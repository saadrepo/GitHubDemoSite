FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY MyMvcLandingPage.csproj ./
RUN dotnet restore MyMvcLandingPage.csproj

COPY . ./
RUN dotnet publish MyMvcLandingPage.csproj -c Release -o /app/publish --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/publish ./

ENV ASPNETCORE_URLS=http://+:5055
EXPOSE 5055
ENTRYPOINT ["dotnet", "MyMvcLandingPage.dll"]
