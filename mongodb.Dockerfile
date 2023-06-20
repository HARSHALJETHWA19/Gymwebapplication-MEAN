FROM mongo

# Install MongoDB Shell
RUN apt-get update && apt-get install -y wget gnupg
RUN wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add -
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list
RUN apt-get update && apt-get install -y mongodb-org-shell

# Copy the init-db.js script to the Docker image
COPY init-db.js /docker-entrypoint-initdb.d/

# Start the MongoDB service
CMD ["mongod", "--bind_ip_all"]


# FROM mongo:4.4

# # Install Node.js and npm
# RUN apt-get update && apt-get install -y curl
# RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
# RUN apt-get install -y nodejs

# # Set the working directory in the container
# WORKDIR /usr/src/app

# # Install Angular CLI globally
# RUN npm install -g @angular/cli

# # Install MongoDB client for Node.js
# RUN npm install mongodb

# # Copy package.json and package-lock.json files
# COPY package*.json ./

# # Install dependencies
# RUN npm install --legacy-peer-deps

# # Copy the rest of the application code
# COPY . .

# # Set the startup command
# CMD [ "npm", "start" ]
