# Use an official Node.js image as the base
FROM node:16.15

# Set the working directory
WORKDIR /usr/src/app
RUN npm install -g @angular/cli
RUN rm -rf node_modules




# Copy package.json and package-lock.json files to the working directory
COPY package*.json ./
COPY package-lock.json .

# Install Angular dependencies
RUN npm install @angular-devkit/build-angular
RUN npm install @angular/compiler-cli
RUN npm install --force

# Copy the entire Angular project to the working directory
COPY . .

# Build the Angular app
RUN npm run build

# Expose the Angular app's default port (adjust if necessary)
EXPOSE 4200

# Start the Angular app
CMD ["npm", "start"]
