# Frontend Assets

Static assets, CSS, JavaScript, and media files for the Bank Asset & HR Management System.

## Components Included

### Assets Directory (`assets/`)
- **CSS** (`assets/css/`) - Stylesheets and themes
- **JS** (`assets/js/`) - JavaScript libraries and custom scripts
- **Images** (`assets/images/`) - Logos, icons, and media files
- **Fonts** (`assets/fonts/`) - Custom fonts and icon fonts

### Third-party Libraries
- Bootstrap 5.x - UI framework
- jQuery 3.x - JavaScript utility library
- DataTables - Table management
- Chart.js - Data visualization
- Font Awesome - Icon library
- Summernote - Rich text editor

## Directory Structure

```
assets/
├── css/
│   ├── bootstrap.min.css
│   ├── custom.css
│   ├── themes/
│   │   ├── default.css
│   │   └── dark.css
│   └── responsive.css
├── js/
│   ├── jquery.min.js
│   ├── bootstrap.bundle.min.js
│   ├── datatables.min.js
│   ├── chart.min.js
│   └── custom.js
├── images/
│   ├── logo.png
│   ├── favicon.ico
│   ├── icons/
│   └── backgrounds/
└── fonts/
    ├── fontawesome/
    └── custom-fonts/
```

## Key Features

### Responsive Design
- Mobile-first approach
- Cross-browser compatibility
- Adaptive layouts for all screen sizes
- Touch-friendly interfaces

### Dashboard Components
- Interactive charts and graphs
- Real-time data widgets
- Customizable user dashboards
- Export functionality for reports

### User Interface Elements
- Form validation and feedback
- Modal dialogs and notifications
- Progress indicators
- File upload components

### Accessibility
- WCAG 2.1 compliance
- Keyboard navigation support
- Screen reader compatibility
- High contrast mode support

## Dependencies

- Modern web browser (Chrome, Firefox, Safari, Edge)
- JavaScript enabled
- Local storage support
- Cookie support for sessions

## Installation

```bash
# Copy to main application
cp -r assets/ ../bank-asset-management/

# Or create symbolic link for development
ln -s $(pwd)/assets ../bank-asset-management/assets
```

## Customization

### Theme Development

Create custom themes by extending the base styles:

```css
/* Custom theme example */
:root {
  --primary-color: #0039a6;
  --secondary-color: #f1f524;
  --accent-color: #28a745;
  --text-color: #212529;
  --background-color: #ffffff;
}

.custom-theme {
  /* Custom theme styles */
}
```

### JavaScript Components

Add custom functionality:

```javascript
// Custom module example
$(document).ready(function() {
  // Initialize custom components
  initCustomDashboard();
  initDataExport();
});

function initCustomDashboard() {
  // Custom dashboard logic
}

function initDataExport() {
  // Custom export functionality
}
```

## Build Process

### Asset Compilation (if needed)
```bash
# Minify CSS
cssnano assets/css/*.css > assets/css/minified.css

# Bundle JavaScript
terser assets/js/*.js > assets/js/bundle.min.js
```

### Image Optimization
```bash
# Compress images
imagemin assets/images/* --out-dir=assets/images/optimized
```

## Performance Optimization

### Caching Strategy
- Browser cache headers for static assets
- CDN integration for public assets
- Versioning for cache busting

### Loading Optimization
- CSS above the fold
- JavaScript deferral
- Lazy loading for images
- Compression (gzip/deflate)

## Browser Support

- **Modern Browsers**: Chrome 90+, Firefox 88+, Safari 14+, Edge 90+
- **Mobile Browsers**: iOS Safari 14+, Chrome Mobile 90+
- **Legacy Support**: Partial support for older browsers (graceful degradation)

## Testing

### Cross-browser Testing
To ensure compatibility across different browsers:

```bash
# Use browser testing tools
npm install -g lighthouse
lighthouse http://localhost:80 --output html --output-path ./report.html
```

### Performance Testing
```bash
# Test loading performance
curl -o /dev/null -s -w "%{time_total}\n" http://localhost:80/assets/css/bootstrap.min.css
```

## Maintenance

### Update Process
1. Backup current assets
2. Update libraries from official sources
3. Test functionality across all modules
4. Update version numbers for cache busting
5. Deploy to staging environment
6. Validate and deploy to production

### Security Considerations
- Regularly update third-party libraries
- Scan for vulnerabilities
- Validate file uploads
- Implement CSP (Content Security Policy)
- Use HTTPS for all asset delivery

## Documentation

### Asset Organization
- **CSS Structure**: Organized by component and function
- **JavaScript**: Modular architecture with clear separation of concerns
- **Images**: Categorized by type and usage
- **Naming Convention**: kebab-case for files, camelCase for classes

### File Naming Convention
```
assets/
├── css/
│   ├── component-name.css
│   ├── page-specific.css
│   └── utilities.css
├── js/
│   ├── component-name.js
│   ├── page-specific.js
│   └── global-utils.js
└── images/
    ├── icon-name.svg
    ├── logo-variant.png
    └── background-image.jpg
```

## Troubleshooting

### Common Issues

1. **Assets not loading**
   - Check file permissions
   - Verify file paths
   - Clear browser cache
   - Check .htaccess rewrites

2. **JavaScript errors**
   - Check browser console
   - Verify jQuery loading order
   - Confirm script dependencies

3. **CSS not applying**
   - Check CSS specificity
   - Verify CSS loading order
   - Clear browser cache
   - Check for syntax errors

4. **Images not displaying**
   - Verify file paths
   - Check image format support
   - Confirm file permissions
   - Check browser network tab
