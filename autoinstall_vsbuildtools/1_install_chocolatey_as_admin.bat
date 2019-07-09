:: run this as administrator
pushd %~dp0\

:: build server settings/tweaks 
regedit /s developer_settings.reg
sc config WSearch start=disabled
net stop WSearch

:: install chocolatey
powershell -command Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
@echo *****
@echo Now close this window and run '2_install_apps_as_admin.bat' as administrator
@echo *****
pause