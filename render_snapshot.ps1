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

$GIT_BASE = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master"

$sorted = $json.elements | Sort-Object zIndex

foreach ($el in $sorted) {
    if ($el.type -eq "image" -and ([string]::IsNullOrEmpty($el.src) -or $el.src -eq "")) {
        $name = $el.name
        $resolved = $null
        if ($name -match "^\d{3}_") {
            $resolved = "$GIT_BASE/Pokemon%20Assets/Slot%20Images/$name.png"
        } elseif ($name -match "^type_") {
            $typeName = $name -replace "^type_", ""
            $resolved = "$GIT_BASE/Pokemon%20Assets/Types/$typeName.png"
        } elseif ($name -eq "DEX PANEL") {
            $resolved = "$GIT_BASE/Pokemon%20Assets/DEX%20PANEL.png"
        } elseif ($name -eq "DEX NEXT") {
            $resolved = "$GIT_BASE/Pokemon%20Assets/DEX%20NEXT.png"
        } elseif ($name -eq "BENCY") {
            $resolved = "$GIT_BASE/BENCY.png"
        } elseif ($name -eq "Pokemon View Panel") {
            $resolved = "$GIT_BASE/Pokemon%20View%20Panel.png"
        } elseif ($name -in @("Grass","Fire","Water","Electric","Psychic","Fighting","Dark","Dragon","Fairy","Flying","Ghost","Ground","Ice","Normal","Poison","Rock","Steel","Bug")) {
            $resolved = "$GIT_BASE/Poke%20Dice/Types/$name.png"
        } elseif ($name -in @("HP","ATK","DEF","SP.ATK","SP.DEF","SPD")) {
            $resolved = "$GIT_BASE/Poke%20Dice/Stats/$name.png"
        }
        if ($resolved) {
            $el | Add-Member -NotePropertyName "src" -NotePropertyValue $resolved -Force
        }
    }
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

$finalBmp = New-Object System.Drawing.Bitmap(2000, 1300)
$finalG = [System.Drawing.Graphics]::FromImage($finalBmp)
$finalG.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$finalG.DrawImage($bmp, 0, 0, 2000, 1300)
$finalG.Dispose()
$bmp.Dispose()
$finalBmp.Save($OutputFile, [System.Drawing.Imaging.ImageFormat]::Png)
$finalBmp.Dispose()
Write-Host "Snapshot saved to $OutputFile (2000 x 1300)"
