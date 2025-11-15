# Core Framework

Core components and base functionality for the Bank Asset & HR Management System.

## Components Included

### Classes (`classes/`)
- `Auth.php` - Authentication and authorization
- `Database.php` - Database connectivity and operations
- `Security.php` - Security functions and validations
- `User.php` - User management

### Configuration (`config/`)
- Database configuration
- Application settings
- Constants and environment variables

### Authentication (`auth/`)
- Login/logout functionality
- Session management
- Password handling

### Includes (`includes/`)
- Common header/footer files
- Navigation components
- Utility functions

## Dependencies

- PHP 8.0+
- MySQL 8.0+
- PDO extension

## Installation

```bash
# Copy to main application
cp -r classes/ ../bank-asset-management/
cp -r config/ ../bank-asset-management/
cp -r auth/ ../bank-asset-management/
cp -r includes/ ../bank-asset-management/
```

## Development

1. Make changes to files in this directory
2. Test locally
3. Update main application with `git submodule update`
