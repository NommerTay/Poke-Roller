# TTS Designer Live Server (PowerShell)
# Run this script in PowerShell. It serves TTS_Designer.html
# and auto-saves state to _designer_live_state.json
#
# Usage: .\serve_designer.ps1
# Then open http://localhost:3001/TTS_Designer.html

$port = 3001
$root = $PSScriptRoot
$stateFile = Join-Path $root "_designer_live_state.json"

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Start()

Write-Host "TTS Designer Live Server running at:" -ForegroundColor Green
Write-Host "  http://localhost:$port/TTS_Designer.html" -ForegroundColor Cyan
Write-Host "  State file: $stateFile" -ForegroundColor Cyan
Write-Host "  Press Ctrl+C to stop" -ForegroundColor Yellow

while ($listener.IsListening) {
    $context = $listener.GetContext()
    $req = $context.Request
    $res = $context.Response

    # CORS headers
    $res.Headers.Add("Access-Control-Allow-Origin", "*")
    $res.Headers.Add("Access-Control-Allow-Methods", "GET, PUT, OPTIONS")
    $res.Headers.Add("Access-Control-Allow-Headers", "Content-Type")

    if ($req.HttpMethod -eq "OPTIONS") {
        $res.StatusCode = 204
        $res.Close()
        continue
    }

    $urlPath = $req.Url.AbsolutePath

    # API: GET /api/state
    if ($req.HttpMethod -eq "GET" -and $urlPath -eq "/api/state") {
        $res.ContentType = "application/json"
        if (Test-Path $stateFile) {
            $data = Get-Content $stateFile -Raw -Encoding UTF8
            $buffer = [Text.Encoding]::UTF8.GetBytes($data)
        } else {
            $default = "{""elements"":[],""nextId"":1,""canvasW"":""1920"",""canvasH"":""1080""}"
            $buffer = [Text.Encoding]::UTF8.GetBytes($default)
        }
        $res.OutputStream.Write($buffer, 0, $buffer.Length)
        $res.Close()
        continue
    }

    # API: PUT /api/state
    if ($req.HttpMethod -eq "PUT" -and $urlPath -eq "/api/state") {
        $reader = New-Object System.IO.StreamReader($req.InputStream)
        $body = $reader.ReadToEnd()
        $reader.Close()
        try {
            $parsed = $body | ConvertFrom-Json
            $body | Out-File $stateFile -Encoding UTF8
            $count = if ($parsed.elements) { $parsed.elements.Count } else { 0 }
            Write-Host "State saved ($count elements)" -ForegroundColor Gray
            $ok = "{""ok"":true}"
            $buffer = [Text.Encoding]::UTF8.GetBytes($ok)
            $res.ContentType = "application/json"
            $res.OutputStream.Write($buffer, 0, $buffer.Length)
        } catch {
            $res.StatusCode = 400
            $err = "{""error"":""Invalid JSON""}"
            $buffer = [Text.Encoding]::UTF8.GetBytes($err)
            $res.ContentType = "application/json"
            $res.OutputStream.Write($buffer, 0, $buffer.Length)
        }
        $res.Close()
        continue
    }

    # Serve static files
    if ($urlPath -eq "/" -or $urlPath -eq "") {
        $filePath = Join-Path $root "TTS_Designer.html"
    } else {
        $filePath = Join-Path $root $urlPath.TrimStart("/")
    }

    if (Test-Path $filePath -PathType Leaf) {
        $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
        $mimeMap = @{
            ".html" = "text/html"
            ".js" = "text/javascript"
            ".css" = "text/css"
            ".json" = "application/json"
            ".png" = "image/png"
            ".jpg" = "image/jpeg"
            ".jpeg" = "image/jpeg"
            ".gif" = "image/gif"
            ".svg" = "image/svg+xml"
            ".ico" = "image/x-icon"
        }
        $contentType = if ($mimeMap.ContainsKey($ext)) { $mimeMap[$ext] } else { "application/octet-stream" }
        $res.ContentType = $contentType
        $data = [IO.File]::ReadAllBytes($filePath)
        $res.OutputStream.Write($data, 0, $data.Length)
    } else {
        $res.StatusCode = 404
        $buffer = [Text.Encoding]::UTF8.GetBytes("Not found")
        $res.OutputStream.Write($buffer, 0, $buffer.Length)
    }
    $res.Close()
}

$listener.Stop()
