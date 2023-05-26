 # # # # Use an official Node.js image with a newer version
# # # # FROM node:14.20

# # # # # Set the working directory
# # # # WORKDIR /app

# # # # # Install the Angular CLI globally
# # # # RUN npm install -g @angular/cli

# # # # # Copy package.json and package-lock.json
# # # # COPY package*.json ./

# # # # # Install dependencies
# # # # RUN npm install

# # # # # Copy the rest of the application code
# # # # COPY . .

# # # # # Build the Angular application
# # # # RUN ng build

# # # # # Expose the port (if needed)
# # # # EXPOSE 4200

# # # # # Define the command to run the application
# # # # CMD ["node", "dist/main"]

# # # FROM node:14.20 

# # # WORKDIR /app

# # # RUN npm install -g @angular/cli

# # # COPY package.json ./

# # # RUN npm install

# # # COPY . .

# # # RUN ng build

# # # EXPOSE 4200

# # # CMD ["npm", "start"]


# # # Use an official Node.js runtime as the base image
# # FROM node:14.20

# # # Set the working directory in the container
# # WORKDIR /app

# # RUN apt-get update && apt-get install -y netcat

# # RUN npm install -g @angular/cli

# # # Copy package.json and package-lock.json to the working directory
# # COPY package*.json ./

# # # Install project dependencies
# # RUN npm install

# # # Copy the entire project to the working directory
# # COPY . .

# # # Expose the port on which the application runs
# # EXPOSE 4200

# # # Set environment variables
# # ENV MONGO_URI mongodb://mongo:27017/gymusers

# # # Wait for MongoDB to start before starting the application
# # CMD ["./wait-for.sh", "mongo:27017", "--", "npm", "start"]


# # Use an official Node.js runtime as the base image
# FROM node:14.20

# # Set the working directory in the container
# WORKDIR /app

# RUN npm install -g @angular/cli


# # Copy package.json and package-lock.json to the working directory
# COPY package*.json ./

# # Install project dependencies
# RUN npm install

# # Copy the source code to the container
# COPY . .

# # Expose the port on which the application runs
# EXPOSE 4200

# # Set the environment variables
# ENV MONGODB_URI=mongodb://localhost:27017/gymusers
# # ENV NODE_ENV=production

# # Start the application
# RUN ng serve

# Use an appropriate Node.js base image
# FROM node:14.20 as builder

# # Set the working directory
# WORKDIR /app

# RUN npm install -g @angular/cli

# # Copy package.json and package-lock.json
# COPY package*.json ./

# # Install dependencies
# # RUN npm ci

# # RUN npm cache clean --force
# RUN npm install
# # RUN node --version

# # Copy the entire project
# COPY . .

# # Build the Angular app
# # RUN ng build --prod

# # Use NGINX as the web server
# # FROM nginx:latest

# # Copy the built Angular app to NGINX default directory
# # COPY --from=builder /app/dist/angular-app /usr/share/nginx/html

# # Expose the port to access the Angular app
# EXPOSE 4200

# # Start NGINX
# CMD ["ng", "serve"]

FROM node

WORKDIR /app

RUN npm install -g @angular/cli

COPY package.json .

RUN npm cache clean --force

# RUN npm install 



COPY . .

EXPOSE 4200

CMD ["npm","start"]