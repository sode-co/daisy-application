FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 5003
ENV ASPNETCORE_ENVIRONMENT=production

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["daisy-core-services/daisy-core-services.sln", "./"]
COPY ["daisy-core-services/Api/Api.csproj", "Api/"]

COPY ../daisy-core-services .
RUN dotnet restore Api/Api.csproj

WORKDIR /src/Api  
RUN dotnet build "Api.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "Api.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
COPY pipeline/env/appsettings.json ./appsettings.json
ENTRYPOINT ["dotnet", "Api.dll"]