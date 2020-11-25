FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443
ENV ASPNETCORE_URLS=http://*:80

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["prometheus-test.csproj", "./"]
RUN dotnet restore "prometheus-test.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "prometheus-test.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "prometheus-test.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "prometheus-test.dll"]
