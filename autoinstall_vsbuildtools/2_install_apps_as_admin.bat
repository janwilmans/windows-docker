:: run this as administrator

::goto skip_choco
choco install -y git
choco install -y python3
choco install -y cppcheck
choco install -y nodejs --version 8.11.3
choco install -y notepadplusplus
choco install -y gitlab-runner
choco install docker-desktop
choco install -y wget
::choco install -y gnuwin32-coreutils.install

:skip_choco
wget https://aka.ms/vs/16/release/channel -O c:\temp\VisualStudio.chman
wget https://aka.ms/vs/16/release/vs_buildtools.exe -O c:\temp\vs_buildtools.exe

c:\temp\vs_buildtools.exe --quiet --wait --norestart --nocache ^ 
    --channelUri C:\TEMP\VisualStudio.chman ^
    --installChannelUri C:\TEMP\VisualStudio.chman ^
    --add Microsoft.VisualStudio.Workload.ManagedDesktopBuildTools ^
    --add Microsoft.Net.Component.3.5.DeveloperTools ^
    --add Microsoft.Net.ComponentGroup.4.6.2.DeveloperTools ^
    --add Microsoft.Net.ComponentGroup.TargetingPacks.Common ^
    --add Microsoft.VisualStudio.Component.TestTools.BuildTools ^
    --add Microsoft.VisualStudio.Workload.VCTools 
    --add Microsoft.VisualStudio.Component.VC.140 ^
    --add Microsoft.VisualStudio.Component.VC.ATL ^
    --add Microsoft.VisualStudio.Component.VC.CLI.Support ^
    --add Microsoft.VisualStudio.Component.Windows10SDK.16299.Desktop ^
    --add Microsoft.VisualStudio.ComponentGroup.NativeDesktop.WinXP ^
    --add Microsoft.VisualStudio.Component.TypeScript.2.8 ^
    --includeRecommended ^
    --installPath C:\BuildTools

@echo -----------
@echo Execute these manual steps:
@echo -----------
@echo * Edit and run C:\gitlab-runner\register.ps1 
@echo * ^> gitlab-runner.exe install service
@echo * ^> gitlab-runner.exe start

pause
