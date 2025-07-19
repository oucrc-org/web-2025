# Development dependencies stage
FROM node:22.17.1-alpine3.22 AS deps
RUN npm install -g pnpm
WORKDIR /app

# Copy workspace files
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
COPY apps/ ./apps/

# Install all dependencies
RUN pnpm install --frozen-lockfile

# Build stage
FROM deps AS build
WORKDIR /app
RUN pnpm --filter @web-2025/pages build

# Production stage
FROM node:22.17.1-alpine3.22 AS production
RUN npm install -g pnpm
WORKDIR /app

# Copy workspace configuration
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
COPY apps/pages/package.json ./apps/pages/

# Install production dependencies only
RUN pnpm install --frozen-lockfile --prod

# Copy built application
COPY --from=build /app/apps/pages/build ./apps/pages/build

EXPOSE 3000
CMD ["pnpm", "--filter", "@web-2025/pages", "start"]
