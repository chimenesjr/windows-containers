# escape=`

FROM microsoft/iis
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# install components
RUN Install-WindowsFeature NET-Framework-45-ASPNET; `
    Install-WindowsFeature Web-Asp-Net45;
    
# Remove the Default web site
RUN Remove-Website 'Default Web Site' 

# Create tfm-er-api website
WORKDIR c:\HealthCheck
RUN New-Website -Name 'HealthCheck' -Port 9191 -PhysicalPath 'c:\HealthCheck' -ApplicationPool '.NET v4.5'
COPY . .

# grant permissions to IIS
RUN icacls c:\HealthCheck /grant IIS_IUSRS:M /T /Q 

HEALTHCHECK --interval=15s `
 CMD powershell -command `
    try { `
     $response = iwr http://localhost:9191/iisstart.htm -UseBasicParsing; `
     if ($response.StatusCode -eq 200) { return 0} `
     else {return 1}; `
    } catch { return 1 }

EXPOSE 9191

ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]