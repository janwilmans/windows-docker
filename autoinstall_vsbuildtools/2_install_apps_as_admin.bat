:: run this as administrator

:: make script directory the current directory
pushd %~dp0
call update_packages.bat
call vs_professional_2019.bat

@echo -----------
@echo Execute these manual steps:
@echo -----------
@echo * Edit and run C:\gitlab-runner\register.ps1 
@echo * ^> gitlab-runner.exe install service
@echo * ^> gitlab-runner.exe start

pause
