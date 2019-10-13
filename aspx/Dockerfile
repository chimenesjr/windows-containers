
# escape=`

# builder
FROM mcr.microsoft.com/dotnet/framework/sdk AS builder  
WORKDIR C:/src 
COPY . .  
RUN nuget restore aspx.csproj -PackagesDirectory .\packages
RUN msbuild aspx.csproj /p:OutputPath=c:\out 

# app 
FROM microsoft/iis
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Install-WindowsFeature NET-Framework-45-ASPNET;
RUN Install-WindowsFeature Web-Asp-Net45;
RUN Import-module IISAdministration;

RUN Remove-Item -Recurse C:\inetpub\wwwroot\*
COPY --from=builder C:/out/_PublishedWebsites/aspx/. C:/inetpub/wwwroot

EXPOSE 80