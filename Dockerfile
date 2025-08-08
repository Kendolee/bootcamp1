# Use Node.js image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy all HTML files and assets
COPY templatemo_589_lugx_gaming/ ./public/

# Install a simple static file server
RUN npm install -g serve

# Expose port 80
EXPOSE 80

# Serve files from public directory
CMD ["serve", "-s", "public", "-l", "80"]
