# escape=`

# Copyright (C) Microsoft Corporation. All rights reserved.
# Licensed under the MIT license. See LICENSE.txt in the project root for license information.

#ARG FROM_IMAGE=microsoft/dotnet-framework:3.5-sdk-windowsservercore-1709
#ARG FROM_IMAGE=mcr.microsoft.com/windows/nanoserver:1803
#ARG FROM_IMAGE=microsoft/dotnet-framework:4.7.2-sdk

ARG FROM_IMAGE=mcr.microsoft.com/windows:1809
FROM ${FROM_IMAGE}

# Reset the shell.
SHELL ["cmd", "/S", "/C"]

RUN powershell -command Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
RUN choco install -y git
RUN choco install -y python3
RUN choco install -y cppcheck -y

# Set up environment to collect install errors.
COPY vs_professional_2019.exe C:\TEMP\
RUN C:\TEMP\vs_professional_2019.exe --layout c:\temp\vs_cache --add Microsoft.VisualStudio.Workload.ManagedDesktopBuildTools `
    --add Microsoft.Net.Component.3.5.DeveloperTools `
    --add Microsoft.Net.ComponentGroup.4.6.2.DeveloperTools `
    --add Microsoft.Net.ComponentGroup.TargetingPacks.Common `
    --add Microsoft.VisualStudio.Component.TestTools.BuildTools `
    --add Microsoft.VisualStudio.Workload.VCTools `
    --add Microsoft.VisualStudio.Component.VC.140 `
    --add Microsoft.VisualStudio.Component.VC.ATL `
    --add Microsoft.VisualStudio.Component.VC.CLI.Support `
    --add Microsoft.VisualStudio.Component.Windows10SDK.17763 `
    --add Microsoft.VisualStudio.Component.WinXP `
    --add Microsoft.VisualStudio.Component.JavaScript.TypeScript `
    --includeRecommended

ADD Init.bat C:\TEMP\Init.bat
RUN C:\TEMP\Init.bat

# add profile to change powershell prompt
ADD Microsoft.PowerShell_profile.ps1 C:\Users\ContainerAdministrator\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

# Use developer command prompt and start PowerShell if no other command specified.
ENTRYPOINT C:\BuildTools\Common7\Tools\VsDevCmd.bat -arch=amd64 && prompt [DOCKER] $P$G &&
CMD ["powershell.exe", "-NoLogo", "-ExecutionPolicy", "Bypass"]

