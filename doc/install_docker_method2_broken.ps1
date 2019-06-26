$paths = $env:psmodulePath.Split(';')
$modulePath = Join-Path $paths[0] "DockerMsftProvider"
if (!(Test-Path $modulePath)) {
  New-Item -Path $modulePath -ItemType Directory
}
$outfile = Join-Path $modulePath 'DockerMsftProvider.psm1'
Invoke-WebRequest -UseBasicParsing -OutFile $outfile -Uri https://raw.githubusercontent.com/ajkauffmann/MicrosoftDockerProvider/master/DockerMsftProvider.psm1

$outfile = Join-Path $modulePath 'DockerMsftProvider.psd1'
Invoke-WebRequest -UseBasicParsing -OutFile $outfile https://raw.githubusercontent.com/ajkauffmann/MicrosoftDockerProvider/master/DockerMsftProvider.psd1

Install-Package Docker -ProviderName DockerMsftProvider -Force