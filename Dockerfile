# Use an official Node.js runtime as a parent image
FROM node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install the dependencies
RUN npm install --only=production

# Copy the rest of the application's code to the container
COPY . .

# Build the application
RUN npm run build

# Expose port 3000 for the container
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
