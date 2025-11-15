# Bank Asset & HR Management System - Docker Setup

A comprehensive Bank Asset & HR Management System running in Docker containers with automated database initialization.

## 🏗️ Architecture

This setup includes:
- **Database Container**: MySQL 8.0 with auto-initialized database
- **Application Container**: XAMPP (Apache/PHP/MySQL) for the web application
- **Automated Setup**: Database created and populated automatically on first run

## 📋 Prerequisites

- Docker installed on your system
- Docker Compose installed
- At least 4GB RAM available
- Ports 80, 3306, and 41061 available

## 🚀 Quick Start

### 1. Start the Application

```bash
# Navigate to the project directory
cd /Users/raheem/work/zozutech/bamt-v1

# Start all services (database + application)
docker-compose up -d

# Wait for the database to initialize (about 30-60 seconds)
# You can monitor progress with:
docker-compose logs -f db
```

### 2. Access the Application

Once started, access the application at:
- **Web Interface**: http://localhost:80
- **Database (External)**: localhost:3306

### 3. First Login

Use one of the sample login credentials:
- **Admin Account**
  - Email: `admin@nationalbank.com`
  - Password: `admin123`
- **Manager Account**
  - Email: `manager@nationalbank.com`
  - Password: `manager123`
- **User Account**
  - Email: `user@nationalbank.com`
  - Password: `user123`

## 🛠️ Detailed Setup Steps

### Step 1: Environment Preparation

Ensure you have the required files:
- `docker-compose.yml` - Container orchestration
- `init-db.sh` - Database initialization script
- `bank-asset-management/` - Application source code
- `bank-asset-management/alm_tool.sql` - Database schema & data

### Step 2: Build and Start Services

```bash
# Build and start in detached mode
docker-compose up -d

# First run will take longer due to database initialization
# Subsequent runs will be faster
```

### Step 3: Verify Services are Running

```bash
# Check container status
docker-compose ps

# Should show:
# - db (bank-asset-mysql) - Up (healthy)
# - xampp (myXampp) - Up

# Check logs if needed
docker-compose logs db
docker-compose logs xampp
```

### Step 4: Test Database Connection

```bash
# Test database connectivity
docker-compose exec db mysql -u root -p1 -e "SHOW DATABASES;"

# Verify application data
docker-compose exec db mysql -u root -p1 -e "USE alm_tool; SELECT COUNT(*) FROM users;"
```

## 📁 Project Structure

```
/Users/raheem/work/zozutech/bamt-v1/
├── docker-compose.yml          # Container orchestration
├── init-db.sh                  # Database setup script
├── bank-asset-management/      # Application source code
│   ├── .env                   # Environment configuration
│   ├── alm_tool.sql          # Database schema & sample data
│   └── logs/                  # Application logs
└── README.md                  # This documentation
```

## 🔧 Configuration Details

### Database Configuration
- **Container**: MySQL 8.0
- **Database Name**: `alm_tool`
- **Root Password**: `1`
- **Port**: 3306 (external access)

### Application Configuration
- **Web Server**: Apache 2.4
- **PHP Version**: 8.2.12
- **Port**: 80 (web interface), 41061 (SSH)
- **Database Host**: `db` (internal container name)

### Volume Mappings
- MySQL data persists in Docker volume `bamt-v1_mysql_data`
- Application code mapped to `/opt/lampp/htdocs/`
- Initialization scripts run automatically on first startup

## 🛑 Stopping Services

```bash
# Stop all services (data preserved)
docker-compose stop

# Stop and remove containers (data preserved)
docker-compose down

# Stop and remove everything including volumes (WARNING: deletes database!)
docker-compose down -v
```

## 🔍 Troubleshooting

### Common Issues

#### 1. "Service temporarily unavailable"
**Symptoms**: Application shows error message
**Cause**: Database connection issues
**Solutions**:
```bash
# Check database health
docker-compose ps db

# Restart services
docker-compose restart

# Check database logs
docker-compose logs db
```

#### 2. Port Already in Use
**Symptoms**: Container fails to start
**Solution**: Stop conflicting services or change ports in `docker-compose.yml`

#### 3. Database Initialization Failures
**Symptoms**: Logs show SQL errors
**Solutions**:
```bash
# Reset database
docker-compose down -v
docker-compose up -d db
```

#### 4. Permission Issues
**Symptoms**: File access errors in logs
**Solution**: Ensure proper file permissions on host directories

### Useful Commands

```bash
# View real-time logs
docker-compose logs -f

# Access container shell
docker-compose exec xampp bash
docker-compose exec db bash

# Restart specific service
docker-compose restart xampp

# View database from host
mysql -h localhost -u root -p1 alm_tool

# Backup database
docker-compose exec db mysqldump -u root -p1 alm_tool > backup.sql
```

## 📊 Monitoring

### Database Health Check
The database container includes automatic health monitoring. You can check:
```bash
docker-compose ps db  # Should show "(healthy)"
```

### Application Logs
```bash
# Application errors
tail -f bank-asset-management/logs/php_errors.log

# Container logs
docker-compose logs -f xampp
```

## 🚀 Advanced Usage

### Custom Database Credentials
Edit `bank-asset-management/.env`:
```env
DB_HOST=db
DB_USER=your_username
DB_PASS=your_password
DB_NAME=your_database
```

### Port Customization
Edit `docker-compose.yml`:
```yaml
ports:
  - "8080:80"      # Change web port
  - "3307:3306"    # Change DB port
  - "2222:22"      # Change SSH port
```

### Environment Scaling
For production environments, consider:
- Using environment-specific docker-compose files
- Setting up proper SSL/TLS certificates
- Implementing backup strategies
- Log aggregation and monitoring tools

## 🆘 Support

If you encounter issues:

1. Check the troubleshooting section above
2. Verify Docker and Docker Compose versions
3. Ensure sufficient system resources (4GB+ RAM)
4. Check firewall settings for required ports

## 📋 Version Information

- **Docker Image**: MySQL 8.0.44, XAMPP
- **PHP Version**: 8.2.12
- **Database**: MySQL 8.0
- **Application**: Bank Asset & HR Management System

## 🔄 Updates

When updating the application:
1. Backup your database if needed
2. Update the source code in `bank-asset-management/`
3. Restart services: `docker-compose restart`

---

**Note**: This setup is configured for development. For production deployment, additional security measures and configurations are recommended.
