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
RUN choco install -y cppcheck

# Install Node.js LTS -- appearently a dependency for the visual studio installer???? -> see https://github.com/microsoft/vs-dockerfiles/blob/master/native-desktop/Dockerfile
ADD https://nodejs.org/dist/v8.11.3/node-v8.11.3-x64.msi C:\TEMP\node-install.msi
RUN start /wait msiexec.exe /i C:\TEMP\node-install.msi /l*vx "%TEMP%\MSI-node-install.log" /qn ADDLOCAL=ALL

# using the vs_professional installer didn't work for me (cmake build errors LNK1318: Unexpected PDB error,
# C2471: cannot update program database and friends, it looks like parts of the core-build tools are missing (msdbgsvr?)
#COPY vs_professional_2019.exe C:\TEMP\
#COPY vs_professional_2019.bat C:\TEMP\
#COPY cpp-vsconfig C:\TEMP\
#RUN C:\TEMP\vs_professional_2019.bat

# as an alternative we now use the build tools installer, which is also smaller.
vs_buildtools.bat

ADD Init.bat C:\TEMP\Init.bat
RUN C:\TEMP\Init.bat

ENV SETUP_MSVC=C:\BuildTools\VC\Auxiliary\Build\vcvarsall.bat

# add profile to change powershell prompt
ADD Microsoft.PowerShell_profile.ps1 C:\Users\ContainerAdministrator\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

# Use developer command prompt and start PowerShell if no other command specified.
ENTRYPOINT prompt [DOCKER] $P$G && powershell.exe -NoLogo -ExecutionPolicy Bypass

CMD ["powershell.exe", "-NoLogo", "-ExecutionPolicy", "Bypass"]