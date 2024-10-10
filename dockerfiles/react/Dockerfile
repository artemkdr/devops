# Node.js 18 image with nginx for serving a React app and proxying requests to an API.

# The nginx configuration source file (nginx.conf) should be placed in the ./nginx directory.
# This configuration assumes that nginx.conf includes a reverse proxy section for /api to forward requests to the API service.

# Build client stage
FROM node:18-alpine AS build-client 
WORKDIR /app

COPY package.json package-lock.json ./ 
RUN npm ci

COPY . ./

# Replace the default config with the Docker-specific config.
# COPY ./src/config.docker.ts ./src/config.ts

# Disable source map generation for production.
ENV GENERATE_SOURCEMAP=false 
RUN npm run build

# Runtime stage
FROM nginx:stable-alpine AS runtime

ARG ANY_ARG=value

ENV ANY_ARG=${ANY_ARG}

WORKDIR /app
COPY --from=build-client /app/build /usr/share/nginx/html
COPY nginx.conf /tmp/nginx.conf

# Substitute the API_HOST and API_PORT placeholders in nginx.conf with the environment variable values.
RUN envsubst '$ANY_ARG' < /tmp/nginx.conf > /etc/nginx/nginx.conf

# Expose port 80 (default for Nginx)
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]