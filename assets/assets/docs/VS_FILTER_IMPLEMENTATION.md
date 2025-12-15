# VS Filter Implementation

## Overview

The VS Filter component provides advanced filtering interfaces with popup menus, collapsible panels, and integrated date range selection. It supports multiple filter types including dropdown selections, date pickers, and custom content for comprehensive data filtering.

## Features

- **Popup Filter Menu**: Expandable filter interface with selectable items
- **Multiple Filter Types**: Dropdown menus, date filters, date range filters, custom filters
- **State Management**: Track active filters and user selections
- **Reset Functionality**: Clear all active filters with one action
- **VS Design System**: Consistent styling and theming
- **Interactive Feedback**: Visual selection indicators and state changes
- **Flexible Layout**: Side-by-side combinations of filters
- **Accessibility**: Keyboard navigation and screen reader support

## Classes

### Data Classes

- `VSFilterItem`: Represents individual filter items with id, name, and selection state
- `VSFilterMenuItem`: Menu item for dropdown filters with search capability
- `VSCustomFilterMenuItem`: Menu item for custom filter content
- `VSFilterMenuItem2`: Enhanced menu item with ValueNotifier support
- `VSDateFilterMenuItem`: Menu item for single date selection
- `VSDateRangeFilterMenuItem`: Menu item for date range selection

### Widget Classes

- `VSFilterButton`: Basic filter button with popup menu
- `VSParentFilterGroup`: Advanced filter group with apply/reset functionality

## Basic Usage

### Simple Filter Button

```dart
VSFilterButton(
  lsFilterMenuItem: [
    VSFilterMenuItem(
      icon: Icon(Icons.flag),
      title: 'Status',
      lsItem: [
        DropDownObj(id: '1', descs: 'Active'),
        DropDownObj(id: '2', descs: 'Inactive'),
        DropDownObj(id: '3', descs: 'Pending'),
      ],
      isMultiSelect: false,
    ),
    VSFilterMenuItem(
      icon: Icon(Icons.category),
      title: 'Category',
      lsItem: [
        DropDownObj(id: '1', descs: 'Technology'),
        DropDownObj(id: '2', descs: 'Business'),
        DropDownObj(id: '3', descs: 'Design'),
      ],
      isMultiSelect: true,
      withSearch: true,
      searchBarTitle: 'Search category...',
    ),
  ],
  resetCallback: () {
    print('Filters reset');
  },
)
```

### Advanced Filter Group

```dart
VSParentFilterGroup(
  applyCallback: () {
    print('Filters applied');
  },
  children: [
    VSFilterMenuItem2(
      icon: Icon(Icons.flag),
      title: 'Status',
      lsItemNotifier: ValueNotifier([
        VSFilterItem(name: 'Active', id: 'active'),
        VSFilterItem(name: 'Inactive', id: 'inactive'),
        VSFilterItem(name: 'Pending', id: 'pending'),
      ]),
      isMultiSelect: false,
    ),
    VSFilterMenuItem2(
      icon: Icon(Icons.category),
      title: 'Category',
      lsItemNotifier: ValueNotifier([
        VSFilterItem(name: 'Technology', id: 'tech'),
        VSFilterItem(name: 'Business', id: 'business'),
        VSFilterItem(name: 'Design', id: 'design'),
      ]),
      isMultiSelect: true,
    ),
    VSDateRangeFilterMenuItem(
      icon: VSIcon(name: VSIcons.calendar, size: 16),
      title: 'Created Date',
      initialDateRange: DateTimeRange(
        start: DateTime.now().subtract(Duration(days: 30)),
        end: DateTime.now(),
      ),
      startDate: DateTime(2020),
      endDate: DateTime(2030),
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
  final ValueNotifier<List<VSFilterItem>> statusItems = ValueNotifier([
    VSFilterItem(name: 'Active', id: 'active'),
    VSFilterItem(name: 'Inactive', id: 'inactive'),
    VSFilterItem(name: 'Pending', id: 'pending'),
  ]);

  final ValueNotifier<List<VSFilterItem>> categoryItems = ValueNotifier([
    VSFilterItem(name: 'Technology', id: 'tech'),
    VSFilterItem(name: 'Business', id: 'business'),
    VSFilterItem(name: 'Design', id: 'design'),
  ]);

  @override
  Widget build(BuildContext context) {
    return VSParentFilterGroup(
      applyCallback: () {
        // Apply filters
        print('Filters applied');
      },
      children: [
        VSFilterMenuItem2(
          icon: Icon(Icons.flag),
          title: 'Status',
          lsItemNotifier: statusItems,
          isMultiSelect: false,
        ),
        VSFilterMenuItem2(
          icon: Icon(Icons.category),
          title: 'Category',
          lsItemNotifier: categoryItems,
          isMultiSelect: true,
        ),
      ],
    );
  }
}
```

## Variants

### Basic Filter Variants

#### Filter with Icons

```dart
VSFilterButton(
  lsFilterMenuItem: [
    VSFilterMenuItem(
      icon: Icon(Icons.person),
      title: 'Assignee',
      lsItem: [
        DropDownObj(id: '1', descs: 'John Doe'),
        DropDownObj(id: '2', descs: 'Jane Smith'),
      ],
      isMultiSelect: false,
    ),
    VSFilterMenuItem(
      icon: Icon(Icons.calendar_today),
      title: 'Date Range',
      lsItem: [
        DropDownObj(id: '1', descs: 'Last 7 days'),
        DropDownObj(id: '2', descs: 'Last 30 days'),
      ],
      isMultiSelect: false,
    ),
  ],
)
```

#### Filter with Search

```dart
VSFilterButton(
  lsFilterMenuItem: [
    VSFilterMenuItem(
      icon: Icon(Icons.category),
      title: 'Category',
      lsItem: [
        DropDownObj(id: '1', descs: 'Technology'),
        DropDownObj(id: '2', descs: 'Business'),
        DropDownObj(id: '3', descs: 'Design'),
        DropDownObj(id: '4', descs: 'Marketing'),
      ],
      isMultiSelect: true,
      withSearch: true,
      searchBarTitle: 'Search categories...',
    ),
  ],
)
```

### Date Picker Variants

#### Date Range Filter

```dart
VSDateRangeFilterMenuItem(
  icon: VSIcon(name: VSIcons.calendar, size: 16),
  title: 'Select Period',
  initialDateRange: DateTimeRange(
    start: DateTime.now().subtract(Duration(days: 30)),
    end: DateTime.now(),
  ),
  startDate: DateTime(2020),
  endDate: DateTime(2030),
)
```

*Note: Date pickers are centered within the popup menu for optimal user experience.*

#### Single Date Filter

```dart
VSDateFilterMenuItem(
  icon: VSIcon(name: VSIcons.calendar, size: 16),
  title: 'Due Date',
  initialDate: DateTime.now(),
  firstDate: DateTime(2020),
  lastDate: DateTime(2030),
)
```

#### Custom Filter Content

```dart
VSCustomFilterMenuItem(
  icon: Icon(Icons.settings),
  title: 'Advanced Settings',
  contentBuilder: (closePopup, filtered, lsNotifier) {
    return Column(
      children: [
        Text('Custom filter content here'),
        ElevatedButton(
          onPressed: closePopup,
          child: Text('Apply'),
        ),
      ],
    );
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
  final ValueNotifier<List<VSFilterItem>> statusItems = ValueNotifier([
    VSFilterItem(name: 'Active', id: 'active'),
    VSFilterItem(name: 'Inactive', id: 'inactive'),
    VSFilterItem(name: 'Pending', id: 'pending'),
  ]);

  final ValueNotifier<List<VSFilterItem>> priorityItems = ValueNotifier([
    VSFilterItem(name: 'High', id: 'high'),
    VSFilterItem(name: 'Medium', id: 'medium'),
    VSFilterItem(name: 'Low', id: 'low'),
  ]);

  @override
  Widget build(BuildContext context) {
    return VSParentFilterGroup(
      applyCallback: () {
        // Apply task filters
        print('Task filters applied');
      },
      children: [
        VSFilterMenuItem2(
          icon: Icon(Icons.flag),
          title: 'Status',
          lsItemNotifier: statusItems,
          isMultiSelect: false,
        ),
        VSFilterMenuItem2(
          icon: Icon(Icons.priority_high),
          title: 'Priority',
          lsItemNotifier: priorityItems,
          isMultiSelect: true,
        ),
        VSDateRangeFilterMenuItem(
          icon: VSIcon(name: VSIcons.calendar, size: 16),
          title: 'Due Date Range',
          initialDateRange: DateTimeRange(
            start: DateTime.now(),
            end: DateTime.now().add(Duration(days: 30)),
          ),
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
    return VSParentFilterGroup(
      applyCallback: () {
        // Apply product filters
      },
      children: [
        VSFilterMenuItem2(
          icon: Icon(Icons.category),
          title: 'Category',
          lsItemNotifier: ValueNotifier([
            VSFilterItem(name: 'Electronics', id: 'electronics'),
            VSFilterItem(name: 'Clothing', id: 'clothing'),
            VSFilterItem(name: 'Books', id: 'books'),
          ]),
          isMultiSelect: true,
        ),
        VSFilterMenuItem2(
          icon: Icon(Icons.attach_money),
          title: 'Price Range',
          lsItemNotifier: ValueNotifier([
            VSFilterItem(name: 'Under $50', id: 'under50'),
            VSFilterItem(name: '$50-$100', id: '50to100'),
            VSFilterItem(name: 'Over $100', id: 'over100'),
          ]),
          isMultiSelect: false,
        ),
        VSDateRangeFilterMenuItem(
          icon: VSIcon(name: VSIcons.calendar, size: 16),
          title: 'Added Date',
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
    return VSParentFilterGroup(
      applyCallback: () {
        // Apply analytics filters
      },
      children: [
        VSFilterMenuItem2(
          icon: Icon(Icons.analytics),
          title: 'Metrics',
          lsItemNotifier: ValueNotifier([
            VSFilterItem(name: 'Page Views', id: 'pageviews'),
            VSFilterItem(name: 'Unique Visitors', id: 'visitors'),
            VSFilterItem(name: 'Bounce Rate', id: 'bounce'),
          ]),
          isMultiSelect: true,
        ),
        VSFilterMenuItem2(
          icon: Icon(Icons.people),
          title: 'User Segments',
          lsItemNotifier: ValueNotifier([
            VSFilterItem(name: 'New Users', id: 'new'),
            VSFilterItem(name: 'Returning Users', id: 'returning'),
          ]),
          isMultiSelect: false,
        ),
        VSDateRangeFilterMenuItem(
          icon: VSIcon(name: VSIcons.calendar, size: 16),
          title: 'Report Period',
          initialDateRange: DateTimeRange(
            start: DateTime.now().subtract(Duration(days: 30)),
            end: DateTime.now(),
          ),
        ),
      ],
    );
  }
}
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

## Configuration Options

### VSFilterButton Properties

| Property | Type | Description | Default |
|----------|------|-------------|---------|
| `lsFilterMenuItem` | `List<VSFilterMenuItem>` | List of filter menu items | Required |
| `lsCustomFilterMenuItem` | `List<VSCustomFilterMenuItem>?` | List of custom filter menu items | `null` |
| `customFilterNotifier` | `List<ValueNotifier<bool>>?` | Notifiers for custom filters | `null` |
| `resetCallback` | `VoidCallback?` | Callback when reset is pressed | `null` |

### VSFilterMenuItem Properties

| Property | Type | Description | Default |
|----------|------|-------------|---------|
| `icon` | `Widget` | Icon to display | Required |
| `title` | `String` | Menu title | Required |
| `lsItem` | `List<DropDownObj>` | List of dropdown items | Required |
| `lsItemNotifier` | `ValueNotifier<List<DropDownObj>?>?` | Notifier for items | `null` |
| `initSelected` | `bool?` | Initial selection state | `null` |
| `withSearch` | `bool` | Enable search functionality | `false` |
| `isMultiSelect` | `bool` | Allow multiple selections | `false` |
| `sortItem` | `bool` | Sort items alphabetically | `false` |
| `searchBarTitle` | `String?` | Search bar placeholder | `null` |
| `searchBarOnChangeCallback` | `Function(String?)?` | Search callback | `null` |
| `itemCallback` | `Function(int index)?` | Item selection callback | `null` |

### VSFilterMenuItem2 Properties

| Property | Type | Description | Default |
|----------|------|-------------|---------|
| `icon` | `Widget` | Icon to display | Required |
| `title` | `String` | Menu title | Required |
| `lsItemNotifier` | `ValueNotifier<List<VSFilterItem>?>` | Notifier for filter items | Required |
| `isMultiSelect` | `bool` | Allow multiple selections | `false` |
| `sortItem` | `bool` | Sort items alphabetically | `false` |
| `searchBarTitle` | `String?` | Search bar placeholder | `null` |
| `allowUnselect` | `bool` | Allow unselecting items | `false` |
| `showSelectedOnly` | `bool` | Show only selected items | `true` |

### VSDateRangeFilterMenuItem Properties

| Property | Type | Description | Default |
|----------|------|-------------|---------|
| `icon` | `Widget` | Icon to display | Required |
| `title` | `String` | Menu title | Required |
| `initialDateRange` | `DateTimeRange?` | Pre-selected date range | `null` |
| `startDate` | `DateTime?` | Minimum selectable date | `null` |
| `endDate` | `DateTime?` | Maximum selectable date | `null` |

### VSDateFilterMenuItem Properties

| Property | Type | Description | Default |
|----------|------|-------------|---------|
| `icon` | `Widget` | Icon to display | Required |
| `title` | `String` | Menu title | Required |
| `initialDate` | `DateTime?` | Pre-selected date | `null` |
| `firstDate` | `DateTime?` | Minimum selectable date | `null` |
| `lastDate` | `DateTime?` | Maximum selectable date | `null` |

### VSParentFilterGroup Properties

| Property | Type | Description | Default |
|----------|------|-------------|---------|
| `applyCallback` | `VoidCallback` | Callback when apply is pressed | Required |
| `children` | `List<VSFilterMenuItem2>` | List of filter menu items | Required |
| `filterKey` | `GlobalKey<PopupMenuButtonState>?` | Key for popup menu | `null` |

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