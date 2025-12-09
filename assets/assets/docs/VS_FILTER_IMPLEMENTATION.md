# VS Filter Implementation

## Overview

The VS Filter component provides flexible filtering interfaces with collapsible panels and date range selection. It supports individual filter items with icons and labels, along with integrated date picker functionality for comprehensive data filtering.

## Features

- **Collapsible Filter Panel**: Expandable filter interface with selectable items
- **Individual Filter Items**: Configurable filter options with icons and labels
- **Date Range Picker**: Calendar-based date selection with custom titles
- **Reset Functionality**: Clear all active filters with one action
- **State Management**: Track active filters and user selections
- **VS Design System**: Consistent styling and theming
- **Interactive Feedback**: Visual selection indicators and state changes
- **Flexible Layout**: Side-by-side combinations of filters and date pickers
- **Accessibility**: Keyboard navigation and screen reader support

## Basic Usage

### Simple Filter Panel

```dart
VSFilter(
  items: [
    VSFilterItem(
      id: 'status',
      label: 'Status',
      icon: Icons.flag,
      onChanged: (selected) {
        print('Status filter: $selected');
      },
    ),
    VSFilterItem(
      id: 'priority',
      label: 'Priority',
      icon: Icons.priority_high,
      onChanged: (selected) {
        print('Priority filter: $selected');
      },
    ),
  ],
  onReset: () {
    print('All filters reset');
  },
)
```

### Filter with Date Picker

```dart
Row(
  children: [
    VSFilter(
      items: [
        VSFilterItem(
          id: 'category',
          label: 'Category',
          icon: Icons.category,
        ),
        VSFilterItem(
          id: 'status',
          label: 'Status',
          icon: Icons.flag,
        ),
      ],
    ),
    SizedBox(width: AppSpacing.md),
    VSFilterDatePicker(
      title: 'Date Range',
      placeholder: 'Select date range',
      onDateRangeChanged: (range) {
        print('Selected range: ${range?.start} to ${range?.end}');
      },
    ),
  ],
)
```

### Filter with State Management

```dart
class FilterExample extends StatefulWidget {
  @override
  _FilterExampleState createState() => _FilterExampleState();
}

class _FilterExampleState extends State<FilterExample> {
  bool _isStatusActive = false;
  bool _isPriorityActive = false;

  @override
  Widget build(BuildContext context) {
    return VSFilter(
      items: [
        VSFilterItem(
          id: 'status',
          label: 'Status',
          icon: Icons.flag,
          onChanged: (selected) {
            setState(() => _isStatusActive = selected);
          },
        ),
        VSFilterItem(
          id: 'priority',
          label: 'Priority',
          icon: Icons.priority_high,
          onChanged: (selected) {
            setState(() => _isPriorityActive = selected);
          },
        ),
      ],
      onReset: () {
        setState(() {
          _isStatusActive = false;
          _isPriorityActive = false;
        });
      },
    );
  }
}
```

## Variants

### Basic Filter Variants

#### Filter with Icons

```dart
VSFilter(
  items: [
    VSFilterItem(
      id: 'assignee',
      label: 'Assignee',
      icon: Icons.person,
    ),
    VSFilterItem(
      id: 'date',
      label: 'Date Range',
      icon: Icons.calendar_today,
    ),
    VSFilterItem(
      id: 'category',
      label: 'Category',
      icon: Icons.category,
    ),
  ],
)
```

#### Filter with Callback Actions

```dart
VSFilter(
  items: [
    VSFilterItem(
      id: 'urgent',
      label: 'Urgent Only',
      icon: Icons.warning,
      onChanged: (selected) {
        if (selected) {
          // Apply urgent filter
          _applyUrgentFilter();
        } else {
          // Remove urgent filter
          _removeUrgentFilter();
        }
      },
    ),
  ],
  onReset: () {
    _clearAllFilters();
  },
)
```

### Date Picker Variants

#### Basic Date Picker

```dart
VSFilterDatePicker(
  title: 'Select Period',
  placeholder: 'Choose start and end dates',
  onDateRangeChanged: (range) {
    print('Date range selected: $range');
  },
)
```

#### Pre-selected Date Range

```dart
VSFilterDatePicker(
  title: 'Report Period',
  placeholder: 'Pre-selected date range',
  initialDateRange: DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 30)),
    end: DateTime.now(),
  ),
  onDateRangeChanged: (range) {
    // Handle date range change
  },
)
```

#### Custom Title and Placeholder

```dart
VSFilterDatePicker(
  title: 'Project Timeline',
  placeholder: 'Select project start and end dates',
  onDateRangeChanged: (range) {
    // Process project timeline
  },
)
```

## Advanced Examples

### Task Management Filters

```dart
class TaskFilters extends StatefulWidget {
  @override
  _TaskFiltersState createState() => _TaskFiltersState();
}

class _TaskFiltersState extends State<TaskFilters> {
  bool _statusFilter = false;
  bool _priorityFilter = false;
  bool _assigneeFilter = false;
  bool _categoryFilter = false;
  DateTimeRange? _dueDateRange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        VSFilter(
          items: [
            VSFilterItem(
              id: 'status',
              label: 'Status',
              icon: Icons.flag,
              onChanged: (selected) => setState(() => _statusFilter = selected),
            ),
            VSFilterItem(
              id: 'priority',
              label: 'Priority',
              icon: Icons.priority_high,
              onChanged: (selected) => setState(() => _priorityFilter = selected),
            ),
            VSFilterItem(
              id: 'assignee',
              label: 'Assignee',
              icon: Icons.person,
              onChanged: (selected) => setState(() => _assigneeFilter = selected),
            ),
            VSFilterItem(
              id: 'category',
              label: 'Category',
              icon: Icons.category,
              onChanged: (selected) => setState(() => _categoryFilter = selected),
            ),
          ],
          onReset: () => setState(() {
            _statusFilter = false;
            _priorityFilter = false;
            _assigneeFilter = false;
            _categoryFilter = false;
          }),
        ),
        SizedBox(width: AppSpacing.md),
        VSFilterDatePicker(
          title: 'Due Date Range',
          placeholder: 'Filter by due dates',
          onDateRangeChanged: (range) => setState(() => _dueDateRange = range),
        ),
      ],
    );
  }
}
```

### E-commerce Product Filters

```dart
class ProductFilters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        VSFilter(
          items: [
            VSFilterItem(
              id: 'category',
              label: 'Category',
              icon: Icons.category,
            ),
            VSFilterItem(
              id: 'price',
              label: 'Price Range',
              icon: Icons.attach_money,
            ),
            VSFilterItem(
              id: 'brand',
              label: 'Brand',
              icon: Icons.business,
            ),
            VSFilterItem(
              id: 'rating',
              label: 'Rating',
              icon: Icons.star,
            ),
            VSFilterItem(
              id: 'availability',
              label: 'Availability',
              icon: Icons.inventory,
            ),
          ],
        ),
        SizedBox(width: AppSpacing.md),
        VSFilterDatePicker(
          title: 'Added Date',
          placeholder: 'Filter by date added',
        ),
      ],
    );
  }
}
```

### Analytics Dashboard Filters

```dart
class AnalyticsFilters extends StatefulWidget {
  @override
  _AnalyticsFiltersState createState() => _AnalyticsFiltersState();
}

class _AnalyticsFiltersState extends State<AnalyticsFilters> {
  DateTimeRange? _reportPeriod;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        VSFilter(
          items: [
            VSFilterItem(
              id: 'metrics',
              label: 'Metrics',
              icon: Icons.analytics,
            ),
            VSFilterItem(
              id: 'users',
              label: 'User Segments',
              icon: Icons.people,
            ),
            VSFilterItem(
              id: 'traffic',
              label: 'Traffic Sources',
              icon: Icons.traffic,
            ),
            VSFilterItem(
              id: 'devices',
              label: 'Device Types',
              icon: Icons.devices,
            ),
          ],
        ),
        SizedBox(width: AppSpacing.md),
        VSFilterDatePicker(
          title: 'Report Period',
          placeholder: 'Select analytics period',
          initialDateRange: DateTimeRange(
            start: DateTime.now().subtract(const Duration(days: 30)),
            end: DateTime.now(),
          ),
          onDateRangeChanged: (range) => setState(() => _reportPeriod = range),
        ),
      ],
    );
  }
}
```

## Real-World Usage Patterns

### Task Management Dashboard

```dart
void _showTaskManagementFilters(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          VSFilter(
            items: [
              VSFilterItem(
                id: 'status',
                label: 'Status',
                icon: Icons.flag,
              ),
              VSFilterItem(
                id: 'priority',
                label: 'Priority',
                icon: Icons.priority_high,
              ),
              VSFilterItem(
                id: 'assignee',
                label: 'Assignee',
                icon: Icons.person,
              ),
              VSFilterItem(
                id: 'category',
                label: 'Category',
                icon: Icons.category,
              ),
            ],
          ),
          SizedBox(width: AppSpacing.md),
          VSFilterDatePicker(
            title: 'Due Date Range',
            placeholder: 'Filter by due dates',
          ),
        ],
      ),
    ),
  );
}
```

### Project Management Filters

```dart
void _showProjectFilters(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          VSFilter(
            items: [
              VSFilterItem(
                id: 'status',
                label: 'Project Status',
                icon: Icons.folder,
              ),
              VSFilterItem(
                id: 'type',
                label: 'Project Type',
                icon: Icons.build,
              ),
              VSFilterItem(
                id: 'team',
                label: 'Team',
                icon: Icons.group,
              ),
              VSFilterItem(
                id: 'budget',
                label: 'Budget Range',
                icon: Icons.attach_money,
              ),
            ],
          ),
          SizedBox(width: AppSpacing.md),
          VSFilterDatePicker(
            title: 'Project Timeline',
            placeholder: 'Select project dates',
          ),
        ],
      ),
    ),
  );
}
```

### Customer Support Filters

```dart
void _showSupportFilters(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          VSFilter(
            items: [
              VSFilterItem(
                id: 'status',
                label: 'Ticket Status',
                icon: Icons.flag,
              ),
              VSFilterItem(
                id: 'priority',
                label: 'Priority Level',
                icon: Icons.priority_high,
              ),
              VSFilterItem(
                id: 'type',
                label: 'Issue Type',
                icon: Icons.bug_report,
              ),
              VSFilterItem(
                id: 'agent',
                label: 'Assigned Agent',
                icon: Icons.support_agent,
              ),
              VSFilterItem(
                id: 'customer',
                label: 'Customer Type',
                icon: Icons.person,
              ),
            ],
          ),
          SizedBox(width: AppSpacing.md),
          VSFilterDatePicker(
            title: 'Created Date',
            placeholder: 'Filter by creation date',
          ),
        ],
      ),
    ),
  );
}
```

### Interactive Filter with Visual Feedback

```dart
class InteractiveFilterDemo extends StatefulWidget {
  @override
  _InteractiveFilterDemoState createState() => _InteractiveFilterDemoState();
}

class _InteractiveFilterDemoState extends State<InteractiveFilterDemo> {
  bool _categoryActive = false;
  bool _statusActive = false;
  bool _priorityActive = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        VSFilter(
          items: [
            VSFilterItem(
              id: 'category',
              label: 'Category',
              icon: Icons.category,
              onChanged: (selected) => setState(() => _categoryActive = selected),
            ),
            VSFilterItem(
              id: 'status',
              label: 'Status',
              icon: Icons.flag,
              onChanged: (selected) => setState(() => _statusActive = selected),
            ),
            VSFilterItem(
              id: 'priority',
              label: 'Priority',
              icon: Icons.priority_high,
              onChanged: (selected) => setState(() => _priorityActive = selected),
            ),
          ],
          onReset: () => setState(() {
            _categoryActive = false;
            _statusActive = false;
            _priorityActive = false;
          }),
        ),
        SizedBox(width: AppSpacing.md),
        Container(
          width: 200,
          padding: EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.neutral0,
            border: Border.all(color: AppColors.neutral300),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Active Filters:', style: AppTypography.bodyMediumSemibold),
              SizedBox(height: AppSpacing.sm),
              if (_categoryActive)
                VSChip(
                  label: 'Category Filter',
                  type: VSChipType.color,
                  variant: VSChipVariant.primary,
                ),
              if (_statusActive)
                VSChip(
                  label: 'Status Filter',
                  type: VSChipType.color,
                  variant: VSChipVariant.secondary,
                ),
              if (_priorityActive)
                VSChip(
                  label: 'Priority Filter',
                  type: VSChipType.color,
                  variant: VSChipVariant.warning,
                ),
              if (!_categoryActive && !_statusActive && !_priorityActive)
                Text('No filters active', style: AppTypography.bodySmallRegular),
            ],
          ),
        ),
      ],
    );
  }
}
```

## Configuration Options

### VSFilter Properties

| Property | Type | Description | Default |
|----------|------|-------------|---------|
| `items` | `List<VSFilterItem>` | List of filter items to display | Required |
| `onReset` | `VoidCallback?` | Callback when reset button is pressed | `null` |

### VSFilterItem Properties

| Property | Type | Description | Default |
|----------|------|-------------|---------|
| `id` | `String` | Unique identifier for the filter item | Required |
| `label` | `String` | Display label for the filter item | Required |
| `icon` | `IconData?` | Icon to display with the filter item | `null` |
| `onChanged` | `ValueChanged<bool>?` | Callback when filter selection changes | `null` |

### VSFilterDatePicker Properties

| Property | Type | Description | Default |
|----------|------|-------------|---------|
| `title` | `String` | Title displayed above the date picker | Required |
| `placeholder` | `String` | Placeholder text for the date input | Required |
| `initialDateRange` | `DateTimeRange?` | Pre-selected date range | `null` |
| `onDateRangeChanged` | `ValueChanged<DateTimeRange?>?` | Callback when date range changes | `null` |

## Best Practices

1. **Logical Grouping**: Group related filters together and use clear, descriptive labels
2. **Icon Consistency**: Use meaningful icons that clearly represent each filter type
3. **State Management**: Properly track filter states and provide reset functionality
4. **Date Integration**: Combine filters with date pickers for comprehensive data filtering
5. **Visual Feedback**: Show active filters with chips or badges for user awareness
6. **Performance**: Consider lazy loading for filters with large datasets
7. **Accessibility**: Ensure keyboard navigation and screen reader compatibility
8. **Reset Functionality**: Always provide a way to clear all active filters

## Accessibility

- Keyboard navigation support for all filter interactions
- Screen reader announcements for filter state changes
- Proper ARIA labels and roles for filter elements
- Focus management and visual focus indicators
- Support for high contrast themes and reduced motion preferences