# Use Node.js LTS
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first for caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of the app
COPY . .

# Optional build step only if package.json has "build" script
# Use shell check to avoid failure if missing
RUN if npm run | grep -q "build"; then npm run build; fi

# Expose app port (adjust if different)
EXPOSE 3000

# Default command
CMD ["npm", "start"]
