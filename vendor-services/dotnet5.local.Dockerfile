FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 5003
ENV ASPNETCORE_ENVIRONMENT=dev

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["daisy-core-services", "./"]
COPY vendor-services/env/appsettings.json ./Shared/appsettings.json

RUN dotnet new tool-manifest
RUN dotnet tool install --local dotnet-ef --version 5.0.0
WORKDIR /src/DataAccess

ENTRYPOINT [""]