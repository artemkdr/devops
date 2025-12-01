# ASP.NET 6.0 image for building and running an API .NET application.

# This image replaces the $DB_CONNECTION_STRING placeholder in appsettings.json with the provided environment variable.

# Build .NET API stage
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build-api
WORKDIR /app
COPY API .
RUN dotnet restore
# build and publish a Release
RUN dotnet publish -c Release -o api

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS runtime

# Install curl for health checks: `curl http://localhost:5000/health`
RUN apt-get update && apt-get install -y curl

# Install gettext (provides envsubst for variable substitution).
RUN apt-get update && apt-get install -y gettext-base

ARG PORT=5000
ARG DB_CONNECTION_STRING=

ENV PORT=${PORT}
ENV DB_CONNECTION_STRING=${DB_CONNECTION_STRING}

COPY --from=build-api /app /app
COPY /appsettings.json /tmp/appsettings.json

# Substitute the DB_CONNECTION_STRING placeholder in appsettings.json with the environment variable value.
RUN envsubst '$DB_CONNECTION_STRING' < /tmp/appsettings.json > /app/appsettings.json
WORKDIR /app/

EXPOSE ${PORT}

ENTRYPOINT dotnet run
# Use this command if you want to run on the specific port
#ENTRYPOINT dotnet ${SERVICE_NAME}.dll --urls http://*:${PORT}