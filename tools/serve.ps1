# 로컬 개발 서버 (Node/Python 없이 Windows PowerShell만으로 동작)
# 사용법: powershell -ExecutionPolicy Bypass -File tools/serve.ps1 [-Port 8765]
param([int]$Port = 8765)
$root = Split-Path -Parent $PSScriptRoot
$types = @{ '.html' = 'text/html; charset=utf-8'; '.js' = 'text/javascript; charset=utf-8'; '.css' = 'text/css; charset=utf-8';
  '.json' = 'application/json'; '.png' = 'image/png'; '.jpg' = 'image/jpeg'; '.svg' = 'image/svg+xml'; '.mp3' = 'audio/mpeg'; '.wav' = 'audio/wav' }
$l = New-Object System.Net.HttpListener
$l.Prefixes.Add("http://localhost:$Port/")
$l.Start()
Write-Host "http://localhost:$Port 에서 실행 중 (Ctrl+C로 종료)"
while ($l.IsListening) {
  $ctx = $l.GetContext()
  $rel = [Uri]::UnescapeDataString($ctx.Request.Url.AbsolutePath.TrimStart('/'))
  if ($rel -eq '') { $rel = 'index.html' }
  $path = [IO.Path]::GetFullPath((Join-Path $root $rel))
  if ($path.StartsWith($root) -and (Test-Path $path -PathType Leaf)) {
    $bytes = [IO.File]::ReadAllBytes($path)
    $ext = [IO.Path]::GetExtension($path).ToLower()
    $ctx.Response.ContentType = $(if ($types[$ext]) { $types[$ext] } else { 'application/octet-stream' })
    $ctx.Response.OutputStream.Write($bytes, 0, $bytes.Length)
  } else { $ctx.Response.StatusCode = 404 }
  $ctx.Response.Close()
}
