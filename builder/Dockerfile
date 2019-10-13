# escape=`
FROM mcr.microsoft.com/dotnet/framework/sdk AS builder  
WORKDIR C:\src\HelloWorld.Console  
COPY . .  
RUN msbuild HelloWorld.Console\HelloWorld.Console.sln /p:OutputPath=c:\out 

# app image
FROM mcr.microsoft.com/windows/servercore:10.0.16299.1029 
WORKDIR C:\hello-world  
COPY --from=builder C:\out .  
CMD HelloWorld.Console.exe  