# Install Windows feature containers
$restartNeeded = $false
if (!(Get-WindowsOptionalFeature -FeatureName containers -Online).State -eq 'Enabled') {
    $restartNeeded = (Enable-WindowsOptionalFeature -FeatureName containers -Online).RestartNeeded
}

if (Get-Service docker -ErrorAction SilentlyContinue)
{
    Stop-Service docker
}

# Download the zip file.
$json = Invoke-WebRequest https://download.docker.com/components/engine/windows-server/index.json | ConvertFrom-Json
$version = $version = $json.channels.'18.09'.version
$url = $json.versions.$version.url
$zipfile = Join-Path "$env:USERPROFILE\Downloads\" $json.versions.$version.url.Split('/')[-1]
Invoke-WebRequest -UseBasicparsing -Outfile $zipfile -Uri $url

# Extract the archive.
Expand-Archive $zipfile -DestinationPath $Env:ProgramFiles -Force

# Modify PATH to persist across sessions.
$newPath = [Environment]::GetEnvironmentVariable("PATH",[EnvironmentVariableTarget]::Machine) + ";$env:ProgramFiles\docker"
$splittedPath = $newPath -split ';'
$cleanedPath = $splittedPath | Sort-Object -Unique
$newPath = $cleanedPath -join ';'
[Environment]::SetEnvironmentVariable("PATH", $newPath, [EnvironmentVariableTarget]::Machine)
$env:path = $newPath

# Register the Docker daemon as a service.
if (!(Get-Service docker -ErrorAction SilentlyContinue)) {
  dockerd --exec-opt isolation=process --register-service
}

# Start the Docker service.
if ($restartNeeded) {
    Write-Host 'A restart is needed to finish the installation' -ForegroundColor Green
    If ((Read-Host 'Do you want to restart now? [Y/N]') -eq 'Y') {
      Restart-Computer
    }
} else {
    Start-Service docker
}