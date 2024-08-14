FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8000

ENV ASPNETCORE_URLS=http://+:8000

USER app
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG configuration=Release
WORKDIR /src
COPY ["Github-TopTech-Backend-Test.csproj", "./"]
RUN dotnet restore "Github-TopTech-Backend-Test.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "Github-TopTech-Backend-Test.csproj" -c $configuration -o /app/build

FROM build AS publish
ARG configuration=Release
RUN dotnet publish "Github-TopTech-Backend-Test.csproj" -c $configuration -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Github-TopTech-Backend-Test.dll"]
