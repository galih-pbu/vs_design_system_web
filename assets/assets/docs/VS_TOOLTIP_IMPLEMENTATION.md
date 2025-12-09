# VS Tooltip

The VS Tooltip component provides contextual help and information overlays that appear on hover or focus, with customizable positioning and styling.

## Overview

The `VSTooltip` widget displays informative text when users hover over or focus on an element, providing contextual help without cluttering the interface.

## Features

- **Multiple Positions**: Top, bottom, left, right positioning
- **Auto-positioning**: Automatically adjusts position to stay in viewport
- **Rich Content**: Support for text, icons, and custom widgets
- **Variants**: Different visual styles and themes
- **Animation**: Smooth show/hide transitions
- **Accessibility**: Screen reader support and keyboard navigation
- **Delay Controls**: Configurable show/hide delays
- **Interactive**: Can contain clickable elements

## Basic Usage

```dart
VSTooltip(
  message: 'This is a helpful tooltip message',
  child: VSButton(
    label: 'Hover me',
    onPressed: () {},
  ),
)
```

## Positions

### Top Position (Default)
Tooltip appears above the target element.

```dart
VSTooltip(
  message: 'Tooltip above the element',
  position: VSTooltipPosition.top,
  child: Icon(Icons.info),
)
```

### Bottom Position
Tooltip appears below the target element.

```dart
VSTooltip(
  message: 'Tooltip below the element',
  position: VSTooltipPosition.bottom,
  child: Icon(Icons.help),
)
```

### Left Position
Tooltip appears to the left of the target element.

```dart
VSTooltip(
  message: 'Tooltip to the left',
  position: VSTooltipPosition.left,
  child: Icon(Icons.arrow_back),
)
```

### Right Position
Tooltip appears to the right of the target element.

```dart
VSTooltip(
  message: 'Tooltip to the right',
  position: VSTooltipPosition.right,
  child: Icon(Icons.arrow_forward),
)
```

## Variants

### Default Variant
Standard tooltip with neutral background.

```dart
VSTooltip(
  message: 'Default tooltip style',
  variant: VSTooltipVariant.default,
  child: Text('Hover for tooltip'),
)
```

### Info Variant
Informational tooltip with blue accent.

```dart
VSTooltip(
  message: 'This provides additional information',
  variant: VSTooltipVariant.info,
  child: Icon(Icons.info, color: AppColors.infoDefault),
)
```

### Success Variant
Success tooltip with green accent.

```dart
VSTooltip(
  message: 'Operation completed successfully',
  variant: VSTooltipVariant.success,
  child: Icon(Icons.check_circle, color: AppColors.successDefault),
)
```

### Warning Variant
Warning tooltip with yellow accent.

```dart
VSTooltip(
  message: 'Please review this carefully',
  variant: VSTooltipVariant.warning,
  child: Icon(Icons.warning, color: AppColors.warningDefault),
)
```

### Error Variant
Error tooltip with red accent.

```dart
VSTooltip(
  message: 'An error occurred',
  variant: VSTooltipVariant.error,
  child: Icon(Icons.error, color: AppColors.dangerDefault),
)
```

## Rich Content

### With Icon
Tooltip with icon for better visual communication.

```dart
VSTooltip(
  message: 'Save your changes',
  icon: Icon(Icons.save, size: 16),
  child: VSButton(
    label: 'Save',
    onPressed: () {},
  ),
)
```

### Multi-line Content
Tooltip with multiple lines of text.

```dart
VSTooltip(
  message: 'This is a longer tooltip message that spans\nmultiple lines to provide more detailed information\nabout the element or action.',
  child: Text('Multi-line tooltip'),
)
```

### Custom Content
Tooltip with custom widget content.

```dart
VSTooltip(
  content: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text('Custom Tooltip Content', style: AppTypography.bodySmallMedium),
      SizedBox(height: 4),
      Text('With multiple elements', style: AppTypography.bodySmallRegular),
      SizedBox(height: 8),
      VSButton(
        label: 'Action',
        size: VSButtonSize.xsmall,
        onPressed: () => print('Tooltip action'),
      ),
    ],
  ),
  child: Text('Custom tooltip'),
)
```

## Timing Controls

### Custom Delays
Control show and hide timing.

```dart
VSTooltip(
  message: 'Tooltip with custom timing',
  showDelay: Duration(milliseconds: 500),  // Show after 500ms
  hideDelay: Duration(milliseconds: 200),  // Hide after 200ms
  child: Text('Delayed tooltip'),
)
```

### Instant Show
Tooltip that appears immediately.

```dart
VSTooltip(
  message: 'Instant tooltip',
  showDelay: Duration.zero,
  child: Text('No delay'),
)
```

## Advanced Usage

### Form Field Help
```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      children: [
        Text('Email Address', style: AppTypography.bodyMediumMedium),
        SizedBox(width: 4),
        VSTooltip(
          message: 'Enter a valid email address in the format: user@example.com',
          position: VSTooltipPosition.right,
          child: Icon(Icons.help_outline, size: 16, color: AppColors.textSecondary),
        ),
      ],
    ),
    SizedBox(height: 8),
    VSInputField(
      label: 'Email',
      hintText: 'user@example.com',
      type: VSInputFieldType.email,
    ),
  ],
)
```

### Icon Button Tooltips
```dart
Row(
  children: [
    VSTooltip(
      message: 'Edit item',
      child: IconButton(
        icon: Icon(Icons.edit),
        onPressed: () => editItem(),
      ),
    ),
    VSTooltip(
      message: 'Delete item',
      variant: VSTooltipVariant.error,
      child: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () => deleteItem(),
      ),
    ),
    VSTooltip(
      message: 'Share item',
      child: IconButton(
        icon: Icon(Icons.share),
        onPressed: () => shareItem(),
      ),
    ),
  ],
)
```

### Data Table Headers
```dart
DataTable(
  columns: [
    DataColumn(
      label: Row(
        children: [
          Text('Name'),
          SizedBox(width: 4),
          VSTooltip(
            message: 'Full name of the user',
            child: Icon(Icons.info_outline, size: 16),
          ),
        ],
      ),
    ),
    DataColumn(
      label: Row(
        children: [
          Text('Status'),
          SizedBox(width: 4),
          VSTooltip(
            message: 'Current status: Active, Inactive, or Pending',
            child: Icon(Icons.help_outline, size: 16),
          ),
        ],
      ),
    ),
  ],
  rows: [
    // Table rows...
  ],
)
```

### Navigation Tooltips
```dart
BottomNavigationBar(
  items: [
    BottomNavigationBarItem(
      icon: VSTooltip(
        message: 'Home - Go to main dashboard',
        child: Icon(Icons.home),
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: VSTooltip(
        message: 'Search - Find items and content',
        child: Icon(Icons.search),
      ),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: VSTooltip(
        message: 'Profile - Manage your account',
        child: Icon(Icons.person),
      ),
      label: 'Profile',
    ),
  ],
)
```

## Accessibility

The VS Tooltip component includes comprehensive accessibility features:
- Screen reader announcements
- Keyboard focus support
- ARIA labels and descriptions
- High contrast support
- Motion reduction respect

## Performance Considerations

- Tooltips are created lazily when needed
- Automatic cleanup when widgets are disposed
- Efficient overlay management
- Minimal impact on scroll performance

## Design Guidelines

- Keep tooltip text concise and clear
- Use appropriate variants for semantic meaning
- Position tooltips to avoid viewport edges
- Consider mobile touch interactions
- Don't overuse tooltips - use for clarification, not explanation
- Test tooltip positioning on different screen sizes

## Related Components

- **VS Info Bar**: Inline information messages
- **VS Toast**: Temporary notification messages
- **VS Dialog**: Modal information displays
- **VS Popover**: Rich content overlays</content>
<parameter name="filePath">c:\vs_design_system\lib\markdown2\VS_TOOLTIP_IMPLEMENTATION.md