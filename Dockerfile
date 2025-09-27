FROM node:18-alpine

WORKDIR /app

# Install git (needed for npm install from GitHub)
RUN apk add --no-cache git

# Install the mcp-postgres-server package
RUN npm install -g mcp-postgres-server

# Create non-root user for security
RUN addgroup -g 1001 -S mcpuser && \
    adduser -S mcpuser -u 1001 -G mcpuser

USER mcpuser

# Set environment variables with defaults
ENV PG_HOST=localhost
ENV PG_PORT=5432
ENV PG_USER=postgres
ENV PG_PASSWORD=""
ENV PG_DATABASE=postgres

# Default command to run the MCP server
ENTRYPOINT ["npx", "mcp-postgres-server"]