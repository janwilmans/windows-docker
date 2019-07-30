cd %~dp0
vs_professional_2019.exe --quiet --wait --norestart --installPath c:\vs --add Microsoft.VisualStudio.Workload.ManagedDesktopBuildTools ^
    --add Microsoft.Net.Component.3.5.DeveloperTools ^
    --add Microsoft.Net.ComponentGroup.4.6.2.DeveloperTools ^
    --add Microsoft.Net.ComponentGroup.TargetingPacks.Common ^
    --add Microsoft.Net.ComponentGroup.NativeDesktop.Core ^
    --add Microsoft.VisualStudio.Component.TestTools.BuildTools ^
    --add Microsoft.VisualStudio.Product.Professional ^
    --add Microsoft.VisualStudio.Workload.VCTools ^
    --add Microsoft.VisualStudio.Component.Nuget ^
    --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 ^
    --add Microsoft.VisualStudio.Component.VC.CMake.Project ^
    --add Microsoft.VisualStudio.Component.VC.140 ^
    --add Microsoft.VisualStudio.Component.VC.ATL ^
    --add Microsoft.VisualStudio.Component.VC.CLI.Support ^
    --add Microsoft.VisualStudio.Component.Windows10SDK.17763 ^
    --add Microsoft.VisualStudio.Component.WinXP ^
    --add Microsoft.VisualStudio.Component.JavaScript.TypeScript ^
    --includeRecommended

