<#
  Builds Ellis's LIVE site (thediabeteslifestylecoach.co.uk) from the demo source.
  Source of truth: ..\diabetes-coach-index.html + ..\photos-diabetes-coach\
  Output: .\site\  -> deploy this folder to Ellis's own Vercel account.
  Re-run after every change. Only copies photos the page actually uses.
#>
$ErrorActionPreference = 'Stop'
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$root = Split-Path -Parent $here
$out  = Join-Path $here 'site'
if (Test-Path $out) { Remove-Item $out -Recurse -Force }
New-Item -ItemType Directory -Path (Join-Path $out 'photos-diabetes-coach') | Out-Null

$html = [IO.File]::ReadAllText((Join-Path $root 'diabetes-coach-index.html'))
[IO.File]::WriteAllText((Join-Path $out 'index.html'), $html, (New-Object Text.UTF8Encoding $false))

Get-ChildItem (Join-Path $root 'photos-diabetes-coach') -File | Where-Object { $html.Contains($_.Name) } |
  ForEach-Object { Copy-Item $_.FullName (Join-Path $out 'photos-diabetes-coach') ; "  photo: $($_.Name)" }

# Self-hosted fonts the page preloads.
New-Item -ItemType Directory -Path (Join-Path $out 'fonts-diabetes-coach') | Out-Null
Get-ChildItem (Join-Path $root 'fonts-diabetes-coach') -Filter *.woff2 | Where-Object { $html.Contains($_.Name) } |
  ForEach-Object { Copy-Item $_.FullName (Join-Path $out 'fonts-diabetes-coach') ; "  font: $($_.Name)" }

@"
User-agent: *
Allow: /

Sitemap: https://thediabeteslifestylecoach.co.uk/sitemap.xml
"@ | Set-Content (Join-Path $out 'robots.txt') -Encoding ascii

$d = Get-Date -Format 'yyyy-MM-dd'
@"
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url><loc>https://thediabeteslifestylecoach.co.uk/</loc><lastmod>$d</lastmod></url>
</urlset>
"@ | Set-Content (Join-Path $out 'sitemap.xml') -Encoding utf8

# Vercel settings: long cache for photos, fresh HTML, sensible security headers.
@'
{
  "headers": [
    { "source": "/(.*)", "headers": [
      { "key": "X-Content-Type-Options", "value": "nosniff" },
      { "key": "Referrer-Policy", "value": "strict-origin-when-cross-origin" },
      { "key": "Permissions-Policy", "value": "camera=(), microphone=(), geolocation=()" },
      { "key": "Strict-Transport-Security", "value": "max-age=31536000" }
    ]},
    { "source": "/(photos|fonts)-diabetes-coach/(.*)", "headers": [
      { "key": "Cache-Control", "value": "public, max-age=31536000, immutable" }
    ]}
  ]
}
'@ | Set-Content (Join-Path $out 'vercel.json') -Encoding ascii

"Built -> $out"
