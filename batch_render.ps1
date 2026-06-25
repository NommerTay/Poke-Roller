param(
    [string]$TemplateDir = "$PSScriptRoot\templates",
    [string]$SnapshotDir = "$PSScriptRoot\Snapshots"
)

$CacheDir = "$env:TEMP\pokeroller_cache"
New-Item -ItemType Directory -Path $CacheDir -Force | Out-Null
New-Item -ItemType Directory -Path $SnapshotDir -Force | Out-Null

Add-Type -AssemblyName System.Drawing

$GIT_BASE = "https://raw.githubusercontent.com/NommerTay/Poke-Roller/master"

$typeNames = @("Bug","Dark","Dragon","Electric","Fairy","Fighting","Fire","Flying","Ghost","Grass","Ground","Ice","Normal","Poison","Psychic","Rock","Steel","Water")
$statNames = @("HP","ATK","DEF","SP.ATK","SP.DEF","SPD")

$wc = New-Object System.Net.WebClient


function Get-CachedImage($url) {
    $key = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($url)).Replace('/', '_').Replace('+', '-').Replace('=', '')
    $cacheFile = "$CacheDir\$key.png"
    if (-not (Test-Path $cacheFile)) {
        try {
            $bytes = $wc.DownloadData($url)
            [System.IO.File]::WriteAllBytes($cacheFile, $bytes)
        } catch {
            Write-Warning "Failed to download: $url"
            return $null
        }
    }
    $bytes = [System.IO.File]::ReadAllBytes($cacheFile)
    $ms = New-Object System.IO.MemoryStream($bytes, 0, $bytes.Length)
    $img = [System.Drawing.Image]::FromStream($ms)
    return $img
}

function Resolve-ImageSrc($el) {
    if (-not [string]::IsNullOrEmpty($el.src)) { return $el.src }
    $name = $el.name
    if ($name -match "^\d{3}_") { return "$GIT_BASE/Pokemon%20Assets/Brown%20Slot%20Images/$name.png" }
    if ($typeNames -contains $name) { return "$GIT_BASE/Poke%20Dice/Types/$name.png" }
    if ($statNames -contains $name) { return "$GIT_BASE/Poke%20Dice/Stats/$name.png" }
    if ($name -eq "Pokemon View Panel") { return "$GIT_BASE/Pokemon%20View%20Panel.png" }
    if ($name -eq "Pokemon Stat Bar") { return "$GIT_BASE/Poke%20Dice/Pokemon%20Stat%20Bar.png" }
    if ($name -eq "Specialty") { return "$GIT_BASE/Poke%20Dice/Specialty.png" }
    if ($name -eq "Starting Dice") { return "$GIT_BASE/Poke%20Dice/Starting%20Dice.png" }
    return $null
}

$templates = Get-ChildItem -Path $TemplateDir -Filter "*.json" | Sort-Object Name
$total = $templates.Count
$i = 0

foreach ($tpl in $templates) {
    $i++
    $base = [System.IO.Path]::GetFileNameWithoutExtension($tpl.Name)
    $outFile = "$SnapshotDir\$base.png"
    Write-Host "[$i/$total] Rendering $base..."

    $json = Get-Content $tpl.FullName -Raw | ConvertFrom-Json

    $boundary = $json.elements | Where-Object { $_.tags -and $_.tags.Contains("panel=") } | Select-Object -First 1
    if ($boundary) {
        $cropX = [int]$boundary.x
        $cropY = [int]$boundary.y
        $cropW = [int]$boundary.w
        $cropH = [int]$boundary.h
    } else {
        $cropX = 0; $cropY = 0
        $cropW = [int]$json.canvasW; $cropH = [int]$json.canvasH
    }

    $bmp = New-Object System.Drawing.Bitmap($cropW, $cropH)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.Clear([System.Drawing.Color]::FromArgb(0, 0, 0, 0))

    $sorted = $json.elements | Sort-Object zIndex

    foreach ($el in $sorted) {
        if ($el.type -ne "image") { continue }
        $src = Resolve-ImageSrc $el
        if (-not $src) { continue }
        $img = Get-CachedImage $src
        if ($img) {
            $ex = [int]$el.x; $ey = [int]$el.y; $ew = [int]$el.w; $eh = [int]$el.h
            $g.DrawImage($img, $ex - $cropX, $ey - $cropY, $ew, $eh)
        }
    }

    $g.Dispose()

    $finalBmp = New-Object System.Drawing.Bitmap(2000, 1300)
    $finalG = [System.Drawing.Graphics]::FromImage($finalBmp)
    $finalG.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $finalG.DrawImage($bmp, 0, 0, 2000, 1300)
    $bmp.Dispose()

    $scaleX = 2000.0 / $cropW
    $scaleY = 1300.0 / $cropH
    $scaleF = ($scaleX + $scaleY) / 2.0

    foreach ($el in $sorted) {
        if ($el.type -ne "text") { continue }
        $tx = [int](([double]$el.x - $cropX) * $scaleX)
        $ty = [int](([double]$el.y - $cropY) * $scaleY)
        $tw = [int]([double]$el.w * $scaleX)
        $th = [int]([double]$el.h * $scaleY)
        $fontStyle = [System.Drawing.FontStyle]::Regular
        if ($el.bold -eq $true) { $fontStyle = $fontStyle -bor [System.Drawing.FontStyle]::Bold }
        if ($el.italic -eq $true) { $fontStyle = $fontStyle -bor [System.Drawing.FontStyle]::Italic }
        $fontSize = [int]([double]$el.size * $scaleF)
        $fontName = if ([string]::IsNullOrEmpty($el.font)) { "Georgia" } else { $el.font }
        try { $font = New-Object System.Drawing.Font($fontName, $fontSize, $fontStyle) } catch { $font = New-Object System.Drawing.Font("Arial", $fontSize, $fontStyle) }
        $colorCode = if ([string]::IsNullOrEmpty($el.color)) { "#FFFFFF" } else { $el.color }
        $argb = [System.Drawing.ColorTranslator]::FromHtml($colorCode)
        $brush = New-Object System.Drawing.SolidBrush($argb)
        $format = New-Object System.Drawing.StringFormat
        $align = if ([string]::IsNullOrEmpty($el.align)) { "left" } else { $el.align }
        switch ($align) { "center" { $format.Alignment = [System.Drawing.StringAlignment]::Center }; "right" { $format.Alignment = [System.Drawing.StringAlignment]::Far }; default { $format.Alignment = [System.Drawing.StringAlignment]::Near } }
        $format.LineAlignment = [System.Drawing.StringAlignment]::Center
        $finalG.DrawString($el.text, $font, $brush, (New-Object System.Drawing.RectangleF($tx, $ty, $tw, $th)), $format)
        $font.Dispose(); $brush.Dispose(); $format.Dispose()
    }

    $finalG.Dispose()
    $finalBmp.Save($outFile, [System.Drawing.Imaging.ImageFormat]::Png)
    $finalBmp.Dispose()
}

$wc.Dispose()
Write-Host "Done! $total snapshots rendered to $SnapshotDir"
