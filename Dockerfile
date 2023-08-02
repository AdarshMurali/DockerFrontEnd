# Stage 1: Build the React app
FROM node:14 as build

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Create the production image
FROM nginx:alpine

# Copy the build files from the previous stage into the Nginx server directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 (the default port for Nginx)
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
