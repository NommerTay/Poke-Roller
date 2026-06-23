param(
    [string]$InputFile = "_designer_live_state.json",
    [string]$OutputFile = "_template_snapshot.png"
)

Add-Type -AssemblyName System.Drawing

$json = Get-Content $InputFile -Raw | ConvertFrom-Json

$boundary = $json.elements | Where-Object { $_.tags -and $_.tags.Contains("panel=") } | Select-Object -First 1
if ($boundary) {
    $cropX = [int][double]::Parse($boundary.x)
    $cropY = [int][double]::Parse($boundary.y)
    $cropW = [int][double]::Parse($boundary.w)
    $cropH = [int][double]::Parse($boundary.h)
} else {
    $cropX = 0
    $cropY = 0
    $cropW = [int]$json.canvasW
    $cropH = [int]$json.canvasH
}

$bmp = New-Object System.Drawing.Bitmap($cropW, $cropH)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(0, 0, 0, 0))

$sorted = $json.elements | Sort-Object zIndex

foreach ($el in $sorted) {
    $ex = [int][double]::Parse($el.x)
    $ey = [int][double]::Parse($el.y)
    $ew = [int][double]::Parse($el.w)
    $eh = [int][double]::Parse($el.h)
    $x = $ex - $cropX
    $y = $ey - $cropY
    $w = $ew
    $h = $eh

    if ($el.type -eq "image" -and $el.src) {
        try {
            $wc = New-Object System.Net.WebClient
            $bytes = $wc.DownloadData($el.src)
            $ms = New-Object System.IO.MemoryStream($bytes, 0, $bytes.Length)
            $img = [System.Drawing.Image]::FromStream($ms)
            $g.DrawImage($img, $x, $y, $w, $h)
            $img.Dispose()
            $ms.Dispose()
            $wc.Dispose()
        } catch {
            Write-Warning "Failed to load: $($el.name) - $($el.src)"
        }
    } elseif ($el.type -eq "text") {
        $fontStyle = [System.Drawing.FontStyle]::Regular
        if ($el.bold -eq $true) { $fontStyle = $fontStyle -bor [System.Drawing.FontStyle]::Bold }
        if ($el.italic -eq $true) { $fontStyle = $fontStyle -bor [System.Drawing.FontStyle]::Italic }
        
        $fontSize = [int][double]::Parse($el.size)
        $fontName = if ([string]::IsNullOrEmpty($el.font)) { "Georgia" } else { $el.font }
        
        try {
            $font = New-Object System.Drawing.Font($fontName, $fontSize, $fontStyle)
        } catch {
            $font = New-Object System.Drawing.Font("Arial", $fontSize, $fontStyle)
        }
        
        $colorCode = if ([string]::IsNullOrEmpty($el.color)) { "#FFFFFF" } else { $el.color }
        $argb = [System.Drawing.ColorTranslator]::FromHtml($colorCode)
        $brush = New-Object System.Drawing.SolidBrush($argb)
        
        $format = New-Object System.Drawing.StringFormat
        $align = if ([string]::IsNullOrEmpty($el.align)) { "left" } else { $el.align }
        switch ($align) {
            "center" { $format.Alignment = [System.Drawing.StringAlignment]::Center }
            "right"  { $format.Alignment = [System.Drawing.StringAlignment]::Far }
            default  { $format.Alignment = [System.Drawing.StringAlignment]::Near }
        }
        $format.LineAlignment = [System.Drawing.StringAlignment]::Center
        $rect = New-Object System.Drawing.RectangleF($x, $y, $w, $h)
        $g.DrawString($el.text, $font, $brush, $rect, $format)
        
        $font.Dispose()
        $brush.Dispose()
        $format.Dispose()
    }
}

$g.Dispose()
$bmp.Save($OutputFile, [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
Write-Host "Snapshot saved to $OutputFile ($cropW x $cropH)"
