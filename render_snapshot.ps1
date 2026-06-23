param(
    [string]$InputFile = "_designer_live_state.json",
    [string]$OutputFile = "_template_snapshot.png"
)

Add-Type -AssemblyName System.Drawing

$json = Get-Content $InputFile -Raw | ConvertFrom-Json
$cw = [int]$json.canvasW
$ch = [int]$json.canvasH

$bmp = New-Object System.Drawing.Bitmap($cw, $ch)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(0x1a, 0x1a, 0x2e))

$sorted = $json.elements | Sort-Object zIndex

foreach ($el in $sorted) {
    $x = [int][double]::Parse($el.x)
    $y = [int][double]::Parse($el.y)
    $w = [int][double]::Parse($el.w)
    $h = [int][double]::Parse($el.h)

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
            "center" { $format.Alignment = [System.Drawing.StringAlignment]::Center; $drawX = $x + $w / 2 }
            "right"  { $format.Alignment = [System.Drawing.StringAlignment]::Far; $drawX = $x + $w }
            default  { $format.Alignment = [System.Drawing.StringAlignment]::Near; $drawX = $x + 4 }
        }
        $format.LineAlignment = [System.Drawing.StringAlignment]::Center
        $drawY = $y + $h / 2
        $rect = New-Object System.Drawing.RectangleF($drawX, $drawY, $w, $h)
        $g.DrawString($el.text, $font, $brush, $rect, $format)
        
        $font.Dispose()
        $brush.Dispose()
        $format.Dispose()
    }
}

$g.Dispose()
$bmp.Save($OutputFile, [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
Write-Host "Snapshot saved to $OutputFile ($cw x $ch)"
