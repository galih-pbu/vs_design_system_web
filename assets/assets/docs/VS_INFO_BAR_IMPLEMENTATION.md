# VS Info Bar Implementation

**Version 1.0.1 - December 14, 2025**

## Overview

The VS Info Bar component provides contextual feedback and notifications to users with different semantic types and interactive actions. It supports both inline notifications and floating bars for bulk operations.

## Features

- **Semantic Types**: Four distinct types (Info, Success, Warning, Error) with appropriate styling
- **Customizable Content**: Flexible message text and optional icons
- **Interactive Actions**: Configurable action buttons for user responses
- **Floating Info Bar**: Bottom-positioned bar for bulk operations
- **VS Design System**: Consistent styling and theming
- **Accessibility**: Proper color contrast and screen reader support
- **Auto-dismiss**: Optional automatic dismissal with customizable duration

## Basic Usage

### Simple Info Bar

```dart
VSInfoBar(
  type: VSInfoBarType.info,
  message: 'This is an informational message for the user.',
)
```

### Info Bar with Actions

```dart
VSInfoBar(
  type: VSInfoBarType.success,
  message: 'Your changes have been saved successfully.',
  icon: Icons.check_circle_outline,
  actions: [
    VSInfoBarAction(
      label: 'View Changes',
      onPressed: () {
        // Handle view changes
      },
    ),
    VSInfoBarAction(
      label: 'Dismiss',
      onPressed: () {
        // Handle dismiss
      },
    ),
  ],
)
```

### Floating Info Bar

```dart
VSInfoBar.showFloating(
  context,
  selectedCount: 5,
  itemLabel: 'files',
  actions: [
    VSFloatingInfoBarAction(
      label: 'Download',
      icon: Icons.download,
      onPressed: () {
        // Handle download
      },
    ),
    VSFloatingInfoBarAction(
      label: 'Delete',
      icon: Icons.delete,
      onPressed: () {
        // Handle delete
      },
      isPrimary: true,
    ),
  ],
  onClose: () {
    // Handle close
  },
  duration: const Duration(seconds: 10),
);
```

## Variants

### Info Bar Types

#### Info Type

```dart
VSInfoBar(
  type: VSInfoBarType.info,
  message: 'This is helpful information that guides user actions.',
  icon: Icons.info_outline,
  actions: [
    VSInfoBarAction(
      label: 'Learn More',
      onPressed: () => print('Learn more clicked'),
    ),
  ],
)
```

#### Success Type

```dart
VSInfoBar(
  type: VSInfoBarType.success,
  message: 'Operation completed successfully!',
  icon: Icons.check_circle_outline,
  actions: [
    VSInfoBarAction(
      label: 'View Result',
      onPressed: () => print('View result clicked'),
    ),
  ],
)
```

#### Warning Type

```dart
VSInfoBar(
  type: VSInfoBarType.warning,
  message: 'Warning: This action cannot be undone.',
  icon: Icons.warning_amber_outlined,
  actions: [
    VSInfoBarAction(
      label: 'Review',
      onPressed: () => print('Review clicked'),
    ),
    VSInfoBarAction(
      label: 'Cancel',
      onPressed: () => print('Cancelled'),
    ),
  ],
)
```

#### Error Type

```dart
VSInfoBar(
  type: VSInfoBarType.error,
  message: 'Error: Failed to save changes. Please try again.',
  icon: Icons.error_outline,
  actions: [
    VSInfoBarAction(
      label: 'Retry',
      onPressed: () => print('Retry clicked'),
    ),
    VSInfoBarAction(
      label: 'Report Issue',
      onPressed: () => print('Report issue clicked'),
    ),
  ],
)
```

### Action Configurations

#### Single Action

```dart
VSInfoBar(
  type: VSInfoBarType.info,
  message: 'New feature available in your account.',
  actions: [
    VSInfoBarAction(
      label: 'Try Now',
      onPressed: () => print('Feature opened'),
    ),
  ],
)
```

#### Multiple Actions

```dart
VSInfoBar(
  type: VSInfoBarType.warning,
  message: 'Your session expires in 5 minutes.',
  actions: [
    VSInfoBarAction(
      label: 'Extend Session',
      onPressed: () => print('Session extended'),
    ),
    VSInfoBarAction(
      label: 'Save Work',
      onPressed: () => print('Work saved'),
    ),
  ],
)
```

### Floating Info Bar Variants

#### Basic Floating Bar

```dart
VSInfoBar.showFloating(
  context,
  selectedCount: 3,
  itemLabel: 'items',
  actions: [
    VSFloatingInfoBarAction(
      label: 'Delete',
      icon: Icons.delete,
      onPressed: () => print('Delete clicked'),
      isPrimary: true,
    ),
  ],
);
```

#### Advanced Floating Bar

```dart
VSInfoBar.showFloating(
  context,
  selectedCount: 12,
  itemLabel: 'files',
  actions: [
    VSFloatingInfoBarAction(
      label: 'Download',
      icon: Icons.download,
      onPressed: () => print('Download started'),
    ),
    VSFloatingInfoBarAction(
      label: 'Move',
      icon: Icons.drive_file_move,
      onPressed: () => print('Move dialog opened'),
    ),
    VSFloatingInfoBarAction(
      label: 'Share',
      icon: Icons.share,
      onPressed: () => print('Share dialog opened'),
    ),
    VSFloatingInfoBarAction(
      label: 'Delete',
      icon: Icons.delete,
      onPressed: () => print('Delete clicked'),
      isPrimary: true,
    ),
  ],
  onClose: () => print('Floating bar closed'),
  duration: const Duration(seconds: 15),
);
```

## Advanced Examples

### Form Validation Feedback

```dart
class FormValidationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSInfoBar(
          type: VSInfoBarType.error,
          message: 'Please fill in all required fields marked with an asterisk (*).',
          icon: Icons.error_outline,
          actions: [
            VSInfoBarAction(
              label: 'Show Required Fields',
              onPressed: () {
                // Highlight required fields
                print('Required fields highlighted');
              },
            ),
          ],
        ),
        SizedBox(height: AppSpacing.sm),
        VSInfoBar(
          type: VSInfoBarType.success,
          message: 'Your profile has been updated successfully.',
          icon: Icons.check_circle_outline,
        ),
      ],
    );
  }
}
```

### System Status Notifications

```dart
class SystemStatusExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSInfoBar(
          type: VSInfoBarType.warning,
          message: 'Scheduled maintenance will begin in 30 minutes. Save your work.',
          icon: Icons.schedule,
          actions: [
            VSInfoBarAction(
              label: 'Save Now',
              onPressed: () {
                // Save user work
                print('Work saved');
              },
            ),
          ],
        ),
        SizedBox(height: AppSpacing.sm),
        VSInfoBar(
          type: VSInfoBarType.info,
          message: 'New feature available: Enhanced search with filters.',
          icon: Icons.new_releases,
          actions: [
            VSInfoBarAction(
              label: 'Try It Now',
              onPressed: () {
                // Open new feature
                print('Enhanced search opened');
              },
            ),
            VSInfoBarAction(
              label: 'Learn More',
              onPressed: () {
                // Show documentation
                print('Feature documentation opened');
              },
            ),
          ],
        ),
      ],
    );
  }
}
```

### File Operation Feedback

```dart
class FileOperationsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSInfoBar(
          type: VSInfoBarType.success,
          message: '5 files uploaded successfully to the Documents folder.',
          icon: Icons.cloud_done,
          actions: [
            VSInfoBarAction(
              label: 'View Files',
              onPressed: () {
                // Open files view
                print('Files view opened');
              },
            ),
          ],
        ),
        SizedBox(height: AppSpacing.sm),
        VSInfoBar(
          type: VSInfoBarType.error,
          message: 'Upload failed: File "document.pdf" exceeds the maximum size limit of 10MB.',
          icon: Icons.error_outline,
          actions: [
            VSInfoBarAction(
              label: 'Compress File',
              onPressed: () {
                // Start file compression
                print('File compression started');
              },
            ),
            VSInfoBarAction(
              label: 'Choose Different File',
              onPressed: () {
                // Open file picker
                print('File picker opened');
              },
            ),
          ],
        ),
      ],
    );
  }
}
```

### User Action Confirmations

```dart
class UserActionsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSInfoBar(
          type: VSInfoBarType.warning,
          message: 'You are about to delete "Project Alpha". This action cannot be undone.',
          icon: Icons.delete_forever,
          actions: [
            VSInfoBarAction(
              label: 'Delete',
              onPressed: () {
                // Perform deletion
                print('Project deleted');
              },
            ),
            VSInfoBarAction(
              label: 'Cancel',
              onPressed: () {
                // Cancel action
                print('Action cancelled');
              },
            ),
          ],
        ),
        SizedBox(height: AppSpacing.sm),
        VSInfoBar(
          type: VSInfoBarType.info,
          message: 'Your session will expire in 5 minutes due to inactivity.',
          icon: Icons.timer,
          actions: [
            VSInfoBarAction(
              label: 'Extend Session',
              onPressed: () {
                // Extend session
                print('Session extended');
              },
            ),
          ],
        ),
      ],
    );
  }
}
```

### Bulk Operations

```dart
class BulkOperationsExample extends StatelessWidget {
  void _showBulkActions(BuildContext context) {
    VSInfoBar.showFloating(
      context,
      selectedCount: 12,
      itemLabel: 'items',
      actions: [
        VSFloatingInfoBarAction(
          label: 'Move',
          icon: Icons.drive_file_move,
          onPressed: () {
            print('Move dialog opened');
          },
        ),
        VSFloatingInfoBarAction(
          label: 'Copy',
          icon: Icons.content_copy,
          onPressed: () {
            print('Copy dialog opened');
          },
        ),
        VSFloatingInfoBarAction(
          label: 'Delete',
          icon: Icons.delete,
          onPressed: () {
            print('Delete confirmation shown');
          },
          isPrimary: true,
        ),
        VSFloatingInfoBarAction(
          label: 'Export',
          icon: Icons.download,
          onPressed: () {
            print('Export options shown');
          },
        ),
      ],
      onClose: () {
        print('Floating bar closed');
      },
      duration: const Duration(seconds: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSInfoBar(
          type: VSInfoBarType.info,
          message: '12 items selected. Choose an action to perform on selected items.',
          icon: Icons.checklist,
          actions: [
            VSInfoBarAction(
              label: 'Move',
              onPressed: () => print('Move dialog opened'),
            ),
            VSInfoBarAction(
              label: 'Copy',
              onPressed: () => print('Copy dialog opened'),
            ),
            VSInfoBarAction(
              label: 'Delete',
              onPressed: () => print('Delete confirmation shown'),
            ),
            VSInfoBarAction(
              label: 'Export',
              onPressed: () => print('Export options shown'),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.md),
        VSButton(
          label: 'Show Floating Info Bar',
          onPressed: () => _showBulkActions(context),
          variant: VSButtonVariant.outlined,
        ),
      ],
    );
  }
}
```

### Dynamic Info Bar Updates

```dart
class DynamicInfoBarExample extends StatefulWidget {
  @override
  _DynamicInfoBarExampleState createState() => _DynamicInfoBarExampleState();
}

class _DynamicInfoBarExampleState extends State<DynamicInfoBarExample> {
  VSInfoBarType _currentType = VSInfoBarType.info;
  String _message = 'Initial message';

  void _simulateOperation() {
    setState(() {
      _currentType = VSInfoBarType.info;
      _message = 'Operation in progress...';
    });

    // Simulate async operation
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _currentType = VSInfoBarType.success;
        _message = 'Operation completed successfully!';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSInfoBar(
          type: _currentType,
          message: _message,
          icon: _currentType == VSInfoBarType.success
              ? Icons.check_circle_outline
              : Icons.info_outline,
        ),
        SizedBox(height: AppSpacing.md),
        VSButton(
          label: 'Start Operation',
          onPressed: _simulateOperation,
        ),
      ],
    );
  }
}
```

## Configuration Options

### VSInfoBar Properties

| Property | Type | Description | Default |
|----------|------|-------------|---------|
| `type` | `VSInfoBarType` | The semantic type of the info bar | Required |
| `message` | `String` | The message text to display | Required |
| `icon` | `IconData?` | Optional icon to display | `null` |
| `actions` | `List<VSInfoBarAction>?` | List of action buttons | `null` |

### VSInfoBarAction Properties

| Property | Type | Description | Default |
|----------|------|-------------|---------|
| `label` | `String` | The action button label | Required |
| `onPressed` | `VoidCallback` | Callback when action is pressed | Required |

### VSFloatingInfoBarAction Properties

| Property | Type | Description | Default |
|----------|------|-------------|---------|
| `label` | `String` | The action button label | Required |
| `icon` | `IconData?` | Optional icon for the action | `null` |
| `onPressed` | `VoidCallback` | Callback when action is pressed | Required |
| `isPrimary` | `bool` | Whether this is the primary action | `false` |

### VSInfoBar.showFloating Parameters

| Parameter | Type | Description | Default |
|-----------|------|-------------|---------|
| `context` | `BuildContext` | The build context | Required |
| `selectedCount` | `int` | Number of selected items | Required |
| `itemLabel` | `String` | Label for the items (e.g., 'files', 'items') | Required |
| `actions` | `List<VSFloatingInfoBarAction>` | List of actions | Required |
| `onClose` | `VoidCallback?` | Callback when bar is closed | `null` |
| `duration` | `Duration?` | Auto-dismiss duration | `null` |

## Best Practices

1. **Choose Appropriate Types**: Use semantic types that match the message content (Info for guidance, Success for confirmations, Warning for cautions, Error for problems)
2. **Keep Messages Clear**: Write concise, actionable messages that clearly communicate the situation
3. **Provide Actions**: Include relevant actions that help users respond to the notification
4. **Use Icons Wisely**: Choose icons that reinforce the message type and content
5. **Consider Timing**: Use auto-dismiss for temporary notifications, manual dismiss for important persistent messages
6. **Test Accessibility**: Ensure proper color contrast and screen reader compatibility
7. **Avoid Overuse**: Don't overwhelm users with too many simultaneous info bars

## Accessibility

- Semantic color schemes with proper contrast ratios
- Screen reader announcements for dynamic content changes
- Keyboard navigation support for action buttons
- Focus management and visual focus indicators
- Support for high contrast themes and reduced motion preferences