# Nginx image

# Runtime stage
FROM nginx:stable-alpine AS runtime

#ARG ANY_ARG=some_value

#ENV ANY_ARG=${ANY_ARG}

COPY nginx.conf /tmp/nginx.conf

# Substitute the args placeholders in nginx.conf with the environment variable values.
RUN envsubst '$ANY_ARG' < /tmp/nginx.conf > /etc/nginx/nginx.conf

# Expose port 80 (default for Nginx)
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]