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

COPY vs_professional_2019.exe C:\TEMP\
COPY vs_professional_2019.bat C:\TEMP\
RUN C:\TEMP\vs_professional_2019.bat


