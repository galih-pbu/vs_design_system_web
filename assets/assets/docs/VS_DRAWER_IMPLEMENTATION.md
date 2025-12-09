# VS Drawer

The VS Drawer component provides slide-out panels for forms, settings, and configuration dialogs with comprehensive item types and action handling.

## Overview

The `VSDrawer` widget creates modal slide-out panels from the right side of the screen, designed for forms, settings, and configuration interfaces. It supports text inputs, dropdowns, info bars, and customizable action buttons.

## Features

- **Two Drawer Types**: Standard drawer and end drawer positioning
- **Multiple Item Types**: Text input fields and dropdown selections
- **Info Bar Support**: Optional informational messages with custom styling
- **Action Buttons**: Configurable action buttons with different variants
- **Form Handling**: Built-in form state management and validation
- **Responsive Design**: Adapts to different screen sizes
- **Accessibility**: Screen reader support and keyboard navigation
- **VS Design Integration**: Consistent theming with design tokens

## Basic Usage

```dart
VSDrawer.show(
  context,
  title: 'User Settings',
  items: [
    VSDrawerItem(
      label: 'Full Name',
      hint: 'Enter your full name',
    ),
    VSDrawerItem(
      label: 'Email',
      hint: 'Enter your email address',
    ),
  ],
  actions: [
    VSDrawerAction(
      label: 'Cancel',
      onPressed: () {},
      variant: VSButtonVariant.outlined,
    ),
    VSDrawerAction(
      label: 'Save',
      onPressed: () => saveSettings(),
    ),
  ],
)
```

## Drawer Types

### Standard Drawer
Default drawer that slides from the right side.

```dart
VSDrawer.show(
  context,
  title: 'Edit Profile',
  items: [
    VSDrawerItem(
      label: 'Display Name',
      hint: 'John Doe',
    ),
    VSDrawerItem(
      label: 'Bio',
      hint: 'Tell us about yourself',
    ),
  ],
  actions: [
    VSDrawerAction(
      label: 'Cancel',
      onPressed: () {},
      variant: VSButtonVariant.outlined,
    ),
    VSDrawerAction(
      label: 'Update Profile',
      onPressed: () => updateProfile(),
    ),
  ],
)
```

### End Drawer
Alternative drawer positioning (same as standard in current implementation).

```dart
VSDrawer.show(
  context,
  title: 'Filter Options',
  items: [
    VSDrawerItem(
      label: 'Category',
      type: VSDrawerItemType.dropdown,
      options: ['All', 'Active', 'Completed'],
    ),
    VSDrawerItem(
      label: 'Priority',
      type: VSDrawerItemType.dropdown,
      options: ['Low', 'Medium', 'High'],
    ),
  ],
  actions: [
    VSDrawerAction(
      label: 'Clear Filters',
      onPressed: () => clearFilters(),
      variant: VSButtonVariant.outlined,
    ),
    VSDrawerAction(
      label: 'Apply Filters',
      onPressed: () => applyFilters(),
    ),
  ],
)
```

## Item Types

### Text Input Items
Standard text input fields with labels and hints.

```dart
VSDrawer.show(
  context,
  title: 'Contact Information',
  items: [
    VSDrawerItem(
      label: 'First Name',
      hint: 'Enter your first name',
    ),
    VSDrawerItem(
      label: 'Last Name',
      hint: 'Enter your last name',
    ),
    VSDrawerItem(
      label: 'Email Address',
      hint: 'your.email@example.com',
    ),
    VSDrawerItem(
      label: 'Phone Number',
      hint: '+1 (555) 123-4567',
    ),
  ],
  actions: [
    VSDrawerAction(
      label: 'Cancel',
      onPressed: () {},
      variant: VSButtonVariant.outlined,
    ),
    VSDrawerAction(
      label: 'Save Contact',
      onPressed: () => saveContact(),
    ),
  ],
)
```

### Dropdown Items
Selection dropdowns with predefined options.

```dart
VSDrawer.show(
  context,
  title: 'System Preferences',
  items: [
    VSDrawerItem(
      label: 'Language',
      type: VSDrawerItemType.dropdown,
      options: ['English', 'Spanish', 'French', 'German'],
    ),
    VSDrawerItem(
      label: 'Timezone',
      type: VSDrawerItemType.dropdown,
      options: ['PST', 'EST', 'CST', 'MST', 'GMT'],
    ),
    VSDrawerItem(
      label: 'Currency',
      type: VSDrawerItemType.dropdown,
      options: ['USD', 'EUR', 'GBP', 'CAD'],
    ),
  ],
  actions: [
    VSDrawerAction(
      label: 'Cancel',
      onPressed: () {},
      variant: VSButtonVariant.outlined,
    ),
    VSDrawerAction(
      label: 'Save Preferences',
      onPressed: () => savePreferences(),
    ),
  ],
)
```

### Mixed Item Types
Combining text inputs and dropdowns in the same drawer.

```dart
VSDrawer.show(
  context,
  title: 'Create New Task',
  items: [
    VSDrawerItem(
      label: 'Task Title',
      hint: 'Enter task title',
    ),
    VSDrawerItem(
      label: 'Priority',
      type: VSDrawerItemType.dropdown,
      options: ['Low', 'Medium', 'High', 'Critical'],
    ),
    VSDrawerItem(
      label: 'Assigned To',
      hint: 'Enter assignee name or email',
    ),
    VSDrawerItem(
      label: 'Category',
      type: VSDrawerItemType.dropdown,
      options: ['Bug', 'Feature', 'Improvement', 'Documentation'],
    ),
    VSDrawerItem(
      label: 'Description',
      hint: 'Enter task description',
    ),
  ],
  actions: [
    VSDrawerAction(
      label: 'Cancel',
      onPressed: () {},
      variant: VSButtonVariant.outlined,
    ),
    VSDrawerAction(
      label: 'Create Task',
      onPressed: () => createTask(),
    ),
  ],
)
```

## Info Bar Support

### With Info Bar
Drawers with informational messages at the top.

```dart
VSDrawer.show(
  context,
  title: 'Project Settings',
  showInfoBar: true,
  infoMessage: 'Changes will take effect immediately. Please review carefully.',
  infoBgColor: AppColors.warningBg,
  infoTextColor: AppColors.warningDefault,
  items: [
    VSDrawerItem(
      label: 'Project Name',
      hint: 'Current project name',
    ),
    VSDrawerItem(
      label: 'Visibility',
      type: VSDrawerItemType.dropdown,
      options: ['Public', 'Private', 'Team Only'],
    ),
  ],
  actions: [
    VSDrawerAction(
      label: 'Cancel',
      onPressed: () {},
      variant: VSButtonVariant.outlined,
    ),
    VSDrawerAction(
      label: 'Save Changes',
      onPressed: () => saveProjectSettings(),
    ),
  ],
)
```

### Different Info Bar Styles
Various info bar configurations for different contexts.

```dart
// Success info bar
VSDrawer.show(
  context,
  title: 'Payment Confirmation',
  showInfoBar: true,
  infoMessage: 'Payment processed successfully.',
  infoBgColor: AppColors.successBg,
  infoTextColor: AppColors.successDefault,
  // ... items and actions
)

// Information info bar
VSDrawer.show(
  context,
  title: 'System Update',
  showInfoBar: true,
  infoMessage: 'New features available. Update recommended.',
  infoBgColor: AppColors.primaryBg,
  infoTextColor: AppColors.primaryDefault,
  // ... items and actions
)

// Warning info bar
VSDrawer.show(
  context,
  title: 'Data Export',
  showInfoBar: true,
  infoMessage: 'Large dataset detected. Export may take several minutes.',
  infoBgColor: AppColors.warningBg,
  infoTextColor: AppColors.warningDefault,
  // ... items and actions
)
```

## Action Button Configurations

### Single Action
Drawers with only one action button.

```dart
VSDrawer.show(
  context,
  title: 'Confirmation Required',
  items: [
    VSDrawerItem(
      label: 'Confirmation Code',
      hint: 'Enter the 6-digit code',
    ),
  ],
  actions: [
    VSDrawerAction(
      label: 'Verify Code',
      onPressed: () => verifyCode(),
    ),
  ],
)
```

### Multiple Actions
Drawers with several action buttons.

```dart
VSDrawer.show(
  context,
  title: 'Content Publishing',
  items: [
    VSDrawerItem(
      label: 'Publish Date',
      hint: 'Select publish date',
    ),
    VSDrawerItem(
      label: 'Visibility',
      type: VSDrawerItemType.dropdown,
      options: ['Public', 'Private', 'Draft'],
    ),
  ],
  actions: [
    VSDrawerAction(
      label: 'Cancel',
      onPressed: () {},
      variant: VSButtonVariant.outlined,
    ),
    VSDrawerAction(
      label: 'Save Draft',
      onPressed: () => saveDraft(),
      variant: VSButtonVariant.secondary,
    ),
    VSDrawerAction(
      label: 'Publish Now',
      onPressed: () => publishContent(),
    ),
  ],
)
```

### No Actions
Informational drawers without action buttons.

```dart
VSDrawer.show(
  context,
  title: 'System Status',
  items: [
    VSDrawerItem(
      label: 'Status',
      hint: 'All systems operational',
    ),
    VSDrawerItem(
      label: 'Last Updated',
      hint: '2 minutes ago',
    ),
    VSDrawerItem(
      label: 'Uptime',
      hint: '99.9%',
    ),
  ],
  actions: [], // No actions
)
```

## Real-world Usage Examples

### User Profile Settings
Profile management drawer.

```dart
class ProfileSettings extends StatelessWidget {
  void _showProfileDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Profile Settings',
      items: [
        VSDrawerItem(
          label: 'Display Name',
          hint: 'John Doe',
        ),
        VSDrawerItem(
          label: 'Email',
          hint: 'john.doe@example.com',
        ),
        VSDrawerItem(
          label: 'Phone',
          hint: 'Enter your phone number',
        ),
        VSDrawerItem(
          label: 'Timezone',
          type: VSDrawerItemType.dropdown,
          options: ['PST', 'EST', 'CST', 'MST', 'GMT'],
        ),
        VSDrawerItem(
          label: 'Language',
          type: VSDrawerItemType.dropdown,
          options: ['English', 'Spanish', 'French', 'German'],
        ),
      ],
      actions: [
        VSDrawerAction(
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSDrawerAction(
          label: 'Save Changes',
          onPressed: () => _saveProfile(context),
        ),
      ],
    );
  }

  void _saveProfile(BuildContext context) {
    // Save profile logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile updated successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return VSButton(
      label: 'Edit Profile',
      onPressed: () => _showProfileDrawer(context),
    );
  }
}
```

### Privacy Settings
Privacy configuration drawer.

```dart
class PrivacySettings extends StatelessWidget {
  void _showPrivacyDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Privacy Settings',
      showInfoBar: true,
      infoMessage: 'Changes to privacy settings take effect immediately.',
      infoBgColor: AppColors.primaryBg,
      infoTextColor: AppColors.primaryDefault,
      items: [
        VSDrawerItem(
          label: 'Profile Visibility',
          type: VSDrawerItemType.dropdown,
          options: ['Public', 'Friends Only', 'Private'],
        ),
        VSDrawerItem(
          label: 'Activity Status',
          type: VSDrawerItemType.dropdown,
          options: ['Show when online', 'Show last seen', 'Hide status'],
        ),
        VSDrawerItem(
          label: 'Data Sharing',
          type: VSDrawerItemType.dropdown,
          options: ['Share with everyone', 'Share with friends', 'Don\'t share'],
        ),
      ],
      actions: [
        VSDrawerAction(
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSDrawerAction(
          label: 'Update Privacy',
          onPressed: () => _updatePrivacy(context),
        ),
      ],
    );
  }

  void _updatePrivacy(BuildContext context) {
    // Update privacy settings
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Privacy settings updated!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return VSButton(
      label: 'Privacy Settings',
      onPressed: () => _showPrivacyDrawer(context),
      variant: VSButtonVariant.outlined,
    );
  }
}
```

### Project Configuration
Project settings management.

```dart
class ProjectSettings extends StatelessWidget {
  void _showProjectDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Project Settings',
      items: [
        VSDrawerItem(
          label: 'Project Name',
          hint: 'E-commerce Platform',
        ),
        VSDrawerItem(
          label: 'Project Type',
          type: VSDrawerItemType.dropdown,
          options: ['Web Application', 'Mobile App', 'Desktop App', 'API'],
        ),
        VSDrawerItem(
          label: 'Visibility',
          type: VSDrawerItemType.dropdown,
          options: ['Public', 'Private', 'Team Only'],
        ),
        VSDrawerItem(
          label: 'Repository URL',
          hint: 'https://github.com/...',
        ),
        VSDrawerItem(
          label: 'Documentation URL',
          hint: 'https://docs.example.com/...',
        ),
      ],
      actions: [
        VSDrawerAction(
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSDrawerAction(
          label: 'Save Settings',
          onPressed: () => _saveProjectSettings(context),
        ),
      ],
    );
  }

  void _saveProjectSettings(BuildContext context) {
    // Save project settings
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Project settings updated!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Project Configuration', style: AppTypography.bodyMediumSemibold),
              Spacer(),
              VSBadge(label: 'ACTIVE', variant: VSBadgeVariant.primary),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.folder, color: AppColors.primaryDefault),
              SizedBox(width: 8),
              Text('E-commerce Platform', style: AppTypography.bodyMediumRegular),
              Spacer(),
              VSBadge(label: '12 MEMBERS', variant: VSBadgeVariant.neutral),
            ],
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              VSButton(
                label: 'Project Settings',
                onPressed: () => _showProjectDrawer(context),
                size: VSButtonSize.small,
                leftIcon: Icons.settings,
              ),
              VSButton(
                label: 'Team Management',
                onPressed: () => _showTeamDrawer(context),
                size: VSButtonSize.small,
                leftIcon: Icons.group,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showTeamDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Team Management',
      items: [
        VSDrawerItem(
          label: 'Add Team Member',
          hint: 'Enter email address',
        ),
        VSDrawerItem(
          label: 'Role Assignment',
          type: VSDrawerItemType.dropdown,
          options: ['Owner', 'Admin', 'Developer', 'Viewer'],
        ),
      ],
      actions: [
        VSDrawerAction(
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSDrawerAction(
          label: 'Add Member',
          onPressed: () => _addTeamMember(context),
        ),
      ],
    );
  }

  void _addTeamMember(BuildContext context) {
    // Add team member logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Team member added successfully!')),
    );
  }
}
```

### Data Management Operations
Import/export configuration drawer.

```dart
class DataManagement extends StatelessWidget {
  void _showExportDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Data Export',
      items: [
        VSDrawerItem(
          label: 'Export Format',
          type: VSDrawerItemType.dropdown,
          options: ['CSV', 'JSON', 'XML', 'Excel'],
        ),
        VSDrawerItem(
          label: 'Date Range',
          hint: 'Select date range for export',
        ),
        VSDrawerItem(
          label: 'Include Attachments',
          type: VSDrawerItemType.dropdown,
          options: ['Yes', 'No'],
        ),
        VSDrawerItem(
          label: 'Compression',
          type: VSDrawerItemType.dropdown,
          options: ['None', 'ZIP', 'GZIP'],
        ),
      ],
      actions: [
        VSDrawerAction(
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSDrawerAction(
          label: 'Start Export',
          onPressed: () => _startExport(context),
        ),
      ],
    );
  }

  void _showImportDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Data Import',
      showInfoBar: true,
      infoMessage: 'Import data from external sources. Supported formats: CSV, JSON, XML.',
      infoBgColor: AppColors.warningBg,
      infoTextColor: AppColors.warningDefault,
      items: [
        VSDrawerItem(
          label: 'Import Source',
          type: VSDrawerItemType.dropdown,
          options: ['File Upload', 'URL', 'Database Connection'],
        ),
        VSDrawerItem(
          label: 'File Path/URL',
          hint: 'Enter file path or URL',
        ),
        VSDrawerItem(
          label: 'Data Mapping',
          type: VSDrawerItemType.dropdown,
          options: ['Auto-detect', 'Manual mapping', 'Template-based'],
        ),
        VSDrawerItem(
          label: 'Duplicate Handling',
          type: VSDrawerItemType.dropdown,
          options: ['Skip duplicates', 'Update existing', 'Create new'],
        ),
      ],
      actions: [
        VSDrawerAction(
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSDrawerAction(
          label: 'Preview Import',
          onPressed: () => _previewImport(context),
          variant: VSButtonVariant.secondary,
        ),
        VSDrawerAction(
          label: 'Start Import',
          onPressed: () => _startImport(context),
        ),
      ],
    );
  }

  void _startExport(BuildContext context) {
    // Start export process
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Data export initiated!')),
    );
  }

  void _previewImport(BuildContext context) {
    // Show import preview
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Import preview generated!')),
    );
  }

  void _startImport(BuildContext context) {
    // Start import process
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Data import started!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Data Management', style: AppTypography.bodyMediumSemibold),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.storage, color: AppColors.secondaryDefault),
              SizedBox(width: 8),
              Text('Database Operations', style: AppTypography.bodyMediumRegular),
              Spacer(),
              VSBadge(label: '2.3 GB', variant: VSBadgeVariant.warning),
            ],
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              VSButton(
                label: 'Export Data',
                onPressed: () => _showExportDrawer(context),
                size: VSButtonSize.small,
                leftIcon: Icons.download,
              ),
              VSButton(
                label: 'Import Data',
                onPressed: () => _showImportDrawer(context),
                size: VSButtonSize.small,
                leftIcon: Icons.upload,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

### Advanced Filters
Complex filtering interface.

```dart
class AdvancedFilters extends StatelessWidget {
  void _showFiltersDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Advanced Filters',
      items: [
        VSDrawerItem(
          label: 'Price Range Min',
          hint: '0',
        ),
        VSDrawerItem(
          label: 'Price Range Max',
          hint: '1000',
        ),
        VSDrawerItem(
          label: 'Category',
          type: VSDrawerItemType.dropdown,
          options: ['Electronics', 'Clothing', 'Books', 'Home & Garden', 'Sports'],
        ),
        VSDrawerItem(
          label: 'Brand',
          hint: 'Enter brand name',
        ),
        VSDrawerItem(
          label: 'Rating',
          type: VSDrawerItemType.dropdown,
          options: ['Any', '4+ stars', '3+ stars', '2+ stars', '1+ star'],
        ),
        VSDrawerItem(
          label: 'Availability',
          type: VSDrawerItemType.dropdown,
          options: ['Any', 'In stock', 'Out of stock'],
        ),
      ],
      actions: [
        VSDrawerAction(
          label: 'Clear All',
          onPressed: () => _clearFilters(context),
          variant: VSButtonVariant.outlined,
        ),
        VSDrawerAction(
          label: 'Apply Filters',
          onPressed: () => _applyFilters(context),
        ),
      ],
    );
  }

  void _clearFilters(BuildContext context) {
    // Clear all filters
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('All filters cleared!')),
    );
  }

  void _applyFilters(BuildContext context) {
    // Apply selected filters
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Filters applied successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Advanced Filters', style: AppTypography.bodyMediumSemibold),
              Spacer(),
              VSBadge(label: '3 ACTIVE', variant: VSBadgeVariant.primary),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.filter_list, color: AppColors.neutral600),
              SizedBox(width: 8),
              Text('Product Catalog Filters', style: AppTypography.bodySmallRegular),
            ],
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              VSChip(label: 'Price: \$0 - \$100', type: VSChipType.color, variant: VSChipVariant.primary),
              VSChip(label: 'Category: Electronics', type: VSChipType.color, variant: VSChipVariant.secondary),
              VSChip(label: 'Rating: 4+ stars', type: VSChipType.color, variant: VSChipVariant.success),
            ],
          ),
          SizedBox(height: 12),
          VSButton(
            label: 'Advanced Filters',
            onPressed: () => _showFiltersDrawer(context),
            size: VSButtonSize.small,
            variant: VSButtonVariant.outlined,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
```

## Advanced Usage

### Form Validation
Adding validation to drawer forms.

```dart
class ValidatedDrawer extends StatefulWidget {
  @override
  _ValidatedDrawerState createState() => _ValidatedDrawerState();
}

class _ValidatedDrawerState extends State<ValidatedDrawer> {
  final _formKey = GlobalKey<FormState>();
  String? _emailError;
  String? _phoneError;

  void _showValidatedDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Contact Information',
      items: [
        VSDrawerItem(
          label: 'Full Name *',
          hint: 'Enter your full name',
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Full name is required';
            }
            return null;
          },
        ),
        VSDrawerItem(
          label: 'Email Address *',
          hint: 'your.email@example.com',
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Email is required';
            }
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
        VSDrawerItem(
          label: 'Phone Number',
          hint: '+1 (555) 123-4567',
          validator: (value) {
            if (value?.isNotEmpty ?? false) {
              if (!RegExp(r'^\+?[\d\s\-\(\)]+$').hasMatch(value!)) {
                return 'Please enter a valid phone number';
              }
            }
            return null;
          },
        ),
      ],
      actions: [
        VSDrawerAction(
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSDrawerAction(
          label: 'Save Contact',
          onPressed: () => _validateAndSave(context),
        ),
      ],
    );
  }

  void _validateAndSave(BuildContext context) {
    // Form validation logic would go here
    // For now, just show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Contact information saved!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return VSButton(
      label: 'Add Contact',
      onPressed: () => _showValidatedDrawer(context),
    );
  }
}
```

### Dynamic Drawer Content
Drawers with content that changes based on selections.

```dart
class DynamicDrawer extends StatefulWidget {
  @override
  _DynamicDrawerState createState() => _DynamicDrawerState();
}

class _DynamicDrawerState extends State<DynamicDrawer> {
  String _selectedType = 'personal';

  void _showDynamicDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Create New Item',
      items: [
        VSDrawerItem(
          label: 'Item Type',
          type: VSDrawerItemType.dropdown,
          options: ['Personal', 'Business', 'Project'],
          onChanged: (value) {
            setState(() => _selectedType = value?.toLowerCase() ?? 'personal');
            // Note: In a real implementation, you might need to rebuild the drawer
            // or handle this differently
          },
        ),
        VSDrawerItem(
          label: 'Title',
          hint: 'Enter item title',
        ),
        if (_selectedType == 'business') ...[
          VSDrawerItem(
            label: 'Company',
            hint: 'Enter company name',
          ),
          VSDrawerItem(
            label: 'Department',
            type: VSDrawerItemType.dropdown,
            options: ['Sales', 'Marketing', 'Engineering', 'HR'],
          ),
        ],
        if (_selectedType == 'project') ...[
          VSDrawerItem(
            label: 'Project Name',
            hint: 'Enter project name',
          ),
          VSDrawerItem(
            label: 'Priority',
            type: VSDrawerItemType.dropdown,
            options: ['Low', 'Medium', 'High', 'Critical'],
          ),
          VSDrawerItem(
            label: 'Due Date',
            hint: 'Select due date',
          ),
        ],
        VSDrawerItem(
          label: 'Description',
          hint: 'Enter description',
        ),
      ],
      actions: [
        VSDrawerAction(
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSDrawerAction(
          label: 'Create Item',
          onPressed: () => _createItem(context),
        ),
      ],
    );
  }

  void _createItem(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${_selectedType} item created!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return VSButton(
      label: 'Create New Item',
      onPressed: () => _showDynamicDrawer(context),
    );
  }
}
```

## Accessibility

The VS Drawer component includes comprehensive accessibility features:
- Proper ARIA labels and descriptions
- Keyboard navigation support (Tab, Enter, Escape)
- Screen reader announcements
- Focus management and focus trapping
- Semantic form structure
- Error announcements for validation

## Design Guidelines

- Use drawers for secondary actions and configurations
- Keep drawer content focused and concise
- Provide clear action button labels
- Use info bars sparingly for important information
- Consider mobile experience with drawer width
- Group related form fields logically
- Provide validation feedback immediately
- Test keyboard navigation thoroughly

## Related Components

- **VS Dialog**: For confirmation dialogs and alerts
- **VS Button**: For triggering drawer displays
- **VS Input Field**: For individual form inputs
- **VS Dropdown**: For selection inputs within drawers
- **VS Info Bar**: For informational messages</content>
<parameter name="filePath">c:\vs_design_system\lib\markdown2\VS_DRAWER_IMPLEMENTATION.md