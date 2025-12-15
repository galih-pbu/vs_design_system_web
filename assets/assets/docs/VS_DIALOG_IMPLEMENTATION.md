# VS Dialog

**Version 1.0.1 - December 14, 2025**

The VS Dialog component provides modal dialogs for user interactions, confirmations, and information display with multiple variants and customization options.

## Overview

The `VSDialog` widget creates modal overlays for important user interactions, confirmations, and information display with consistent styling and behavior.

## Features

- **Multiple Types**: Info, warning, error, success, and custom dialogs
- **Action Buttons**: Configurable action buttons with callbacks
- **Icons**: Automatic icons based on dialog type
- **Loading States**: Built-in loading indicators
- **Custom Content**: Flexible content area for forms and complex layouts
- **Accessibility**: Screen reader support and keyboard navigation
- **Responsive Design**: Adapts to different screen sizes
- **Animation**: Smooth show/hide transitions

## Basic Usage

```dart
showDialog(
  context: context,
  builder: (context) => VSDialog(
    title: 'Confirm Action',
    message: 'Are you sure you want to proceed?',
    actions: [
      VSDialogAction(
        label: 'Cancel',
        onPressed: () => Navigator.of(context).pop(),
      ),
      VSDialogAction(
        label: 'Confirm',
        onPressed: () {
          // Handle confirmation
          Navigator.of(context).pop();
        },
      ),
    ],
  ),
);
```

## Dialog Types

### Info Dialog
General information dialog with blue accent.

```dart
VSDialog(
  type: VSDialogType.info,
  title: 'Information',
  message: 'This is an informational message.',
  actions: [
    VSDialogAction(
      label: 'OK',
      onPressed: () => Navigator.of(context).pop(),
    ),
  ],
)
```

### Warning Dialog
Warning dialog with yellow/orange accent.

```dart
VSDialog(
  type: VSDialogType.warning,
  title: 'Warning',
  message: 'This action cannot be undone.',
  actions: [
    VSDialogAction(
      label: 'Cancel',
      onPressed: () => Navigator.of(context).pop(),
    ),
    VSDialogAction(
      label: 'Proceed',
      onPressed: () {
        // Handle warning action
        Navigator.of(context).pop();
      },
    ),
  ],
)
```

### Error Dialog
Error dialog with red accent.

```dart
VSDialog(
  type: VSDialogType.error,
  title: 'Error',
  message: 'An error occurred while processing your request.',
  actions: [
    VSDialogAction(
      label: 'Try Again',
      onPressed: () {
        // Retry action
        Navigator.of(context).pop();
      },
    ),
    VSDialogAction(
      label: 'Cancel',
      onPressed: () => Navigator.of(context).pop(),
    ),
  ],
)
```

### Success Dialog
Success confirmation dialog with green accent.

```dart
VSDialog(
  type: VSDialogType.success,
  title: 'Success',
  message: 'Your changes have been saved successfully.',
  actions: [
    VSDialogAction(
      label: 'OK',
      onPressed: () => Navigator.of(context).pop(),
    ),
  ],
)
```

### Approve Dialog
Approval confirmation with checkmark icon.

```dart
VSDialog(
  type: VSDialogType.approve,
  title: 'Approve Request',
  message: 'Do you want to approve this request?',
  actions: [
    VSDialogAction(
      label: 'Cancel',
      onPressed: () => Navigator.of(context).pop(),
    ),
    VSDialogAction(
      label: 'Approve',
      onPressed: () {
        // Handle approval
        Navigator.of(context).pop();
      },
    ),
  ],
)
```

## Custom Dialog

### With Custom Icon
```dart
VSDialog(
  title: 'Custom Dialog',
  message: 'This dialog has a custom icon.',
  icon: Icon(Icons.settings, size: 48, color: AppColors.primaryDefault),
  actions: [
    VSDialogAction(
      label: 'OK',
      onPressed: () => Navigator.of(context).pop(),
    ),
  ],
)
```

### With Custom Content
```dart
VSDialog(
  title: 'Form Dialog',
  content: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      VSInputField(
        label: 'Name',
        hintText: 'Enter your name',
      ),
      SizedBox(height: 16),
      VSInputField(
        label: 'Email',
        hintText: 'Enter your email',
        type: VSInputFieldType.email,
      ),
    ],
  ),
  actions: [
    VSDialogAction(
      label: 'Cancel',
      onPressed: () => Navigator.of(context).pop(),
    ),
    VSDialogAction(
      label: 'Submit',
      onPressed: () {
        // Handle form submission
        Navigator.of(context).pop();
      },
    ),
  ],
)
```

## Action Buttons

### Single Action
Simple confirmation dialog.

```dart
VSDialog(
  title: 'Notification',
  message: 'Your profile has been updated.',
  actions: [
    VSDialogAction(
      label: 'OK',
      onPressed: () => Navigator.of(context).pop(),
    ),
  ],
)
```

### Multiple Actions
Dialog with multiple choices.

```dart
VSDialog(
  title: 'Save Changes',
  message: 'Do you want to save your changes before leaving?',
  actions: [
    VSDialogAction(
      label: 'Don\'t Save',
      onPressed: () => Navigator.of(context).pop(false),
    ),
    VSDialogAction(
      label: 'Cancel',
      onPressed: () => Navigator.of(context).pop(),
    ),
    VSDialogAction(
      label: 'Save',
      onPressed: () => Navigator.of(context).pop(true),
    ),
  ],
)
```

### Destructive Actions
Highlighting dangerous actions.

```dart
VSDialog(
  type: VSDialogType.error,
  title: 'Delete Account',
  message: 'This action cannot be undone. All your data will be permanently deleted.',
  actions: [
    VSDialogAction(
      label: 'Cancel',
      onPressed: () => Navigator.of(context).pop(),
    ),
    VSDialogAction(
      label: 'Delete Account',
      variant: VSButtonVariant.danger,
      onPressed: () {
        // Handle account deletion
        Navigator.of(context).pop();
      },
    ),
  ],
)
```

## Loading States

### Loading Dialog
Show loading indicator during async operations.

```dart
// Show loading dialog
showDialog(
  context: context,
  barrierDismissible: false,
  builder: (context) => VSDialog(
    title: 'Processing',
    message: 'Please wait while we process your request...',
    isLoading: true,
  ),
);

// Close after operation completes
Future.delayed(Duration(seconds: 2), () {
  Navigator.of(context).pop();
});
```

## Advanced Usage

### Confirmation with Form
```dart
class DeleteConfirmationDialog extends StatefulWidget {
  final String itemName;

  const DeleteConfirmationDialog({required this.itemName});

  @override
  _DeleteConfirmationDialogState createState() => _DeleteConfirmationDialogState();
}

class _DeleteConfirmationDialogState extends State<DeleteConfirmationDialog> {
  final TextEditingController _confirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return VSDialog(
      type: VSDialogType.warning,
      title: 'Confirm Deletion',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Are you sure you want to delete "${widget.itemName}"? '
            'This action cannot be undone.',
          ),
          SizedBox(height: 16),
          VSInputField(
            controller: _confirmationController,
            label: 'Type "DELETE" to confirm',
            hintText: 'DELETE',
          ),
        ],
      ),
      actions: [
        VSDialogAction(
          label: 'Cancel',
          onPressed: () => Navigator.of(context).pop(false),
        ),
        VSDialogAction(
          label: 'Delete',
          variant: VSButtonVariant.danger,
          onPressed: () {
            if (_confirmationController.text == 'DELETE') {
              Navigator.of(context).pop(true);
            }
          },
        ),
      ],
    );
  }
}
```

### Progress Dialog
```dart
VSDialog(
  title: 'Uploading Files',
  content: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      LinearProgressIndicator(value: 0.7),
      SizedBox(height: 8),
      Text('Uploading file 3 of 5...'),
    ],
  ),
  actions: [
    VSDialogAction(
      label: 'Cancel Upload',
      onPressed: () => Navigator.of(context).pop(),
    ),
  ],
)
```

## Usage Patterns

### Error Handling
```dart
void handleApiError(BuildContext context, String error) {
  showDialog(
    context: context,
    builder: (context) => VSDialog(
      type: VSDialogType.error,
      title: 'Error',
      message: error,
      actions: [
        VSDialogAction(
          label: 'Retry',
          onPressed: () {
            Navigator.of(context).pop();
            // Retry the operation
          },
        ),
        VSDialogAction(
          label: 'Cancel',
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}
```

### Success Confirmation
```dart
void showSuccessMessage(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) => VSDialog(
      type: VSDialogType.success,
      title: 'Success',
      message: message,
      actions: [
        VSDialogAction(
          label: 'OK',
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}
```

### Confirmation Dialog Hook
```dart
Future<bool> showConfirmationDialog(
  BuildContext context, {
  required String title,
  required String message,
  String confirmLabel = 'Confirm',
  String cancelLabel = 'Cancel',
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => VSDialog(
      title: title,
      message: message,
      actions: [
        VSDialogAction(
          label: cancelLabel,
          onPressed: () => Navigator.of(context).pop(false),
        ),
        VSDialogAction(
          label: confirmLabel,
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    ),
  );

  return result ?? false;
}

// Usage
bool confirmed = await showConfirmationDialog(
  context,
  title: 'Delete Item',
  message: 'Are you sure you want to delete this item?',
);
```

## Accessibility

The VS Dialog component includes comprehensive accessibility features:
- Proper ARIA labels and descriptions
- Keyboard navigation (Tab, Enter, Escape)
- Screen reader announcements
- Focus management and trapping
- High contrast support

## Design Guidelines

- Use appropriate dialog types for semantic meaning
- Keep messages clear and concise
- Provide clear action labels
- Use destructive styling sparingly
- Consider mobile screen sizes
- Avoid nested dialogs when possible

## Related Components

- **VS Toast**: Non-modal notifications
- **VS Info Bar**: Inline status messages
- **VS Drawer**: Slide-out panels
- **VS Bottom Sheet**: Mobile-friendly overlays</content>
<parameter name="filePath">c:\vs_design_system\lib\markdown2\VS_DIALOG_IMPLEMENTATION.md