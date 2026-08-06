$ErrorActionPreference = "Stop"
$projekt = "C:\Users\lenovo\udraznianierurwarszawa.pl"
$hasloPlik = Join-Path $projekt "ftp-haslo.txt"
if (-not (Test-Path $hasloPlik)) {
  Write-Host "BRAK PLIKU ftp-haslo.txt - utworz go i wklej do niego haslo FTP (sama tresc hasla, nic wiecej)"
  exit 1
}
$haslo = (Get-Content $hasloPlik -Raw).Trim()
$user = "githubxn--udranianierurwarszawa-sse@srv78381.seohost.com.pl"
$hostFtp = "h50.seohost.pl"

$pliki = @(
  @{ lokalny = "index.html";                zdalny = "index.html" },
  @{ lokalny = "css\style.css";             zdalny = "css/style.css" },
  @{ lokalny = "img\placeholder-hero.svg";  zdalny = "img/placeholder-hero.svg" },
  @{ lokalny = "img\placeholder-autor.svg"; zdalny = "img/placeholder-autor.svg" }
)

foreach ($p in $pliki) {
  $lokalna = Join-Path $projekt $p.lokalny
  Write-Host "Wysylam: $($p.zdalny)"
  & curl.exe -s -S --ftp-create-dirs -T $lokalna --user "${user}:${haslo}" "ftp://$hostFtp/$($p.zdalny)"
  if ($LASTEXITCODE -ne 0) { Write-Host "BLAD przy $($p.zdalny)"; exit 1 }
}
Write-Host "GOTOWE - wszystkie pliki wyslane"
