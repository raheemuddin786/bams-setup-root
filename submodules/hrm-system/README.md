# HRM (Human Resource Management) System

Complete human resource management solution for banking institutions.

## Components Included

### Modules
- **HRM** (`modules/hrm/`) - Employee management interface
- **Attendance** (`modules/attendance/`) - Time tracking and attendance
- **Leaves** (`modules/leaves/`) - Leave management system
- **Payroll** (`modules/payroll/`) - Salary processing
- **Settings** (`modules/settings/`) - System configuration

### Classes
- `Attendance.php` - Attendance management
- `Leave.php` - Leave operations
- `Payroll.php` - Payroll calculations
- `User.php` - Employee data management

### AJAX Endpoints
- `ajax/attendance.php` - Attendance operations
- `ajax/leaves.php` - Leave management
- `ajax/payroll.php` - Payroll operations
- `ajax/hrm.php` - HR operations

## Key Features

### Employee Management
- Employee profile management
- Department and designation tracking
- Employment history
- Performance reviews
- Career progression

### Time & Attendance
- Daily attendance tracking
- Check-in/check-out logging
- Overtime calculation
- Attendance reports
- Holiday management

### Leave Management
- Leave balance tracking
- Leave application workflow
- Approval processes
- Calendar integration
- Accrual calculations

### Payroll Processing
- Salary calculations
- Tax computation
- Deduction management
- Payslip generation
- Multi-currency support

## Database Tables

### Core HRM
- `users` - Employee profiles
- `departments` - Department structure
- `designations` - Job roles

### Time Management
- `attendance` - Daily attendance
- `leave_balance` - Leave entitlements
- `leaves` - Leave applications

### Payroll
- `payroll` - Salary records
- `salary_structures` - Compensation setup
- `deduction_config` - Deduction rules
- `allowance_config` - Allowance rules

### Workflow
- `notifications` - System notifications
- `user_dashboard_preferences` - Dashboard customization

## API Endpoints

### Attendance
- `POST /ajax/attendance.php?action=checkin` - Clock in
- `POST /ajax/attendance.php?action=checkout` - Clock out
- `GET /ajax/attendance.php?action=report` - Attendance reports

### Leave Management
- `POST /ajax/leaves.php?action=apply` - Submit leave request
- `GET /ajax/leaves.php?action=balance` - Leave balance
- `PUT /ajax/leaves.php?action=approve` - Approve/reject leave

### Payroll
- `GET /ajax/payroll.php?action=generate` - Generate payroll
- `GET /ajax/payroll.php?action=payslip` - Get payslip

## Dependencies

- Core Framework submodule
- MySQL 8.0+ with advanced functions
- PHP 8.0+ with datetime extensions
- Email system for notifications

## Installation

```bash
# Copy modules
cp -r modules/hrm/ ../bank-asset-management/modules/
cp -r modules/attendance/ ../bank-asset-management/modules/
cp -r modules/leaves/ ../bank-asset-management/modules/
cp -r modules/payroll/ ../bank-asset-management/modules/
cp -r modules/settings/ ../bank-asset-management/modules/

# Copy AJAX handlers
cp -r ajax/ ../bank-asset-management/

# Copy classes
cp classes/*.php ../bank-asset-management/classes/
```

## Configuration Requirements

### Environment Variables
```env
PAYROLL_PROCESSING_DAY=25
LEAVE_ACCURAL_PERIOD=monthly
ATTENDANCE_GRACE_TIME=15
SALARY_CURRENCY=INR
```

### Database Setup
- Run payroll system initialization scripts
- Configure tax slabs and deduction rules
- Set up holiday calendar
- Initialize employee data

## Security Features

- Role-based access control
- Audit logging for all HR operations
- Data encryption for sensitive information
- GDPR compliance features
- Multi-tenant support for banking branches
