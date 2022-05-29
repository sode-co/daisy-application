FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 5003
ENV ASPNETCORE_ENVIRONMENT=production

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["daisy-core-services/daisy-core-services.sln", "./"]
COPY ["daisy-core-services/GrpcServices/GrpcServices.csproj", "GrpcServices/"]

RUN dotnet restore GrpcServices/GrpcServices.csproj
COPY daisy-core-services .

WORKDIR /src/GrpcServices  
RUN dotnet build "GrpcServices.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "GrpcServices.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
COPY pipeline/env/appsettings.json ./appsettings.json
ENTRYPOINT ["dotnet", "GrpcServices.dll"]