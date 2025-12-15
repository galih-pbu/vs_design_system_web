# VS Page Not Found Implementation

**Version 1.0.1 - December 14, 2025**

## Overview

The VS Page Not Found component provides a standardized 404 error page layout with VS Design System styling and consistent messaging. It displays a large "404" number, clear error messaging, and a primary action button for navigation.

## Features

- **Standardized 404 Layout**: Consistent error page design across applications
- **Large Visual Impact**: Prominent "404" display for immediate recognition
- **Clear Messaging**: Descriptive text explaining the error state
- **Primary Action**: "Go Back Home" button that shows a toast notification
- **Responsive Design**: Adapts to different screen sizes with max-width constraints
- **VS Design System Integration**: Uses consistent colors, typography, and spacing
- **Accessibility**: Proper semantic structure and readable text hierarchy

## Basic Usage

```dart
import 'package:vs_design_system/vs_design_system.dart';

// Simple 404 page implementation
class My404Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const VSPageNotFound();
  }
}
```

## Variants

### Standard 404 Page

The default VS Page Not Found component provides a complete error page layout:

```dart
// In your route handling or error boundary
MaterialPageRoute(
  builder: (context) => const VSPageNotFound(),
)
```

### Custom 404 Dialog

For modal presentations or smaller contexts:

```dart
void show404Dialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 500,
        height: 400,
        child: const VSPageNotFound(),
      ),
    ),
  );
}
```

## Advanced Examples

### Custom Error Page with Actions

```dart
class CustomErrorPage extends StatelessWidget {
  final String title;
  final String message;
  final List<Widget> actions;

  const CustomErrorPage({
    super.key,
    required this.title,
    required this.message,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral100,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Custom icon or number
              Text(
                '404',
                style: AppTypography.h1.copyWith(
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDefault,
                  height: 1,
                ),
              ),
              SizedBox(height: AppSpacing.lg),

              // Custom title
              Text(
                title,
                style: AppTypography.h3.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.md),

              // Custom message
              Text(
                message,
                style: AppTypography.bodyLargeRegular.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.xl),

              // Custom actions
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: actions,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Usage
CustomErrorPage(
  title: 'Product Not Found',
  message: 'The product you\'re looking for might have been removed.',
  actions: [
    VSButton(
      label: 'Continue Shopping',
      onPressed: () => Navigator.pushNamed(context, '/products'),
      variant: VSButtonVariant.primary,
    ),
    SizedBox(width: AppSpacing.md),
    VSButton(
      label: 'Go Home',
      onPressed: () => Navigator.pushNamed(context, '/'),
      variant: VSButtonVariant.outlined,
    ),
  ],
)
```

### Error Boundary Integration

```dart
class ErrorBoundary extends StatefulWidget {
  final Widget child;

  const ErrorBoundary({super.key, required this.child});

  @override
  State<ErrorBoundary> createState() => _ErrorBoundaryState();
}

class _ErrorBoundaryState extends State<ErrorBoundary> {
  bool hasError = false;

  @override
  void didCatchError(Object error, StackTrace stackTrace) {
    setState(() => hasError = true);
    // Log error to analytics/service
  }

  @override
  Widget build(BuildContext context) {
    if (hasError) {
      return const VSPageNotFound();
    }
    return widget.child;
  }
}

// Usage in app root
void main() {
  runApp(
    MaterialApp(
      home: ErrorBoundary(
        child: MyApp(),
      ),
    ),
  );
}
```

### Route Not Found Handler

```dart
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/products':
        return MaterialPageRoute(builder: (_) => ProductsPage());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfilePage());
      default:
        // Return 404 page for unknown routes
        return MaterialPageRoute(
          builder: (_) => const VSPageNotFound(),
          settings: settings,
        );
    }
  }
}

// In MaterialApp
MaterialApp(
  onGenerateRoute: AppRouter.generateRoute,
  // ...
)
```

## Real-World Usage Patterns

### E-commerce Product Not Found

```dart
class ProductNotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral100,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Product icon
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.primaryBg.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Icon(
                  Icons.shopping_bag,
                  size: 60,
                  color: AppColors.primaryDefault,
                ),
              ),
              SizedBox(height: AppSpacing.lg),

              Text(
                'Product Not Found',
                style: AppTypography.h3.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.md),

              Text(
                'The product you\'re looking for might have been removed or is temporarily unavailable.',
                style: AppTypography.bodyLargeRegular.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.xl),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VSButton(
                    label: 'Continue Shopping',
                    onPressed: () => Navigator.pushNamed(context, '/products'),
                    variant: VSButtonVariant.primary,
                  ),
                  SizedBox(width: AppSpacing.md),
                  VSButton(
                    label: 'Search Products',
                    onPressed: () => Navigator.pushNamed(context, '/search'),
                    variant: VSButtonVariant.outlined,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### Blog Article Not Found

```dart
class ArticleNotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral100,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Article icon
              Icon(
                Icons.article,
                size: 120,
                color: AppColors.secondaryDefault,
              ),
              SizedBox(height: AppSpacing.lg),

              Text(
                'Article Not Found',
                style: AppTypography.h3.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.md),

              Text(
                'The article you\'re looking for doesn\'t exist or may have been moved.',
                style: AppTypography.bodyLargeRegular.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.xl),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VSButton(
                    label: 'Browse Articles',
                    onPressed: () => Navigator.pushNamed(context, '/blog'),
                    variant: VSButtonVariant.secondary,
                  ),
                  SizedBox(width: AppSpacing.md),
                  VSButton(
                    label: 'Go to Blog',
                    onPressed: () => Navigator.pushNamed(context, '/blog'),
                    variant: VSButtonVariant.outlined,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### Admin Panel Access Denied

```dart
class AccessDeniedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral100,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Admin icon
              Icon(
                Icons.admin_panel_settings,
                size: 120,
                color: AppColors.warningDefault,
              ),
              SizedBox(height: AppSpacing.lg),

              Text(
                'Access Denied',
                style: AppTypography.h3.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.md),

              Text(
                'You don\'t have permission to access this admin page.',
                style: AppTypography.bodyLargeRegular.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.xl),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VSButton(
                    label: 'Request Access',
                    onPressed: () => _requestAccess(),
                    variant: VSButtonVariant.primary,
                  ),
                  SizedBox(width: AppSpacing.md),
                  VSButton(
                    label: 'Go to Dashboard',
                    onPressed: () => Navigator.pushNamed(context, '/dashboard'),
                    variant: VSButtonVariant.outlined,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _requestAccess() {
    // Handle access request logic
  }
}
```

### API Endpoint Not Found

```dart
class ApiNotFoundPage extends StatelessWidget {
  final String endpoint;

  const ApiNotFoundPage({super.key, required this.endpoint});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral100,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // API icon
              Container(
                padding: EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.dangerBg.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Icon(
                  Icons.code,
                  size: 80,
                  color: AppColors.dangerDefault,
                ),
              ),
              SizedBox(height: AppSpacing.lg),

              Text(
                '404 Not Found',
                style: AppTypography.h3.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.sm),

              // Show the endpoint
              Container(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
                decoration: BoxDecoration(
                  color: AppColors.neutral200,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  endpoint,
                  style: AppTypography.bodySmallRegular.copyWith(
                    fontFamily: 'monospace',
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              SizedBox(height: AppSpacing.sm),

              Text(
                'The requested API endpoint does not exist.',
                style: AppTypography.bodyLargeRegular.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.xl),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VSButton(
                    label: 'View API Docs',
                    onPressed: () => Navigator.pushNamed(context, '/api-docs'),
                    variant: VSButtonVariant.primary,
                  ),
                  SizedBox(width: AppSpacing.md),
                  VSButton(
                    label: 'Go to Homepage',
                    onPressed: () => Navigator.pushNamed(context, '/'),
                    variant: VSButtonVariant.outlined,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### Mobile App Screen Not Found

```dart
class MobileNotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral100,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 300),
          padding: EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Mobile icon
              Icon(
                Icons.smartphone,
                size: 80,
                color: AppColors.primaryDefault,
              ),
              SizedBox(height: AppSpacing.lg),

              Text(
                'Oops!',
                style: AppTypography.h4.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.sm),

              Text(
                'This screen is not available',
                style: AppTypography.bodySmallRegular.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.lg),

              VSButton(
                label: 'Go Back',
                onPressed: () => VSToastService.showToast(
                  context,
                  title: 'Navigation',
                  description: 'This would navigate back to previous page',
                  type: VSToastType.info,
                ),
                size: VSButtonSize.small,
                width: double.infinity,
              ),
              SizedBox(height: AppSpacing.sm),
              VSButton(
                label: 'Home',
                onPressed: () => Navigator.pushNamed(context, '/'),
                size: VSButtonSize.small,
                variant: VSButtonVariant.outlined,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### App Store Page Not Found

```dart
class AppNotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral100,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // App icon placeholder
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.primaryBg,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  Icons.apps,
                  color: AppColors.primaryDefault,
                  size: 60,
                ),
              ),
              SizedBox(height: AppSpacing.lg),

              Text(
                'App Not Found',
                style: AppTypography.h3.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.md),

              Text(
                'The app you\'re looking for is no longer available or doesn\'t exist.',
                style: AppTypography.bodyLargeRegular.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.xl),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VSButton(
                    label: 'Browse Apps',
                    onPressed: () => Navigator.pushNamed(context, '/apps'),
                    variant: VSButtonVariant.primary,
                  ),
                  SizedBox(width: AppSpacing.md),
                  VSButton(
                    label: 'Search',
                    onPressed: () => Navigator.pushNamed(context, '/search'),
                    variant: VSButtonVariant.outlined,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## Configuration Options

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `key` | `Key?` | `null` | Widget key for identification |

## Best Practices

### When to Use VS Page Not Found

- **Route Not Found**: For undefined routes in your app navigation
- **Resource Unavailable**: When content has been deleted or moved
- **Access Control**: When users don't have permission to view content
- **API Errors**: For 404 responses from backend services
- **Broken Links**: When internal links point to non-existent pages

### Design Guidelines

- **Consistent Messaging**: Use clear, user-friendly language
- **Action-Oriented**: Always provide clear next steps for users
- **Context-Aware**: Customize content based on the type of resource (product, article, page, etc.)
- **Visual Hierarchy**: Use appropriate typography sizes for different information levels
- **Color Psychology**: Choose colors that match the error context (warning for access denied, neutral for not found)

### Implementation Tips

- **Route Guards**: Implement at the routing level for consistent error handling
- **Error Boundaries**: Use in error boundaries to catch runtime errors
- **Logging**: Log 404 occurrences for analytics and content strategy
- **SEO**: Consider custom meta tags for SEO-optimized error pages
- **Accessibility**: Ensure screen readers can navigate error pages effectively

## Accessibility

- **Semantic HTML**: Uses proper heading hierarchy (h1, h3)
- **Color Contrast**: Maintains WCAG compliant color ratios
- **Keyboard Navigation**: Button is keyboard accessible
- **Screen Readers**: Clear, descriptive text for assistive technologies
- **Focus Management**: Proper focus handling for navigation

## Integration with VS Design System

The VS Page Not Found component integrates seamlessly with other VS Design System components:

- **VSButton**: For primary and secondary actions
- **AppColors**: Consistent color palette usage
- **AppTypography**: Standardized text styling
- **AppSpacing**: Consistent spacing throughout
- **VSDialog**: For modal error presentations
- **VSLink**: For breadcrumb navigation

## Migration Guide

### From Custom Error Pages

```dart
// Before: Custom error page
class Custom404Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('404 - Page Not Found'),
      ),
    );
  }
}

// After: VS Design System
class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const VSPageNotFound();
  }
}
```

### From Third-Party Libraries

```dart
// Before: Third-party error widget
ErrorWidget.builder = (error) => CustomErrorWidget();

// After: VS Design System integration
ErrorWidget.builder = (error) => const VSPageNotFound();
```</content>
<parameter name="filePath">c:\vs_design_system\lib\markdown2\VS_PAGE_NOT_FOUND_IMPLEMENTATION.md