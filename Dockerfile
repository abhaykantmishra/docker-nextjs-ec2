# Dockerfile

# Step 1: Build the Next.js app
FROM node:20-alpine AS builder

WORKDIR /app
COPY package*.json ./
RUN npm install

# Copy the rest of app
COPY . .

# Build the app
RUN npm run build

# Step 2: Run the Next.js app in production
FROM node:20-alpine

ENV NODE_ENV=production
WORKDIR /app

COPY --from=builder /app ./
RUN npm install --omit=dev

EXPOSE 3000
RUN echo "Environment check" && env | grep -i jwt || echo "No JWT env vars found"
CMD ["npm", "start"]