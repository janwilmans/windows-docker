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
    --add Microsoft.VisualStudio.Workload.VCTools ^
    --add Microsoft.VisualStudio.Component.VC.140 ^
    --add Microsoft.VisualStudio.Component.VC.ATL ^
    --add Microsoft.VisualStudio.Component.VC.CLI.Support ^
    --add Microsoft.VisualStudio.Component.Windows10SDK.16299.Desktop ^
    --add Microsoft.VisualStudio.ComponentGroup.NativeDesktop.WinXP ^
    --add Microsoft.VisualStudio.Component.TypeScript.2.8 ^
    --includeRecommended ^
    --installPath C:\BuildTools