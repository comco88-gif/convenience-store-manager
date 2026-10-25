# claude.ai 아티팩트용 사본 만들기
# 아티팩트는 문서 껍데기(doctype/html/head/body)를 직접 씌우고, 같이 올리지 않는 파일(manifest, 아이콘)은 쓸 수 없어서
# 그 줄들을 뺀 사본을 .artifact/convenience-manager.html 에 만든다. (git 제외 폴더)
# 사용법: powershell -ExecutionPolicy Bypass -File tools/build-artifact.ps1
$root = Split-Path -Parent $PSScriptRoot
$skip = '^(<!doctype html>|<html lang="ko">|<head>|<meta charset="utf-8">|<meta name="viewport".*|</head>|<body>|</body>|</html>' +
  '|<link rel="(manifest|apple-touch-icon)".*|<meta name="(theme-color|mobile-web-app-capable|apple-mobile-web-app-[a-z-]+)".*)$'
$lines = Get-Content -Encoding utf8 (Join-Path $root 'index.html')
$outDir = Join-Path $root '.artifact'
New-Item -ItemType Directory -Force $outDir | Out-Null
$out = Join-Path $outDir 'convenience-manager.html'
[IO.File]::WriteAllLines($out, ($lines | Where-Object { $_ -notmatch $skip }), (New-Object Text.UTF8Encoding $false))
Write-Host "만들었어요: $out"
