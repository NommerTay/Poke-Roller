param(
    [string]$InputFile,
    [string]$OutputFile
)

Add-Type -AssemblyName System.Drawing

$img = [System.Drawing.Image]::FromFile($InputFile)
$bmp = $img
$w = $bmp.Width
$h = $bmp.Height
Write-Host "Processing $InputFile ($w x $h)"

$newBmp = New-Object System.Drawing.Bitmap($w, $h)
$newG = [System.Drawing.Graphics]::FromImage($newBmp)
$newG.DrawImage($bmp, 0, 0, $w, $h)
$newG.Dispose()

$borderThickness = 8
$replaced = 0
$unchangedBorder = 0

for ($x = 0; $x -lt $w; $x++) {
    for ($y = 0; $y -lt $h; $y++) {
        $onBorder = $x -lt $borderThickness -or $x -ge ($w - $borderThickness) -or $y -lt $borderThickness -or $y -ge ($h - $borderThickness)
        
        if (-not $onBorder) { continue }
        
        $c = $bmp.GetPixel($x, $y)
        $r = $c.R
        $g = $c.G
        $b = $c.B
        
        # Skip true black (background border)
        if ($r -lt 5 -and $g -lt 5 -and $b -lt 5) {
            $unchangedBorder++
            continue
        }
        
        # Check if it's a purple-ish border pixel
        # Purple: B > G and R is moderate
        $isBorderPurple = $b -gt $g -and $r -gt 5 -and $b -gt 10
        
        if ($isBorderPurple) {
            $lum = [int](0.299 * $r + 0.587 * $g + 0.114 * $b)
            
            if ($lum -le 20) {
                $nr = [int]($r * 2.0)
                $ng = [int]($r * 1.2)
                $nb = [int]($r * 0.5)
            } elseif ($lum -le 30) {
                $nr = [int](25 + ($lum - 20) * 3.0)
                $ng = [int](13 + ($lum - 20) * 1.5)
                $nb = [int](6 + ($lum - 20) * 0.8)
            } elseif ($lum -le 40) {
                $nr = [int](40 + ($lum - 30) * 4.0)
                $ng = [int](22 + ($lum - 30) * 2.0)
                $nb = [int](10 + ($lum - 30) * 1.0)
            } else {
                $nr = [int](70 + ($lum - 40) * 1.5)
                $ng = [int](40 + ($lum - 40) * 0.8)
                $nb = [int](18 + ($lum - 40) * 0.4)
            }
            
            if ($nr -gt 255) { $nr = 255 }
            if ($ng -gt 255) { $ng = 255 }
            if ($nb -gt 255) { $nb = 255 }
            if ($nr -lt 0) { $nr = 0 }
            if ($ng -lt 0) { $ng = 0 }
            if ($nb -lt 0) { $nb = 0 }
            
            $newBmp.SetPixel($x, $y, [System.Drawing.Color]::FromArgb($c.A, $nr, $ng, $nb))
            $replaced++
        } else {
            $unchangedBorder++
        }
    }
}

Write-Host "Replaced $replaced border pixels"
Write-Host "Unchanged border pixels: $unchangedBorder"
$newBmp.Save($OutputFile, [System.Drawing.Imaging.ImageFormat]::Png)
$newBmp.Dispose()
$img.Dispose()
Write-Host "Saved to $OutputFile"
