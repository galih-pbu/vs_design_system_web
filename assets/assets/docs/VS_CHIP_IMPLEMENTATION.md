# VS Chip

**Version 1.0.1 - December 14, 2025**

The VS Chip component provides compact, interactive elements for displaying status indicators, tags, filters, and approval states with consistent design tokens and multiple variants.

## Overview

The `VSChip` widget creates small, rounded elements that can represent tags, filters, status indicators, or approval states. It supports three main types (color, input, approval) and six semantic variants for different use cases.

## Features

- **Three Types**: Color chips for status/tags, input chips for filters, approval chips for workflows
- **Six Variants**: Primary, secondary, danger, success, warning, neutral with semantic colors
- **Interactive States**: Delete functionality for input chips, selection states
- **Approval Indicators**: Check marks for approved states
- **Disabled State**: Visual feedback for disabled chips
- **Compact Design**: Optimized for tags, categories, and filters
- **Accessibility**: Screen reader support and keyboard navigation

## Basic Usage

```dart
// Simple status chip
VSChip(
  label: 'ACTIVE',
  type: VSChipType.color,
  variant: VSChipVariant.success,
)

// Filter chip with delete
VSChip(
  label: 'React',
  type: VSChipType.input,
  onDelete: () => removeFilter('React'),
)

// Approval chip
VSChip(
  label: 'APPROVED',
  type: VSChipType.approval,
  variant: VSChipVariant.success,
  showCheckIndicator: true,
)
```

## Chip Types

### Color Chips
Status and category indicators with semantic colors.

```dart
Column(
  children: [
    VSChip(
      label: 'PRIMARY',
      type: VSChipType.color,
      variant: VSChipVariant.primary,
    ),
    VSChip(
      label: 'SECONDARY',
      type: VSChipType.color,
      variant: VSChipVariant.secondary,
    ),
    VSChip(
      label: 'SUCCESS',
      type: VSChipType.color,
      variant: VSChipVariant.success,
    ),
    VSChip(
      label: 'WARNING',
      type: VSChipType.color,
      variant: VSChipVariant.warning,
    ),
    VSChip(
      label: 'DANGER',
      type: VSChipType.color,
      variant: VSChipVariant.danger,
    ),
    VSChip(
      label: 'NEUTRAL',
      type: VSChipType.color,
      variant: VSChipVariant.neutral,
    ),
  ],
)
```

### Input Chips
Filter chips with optional delete functionality.

```dart
Wrap(
  spacing: 8,
  children: [
    VSChip(
      label: 'React',
      type: VSChipType.input,
      onDelete: () => removeFilter('React'),
    ),
    VSChip(
      label: 'TypeScript',
      type: VSChipType.input,
      onDelete: () => removeFilter('TypeScript'),
    ),
    VSChip(
      label: 'Flutter',
      type: VSChipType.input,
      onDelete: () => removeFilter('Flutter'),
    ),
  ],
)
```

### Approval Chips
Workflow approval indicators with check marks.

```dart
Row(
  children: [
    VSChip(
      label: 'APPROVED',
      type: VSChipType.approval,
      variant: VSChipVariant.success,
      showCheckIndicator: true,
    ),
    SizedBox(width: 8),
    VSChip(
      label: 'PENDING',
      type: VSChipType.approval,
      variant: VSChipVariant.warning,
    ),
    SizedBox(width: 8),
    VSChip(
      label: 'REJECTED',
      type: VSChipType.approval,
      variant: VSChipVariant.danger,
    ),
  ],
)
```

## Interactive Examples

### Filter Management
Dynamic filter selection with add/remove functionality.

```dart
class FilterChipsExample extends StatefulWidget {
  @override
  _FilterChipsExampleState createState() => _FilterChipsExampleState();
}

class _FilterChipsExampleState extends State<FilterChipsExample> {
  final Set<String> _selectedFilters = {'React', 'TypeScript'};
  final List<String> _availableFilters = [
    'React', 'Vue', 'Angular', 'TypeScript', 'JavaScript', 'Python'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Technology Filters'),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _availableFilters.map((filter) {
            final isSelected = _selectedFilters.contains(filter);
            return VSChip(
              label: filter,
              type: VSChipType.input,
              variant: isSelected ? VSChipVariant.primary : VSChipVariant.neutral,
              onDelete: isSelected
                  ? () => setState(() => _selectedFilters.remove(filter))
                  : null,
            );
          }).toList(),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            VSButton(
              label: 'Add Filter',
              onPressed: () => _showAddFilterDialog(),
              size: VSButtonSize.small,
              variant: VSButtonVariant.outlined,
            ),
            SizedBox(width: 8),
            VSButton(
              label: 'Clear All',
              onPressed: () => setState(() => _selectedFilters.clear()),
              size: VSButtonSize.small,
              variant: VSButtonVariant.text,
            ),
          ],
        ),
      ],
    );
  }

  void _showAddFilterDialog() {
    // Show dialog to add new filters
  }
}
```

### Tag Management
Tag chips for categorizing content.

```dart
class TagManagementExample extends StatelessWidget {
  final List<String> _availableTags = [
    'urgent', 'frontend', 'backend', 'design', 'testing', 'documentation'
  ];

  VSChipVariant _getTagVariant(String tag) {
    switch (tag) {
      case 'urgent':
        return VSChipVariant.danger;
      case 'frontend':
        return VSChipVariant.primary;
      case 'backend':
        return VSChipVariant.secondary;
      case 'design':
        return VSChipVariant.success;
      case 'testing':
        return VSChipVariant.warning;
      case 'documentation':
        return VSChipVariant.neutral;
      default:
        return VSChipVariant.neutral;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Project Tags'),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _availableTags.map((tag) {
            return VSChip(
              label: tag,
              type: VSChipType.color,
              variant: _getTagVariant(tag),
            );
          }).toList(),
        ),
      ],
    );
  }
}
```

## Real-world Usage Examples

### User Profile with Skills
Display user skills and technologies.

```dart
Container(
  padding: EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          VSAvatar(
            imageUrl: 'https://via.placeholder.com/40',
            size: VSAvatarSize.medium,
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sarah Johnson', style: AppTypography.bodyMediumSemibold),
              Text('Senior Developer', style: AppTypography.bodySmallRegular),
            ],
          ),
        ],
      ),
      SizedBox(height: 12),
      Text('Skills & Technologies', style: AppTypography.bodySmallSemibold),
      SizedBox(height: 8),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          VSChip(label: 'React', type: VSChipType.color, variant: VSChipVariant.primary),
          VSChip(label: 'TypeScript', type: VSChipType.color, variant: VSChipVariant.secondary),
          VSChip(label: 'Node.js', type: VSChipType.color, variant: VSChipVariant.success),
          VSChip(label: 'AWS', type: VSChipType.color, variant: VSChipVariant.warning),
          VSChip(label: 'Docker', type: VSChipType.color, variant: VSChipVariant.neutral),
        ],
      ),
    ],
  ),
)
```

### Task Status Board
Task management with status and category chips.

```dart
class TaskItem extends StatelessWidget {
  final String title;
  final List<String> tags;
  final VSChipVariant statusVariant;

  const TaskItem({
    required this.title,
    required this.tags,
    required this.statusVariant,
  });

  VSChipVariant _getTagVariant(String tag) {
    // Same as above
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(title, style: AppTypography.bodySmallRegular),
          ),
          SizedBox(width: 8),
          Wrap(
            spacing: 4,
            children: tags.map((tag) => VSChip(
              label: tag,
              type: VSChipType.color,
              variant: _getTagVariant(tag),
            )).toList(),
          ),
          SizedBox(width: 8),
          VSChip(
            label: 'IN PROGRESS',
            type: VSChipType.color,
            variant: statusVariant,
          ),
        ],
      ),
    );
  }
}

// Usage
Column(
  children: [
    TaskItem(
      title: 'Implement user authentication',
      tags: ['backend', 'security'],
      statusVariant: VSChipVariant.warning,
    ),
    TaskItem(
      title: 'Design new dashboard',
      tags: ['design', 'frontend'],
      statusVariant: VSChipVariant.primary,
    ),
    TaskItem(
      title: 'Write API documentation',
      tags: ['documentation'],
      statusVariant: VSChipVariant.neutral,
    ),
  ],
)
```

### Approval Workflow
Purchase request approval tracking.

```dart
Container(
  padding: EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Purchase Request #PR-2024-001', style: AppTypography.bodyMediumSemibold),
      SizedBox(height: 12),
      Row(
        children: [
          Text('Status:', style: AppTypography.bodySmallRegular),
          SizedBox(width: 8),
          VSChip(
            label: 'APPROVED',
            type: VSChipType.approval,
            variant: VSChipVariant.success,
            showCheckIndicator: true,
          ),
        ],
      ),
      SizedBox(height: 12),
      Text('Approval History', style: AppTypography.bodySmallSemibold),
      SizedBox(height: 8),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          VSChip(
            label: 'Manager Approved',
            type: VSChipType.approval,
            variant: VSChipVariant.success,
            showCheckIndicator: true,
          ),
          VSChip(
            label: 'Finance Pending',
            type: VSChipType.approval,
            variant: VSChipVariant.warning,
          ),
          VSChip(
            label: 'CEO Pending',
            type: VSChipType.approval,
            variant: VSChipVariant.neutral,
          ),
        ],
      ),
    ],
  ),
)
```

### Active Filters Panel
Display and manage active filters.

```dart
Container(
  padding: EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Active Filters', style: AppTypography.bodyMediumSemibold),
      SizedBox(height: 12),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          VSChip(
            label: 'Status: Active',
            type: VSChipType.input,
            onDelete: () => removeFilter('status'),
          ),
          VSChip(
            label: 'Priority: High',
            type: VSChipType.input,
            onDelete: () => removeFilter('priority'),
          ),
          VSChip(
            label: 'Date: This Week',
            type: VSChipType.input,
            onDelete: () => removeFilter('date'),
          ),
        ],
      ),
      SizedBox(height: 12),
      VSButton(
        label: 'Add Filter',
        onPressed: () => showFilterDialog(),
        size: VSButtonSize.small,
        variant: VSButtonVariant.outlined,
        leftIcon: Icons.add,
      ),
    ],
  ),
)
```

## Disabled State

Chips can be disabled to show inactive or unavailable states.

```dart
Wrap(
  spacing: 8,
  children: [
    VSChip(
      label: 'DISABLED',
      type: VSChipType.color,
      variant: VSChipVariant.primary,
      isEnabled: false,
    ),
    VSChip(
      label: 'DISABLED INPUT',
      type: VSChipType.input,
      isEnabled: false,
    ),
    VSChip(
      label: 'DISABLED APPROVAL',
      type: VSChipType.approval,
      variant: VSChipVariant.success,
      showCheckIndicator: true,
      isEnabled: false,
    ),
  ],
)
```

## Advanced Usage

### Custom Chip with Icons
Extend chips with custom icons or indicators.

```dart
class CustomChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final VSChipVariant variant;
  final VoidCallback? onTap;

  const CustomChip({
    required this.label,
    required this.icon,
    required this.variant,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: _getBackgroundColor(variant),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: _getTextColor(variant)),
            SizedBox(width: 6),
            Text(
              label,
              style: AppTypography.bodySmallSemibold.copyWith(
                color: _getTextColor(variant),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor(VSChipVariant variant) {
    // Map variant to background color
  }

  Color _getTextColor(VSChipVariant variant) {
    // Map variant to text color
  }
}
```

### Chip Group with Selection
Group of selectable chips.

```dart
class ChipGroup extends StatefulWidget {
  final List<String> options;
  final String? selectedOption;
  final Function(String) onSelectionChanged;

  const ChipGroup({
    required this.options,
    required this.selectedOption,
    required this.onSelectionChanged,
  });

  @override
  _ChipGroupState createState() => _ChipGroupState();
}

class _ChipGroupState extends State<ChipGroup> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: widget.options.map((option) {
        final isSelected = widget.selectedOption == option;
        return GestureDetector(
          onTap: () => widget.onSelectionChanged(option),
          child: VSChip(
            label: option,
            type: VSChipType.color,
            variant: isSelected ? VSChipVariant.primary : VSChipVariant.neutral,
          ),
        );
      }).toList(),
    );
  }
}
```

## Accessibility

The VS Chip component includes comprehensive accessibility features:
- Proper semantic labeling for screen readers
- Keyboard navigation support for interactive chips
- Focus indicators for delete actions
- ARIA labels and descriptions

## Design Guidelines

- Use color chips for status indicators and categories
- Use input chips for filters and removable tags
- Use approval chips for workflow states
- Keep labels concise and descriptive
- Consider color blindness when choosing variants
- Provide clear visual feedback for interactions
- Test on different screen sizes and densities

## Related Components

- **VS Badge**: For numeric indicators and small status displays
- **VS Button**: For primary actions and larger interactive elements
- **VS Filter**: For complex filtering interfaces
- **VS Input Field**: For text input with chip-like suggestions</content>
<parameter name="filePath">c:\vs_design_system\lib\markdown2\VS_CHIP_IMPLEMENTATION.md