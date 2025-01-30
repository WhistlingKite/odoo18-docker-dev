# Odoo 18 Development Environment

This repository contains a Docker-based development environment for Odoo 18. It provides a quick and consistent way to get started with Odoo development.

## Prerequisites

- Docker Engine
- Docker Compose
- Git

## Quick Start

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd <repository-name>
   ```

2. Set up environment variables:
   ```bash
   cp .env.example .env
   ```
   Edit `.env` file to customize your settings if needed.

3. Start Odoo with PostgreSQL:
   ```bash
   docker compose up -d
   ```
   Access Odoo at http://localhost:8069 (or your configured HTTP_PORT)

## Configuration Options

### Environment Variables

Key environment variables in `.env`:
- `DB_HOST`: Database host (default: db)
- `DB_PORT`: Database port (default: 5432)
- `DB_USER`: Database user (default: odoo)
- `DB_PASSWORD`: Database password (default: odoo)
- `ADMIN_PASSWORD`: Odoo admin password
- `HTTP_PORT`: Odoo web port (default: 8069)

### Directory Structure

- `/addons`: Place your custom Odoo modules here
- `odoo.conf.template`: Odoo server configuration template
- `Dockerfile`: Odoo image configuration
- `docker-compose.yml`: Full stack with PostgreSQL
- `docker-compose.odoo-only.yml`: Odoo service only (for using host PostgreSQL)

## Development Workflows

### 1. Using Built-in PostgreSQL (Recommended for beginners)

```bash
docker compose up -d
```

This starts both Odoo and PostgreSQL containers. Perfect for isolated development.

### 2. Using Host PostgreSQL

If you prefer using your system's PostgreSQL:

1. Configure your PostgreSQL to accept Docker connections
2. Update `.env` with your PostgreSQL connection details
3. Start Odoo only:
   ```bash
   docker compose -f docker-compose.odoo-only.yml up -d
   ```

### Adding Custom Modules

1. Place your module in the `/addons` directory
2. Restart the container:
   ```bash
   docker compose restart web
   ```
3. Update module list in Odoo's Apps menu
4. Install your module

## Database Management

- Initial database creation is done through Odoo's web interface
- Access database manager at: http://localhost:8069/web/database/manager
- Use the admin password set in `.env` for database operations

## Maintenance

### Logs
```bash
# View Odoo logs
docker compose logs -f web

# View PostgreSQL logs
docker compose logs -f db
```

### Clean Up
```bash
# Stop containers
docker compose down

# Remove volumes (will delete database!)
docker compose down -v
```

## Troubleshooting

1. **Can't connect to database**
   - Check if PostgreSQL container is running
   - Verify database credentials in `.env`
   - Ensure PostgreSQL is accepting connections

2. **Module not visible in Apps**
   - Check module structure in `/addons`
   - Restart Odoo container
   - Update Apps list in Odoo

3. **Permission issues**
   - Ensure proper file permissions in mounted volumes
   - Check container logs for specific errors

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
