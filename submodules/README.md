# Submodules Management

This document outlines the modular architecture of the Bank Asset & HR Management System, organized into separate Git submodules for better maintainability and team collaboration.

## 📁 Submodule Structure

The application has been divided into the following logical submodules:

### 1. **Core Framework** (`core-framework/`)
- **Purpose**: Foundation components and shared functionality
- **Contents**: Authentication, database abstraction, security, configuration
- **Audience**: All team members, always included

### 2. **Inventory System** (`inventory-system/`)
- **Purpose**: IT and non-IT asset management
- **Contents**: Asset tracking, procurement, software licensing
- **Audience**: Operations and procurement teams

### 3. **HRM System** (`hrm-system/`)
- **Purpose**: Human resource management
- **Contents**: Employee profiles, attendance, payroll, leave management
- **Audience**: HR and management teams

### 4. **Finance & Administration** (`finance-system/`)
- **Purpose**: Administrative and financial workflows
- **Contents**: Note movement, circulars, notifications, loan management
- **Audience**: Finance and administration teams

### 5. **Frontend Assets** (`frontend-assets/`)
- **Purpose**: Static assets and UI components
- **Contents**: CSS, JavaScript, images, themes
- **Audience**: Frontend developers and designers

## 🚀 Getting Started

### Prerequisites
```bash
# Ensure Git is configured
git --version
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Initial Repository Setup
```bash
# Main repository
cd /Users/raheem/work/zozutech/bamt-v1
git init
git add .
git commit -m "Initial project setup with Docker configuration"
```

## 🔧 Setting Up Submodules

### Step 1: Initialize Submodules
```bash
# Initialize all submodules
git submodule init
git submodule update --init --recursive
```

### Step 2: Add Individual Submodules
```bash
# Add core framework (required)
git submodule add ./submodules/core-framework bank-asset-management/classes
git submodule add ./submodules/core-framework bank-asset-management/config
git submodule add ./submodules/core-framework bank-asset-management/auth
git submodule add ./submodules/core-framework bank-asset-management/includes

# Add inventory system
git submodule add ./submodules/inventory-system bank-asset-management/modules/inventory
git submodule add ./submodules/inventory-system bank-asset-management/modules/asset-requests
git submodule add ./submodules/inventory-system bank-asset-management/modules/software
git submodule add ./submodules/inventory-system bank-asset-management/modules/stock-register

# Add HRM system
git submodule add ./submodules/hrm-system bank-asset-management/modules/hrm
git submodule add ./submodules/hrm-system bank-asset-management/modules/attendance
git submodule add ./submodules/hrm-system bank-asset-management/modules/leaves
git submodule add ./submodules/hrm-system bank-asset-management/modules/payroll
git submodule add ./submodules/hrm-system bank-asset-management/modules/settings

# Add finance system
git submodule add ./submodules/finance-system bank-asset-management/modules/notes
git submodule add ./submodules/finance-system bank-asset-management/modules/circulars
git submodule add ./submodules/finance-system bank-asset-management/modules/notifications
git submodule add ./submodules/finance-system bank-asset-management/modules/loans
git submodule add ./submodules/finance-system bank-asset-management/modules/reports

# Add frontend assets
git submodule add ./submodules/frontend-assets bank-asset-management/assets
```

## 📋 Development Workflow

### Daily Development
```bash
# Pull latest changes from all submodules
git submodule foreach git pull origin main

# Check submodule status
git submodule status

# Update all submodules to their latest commit
git submodule update --remote
```

### Working on a Submodule
```bash
# Change to a specific submodule directory
cd bank-asset-management/modules/inventory

# Make changes, then commit in the submodule
git add .
git commit -m "Add new inventory feature"

# Push the submodule changes
git push origin main

# Go back to main project and update submodule reference
cd ../../..
git add bank-asset-management/modules/inventory
git commit -m "Update inventory module to latest version"
git push origin main
```

## 🔄 Release Management

### Tagging Releases
```bash
# Tag a specific submodule
cd submodules/core-framework
git tag -a v2.1.0 -m "Release version 2.1.0"
git push origin v2.1.0

# Update main project to use tagged version
cd ../..
git add submodules/core-framework
git commit -m "Update core-framework submodule to v2.1.0"
```

### Release Process
1. **Development Phase**
   - Make changes in respective submodules
   - Test integration in main project
   
2. **Staging Phase**
   ```bash
   # Create release branch
   git checkout -b release/v1.0.0
   
   # Update all submodules to stable versions
   git submodule foreach git checkout tags/v1.0.0
   
   # Test complete system
   docker-compose up -d
   ```
   
3. **Production Release**
   ```bash
   # Merge release to main
   git checkout main
   git merge release/v1.0.0
   
   # Tag main project
   git tag -a v1.0.0 -m "Production release v1.0.0"
   git push origin main --tags
   ```

## 🔍 Monitoring Submodules

### Status Check
```bash
# Check all submodule status
git submodule status

# Detailed information
git submodule
```

### Health Monitoring
```bash
# Verify all submodules are initialized
git submodule init --all

# Sync submodules
git submodule sync
```

## 🛠️ Troubleshooting

### Common Issues
- **Submodule not found**: Reinitialize with `git submodule deinit --all && git submodule init`
- **Detached HEAD**: Fix with `git checkout main` in submodule directory
- **Permission issues**: Use `chmod -R 755 .` in submodule directories
- **Conflicts**: Resolve manually in submodule, then update main project

### Example Fix Commands
```bash
# Fix detached HEAD
cd submodules/core-framework
git checkout main
cd ../..
git add submodules/core-framework

# Sync after repository move
git submodule sync --recursive
git submodule update --init --recursive
```

## 📚 Best Practices

1. **Regular Updates**: Pull submodule changes daily
2. **Atomic Commits**: Commit in submodules first, then main project
3. **Version Tags**: Tag important releases for stability
4. **Documentation**: Keep README.md updated for each submodule
5. **Testing**: Test submodule changes in main project before pushing

## 🔗 Dependencies

### Core Framework
- Required by all other submodules
- Must be loaded first in initialization

### Optional Submodules
- **inventory-system**: Can be excluded for HR-only deployments
- **hrm-system**: Can be excluded for inventory-only deployments  
- **finance-system**: Required for banking operations
- **frontend-assets**: Required for web interface

## 📞 Support

For submodule development questions:
1. Check individual submodule README.md files
2. Review main project documentation
3. Contact development team for access requests
