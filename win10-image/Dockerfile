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
RUN choco install git -y
RUN choco install python3 -y
RUN choco install cppcheck -y
RUN choco install nodejs --version 8.11.3

# choco install nodejs-lts # maybe vs_buildtools can work with the lateste LTS ?

# Set up environment to collect install errors.
COPY Install.cmd C:\TEMP\
ADD https://aka.ms/vscollect.exe C:\TEMP\collect.exe

## Install Node.js LTS
ADD https://nodejs.org/dist/v8.11.3/node-v8.11.3-x64.msi C:\TEMP\node-install.msi
RUN start /wait msiexec.exe /i C:\TEMP\node-install.msi /l*vx "%TEMP%\MSI-node-install.log" /qn ADDLOCAL=ALL

# Download channel for fixed install.
ARG CHANNEL_URL=https://aka.ms/vs/16/release/channel
ADD ${CHANNEL_URL} C:\TEMP\VisualStudio.chman

# Download and install Build Tools for Visual Studio 2019 for native desktop workload.
ADD https://aka.ms/vs/16/release/vs_buildtools.exe C:\TEMP\vs_buildtools.exe
RUN C:\TEMP\Install.cmd C:\TEMP\vs_buildtools.exe --quiet --wait --norestart --nocache `
    --channelUri C:\TEMP\VisualStudio.chman `
    --installChannelUri C:\TEMP\VisualStudio.chman `
    --add Microsoft.VisualStudio.Workload.VCTools --includeRecommended`
    --installPath C:\BuildTools

ADD Init.bat C:\TEMP\Init.bat
RUN C:\TEMP\Init.bat

# add profile to change powershell prompt
ADD Microsoft.PowerShell_profile.ps1 C:\Users\ContainerAdministrator\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

# Use developer command prompt and start PowerShell if no other command specified.
ENTRYPOINT C:\BuildTools\Common7\Tools\VsDevCmd.bat -arch=amd64 && prompt [DOCKER] $P$G &&
CMD ["powershell.exe", "-NoLogo", "-ExecutionPolicy", "Bypass"]

