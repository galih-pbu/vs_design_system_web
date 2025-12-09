# VS Toast Implementation

## Overview

The VS Toast component provides non-intrusive notifications for user feedback with VS Design System styling. It offers temporary, auto-dismissing messages that appear as overlays to inform users about actions, errors, or system status without interrupting their workflow.

## Features

- **Multiple Toast Types**: Success, error, warning, and info variants with appropriate colors and icons
- **Flexible Positioning**: Top, bottom, and center screen placement options
- **Duration Control**: Configurable display duration or persistent toasts
- **Interactive Actions**: Optional action buttons for user responses
- **Progress Indicator**: Visual countdown for auto-dismissing toasts
- **VS Design System Integration**: Consistent colors, typography, and spacing
- **Smooth Animations**: Fade in/out transitions and progress bar animations
- **Accessibility**: Proper screen reader support and keyboard navigation
- **Overlay Management**: Proper layering and z-index handling

## Basic Usage

```dart
import 'package:vs_design_system/vs_design_system.dart';

class NotificationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSButton(
          label: 'Show Success Toast',
          onPressed: () => VSToastService.showToast(
            context,
            title: 'Operation completed successfully!',
            description: 'Your changes have been saved.',
            type: VSToastType.success,
          ),
        ),
        SizedBox(height: AppSpacing.md),
        VSButton(
          label: 'Show Error Toast',
          onPressed: () => VSToastService.showToast(
            context,
            title: 'An error occurred',
            description: 'Please try again later.',
            type: VSToastType.error,
          ),
        ),
      ],
    );
  }
}
```

## Toast Types

### Success Toast

```dart
VSToastService.showToast(
  context,
  title: 'File uploaded successfully',
  description: 'Your document has been saved to the cloud.',
  type: VSToastType.success,
);
```

### Error Toast

```dart
VSToastService.showToast(
  context,
  title: 'Upload failed',
  description: 'File size exceeds the maximum limit of 10MB.',
  type: VSToastType.error,
);
```

### Warning Toast

```dart
VSToastService.showToast(
  context,
  title: 'Session expiring',
  description: 'Your session will expire in 5 minutes.',
  type: VSToastType.warning,
);
```

### Info Toast

```dart
VSToastService.showToast(
  context,
  title: 'New updates available',
  description: 'Version 2.1.0 is ready to download.',
  type: VSToastType.info,
);
```

## Positioning

### Top Right (Default)

```dart
VSToastService.showToast(
  context,
  title: 'Notification',
  description: 'This appears at the top right.',
  type: VSToastType.info,
  alignment: Alignment.topRight,
);
```

### Bottom Right

```dart
VSToastService.showToast(
  context,
  title: 'Notification',
  description: 'This appears at the bottom right.',
  type: VSToastType.success,
  alignment: Alignment.bottomRight,
);
```

### Center

```dart
VSToastService.showToast(
  context,
  title: 'Important Message',
  description: 'This appears in the center of the screen.',
  type: VSToastType.warning,
  alignment: Alignment.center,
);
```

## Duration Control

### Short Duration (2 seconds)

```dart
VSToastService.showToast(
  context,
  title: 'Quick notification',
  description: 'This disappears quickly.',
  type: VSToastType.success,
  duration: const Duration(seconds: 2),
);
```

### Long Duration (8 seconds)

```dart
VSToastService.showToast(
  context,
  title: 'Detailed message',
  description: 'This stays visible longer for important information.',
  type: VSToastType.info,
  duration: const Duration(seconds: 8),
);
```

### Persistent Toast

```dart
VSToastService.showToast(
  context,
  title: 'Critical alert',
  description: 'This stays until manually dismissed.',
  type: VSToastType.error,
  duration: null, // Persistent
  actionLabel: 'Dismiss',
  onActionTap: () => print('Toast dismissed'),
);
```

## Interactive Toasts with Actions

### Action Button

```dart
VSToastService.showToast(
  context,
  title: 'Update available',
  description: 'A new version is ready to install.',
  type: VSToastType.info,
  actionLabel: 'Update Now',
  onActionTap: () => _performUpdate(),
);

void _performUpdate() {
  // Handle update logic
  print('Starting update...');
}
```

### Undo Action

```dart
VSToastService.showToast(
  context,
  title: 'Item deleted',
  description: 'The selected item has been removed.',
  type: VSToastType.warning,
  actionLabel: 'Undo',
  onActionTap: () => _undoDelete(),
);

void _undoDelete() {
  // Restore the deleted item
  print('Restoring deleted item...');
}
```

### Retry Action

```dart
VSToastService.showToast(
  context,
  title: 'Connection failed',
  description: 'Unable to connect to the server.',
  type: VSToastType.error,
  actionLabel: 'Retry',
  onActionTap: () => _retryConnection(),
);

void _retryConnection() {
  // Attempt to reconnect
  print('Retrying connection...');
}
```

## Advanced Examples

### Form Validation Feedback

```dart
class FormWithToastFeedback extends StatefulWidget {
  @override
  State<FormWithToastFeedback> createState() => _FormWithToastFeedbackState();
}

class _FormWithToastFeedbackState extends State<FormWithToastFeedback> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          VSInputField(
            label: 'Email',
            controller: _emailController,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Email is required';
              }
              if (!value!.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(height: AppSpacing.md),
          VSInputField(
            label: 'Password',
            controller: _passwordController,
            obscureText: true,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Password is required';
              }
              if (value!.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          SizedBox(height: AppSpacing.lg),
          VSButton(
            label: 'Submit',
            onPressed: _submitForm,
            variant: VSButtonVariant.primary,
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Form is valid
      VSToastService.showToast(
        context,
        title: 'Form submitted successfully',
        description: 'Thank you for your submission.',
        type: VSToastType.success,
      );
      _clearForm();
    } else {
      // Form has validation errors
      VSToastService.showToast(
        context,
        title: 'Please correct the errors',
        description: 'Some fields are missing or invalid.',
        type: VSToastType.error,
      );
    }
  }

  void _clearForm() {
    _emailController.clear();
    _passwordController.clear();
    _formKey.currentState?.reset();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
```

### File Upload with Progress Feedback

```dart
class FileUploadWidget extends StatefulWidget {
  @override
  State<FileUploadWidget> createState() => _FileUploadWidgetState();
}

class _FileUploadWidgetState extends State<FileUploadWidget> {
  bool _isUploading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSButton(
          label: _isUploading ? 'Uploading...' : 'Upload File',
          onPressed: _isUploading ? null : _uploadFile,
          variant: VSButtonVariant.primary,
        ),
      ],
    );
  }

  Future<void> _uploadFile() async {
    setState(() => _isUploading = true);

    try {
      // Simulate file upload
      await Future.delayed(const Duration(seconds: 2));

      VSToastService.showToast(
        context,
        title: 'Upload completed',
        description: 'Your file has been uploaded successfully.',
        type: VSToastType.success,
        actionLabel: 'View File',
        onActionTap: () => _viewUploadedFile(),
      );
    } catch (error) {
      VSToastService.showToast(
        context,
        title: 'Upload failed',
        description: 'An error occurred while uploading your file.',
        type: VSToastType.error,
        actionLabel: 'Retry',
        onActionTap: () => _uploadFile(),
      );
    } finally {
      setState(() => _isUploading = false);
    }
  }

  void _viewUploadedFile() {
    // Navigate to view the uploaded file
    print('Opening uploaded file...');
  }
}
```

### Shopping Cart Actions

```dart
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // Product image and details...
          Row(
            children: [
              Expanded(
                child: VSButton(
                  label: 'Add to Cart',
                  onPressed: () => _addToCart(context),
                  variant: VSButtonVariant.primary,
                ),
              ),
              SizedBox(width: AppSpacing.sm),
              VSButton(
                label: 'Buy Now',
                onPressed: () => _buyNow(context),
                variant: VSButtonVariant.secondary,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _addToCart(BuildContext context) {
    // Add to cart logic
    VSToastService.showToast(
      context,
      title: 'Added to cart',
      description: '${product.name} has been added to your cart.',
      type: VSToastType.success,
      actionLabel: 'View Cart',
      onActionTap: () => _navigateToCart(context),
    );
  }

  void _buyNow(BuildContext context) {
    // Buy now logic
    VSToastService.showToast(
      context,
      title: 'Processing order',
      description: 'Redirecting to checkout...',
      type: VSToastType.info,
      duration: const Duration(seconds: 2),
    );

    // Simulate navigation delay
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to checkout
      print('Navigating to checkout...');
    });
  }

  void _navigateToCart(BuildContext context) {
    // Navigate to cart page
    print('Navigating to cart...');
  }
}
```

### Authentication Feedback

```dart
class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSInputField(
          label: 'Email',
          controller: _emailController,
        ),
        SizedBox(height: AppSpacing.md),
        VSInputField(
          label: 'Password',
          controller: _passwordController,
          obscureText: true,
        ),
        SizedBox(height: AppSpacing.lg),
        VSButton(
          label: _isLoading ? 'Signing in...' : 'Sign In',
          onPressed: _isLoading ? null : _signIn,
          variant: VSButtonVariant.primary,
        ),
        SizedBox(height: AppSpacing.md),
        TextButton(
          onPressed: _forgotPassword,
          child: Text('Forgot Password?'),
        ),
      ],
    );
  }

  Future<void> _signIn() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      VSToastService.showToast(
        context,
        title: 'Missing information',
        description: 'Please enter both email and password.',
        type: VSToastType.warning,
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      // Simulate authentication
      await Future.delayed(const Duration(seconds: 2));

      // Simulate successful login
      VSToastService.showToast(
        context,
        title: 'Welcome back!',
        description: 'You have successfully signed in.',
        type: VSToastType.success,
      );

      // Navigate to dashboard
      _navigateToDashboard();
    } catch (error) {
      VSToastService.showToast(
        context,
        title: 'Sign in failed',
        description: 'Invalid email or password. Please try again.',
        type: VSToastType.error,
        actionLabel: 'Reset Password',
        onActionTap: () => _forgotPassword(),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _forgotPassword() {
    VSToastService.showToast(
      context,
      title: 'Password reset sent',
      description: 'Check your email for password reset instructions.',
      type: VSToastType.info,
    );
  }

  void _navigateToDashboard() {
    // Navigate to dashboard
    print('Navigating to dashboard...');
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
```

## Real-World Usage Patterns

### E-commerce Operations

```dart
class EcommerceActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Add to Cart
        VSButton(
          label: 'Add to Cart',
          onPressed: () => VSToastService.showToast(
            context,
            title: 'Added to cart',
            description: 'Wireless headphones added to your cart.',
            type: VSToastType.success,
            actionLabel: 'View Cart',
            onActionTap: () => _viewCart(),
          ),
        ),

        SizedBox(height: AppSpacing.md),

        // Out of Stock
        VSButton(
          label: 'Out of Stock',
          onPressed: () => VSToastService.showToast(
            context,
            title: 'Out of stock',
            description: 'This item is currently unavailable.',
            type: VSToastType.warning,
          ),
        ),

        SizedBox(height: AppSpacing.md),

        // Order Placed
        VSButton(
          label: 'Place Order',
          onPressed: () => VSToastService.showToast(
            context,
            title: 'Order placed successfully',
            description: 'Your order #12345 has been confirmed.',
            type: VSToastType.success,
            actionLabel: 'Track Order',
            onActionTap: () => _trackOrder(),
          ),
        ),

        SizedBox(height: AppSpacing.md),

        // Payment Failed
        VSButton(
          label: 'Payment Failed',
          onPressed: () => VSToastService.showToast(
            context,
            title: 'Payment failed',
            description: 'Please check your card details and try again.',
            type: VSToastType.error,
            actionLabel: 'Retry Payment',
            onActionTap: () => _retryPayment(),
          ),
        ),
      ],
    );
  }

  void _viewCart() {
    // Navigate to cart
  }

  void _trackOrder() {
    // Navigate to order tracking
  }

  void _retryPayment() {
    // Retry payment process
  }
}
```

### File Management

```dart
class FileOperations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // File Saved
        VSButton(
          label: 'Save File',
          onPressed: () => VSToastService.showToast(
            context,
            title: 'File saved',
            description: 'Document saved successfully.',
            type: VSToastType.success,
          ),
        ),

        SizedBox(height: AppSpacing.md),

        // Upload Complete
        VSButton(
          label: 'Upload File',
          onPressed: () => VSToastService.showToast(
            context,
            title: 'Upload complete',
            description: 'File uploaded successfully to the cloud.',
            type: VSToastType.success,
            actionLabel: 'View File',
            onActionTap: () => _viewFile(),
          ),
        ),

        SizedBox(height: AppSpacing.md),

        // File Too Large
        VSButton(
          label: 'Upload Large File',
          onPressed: () => VSToastService.showToast(
            context,
            title: 'File too large',
            description: 'File size exceeds the maximum limit of 10MB.',
            type: VSToastType.error,
          ),
        ),

        SizedBox(height: AppSpacing.md),

        // Download Started
        VSButton(
          label: 'Download File',
          onPressed: () => VSToastService.showToast(
            context,
            title: 'Download started',
            description: 'Check your downloads folder.',
            type: VSToastType.info,
          ),
        ),
      ],
    );
  }

  void _viewFile() {
    // Open uploaded file
  }
}
```

### System Notifications

```dart
class SystemNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Update Available
        VSButton(
          label: 'Check for Updates',
          onPressed: () => VSToastService.showToast(
            context,
            title: 'Update available',
            description: 'Version 2.1.0 is available with new features.',
            type: VSToastType.info,
            actionLabel: 'Update Now',
            onActionTap: () => _startUpdate(),
          ),
        ),

        SizedBox(height: AppSpacing.md),

        // Maintenance Warning
        VSButton(
          label: 'Maintenance Alert',
          onPressed: () => VSToastService.showToast(
            context,
            title: 'Scheduled maintenance',
            description: 'System will be down for maintenance in 30 minutes.',
            type: VSToastType.warning,
          ),
        ),

        SizedBox(height: AppSpacing.md),

        // Backup Complete
        VSButton(
          label: 'Run Backup',
          onPressed: () => VSToastService.showToast(
            context,
            title: 'Backup complete',
            description: 'Automatic backup completed successfully.',
            type: VSToastType.success,
          ),
        ),

        SizedBox(height: AppSpacing.md),

        // Connection Restored
        VSButton(
          label: 'Test Connection',
          onPressed: () => VSToastService.showToast(
            context,
            title: 'Connection restored',
            description: 'Internet connection has been restored.',
            type: VSToastType.success,
          ),
        ),
      ],
    );
  }

  void _startUpdate() {
    // Start update process
  }
}
```

### Form Validation

```dart
class FormValidation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Form Saved
        VSButton(
          label: 'Save Form',
          onPressed: () => VSToastService.showToast(
            context,
            title: 'Form saved',
            description: 'Your changes have been saved successfully.',
            type: VSToastType.success,
          ),
        ),

        SizedBox(height: AppSpacing.md),

        // Validation Error
        VSButton(
          label: 'Submit Invalid Form',
          onPressed: () => VSToastService.showToast(
            context,
            title: 'Validation error',
            description: 'Please fill in all required fields.',
            type: VSToastType.error,
          ),
        ),

        SizedBox(height: AppSpacing.md),

        // Email Sent
        VSButton(
          label: 'Send Email',
          onPressed: () => VSToastService.showToast(
            context,
            title: 'Email sent',
            description: 'Message sent successfully. We\'ll get back to you soon!',
            type: VSToastType.success,
          ),
        ),

        SizedBox(height: AppSpacing.md),

        // Duplicate Entry
        VSButton(
          label: 'Submit Duplicate',
          onPressed: () => VSToastService.showToast(
            context,
            title: 'Duplicate entry',
            description: 'This email address is already registered.',
            type: VSToastType.warning,
          ),
        ),
      ],
    );
  }
}
```

## Configuration Options

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `title` | `String` | Required | Main message title displayed in the toast |
| `description` | `String` | Required | Additional descriptive text |
| `type` | `VSToastType` | `VSToastType.success` | Toast variant (success, error, warning, info) |
| `duration` | `Duration` | `Duration(seconds: 5)` | How long the toast stays visible |
| `alignment` | `Alignment` | `Alignment.topRight` | Screen position for the toast |
| `actionLabel` | `String?` | `null` | Text for optional action button |
| `onActionTap` | `VoidCallback?` | `null` | Callback when action button is tapped |

## Best Practices

### When to Use Toasts

- **Non-intrusive Feedback**: For operations that don't require immediate user attention
- **Quick Status Updates**: For confirming actions without interrupting workflow
- **Error Notifications**: For displaying errors that don't block the interface
- **Progress Updates**: For background operations and status changes
- **Transient Information**: For information that doesn't need to persist

### Design Guidelines

- **Clear Messaging**: Use concise, actionable language
- **Appropriate Types**: Choose the right toast type for the message context
- **Strategic Positioning**: Use top-right for general notifications, center for important alerts
- **Proper Duration**: Match duration to message importance (2-5 seconds for routine, longer for critical)
- **Action Buttons**: Only include when user action is expected or beneficial

### Implementation Tips

- **Queue Management**: Handle multiple toasts gracefully
- **Accessibility**: Ensure screen readers can announce toasts
- **Mobile Considerations**: Adjust positioning for mobile screens
- **Theme Integration**: Respect user's theme preferences
- **Testing**: Test with various screen sizes and orientations

## Accessibility

- **Screen Reader Support**: Proper ARIA labels and live regions
- **Keyboard Navigation**: Toast action buttons are keyboard accessible
- **Color Contrast**: Sufficient contrast for all toast types
- **Motion Preferences**: Respects user's motion preferences
- **Focus Management**: Proper focus handling when toasts appear

## Integration with VS Design System

The VS Toast component integrates seamlessly with other VS Design System components:

- **VSButton**: For action buttons within toast content
- **VSDialog**: For more complex interactions requiring user input
- **VSInputField**: For forms that trigger toast feedback
- **AppColors**: Consistent color scheme across toast types
- **AppTypography**: Standardized text styling for toast content
- **AppSpacing**: Consistent spacing and layout within toasts

## Migration Guide

### From Flutter SnackBar

```dart
// Before: Flutter SnackBar
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('Operation completed'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () => undoOperation(),
    ),
  ),
);

// After: VS Toast
VSToastService.showToast(
  context,
  title: 'Operation completed',
  description: 'Your changes have been saved.',
  type: VSToastType.success,
  actionLabel: 'Undo',
  onActionTap: () => undoOperation(),
);
```

### From Custom Toast Implementation

```dart
// Before: Custom toast
class CustomToast extends StatelessWidget {
  final String message;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: backgroundColor,
      child: Text(message),
    );
  }
}

// After: VS Toast
VSToastService.showToast(
  context,
  title: message,
  description: '',
  type: VSToastType.info,
  // VS Design System handles styling automatically
);
```

### From Alert Dialogs for Simple Messages

```dart
// Before: Alert dialog for simple message
showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: Text('Success'),
    content: Text('Operation completed successfully'),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text('OK'),
      ),
    ],
  ),
);

// After: VS Toast for non-blocking feedback
VSToastService.showToast(
  context,
  title: 'Success',
  description: 'Operation completed successfully',
  type: VSToastType.success,
);
```