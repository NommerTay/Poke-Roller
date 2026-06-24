param(
    [string]$InputFile = "move_template.json",
    [string]$OutputFile = "move_template.png"
)

Add-Type -AssemblyName System.Drawing

$json = Get-Content $InputFile -Raw | ConvertFrom-Json

# Compute bounding box from all elements
$minX = 99999; $minY = 99999; $maxX = 0; $maxY = 0
foreach ($el in $json.elements) {
    $ex = [int][double]::Parse($el.x)
    $ey = [int][double]::Parse($el.y)
    $ew = [int][double]::Parse($el.w)
    $eh = [int][double]::Parse($el.h)
    if ($ex -lt $minX) { $minX = $ex }
    if ($ey -lt $minY) { $minY = $ey }
    if (($ex + $ew) -gt $maxX) { $maxX = $ex + $ew }
    if (($ey + $eh) -gt $maxY) { $maxY = $ey + $eh }
}

$cropW = $maxX - $minX
$cropH = $maxY - $minY

$bmp = New-Object System.Drawing.Bitmap($cropW, $cropH)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clear([System.Drawing.Color]::FromArgb(0, 0, 0, 0))

$GIT_BASE = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master"

$sorted = $json.elements | Sort-Object zIndex

foreach ($el in $sorted) {
    $ex = [int][double]::Parse($el.x)
    $ey = [int][double]::Parse($el.y)
    $ew = [int][double]::Parse($el.w)
    $eh = [int][double]::Parse($el.h)
    $x = $ex - $minX
    $y = $ey - $minY
    
    if ($el.type -eq "image" -and $el.src) {
        try {
            $wc = New-Object System.Net.WebClient
            $bytes = $wc.DownloadData($el.src)
            $ms = New-Object System.IO.MemoryStream($bytes, 0, $bytes.Length)
            $img = [System.Drawing.Image]::FromStream($ms)
            $g.DrawImage($img, $x, $y, $ew, $eh)
            $img.Dispose()
            $ms.Dispose()
            $wc.Dispose()
        } catch {
            Write-Warning "Failed to load: $($el.name) - $($el.src)"
        }
    } elseif ($el.type -eq "text") {
        $tx = $x
        $ty = $y
        $tw = $ew
        $th = $eh
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
        $rect = New-Object System.Drawing.RectangleF($tx, $ty, $tw, $th)
        $g.DrawString($el.text, $font, $brush, $rect, $format)
        $font.Dispose()
        $brush.Dispose()
        $format.Dispose()
    }
}

$g.Dispose()
$bmp.Save($OutputFile, [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
Write-Host "Saved $OutputFile ($cropW x $cropH)"
