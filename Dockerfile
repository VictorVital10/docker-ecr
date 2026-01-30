# Use the Nginx Alpine image as base
FROM nginx:alpine

# Copy the website files to Nginx html directory
COPY website/ /usr/share/nginx/html

# Expose port 80 HTTP
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]