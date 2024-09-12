# Use the official Node.js runtime as the base image
FROM node:20 AS build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire application code to the container
COPY . .

# Build the app for production
RUN npm run build

# Use Apache as the production server
FROM httpd:2.4

# Copy the built app to Apaches's web server directory
COPY --from=build /app/src /usr/local/apache2/htdocs/

# Update apache config
COPY server.crt /usr/local/apache2/conf/server.crt
COPY server.key /usr/local/apache2/conf/server.key

COPY httpd.conf /usr/local/apache2/conf/httpd.conf
COPY httpd-ssl.conf /usr/local/apache2/conf/extra/httpd-ssl.conf

# Expose port 443 for the apache server
EXPOSE 443