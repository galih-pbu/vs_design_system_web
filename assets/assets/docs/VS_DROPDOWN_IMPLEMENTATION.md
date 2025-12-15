# VS Dropdown Implementation

**Version 1.0.1 - December 14, 2025**

## Overview

The VS Dropdown component provides flexible selection interfaces with VS Design System styling. It supports both basic dropdowns with static lists and advanced autocomplete dropdowns with search and lazy loading capabilities.

## Features

- **Basic Dropdown**: Static list with overlay positioning
- **Autocomplete Dropdown**: Search and lazy loading capabilities
- **Form Integration**: Labels, hints, validation, required fields
- **Error Handling**: Custom error messages and validation states
- **Accessibility**: Keyboard navigation and screen reader support
- **VS Design System**: Consistent styling and theming
- **State Management**: Enabled/disabled states and pre-selection
- **Performance**: Efficient rendering and memory management

## Basic Usage

### Simple Dropdown

```dart
VSDropdown(
  label: 'Country',
  items: ['United States', 'Canada', 'Mexico', 'United Kingdom'],
  value: 'United States',
  onChanged: (value) {
    print('Selected: $value');
  },
)
```

### Dropdown with Validation

```dart
VSDropdown(
  label: 'Priority',
  items: ['Low', 'Medium', 'High', 'Critical'],
  value: _selectedPriority,
  error: _priorityError,
  required: true,
  onChanged: (value) {
    setState(() {
      _selectedPriority = value;
      _priorityError = null;
    });
  },
)
```

### Autocomplete Dropdown

```dart
VSAutocompleteDropdown(
  label: 'Select User',
  hint: 'Search for users...',
  onLoadMore: (page) async {
    // Simulate API call with pagination
    await Future.delayed(const Duration(milliseconds: 300));
    return _fetchUsers(page);
  },
  onChanged: (value) {
    print('Selected user: $value');
  },
)
```

## Variants

### Basic Dropdown Variants

#### With Hint Text
```dart
VSDropdown(
  label: 'Department',
  hint: 'Choose your department',
  items: ['Engineering', 'Design', 'Marketing', 'Sales', 'HR'],
)
```

#### Required Field
```dart
VSDropdown(
  label: 'Project Type',
  items: ['Web App', 'Mobile App', 'Desktop App', 'API'],
  required: true,
)
```

#### Disabled State
```dart
VSDropdown(
  label: 'Status',
  items: ['Active', 'Inactive', 'Pending'],
  enabled: false,
  value: 'Pending',
)
```

#### With Error State
```dart
VSDropdown(
  label: 'Category',
  items: ['Electronics', 'Clothing', 'Books'],
  error: 'Please select a category',
  value: null,
)
```

### Autocomplete Dropdown Variants

#### With Custom Display
```dart
VSAutocompleteDropdown(
  label: 'Team Member',
  hint: 'Search team members...',
  displayStringForOption: (user) => '${user.name} (${user.email})',
  onLoadMore: (page) async {
    return await _searchUsers('', page);
  },
)
```

#### With Initial Value
```dart
VSAutocompleteDropdown(
  label: 'Assignee',
  hint: 'Select assignee...',
  initialValue: selectedUser,
  onLoadMore: (page) async {
    return await _fetchUsers(page);
  },
)
```

## Advanced Examples

### Form with Multiple Dropdowns

```dart
class UserProfileForm extends StatefulWidget {
  @override
  _UserProfileFormState createState() => _UserProfileFormState();
}

class _UserProfileFormState extends State<UserProfileForm> {
  String? _selectedCountry;
  String? _selectedPriority;
  String? _countryError;
  String? _priorityError;

  void _validateAndSubmit() {
    setState(() {
      _countryError = _selectedCountry == null ? 'Country is required' : null;
      _priorityError = _selectedPriority == null ? 'Priority is required' : null;
    });

    if (_countryError == null && _priorityError == null) {
      // Submit form
      print('Form submitted successfully');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSDropdown(
          label: 'Country',
          items: ['United States', 'Canada', 'Mexico', 'United Kingdom'],
          value: _selectedCountry,
          error: _countryError,
          required: true,
          onChanged: (value) {
            setState(() {
              _selectedCountry = value;
              _countryError = null;
            });
          },
        ),
        SizedBox(height: AppSpacing.md),
        VSDropdown(
          label: 'Priority',
          items: ['Low', 'Medium', 'High', 'Critical'],
          value: _selectedPriority,
          error: _priorityError,
          required: true,
          onChanged: (value) {
            setState(() {
              _selectedPriority = value;
              _priorityError = null;
            });
          },
        ),
        SizedBox(height: AppSpacing.lg),
        VSButton(
          label: 'Save Profile',
          onPressed: _validateAndSubmit,
        ),
      ],
    );
  }
}
```

### Autocomplete with Lazy Loading

```dart
class UserSelector extends StatefulWidget {
  @override
  _UserSelectorState createState() => _UserSelectorState();
}

class _UserSelectorState extends State<UserSelector> {
  List<User> _allUsers = [
    User(id: 1, name: 'Alice Johnson', email: 'alice@example.com'),
    User(id: 2, name: 'Bob Smith', email: 'bob@example.com'),
    User(id: 3, name: 'Charlie Brown', email: 'charlie@example.com'),
    // ... more users
  ];

  Future<List<User>> _searchUsers(String query, int page) async {
    await Future.delayed(const Duration(milliseconds: 300)); // Simulate network delay

    final filtered = _allUsers.where((user) =>
      user.name.toLowerCase().contains(query.toLowerCase()) ||
      user.email.toLowerCase().contains(query.toLowerCase())
    ).toList();

    // Simulate pagination
    final startIndex = (page - 1) * 10;
    final endIndex = startIndex + 10;
    return filtered.sublist(startIndex, endIndex.clamp(0, filtered.length));
  }

  @override
  Widget build(BuildContext context) {
    return VSAutocompleteDropdown<User>(
      label: 'Select User',
      hint: 'Search for users...',
      displayStringForOption: (user) => '${user.name} (${user.email})',
      onLoadMore: (page) async {
        return await _searchUsers('', page);
      },
      onChanged: (user) {
        if (user != null) {
          print('Selected: ${user.name}');
        }
      },
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  @override
  String toString() => name;
}
```

### Dynamic Dropdown Updates

```dart
class DynamicDropdownExample extends StatefulWidget {
  @override
  _DynamicDropdownExampleState createState() => _DynamicDropdownExampleState();
}

class _DynamicDropdownExampleState extends State<DynamicDropdownExample> {
  String? _selectedCountry;
  List<String> _cities = [];

  final Map<String, List<String>> _countryCities = {
    'United States': ['New York', 'Los Angeles', 'Chicago', 'Houston'],
    'Canada': ['Toronto', 'Vancouver', 'Montreal', 'Calgary'],
    'Mexico': ['Mexico City', 'Guadalajara', 'Monterrey', 'Puebla'],
    'United Kingdom': ['London', 'Manchester', 'Birmingham', 'Liverpool'],
  };

  void _onCountryChanged(String? country) {
    setState(() {
      _selectedCountry = country;
      _cities = country != null ? _countryCities[country]! : [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSDropdown(
          label: 'Country',
          items: _countryCities.keys.toList(),
          value: _selectedCountry,
          onChanged: _onCountryChanged,
        ),
        SizedBox(height: AppSpacing.md),
        VSDropdown(
          label: 'City',
          items: _cities,
          enabled: _selectedCountry != null,
          hint: _selectedCountry == null ? 'Select a country first' : null,
        ),
      ],
    );
  }
}
```

## Real-World Usage Patterns

### User Profile Settings

```dart
void _showUserProfileForm(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => VSDialog(
      type: VSDialogType.summary,
      title: 'Edit Profile',
      message: '',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VSDropdown(
            label: 'Country',
            items: ['United States', 'Canada', 'Mexico', 'United Kingdom'],
            value: 'United States',
          ),
          SizedBox(height: AppSpacing.md),
          VSDropdown(
            label: 'Timezone',
            items: ['EST', 'CST', 'MST', 'PST', 'GMT'],
            value: 'EST',
          ),
          SizedBox(height: AppSpacing.md),
          VSDropdown(
            label: 'Language',
            items: ['English', 'Spanish', 'French', 'German'],
            value: 'English',
          ),
        ],
      ),
      actions: [
        VSDialogAction(
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSDialogAction(
          label: 'Save Changes',
          onPressed: () => _showActionDialog(context, 'Profile updated successfully!'),
        ),
      ],
    ),
  );
}
```

### Notification Settings

```dart
void _showNotificationSettingsForm(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => VSDialog(
      type: VSDialogType.summary,
      title: 'Notification Settings',
      message: '',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VSDropdown(
            label: 'Email Notifications',
            items: ['All emails', 'Important only', 'No emails'],
            value: 'Important only',
          ),
          SizedBox(height: AppSpacing.md),
          VSDropdown(
            label: 'Push Notifications',
            items: ['All notifications', 'Important only', 'No notifications'],
            value: 'All notifications',
          ),
          SizedBox(height: AppSpacing.md),
          VSDropdown(
            label: 'Quiet Hours',
            items: ['8 PM - 8 AM', '10 PM - 7 AM', '11 PM - 6 AM', 'Disabled'],
            value: '10 PM - 7 AM',
          ),
        ],
      ),
      actions: [
        VSDialogAction(
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSDialogAction(
          label: 'Save Settings',
          onPressed: () => _showActionDialog(context, 'Notification settings saved!'),
        ),
      ],
    ),
  );
}
```

### Project Settings

```dart
void _showProjectSettingsForm(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => VSDialog(
      type: VSDialogType.summary,
      title: 'Project Settings',
      message: '',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VSDropdown(
            label: 'Project Type',
            items: ['Web Application', 'Mobile App', 'Desktop App', 'API'],
            value: 'Web Application',
          ),
          SizedBox(height: AppSpacing.md),
          VSDropdown(
            label: 'Visibility',
            items: ['Public', 'Private', 'Team Only'],
            value: 'Private',
          ),
          SizedBox(height: AppSpacing.md),
          VSDropdown(
            label: 'Default Branch',
            items: ['main', 'master', 'develop'],
            value: 'main',
          ),
        ],
      ),
      actions: [
        VSDialogAction(
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSDialogAction(
          label: 'Save Settings',
          onPressed: () => _showActionDialog(context, 'Project settings updated!'),
        ),
      ],
    ),
  );
}
```

### Team Management

```dart
void _showTeamManagementForm(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => VSDialog(
      type: VSDialogType.summary,
      title: 'Add Team Member',
      message: '',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VSAutocompleteDropdown(
            label: 'Select User',
            hint: 'Search for team members...',
            onLoadMore: (page) async {
              await Future.delayed(const Duration(milliseconds: 300));
              return _allUsers.sublist(0, 10);
            },
          ),
          SizedBox(height: AppSpacing.md),
          VSDropdown(
            label: 'Role',
            items: ['Owner', 'Admin', 'Developer', 'Viewer'],
            value: 'Developer',
          ),
          SizedBox(height: AppSpacing.md),
          VSDropdown(
            label: 'Permissions',
            items: ['Full Access', 'Edit Only', 'Read Only'],
            value: 'Edit Only',
          ),
        ],
      ),
      actions: [
        VSDialogAction(
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSDialogAction(
          label: 'Add Member',
          onPressed: () => _showActionDialog(context, 'Team member added successfully!'),
        ),
      ],
    ),
  );
}
```

### Workflow Configuration

```dart
void _showWorkflowConfigForm(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => VSDialog(
      type: VSDialogType.summary,
      title: 'Workflow Configuration',
      message: '',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VSDropdown(
            label: 'Trigger Event',
            items: ['Push to main', 'Pull request', 'Issue created', 'Manual trigger'],
            value: 'Push to main',
          ),
          SizedBox(height: AppSpacing.md),
          VSDropdown(
            label: 'Action Type',
            items: ['Run tests', 'Deploy', 'Send notification', 'Create issue'],
            value: 'Run tests',
          ),
          SizedBox(height: AppSpacing.md),
          VSDropdown(
            label: 'Environment',
            items: ['Development', 'Staging', 'Production'],
            value: 'Development',
          ),
        ],
      ),
      actions: [
        VSDialogAction(
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSDialogAction(
          label: 'Save Workflow',
          onPressed: () => _showActionDialog(context, 'Workflow configured successfully!'),
        ),
      ],
    ),
  );
}
```

### Advanced Filters

```dart
void _showAdvancedFiltersForm(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => VSDialog(
      type: VSDialogType.summary,
      title: 'Advanced Filters',
      message: '',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VSDropdown(
            label: 'Category',
            items: ['Electronics', 'Clothing', 'Books', 'Home & Garden', 'Sports'],
            value: 'Electronics',
          ),
          SizedBox(height: AppSpacing.md),
          VSDropdown(
            label: 'Price Range',
            items: ['\$0 - \$50', '\$50 - \$100', '\$100 - \$500', '\$500+'],
            value: '\$50 - \$100',
          ),
          SizedBox(height: AppSpacing.md),
          VSDropdown(
            label: 'Rating',
            items: ['Any', '4+ stars', '3+ stars', '2+ stars'],
            value: '4+ stars',
          ),
          SizedBox(height: AppSpacing.md),
          VSDropdown(
            label: 'Availability',
            items: ['Any', 'In stock', 'Out of stock'],
            value: 'In stock',
          ),
        ],
      ),
      actions: [
        VSDialogAction(
          label: 'Clear All',
          onPressed: () => _showActionDialog(context, 'All filters cleared!'),
          variant: VSButtonVariant.outlined,
        ),
        VSDialogAction(
          label: 'Apply Filters',
          onPressed: () => _showActionDialog(context, 'Filters applied successfully!'),
        ),
      ],
    ),
  );
}
```

### Task Creation

```dart
void _showTaskCreationForm(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => VSDialog(
      type: VSDialogType.summary,
      title: 'Create New Task',
      message: '',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VSDropdown(
            label: 'Task Type',
            items: ['Bug', 'Feature', 'Improvement', 'Documentation'],
            value: 'Feature',
          ),
          SizedBox(height: AppSpacing.md),
          VSDropdown(
            label: 'Priority',
            items: ['Low', 'Medium', 'High', 'Critical'],
            value: 'Medium',
          ),
          SizedBox(height: AppSpacing.md),
          VSDropdown(
            label: 'Assignee',
            items: ['Unassigned', 'Alice Johnson', 'Bob Smith', 'Charlie Brown'],
            value: 'Unassigned',
          ),
        ],
      ),
      actions: [
        VSDialogAction(
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSDialogAction(
          label: 'Create Task',
          onPressed: () => _showActionDialog(context, 'Task created successfully!'),
        ),
      ],
    ),
  );
}
```

### Bulk Actions

```dart
void _showBulkActionsForm(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => VSDialog(
      type: VSDialogType.summary,
      title: 'Bulk Actions',
      message: '',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VSDropdown(
            label: 'Action Type',
            items: ['Change Status', 'Assign To', 'Change Priority', 'Delete'],
            value: 'Change Status',
          ),
          SizedBox(height: AppSpacing.md),
          VSDropdown(
            label: 'New Status',
            items: ['Open', 'In Progress', 'Review', 'Closed'],
            value: 'In Progress',
          ),
          SizedBox(height: AppSpacing.md),
          VSDropdown(
            label: 'Apply To',
            items: ['Selected items (3)', 'All items on page', 'All matching items'],
            value: 'Selected items (3)',
          ),
        ],
      ),
      actions: [
        VSDialogAction(
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSDialogAction(
          label: 'Apply Changes',
          onPressed: () => _showActionDialog(context, 'Bulk action applied to 3 items!'),
        ),
      ],
    ),
  );
}
```

### Task Export

```dart
void _showTaskExportForm(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => VSDialog(
      type: VSDialogType.summary,
      title: 'Export Tasks',
      message: '',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VSDropdown(
            label: 'Export Format',
            items: ['CSV', 'Excel', 'JSON', 'PDF'],
            value: 'CSV',
          ),
          SizedBox(height: AppSpacing.md),
          VSDropdown(
            label: 'Date Range',
            items: ['Last 7 days', 'Last 30 days', 'Last 3 months', 'All time'],
            value: 'Last 30 days',
          ),
          SizedBox(height: AppSpacing.md),
          VSDropdown(
            label: 'Include Fields',
            items: ['All fields', 'Basic info only', 'Custom selection'],
            value: 'All fields',
          ),
        ],
      ),
      actions: [
        VSDialogAction(
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSDialogAction(
          label: 'Start Export',
          onPressed: () => _showActionDialog(context, 'Export started! You will receive an email when ready.'),
        ),
      ],
    ),
  );
}
```

## Configuration Options

### VSDropdown Properties

| Property | Type | Description | Default |
|----------|------|-------------|---------|
| `label` | `String?` | The label text displayed above the dropdown | `null` |
| `hint` | `String?` | Hint text shown when no value is selected | `null` |
| `items` | `List<String>` | List of items to display in the dropdown | Required |
| `value` | `String?` | Currently selected value | `null` |
| `error` | `String?` | Error message to display | `null` |
| `required` | `bool` | Whether the field is required | `false` |
| `enabled` | `bool` | Whether the dropdown is enabled | `true` |
| `onChanged` | `ValueChanged<String?>?` | Callback when selection changes | `null` |

### VSAutocompleteDropdown Properties

| Property | Type | Description | Default |
|----------|------|-------------|---------|
| `label` | `String?` | The label text displayed above the dropdown | `null` |
| `hint` | `String?` | Hint text shown when no value is selected | `null` |
| `initialValue` | `T?` | Initial selected value | `null` |
| `displayStringForOption` | `String Function(T)?` | Function to display option as string | `null` |
| `onLoadMore` | `Future<List<T>> Function(int)?` | Function to load more items | `null` |
| `onChanged` | `ValueChanged<T?>?` | Callback when selection changes | `null` |
| `enabled` | `bool` | Whether the dropdown is enabled | `true` |

## Best Practices

1. **Use Appropriate Component**: Choose `VSDropdown` for static lists and `VSAutocompleteDropdown` for large datasets with search
2. **Provide Clear Labels**: Always include descriptive labels for accessibility and usability
3. **Handle Validation**: Show appropriate error messages and clear them when user makes valid selections
4. **Consider Performance**: Use lazy loading for large datasets to maintain smooth performance
5. **Maintain Consistency**: Use consistent item formatting and ordering across similar dropdowns
6. **Test Edge Cases**: Ensure proper handling of empty states, loading states, and error conditions

## Accessibility

- Keyboard navigation support for all dropdown interactions
- Screen reader announcements for selection changes
- Proper ARIA labels and roles for assistive technologies
- Focus management and visual focus indicators
- Support for high contrast themes and reduced motion preferences