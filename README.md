# MCP PostgreSQL Server Docker

Dockerization of the MCP PostgreSQL server based on [antonorlov/mcp-postgres-server](https://github.com/antonorlov/mcp-postgres-server).

## Features

- **MCP (Model Context Protocol) Server** for PostgreSQL
- Standardized interface for database interactions
- Available tools: `connect_db`, `query`, `execute`, `list_schemas`, `list_tables`, `describe_table`
- Enhanced security with prepared statements

## Usage

### 1. Build and launch

```bash
# Build and start the service
docker compose up --build -d
```

### 2. Add the MCP server configuration

Add this to your agent configuration file:

```json
{
  "mcpServers": {
    "postgres": {
      "command": "docker",
      "args": [
        "exec",
        "-i",
        "mcp-postgres-server",
        "npx",
        "mcp-postgres-server"
      ],
      "env": {
        "PG_HOST": "your_postgres_host",
        "PG_PORT": "5432",
        "PG_USER": "your_username",
        "PG_PASSWORD": "your_password",
        "PG_DATABASE": "your_database"
      }
    }
  }
}
```

## Environment variables configuration

1. **Dockerfile ENV** - Default values
2. **Claude configuration** - Variables passed by Claude Desktop

### Available variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PG_HOST` | PostgreSQL host | localhost |
| `PG_PORT` | PostgreSQL port | 5432 |
| `PG_USER` | Username | postgres |
| `PG_PASSWORD` | Password | "" |
| `PG_DATABASE` | Database name | postgres |

## Available tools

1. **connect_db**: Database connection
2. **query**: SELECT queries
3. **execute**: INSERT/UPDATE/DELETE operations
4. **list_schemas**: List database schemas
5. **list_tables**: List tables
6. **describe_table**: Table structure
