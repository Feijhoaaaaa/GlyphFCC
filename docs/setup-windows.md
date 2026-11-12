cd C:\Code\GlyphFCC

$path = ".\docs\setup-windows.md"
$content = Get-Content $path -Raw

$content = $content.Replace('#', '#')
$content = $content.Replace('&', '&')
$content = $content.Replace('_', '_')
$content = $content.Replace('\', '\')

Set-Content $path $content -Encoding utf8
