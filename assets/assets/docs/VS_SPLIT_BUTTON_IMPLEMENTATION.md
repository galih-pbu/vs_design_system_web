# VS Split Button Implementation

## Overview

The VS Split Button component combines a primary action button with a dropdown menu for related actions. It provides a compact way to present a main action while offering additional related options through a dropdown menu.

## Features

- **Split Design**: Main action button with separate dropdown trigger
- **Multiple Variants**: Primary, secondary, danger, and outlined styles
- **Flexible Sizing**: Four sizes from xsmall to large
- **Menu Items**: Dropdown with optional icons for each item
- **Custom Colors**: Support for custom background and text colors
- **Disabled State**: Visual feedback for disabled buttons
- **Overlay Menu**: Positioned dropdown menu with proper layering
- **VS Design System Integration**: Consistent colors, typography, and spacing

## Basic Usage

```dart
import 'package:vs_design_system/vs_design_system.dart';

class DocumentActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VSSplitButton(
      label: 'Open',
      onPressed: () => openDocument(),
      onDropdownPressed: () => print('Dropdown opened'),
      menuItems: [
        VSSplitButtonMenuItem(
          label: 'Open in Browser',
          icon: Icons.open_in_browser,
          onTap: () => openInBrowser(),
        ),
        VSSplitButtonMenuItem(
          label: 'Download',
          icon: Icons.download,
          onTap: () => downloadDocument(),
        ),
        VSSplitButtonMenuItem(
          label: 'Print',
          icon: Icons.print,
          onTap: () => printDocument(),
        ),
      ],
    );
  }

  void openDocument() {
    // Handle main action
  }

  void openInBrowser() {
    // Handle browser opening
  }

  void downloadDocument() {
    // Handle download
  }

  void printDocument() {
    // Handle printing
  }
}
```

## Variants

### Primary Variant

```dart
VSSplitButton(
  label: 'Create',
  onPressed: () => createNewItem(),
  onDropdownPressed: () => print('Create options opened'),
  menuItems: [
    VSSplitButtonMenuItem(
      label: 'Create Document',
      onTap: () => createDocument(),
    ),
    VSSplitButtonMenuItem(
      label: 'Create Folder',
      onTap: () => createFolder(),
    ),
  ],
  variant: VSSplitButtonVariant.primary,
)
```

### Secondary Variant

```dart
VSSplitButton(
  label: 'Export',
  onPressed: () => exportDefault(),
  onDropdownPressed: () => print('Export options opened'),
  menuItems: [
    VSSplitButtonMenuItem(
      label: 'Export as PDF',
      onTap: () => exportAsPdf(),
    ),
    VSSplitButtonMenuItem(
      label: 'Export as CSV',
      onTap: () => exportAsCsv(),
    ),
  ],
  variant: VSSplitButtonVariant.secondary,
)
```

### Danger Variant

```dart
VSSplitButton(
  label: 'Delete',
  onPressed: () => deleteSelected(),
  onDropdownPressed: () => print('Delete options opened'),
  menuItems: [
    VSSplitButtonMenuItem(
      label: 'Delete All',
      onTap: () => deleteAll(),
    ),
    VSSplitButtonMenuItem(
      label: 'Move to Trash',
      onTap: () => moveToTrash(),
    ),
  ],
  variant: VSSplitButtonVariant.danger,
)
```

### Outlined Variant

```dart
VSSplitButton(
  label: 'More',
  onPressed: () => showMore(),
  onDropdownPressed: () => print('More options opened'),
  menuItems: [
    VSSplitButtonMenuItem(
      label: 'Settings',
      onTap: () => openSettings(),
    ),
    VSSplitButtonMenuItem(
      label: 'Help',
      onTap: () => showHelp(),
    ),
  ],
  variant: VSSplitButtonVariant.outlined,
)
```

## Sizes

### All Sizes

```dart
Column(
  children: [
    VSSplitButton(
      label: 'XSmall',
      onPressed: () {},
      onDropdownPressed: () {},
      menuItems: [VSSplitButtonMenuItem(label: 'Option', onTap: () {})],
      size: VSSplitButtonSize.xsmall,
    ),
    SizedBox(height: AppSpacing.sm),
    VSSplitButton(
      label: 'Small',
      onPressed: () {},
      onDropdownPressed: () {},
      menuItems: [VSSplitButtonMenuItem(label: 'Option', onTap: () {})],
      size: VSSplitButtonSize.small,
    ),
    SizedBox(height: AppSpacing.sm),
    VSSplitButton(
      label: 'Medium',
      onPressed: () {},
      onDropdownPressed: () {},
      menuItems: [VSSplitButtonMenuItem(label: 'Option', onTap: () {})],
      size: VSSplitButtonSize.medium,
    ),
    SizedBox(height: AppSpacing.sm),
    VSSplitButton(
      label: 'Large',
      onPressed: () {},
      onDropdownPressed: () {},
      menuItems: [VSSplitButtonMenuItem(label: 'Option', onTap: () {})],
      size: VSSplitButtonSize.large,
    ),
  ],
)
```

## Advanced Examples

### Menu Items with Icons

```dart
class FileActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VSSplitButton(
      label: 'Actions',
      onPressed: () => performDefaultAction(),
      onDropdownPressed: () => trackAnalytics('actions_dropdown_opened'),
      menuItems: [
        VSSplitButtonMenuItem(
          label: 'Edit',
          icon: Icons.edit,
          onTap: () => editFile(),
        ),
        VSSplitButtonMenuItem(
          label: 'Copy',
          icon: Icons.copy,
          onTap: () => copyFile(),
        ),
        VSSplitButtonMenuItem(
          label: 'Move',
          icon: Icons.drive_file_move,
          onTap: () => moveFile(),
        ),
        VSSplitButtonMenuItem(
          label: 'Share',
          icon: Icons.share,
          onTap: () => shareFile(),
        ),
        VSSplitButtonMenuItem(
          label: 'Delete',
          icon: Icons.delete,
          onTap: () => deleteFile(),
        ),
      ],
      variant: VSSplitButtonVariant.primary,
      size: VSSplitButtonSize.medium,
    );
  }

  void performDefaultAction() {
    // Default action (e.g., open file)
  }

  void editFile() {
    // Handle edit action
  }

  void copyFile() {
    // Handle copy action
  }

  void moveFile() {
    // Handle move action
  }

  void shareFile() {
    // Handle share action
  }

  void deleteFile() {
    // Handle delete action
  }

  void trackAnalytics(String event) {
    // Track user interactions
  }
}
```

### Custom Colors

```dart
class ThemedSplitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VSSplitButton(
      label: 'Custom',
      onPressed: () => performAction(),
      onDropdownPressed: () => print('Custom dropdown opened'),
      menuItems: [
        VSSplitButtonMenuItem(
          label: 'Option 1',
          onTap: () => handleOption1(),
        ),
        VSSplitButtonMenuItem(
          label: 'Option 2',
          onTap: () => handleOption2(),
        ),
      ],
      backgroundColor: Colors.teal.shade600,
      textColor: Colors.white,
    );
  }

  void performAction() {
    // Handle main action
  }

  void handleOption1() {
    // Handle option 1
  }

  void handleOption2() {
    // Handle option 2
  }
}
```

### Dynamic Menu Items

```dart
class DynamicActions extends StatefulWidget {
  @override
  State<DynamicActions> createState() => _DynamicActionsState();
}

class _DynamicActionsState extends State<DynamicActions> {
  List<String> _availableActions = ['edit', 'copy', 'share'];
  bool _canDelete = false;

  @override
  Widget build(BuildContext context) {
    return VSSplitButton(
      label: 'Actions',
      onPressed: () => performPrimaryAction(),
      onDropdownPressed: () => print('Actions menu opened'),
      menuItems: _buildMenuItems(),
      variant: VSSplitButtonVariant.secondary,
    );
  }

  List<VSSplitButtonMenuItem> _buildMenuItems() {
    final items = <VSSplitButtonMenuItem>[];

    if (_availableActions.contains('edit')) {
      items.add(VSSplitButtonMenuItem(
        label: 'Edit',
        icon: Icons.edit,
        onTap: () => editItem(),
      ));
    }

    if (_availableActions.contains('copy')) {
      items.add(VSSplitButtonMenuItem(
        label: 'Copy',
        icon: Icons.copy,
        onTap: () => copyItem(),
      ));
    }

    if (_availableActions.contains('share')) {
      items.add(VSSplitButtonMenuItem(
        label: 'Share',
        icon: Icons.share,
        onTap: () => shareItem(),
      ));
    }

    if (_canDelete) {
      items.add(VSSplitButtonMenuItem(
        label: 'Delete',
        icon: Icons.delete,
        onTap: () => deleteItem(),
      ));
    }

    return items;
  }

  void performPrimaryAction() {
    // Primary action logic
  }

  void editItem() {
    // Edit logic
  }

  void copyItem() {
    // Copy logic
  }

  void shareItem() {
    // Share logic
  }

  void deleteItem() {
    // Delete logic
  }
}
```

### Form Integration

```dart
class FormActions extends StatelessWidget {
  final bool isDirty;
  final bool isValid;
  final VoidCallback onSave;
  final VoidCallback onSaveAsDraft;
  final VoidCallback onDiscard;

  const FormActions({
    super.key,
    required this.isDirty,
    required this.isValid,
    required this.onSave,
    required this.onSaveAsDraft,
    required this.onDiscard,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        VSButton(
          label: 'Cancel',
          onPressed: onDiscard,
          variant: VSButtonVariant.outlined,
        ),
        SizedBox(width: AppSpacing.md),
        VSSplitButton(
          label: 'Save',
          onPressed: isValid ? onSave : null,
          onDropdownPressed: () => print('Save options opened'),
          menuItems: [
            VSSplitButtonMenuItem(
              label: 'Save as Draft',
              icon: Icons.draft,
              onTap: isDirty ? onSaveAsDraft : null,
            ),
            VSSplitButtonMenuItem(
              label: 'Save & Continue Editing',
              icon: Icons.edit,
              onTap: isValid ? () {
                onSave();
                // Continue editing logic
              } : null,
            ),
          ],
          variant: VSButtonVariant.primary,
          isEnabled: isValid,
        ),
      ],
    );
  }
}
```

## Real-World Usage Patterns

### Document Management

```dart
class DocumentToolbar extends StatelessWidget {
  final Document document;

  const DocumentToolbar({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        VSSplitButton(
          label: 'Open',
          onPressed: () => openDocument(document),
          onDropdownPressed: () => trackEvent('document_open_menu'),
          menuItems: [
            VSSplitButtonMenuItem(
              label: 'Open in New Tab',
              icon: Icons.open_in_new,
              onTap: () => openInNewTab(document),
            ),
            VSSplitButtonMenuItem(
              label: 'Open in Browser',
              icon: Icons.open_in_browser,
              onTap: () => openInBrowser(document),
            ),
            VSSplitButtonMenuItem(
              label: 'Download',
              icon: Icons.download,
              onTap: () => downloadDocument(document),
            ),
          ],
          variant: VSSplitButtonVariant.primary,
        ),
        SizedBox(width: AppSpacing.md),
        VSSplitButton(
          label: 'Share',
          onPressed: () => shareDocument(document),
          onDropdownPressed: () => trackEvent('document_share_menu'),
          menuItems: [
            VSSplitButtonMenuItem(
              label: 'Share Link',
              icon: Icons.link,
              onTap: () => shareLink(document),
            ),
            VSSplitButtonMenuItem(
              label: 'Email',
              icon: Icons.email,
              onTap: () => emailDocument(document),
            ),
            VSSplitButtonMenuItem(
              label: 'Export',
              icon: Icons.file_upload,
              onTap: () => exportDocument(document),
            ),
          ],
          variant: VSSplitButtonVariant.secondary,
        ),
      ],
    );
  }

  void openDocument(Document doc) {
    // Open document logic
  }

  void openInNewTab(Document doc) {
    // Open in new tab logic
  }

  void openInBrowser(Document doc) {
    // Open in browser logic
  }

  void downloadDocument(Document doc) {
    // Download logic
  }

  void shareDocument(Document doc) {
    // Share logic
  }

  void shareLink(Document doc) {
    // Share link logic
  }

  void emailDocument(Document doc) {
    // Email logic
  }

  void exportDocument(Document doc) {
    // Export logic
  }

  void trackEvent(String event) {
    // Analytics tracking
  }
}
```

### User Actions

```dart
class UserCard extends StatelessWidget {
  final User user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.neutral100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              VSAvatar(
                imageUrl: user.avatarUrl,
                initials: user.initials,
                size: VSAvatarSize.medium,
              ),
              SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.name, style: AppTypography.bodyMediumSemibold),
                    Row(
                      children: [
                        VSBadge(
                          label: user.role.toUpperCase(),
                          variant: VSBadgeVariant.primary,
                          size: VSBadgeSize.xsmall,
                        ),
                        SizedBox(width: AppSpacing.xs),
                        VSBadge(
                          label: user.status.toUpperCase(),
                          variant: user.isOnline ? VSBadgeVariant.success : VSBadgeVariant.neutral,
                          size: VSBadgeSize.xsmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.sm),
          VSSplitButton(
            label: 'Message',
            onPressed: () => sendDirectMessage(user),
            onDropdownPressed: () => trackInteraction('user_actions_menu', user.id),
            menuItems: [
              VSSplitButtonMenuItem(
                label: 'Send Email',
                icon: Icons.email,
                onTap: () => sendEmail(user),
              ),
              VSSplitButtonMenuItem(
                label: 'Call',
                icon: Icons.call,
                onTap: () => initiateCall(user),
              ),
              VSSplitButtonMenuItem(
                label: 'Video Call',
                icon: Icons.video_call,
                onTap: () => startVideoCall(user),
              ),
              VSSplitButtonMenuItem(
                label: 'View Profile',
                icon: Icons.person,
                onTap: () => viewProfile(user),
              ),
            ],
            size: VSSplitButtonSize.small,
            variant: VSSplitButtonVariant.primary,
          ),
        ],
      ),
    );
  }

  void sendDirectMessage(User user) {
    // Send direct message
  }

  void sendEmail(User user) {
    // Send email
  }

  void initiateCall(User user) {
    // Initiate call
  }

  void startVideoCall(User user) {
    // Start video call
  }

  void viewProfile(User user) {
    // View profile
  }

  void trackInteraction(String event, String userId) {
    // Track user interactions
  }
}
```

### Data Export

```dart
class DataExportPanel extends StatefulWidget {
  final List<String> availableFormats;
  final int recordCount;

  const DataExportPanel({
    super.key,
    required this.availableFormats,
    required this.recordCount,
  });

  @override
  State<DataExportPanel> createState() => _DataExportPanelState();
}

class _DataExportPanelState extends State<DataExportPanel> {
  String _selectedFormat = 'csv';
  bool _includeHeaders = true;
  DateTimeRange? _dateRange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.neutral100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.file_download, color: AppColors.primaryDefault),
              SizedBox(width: AppSpacing.sm),
              Text('Export Data', style: AppTypography.bodyLargeSemibold),
              Spacer(),
              VSBadge(
                label: '${widget.recordCount} RECORDS',
                variant: VSBadgeVariant.primary,
              ),
            ],
          ),
          SizedBox(height: AppSpacing.sm),
          Text(
            'Export your data in various formats for analysis or backup.',
            style: AppTypography.bodySmallRegular.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: AppSpacing.md),

          // Export options
          Row(
            children: [
              Expanded(
                child: VSSplitButton(
                  label: 'Export',
                  onPressed: () => exportData(_selectedFormat),
                  onDropdownPressed: () => trackEvent('export_format_menu_opened'),
                  menuItems: widget.availableFormats.map((format) {
                    return VSSplitButtonMenuItem(
                      label: 'Export as ${format.toUpperCase()}',
                      icon: _getFormatIcon(format),
                      onTap: () {
                        setState(() => _selectedFormat = format);
                        exportData(format);
                      },
                    );
                  }).toList(),
                  variant: VSSplitButtonVariant.secondary,
                ),
              ),
            ],
          ),

          SizedBox(height: AppSpacing.md),

          // Additional options
          Row(
            children: [
              VSCheckbox(
                value: _includeHeaders,
                onChanged: (value) => setState(() => _includeHeaders = value ?? true),
                label: 'Include headers',
              ),
            ],
          ),
        ],
      ),
    );
  }

  IconData _getFormatIcon(String format) {
    switch (format) {
      case 'csv': return Icons.table_chart;
      case 'pdf': return Icons.picture_as_pdf;
      case 'excel': return Icons.grid_on;
      case 'json': return Icons.data_object;
      default: return Icons.file_download;
    }
  }

  void exportData(String format) {
    // Implement export logic
    print('Exporting ${widget.recordCount} records as $format');
    if (_includeHeaders) {
      print('Including headers');
    }
  }

  void trackEvent(String event) {
    // Analytics tracking
  }
}
```

### Bulk Actions

```dart
class BulkActionsToolbar extends StatelessWidget {
  final int selectedCount;
  final VoidCallback onSelectAll;
  final VoidCallback onClearSelection;
  final VoidCallback onDeleteSelected;
  final VoidCallback onMoveSelected;
  final VoidCallback onTagSelected;

  const BulkActionsToolbar({
    super.key,
    required this.selectedCount,
    required this.onSelectAll,
    required this.onClearSelection,
    required this.onDeleteSelected,
    required this.onMoveSelected,
    required this.onTagSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (selectedCount == 0) {
      return SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.warningBg.withValues(alpha: 0.1),
        border: Border.all(color: AppColors.warningDefault.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          VSBadge(
            label: '$selectedCount SELECTED',
            variant: VSBadgeVariant.warning,
          ),
          SizedBox(width: AppSpacing.md),
          Expanded(
            child: VSSplitButton(
              label: 'Apply Action',
              onPressed: () => _showDefaultActionDialog(context),
              onDropdownPressed: () => trackEvent('bulk_actions_menu_opened'),
              menuItems: [
                VSSplitButtonMenuItem(
                  label: 'Move to Folder',
                  icon: Icons.folder,
                  onTap: onMoveSelected,
                ),
                VSSplitButtonMenuItem(
                  label: 'Add Tags',
                  icon: Icons.tag,
                  onTap: onTagSelected,
                ),
                VSSplitButtonMenuItem(
                  label: 'Duplicate',
                  icon: Icons.copy,
                  onTap: () => duplicateSelected(),
                ),
                VSSplitButtonMenuItem(
                  label: 'Archive',
                  icon: Icons.archive,
                  onTap: () => archiveSelected(),
                ),
                VSSplitButtonMenuItem(
                  label: 'Delete',
                  icon: Icons.delete_forever,
                  onTap: onDeleteSelected,
                ),
              ],
              variant: VSSplitButtonVariant.danger,
              size: VSSplitButtonSize.medium,
            ),
          ),
          SizedBox(width: AppSpacing.md),
          VSButton(
            label: 'Clear Selection',
            onPressed: onClearSelection,
            variant: VSButtonVariant.outlined,
            size: VSButtonSize.small,
          ),
        ],
      ),
    );
  }

  void _showDefaultActionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.confirmation,
        title: 'Apply Default Action',
        message: 'What would you like to do with the $selectedCount selected items?',
        actions: [
          VSDialogAction(
            label: 'Cancel',
            onPressed: () {},
          ),
          VSDialogAction(
            label: 'Move',
            onPressed: onMoveSelected,
          ),
          VSDialogAction(
            label: 'Delete',
            onPressed: onDeleteSelected,
            isDestructive: true,
          ),
        ],
      ),
    );
  }

  void duplicateSelected() {
    // Duplicate selected items
  }

  void archiveSelected() {
    // Archive selected items
  }

  void trackEvent(String event) {
    // Analytics tracking
  }
}
```

## Configuration Options

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String` | Required | Text displayed on the main button |
| `onPressed` | `VoidCallback` | Required | Callback for main button press |
| `onDropdownPressed` | `VoidCallback` | Required | Callback when dropdown is opened |
| `menuItems` | `List<VSSplitButtonMenuItem>` | Required | List of menu items for dropdown |
| `variant` | `VSSplitButtonVariant` | `VSSplitButtonVariant.primary` | Visual style variant |
| `size` | `VSSplitButtonSize` | `VSSplitButtonSize.large` | Size of the button |
| `backgroundColor` | `Color?` | `null` | Custom background color |
| `textColor` | `Color?` | `null` | Custom text color |
| `width` | `double?` | `null` | Fixed width for the button |
| `isEnabled` | `bool` | `true` | Whether the button is interactive |
| `key` | `Key?` | `null` | Widget key for identification |

## Menu Item Configuration

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String` | Required | Text displayed for the menu item |
| `onTap` | `VoidCallback` | Required | Callback when menu item is tapped |
| `icon` | `IconData?` | `null` | Optional icon displayed before the label |

## Best Practices

### When to Use Split Buttons

- **Primary + Related Actions**: When you have a primary action with closely related secondary actions
- **Space Constraints**: When you want to save space compared to multiple separate buttons
- **Frequent Actions**: For actions that are performed together often
- **Contextual Menus**: When the secondary actions depend on the primary action context

### Design Guidelines

- **Clear Primary Action**: The main button should represent the most common action
- **Logical Grouping**: Group related actions in the dropdown menu
- **Consistent Icons**: Use icons consistently across similar split buttons
- **Descriptive Labels**: Use clear, concise labels for both main button and menu items
- **Visual Hierarchy**: Primary action should be visually prominent

### Implementation Tips

- **State Management**: Handle loading states for async operations
- **Error Handling**: Provide feedback for failed operations
- **Analytics**: Track usage of both primary and secondary actions
- **Accessibility**: Ensure keyboard navigation works properly
- **Performance**: Avoid rebuilding menu items unnecessarily

## Accessibility

- **Keyboard Navigation**: Full keyboard support with Tab and Enter/Space
- **Screen Reader**: Proper labeling and role announcements
- **Focus Management**: Clear focus indicators and logical tab order
- **Semantic HTML**: Proper button and menu semantics
- **Color Contrast**: Sufficient contrast for all interactive states

## Integration with VS Design System

The VS Split Button component integrates seamlessly with other VS Design System components:

- **VSButton**: For standalone actions alongside split buttons
- **VSDropdown**: Alternative for single-selection from many options
- **VSDialog**: For confirmation dialogs triggered by menu items
- **VSIcon**: Consistent icon usage in menu items
- **AppColors**: Consistent color scheme across variants
- **AppTypography**: Standardized text styling
- **AppSpacing**: Consistent spacing and layout

## Migration Guide

### From Custom Split Buttons

```dart
// Before: Custom split button
class CustomSplitButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final List<PopupMenuItem<String>> menuItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          child: Text(label),
        ),
        PopupMenuButton<String>(
          itemBuilder: (context) => menuItems,
        ),
      ],
    );
  }
}

// After: VS Design System
VSSplitButton(
  label: label,
  onPressed: onPressed,
  onDropdownPressed: () => print('Dropdown opened'),
  menuItems: menuItems.map((item) {
    return VSSplitButtonMenuItem(
      label: item.child.toString(),
      onTap: () => item.onTap?.call(item.value),
    );
  }).toList(),
)
```

### From Dropdown Only

```dart
// Before: Dropdown button only
DropdownButton<String>(
  value: selectedValue,
  items: options.map((option) {
    return DropdownMenuItem(
      value: option,
      child: Text(option),
    );
  }).toList(),
  onChanged: (value) => setState(() => selectedValue = value!),
)

// After: Split button with primary action
VSSplitButton(
  label: 'Select Action',
  onPressed: () => performAction(selectedValue),
  onDropdownPressed: () => print('Action menu opened'),
  menuItems: options.map((option) {
    return VSSplitButtonMenuItem(
      label: option,
      onTap: () => setState(() => selectedValue = option),
    );
  }).toList(),
)
```

### From Multiple Buttons

```dart
// Before: Multiple separate buttons
Row(
  children: [
    ElevatedButton(
      onPressed: () => createNew(),
      child: Text('Create New'),
    ),
    SizedBox(width: 8),
    ElevatedButton(
      onPressed: () => import(),
      child: Text('Import'),
    ),
    SizedBox(width: 8),
    ElevatedButton(
      onPressed: () => export(),
      child: Text('Export'),
    ),
  ],
)

// After: Split button with primary action
VSSplitButton(
  label: 'Create New',
  onPressed: () => createNew(),
  onDropdownPressed: () => trackEvent('create_menu_opened'),
  menuItems: [
    VSSplitButtonMenuItem(
      label: 'Import',
      icon: Icons.file_upload,
      onTap: () => import(),
    ),
    VSSplitButtonMenuItem(
      label: 'Export',
      icon: Icons.file_download,
      onTap: () => export(),
    ),
  ],
  variant: VSSplitButtonVariant.primary,
)
```</content>
<parameter name="filePath">c:\vs_design_system\lib\markdown2\VS_SPLIT_BUTTON_IMPLEMENTATION.md