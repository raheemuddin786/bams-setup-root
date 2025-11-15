# Inventory System

Comprehensive IT and non-IT asset management system for banking operations.

## Components Included

### Modules
- **Inventory Management** (`modules/inventory/`) - IT hardware asset tracking
- **Non-IT Assets** (`modules/non-it-assets/`) - Furniture, vehicles, equipment
- **Asset Requests** (`modules/asset-requests/`) - Asset procurement workflow
- **Software Inventory** (`modules/software/`) - Software license management
- **Stock Register** (`modules/stock-register/`) - Stock and procurement tracking

### Classes
- `Inventory.php` - IT asset operations
- `NonITAsset.php` - Non-IT asset operations
- `SoftwareInventory.php` - Software license operations

### AJAX Endpoints
- `ajax/inventory.php` - IT asset AJAX handlers
- `ajax/non-it-assets.php` - Non-IT asset AJAX handlers
- `ajax/software.php` - Software inventory AJAX handlers

## Key Features

### IT Asset Management
- Hardware inventory tracking
- Software licensing compliance
- AMC/SLA management
- Maintenance scheduling
- Depreciation calculations

### Non-IT Asset Management
- Furniture and fixture tracking
- Vehicle management
- Equipment lifecycle management
- Cost center allocation

### Procurement Workflow
- Asset request creation
- Approval workflows
- Budget tracking
- Vendor management

## Dependencies

- Core Framework submodule
- MySQL 8.0+
- PHP 8.0+ with PDO

## Installation

```bash
# Copy to main application
cp -r modules/ ../bank-asset-management/
cp -r ajax/ ../bank-asset-management/

# Copy classes to appropriate location
cp classes/Inventory.php ../bank-asset-management/classes/
cp classes/NonITAsset.php ../bank-asset-management/classes/
cp classes/SoftwareInventory.php ../bank-asset-management/classes/
```

## Database Tables

- `inventory` - IT hardware assets
- `non_it_assets` - Non-IT assets
- `software_inventory` - Software licenses
- `asset_history` - Asset lifecycle tracking
- `asset_requests` - Procurement requests
- `stock_register` - Inventory movements

## API Endpoints

- `GET /modules/inventory/` - Asset listing
- `POST /modules/inventory/add` - Add new asset
- `PUT /modules/inventory/update/{id}` - Update asset
- `GET /ajax/inventory.php` - AJAX data operations
