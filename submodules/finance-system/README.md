# Finance & Administration System

Administrative and financial workflow management for banking operations.

## Components Included

### Modules
- **Notes** (`modules/notes/`) - Note approval workflow system
- **Circulars** (`modules/circulars/`) - Official communication system
- **Notifications** (`modules/notifications/`) - Internal messaging
- **Loans** (`modules/loans/`) - Employee loan management
- **Reports** (`modules/reports/`) - Financial and operational reporting

### Classes
- `Note.php` - Note management operations
- `Circular.php` - Circular handling
- `Report.php` - Report generation

### AJAX Endpoints
- `ajax/notes.php` - Note workflow operations
- `ajax/circulars.php` - Circular management
- `ajax/loans.php` - Loan processing

## Key Features

### Note Movement System
- Multi-level approval workflow
- Hierarchical authorization
- Escalation mechanisms
- Audit trails
- Digital signatures

### Circular Management
- Official communication distribution
- Read receipts and acknowledgments
- Archival and search
- Compliance tracking
- Department-wise circulation

### Notification System
- Real-time notifications
- Email and SMS integration
- Customizable templates
- Delivery status tracking
- Priority management

### Loan Management
- Loan application processing
- EMI calculations
- Payment tracking
- Interest computation
- Loan recovery management

### Reporting Suite
- Financial reports
- Operational dashboards
- Compliance reports
- Custom report builder
- Export capabilities

## Database Tables

### Workflow Management
- `notes` - Official notes and proposals
- `note_approvals` - Approval workflow tracking
- `circulars` - Official communications
- `circular_views` - Read receipts

### Financial Operations
- `employee_loans` - Loan records
- `employee_advances` - Salary advances
- `loan_advance_recoveries` - Recovery tracking

### Communication
- `notifications` - System notifications
- `email_queue` - Email delivery queue
- `sms_queue` - SMS delivery queue (if applicable)

## API Endpoints

### Note Workflow
- `POST /ajax/notes.php?action=create` - Create new note
- `PUT /ajax/notes.php?action=approve` - Approve note
- `GET /ajax/notes.php?action=history` - Note history

### Circulars
- `POST /ajax/circulars.php?action=publish` - Publish circular
- `GET /ajax/circulars.php?action=views` - Circular views
- `DELETE /ajax/circulars.php?action=archive` - Archive circular

### Loans
- `POST /ajax/loans.php?action=apply` - Apply for loan
- `GET /ajax/loans.php?action=calculate_emi` - EMI calculation
- `PUT /ajax/loans.php?action=disburse` - Disburse loan

### Reports
- `GET /ajax/reports.php?action=generate` - Generate report
- `POST /ajax/reports.php?action=export` - Export report

## Workflow Definitions

### Note Approval Hierarchy
```
Staff Assistant → Assistant Manager → Manager/DGM →
CEO → Chairman (escalation)
```

### Approval Authorities
- **Monetary Limits**: Role-based approval amounts
- **Department Heads**: Automatic routing
- **Escalation**: Time-based automatic escalation
- **Exception Handling**: Emergency approval routes

## Dependencies

- Core Framework submodule
- Email/SMS service integration
- PDF generation libraries
- Advanced MySQL functions (stored procedures)
- Cron jobs for scheduled tasks

## Installation

```bash
# Copy modules
cp -r modules/notes/ ../bank-asset-management/modules/
cp -r modules/circulars/ ../bank-asset-management/modules/
cp -r modules/notifications/ ../bank-asset-management/modules/
cp -r modules/loans/ ../bank-asset-management/modules/
cp -r modules/reports/ ../bank-asset-management/modules/

# Copy classes
cp classes/Note.php ../bank-asset-management/classes/
cp classes/Circular.php ../bank-asset-management/classes/
cp classes/Report.php ../bank-asset-management/classes/
```

## Configuration Requirements

### Environment Variables
```env
NOTE_ESCALATION_DAYS=7
EMAIL_SMTP_HOST=smtp.gmail.com
EMAIL_SMTP_PORT=587
CIRCULAR_RETENTION_DAYS=365
LOAN_PROCESSING_FEES=0.5
REPORT_CACHE_DURATION=3600
```

### Database Setup
- Create approval workflow triggers
- Initialize notification templates
- Set up circular distribution rules
- Configure loan sanction limits

## Security & Compliance

### Audit Logging
- Complete audit trail for all operations
- Digital signatures for approvals
- Tamper-proof logging
- Compliance with regulatory requirements

### Access Control
- Role-based permissions
- Multi-factor authentication
- Department-specific access
- Document classification levels

### Data Protection
- Encryption of sensitive financial data
- Secure file storage for attachments
- Automatic data purging policies
- Backup and disaster recovery procedures

## Integration Points

- **Banking Systems**: Core banking integration
- **Email Systems**: SMTP configuration
- **SMS Gateways**: SMS delivery integration
- **Document Management**: File storage and retrieval
- **Reporting Tools**: BI tool integration

## Monitoring & Analytics

- Workflow completion tracking
- Approval bottleneck identification
- User activity analytics
- System performance metrics
- Compliance reporting dashboards
