# VS Button

The VS Button component provides a flexible and customizable button implementation with multiple variants, sizes, and interactive states.

## Overview

The `VSButton` widget is a fundamental UI component that supports various button styles and configurations to fit different design needs and user interactions.

## Features

- **Multiple Variants**: Primary, Secondary, Danger, Outlined, and Text button styles
- **Size Options**: XSmall, Small, Medium, and Large sizes
- **Icon Support**: Left and right icon placement
- **Loading States**: Built-in loading indicator support
- **Disabled State**: Proper disabled styling and interaction handling
- **Accessibility**: Screen reader support and keyboard navigation

## Basic Usage

```dart
VSButton(
  label: 'Click Me',
  onPressed: () {
    // Handle button press
  },
)
```

## Variants

### Primary Button
The default button style with the primary brand color.

```dart
VSButton(
  label: 'Primary Action',
  onPressed: () => print('Primary button pressed'),
  variant: VSButtonVariant.primary,
)
```

### Secondary Button
A secondary action button with muted styling.

```dart
VSButton(
  label: 'Secondary Action',
  onPressed: () => print('Secondary button pressed'),
  variant: VSButtonVariant.secondary,
)
```

### Danger Button
Used for destructive actions like delete or cancel.

```dart
VSButton(
  label: 'Delete Item',
  onPressed: () => print('Danger button pressed'),
  variant: VSButtonVariant.danger,
)
```

### Outlined Button
A button with an outline border and transparent background.

```dart
VSButton(
  label: 'Outlined Action',
  onPressed: () => print('Outlined button pressed'),
  variant: VSButtonVariant.outlined,
)
```

### Text Button
A minimal button that appears as styled text.

```dart
VSButton(
  label: 'Text Action',
  onPressed: () => print('Text button pressed'),
  variant: VSButtonVariant.text,
)
```

## Sizes

### XSmall
Compact button for tight spaces.

```dart
VSButton(
  label: 'XS',
  onPressed: () => print('XSmall button pressed'),
  size: VSButtonSize.xsmall,
)
```

### Small
Small button for secondary actions.

```dart
VSButton(
  label: 'Small',
  onPressed: () => print('Small button pressed'),
  size: VSButtonSize.small,
)
```

### Medium (Default)
Standard button size for most use cases.

```dart
VSButton(
  label: 'Medium',
  onPressed: () => print('Medium button pressed'),
  size: VSButtonSize.medium,
)
```

### Large
Prominent button for primary actions.

```dart
VSButton(
  label: 'Large',
  onPressed: () => print('Large button pressed'),
  size: VSButtonSize.large,
)
```

## With Icons

### Left Icon
Button with an icon positioned to the left of the text.

```dart
VSButton(
  label: 'Save',
  onPressed: () => print('Save button pressed'),
  leftIcon: Icon(Icons.save),
)
```

### Right Icon
Button with an icon positioned to the right of the text.

```dart
VSButton(
  label: 'Next',
  onPressed: () => print('Next button pressed'),
  rightIcon: Icon(Icons.arrow_forward),
)
```

### Icon Only
Button with only an icon (no text label).

```dart
VSButton(
  onPressed: () => print('Icon button pressed'),
  leftIcon: Icon(Icons.add),
)
```

## States

### Loading State
Button showing a loading indicator.

```dart
VSButton(
  label: 'Loading...',
  onPressed: null, // Disabled when loading
  isLoading: true,
)
```

### Disabled State
Button that cannot be interacted with.

```dart
VSButton(
  label: 'Disabled',
  onPressed: null, // null onPressed makes button disabled
)
```

## Advanced Usage

### Custom Styling
While the button provides predefined variants, you can customize appearance through the theme system.

### Full Example
```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSButton(
          label: 'Create New Item',
          onPressed: () => _createItem(),
          variant: VSButtonVariant.primary,
          size: VSButtonSize.large,
          leftIcon: Icon(Icons.add),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            VSButton(
              label: 'Cancel',
              onPressed: () => _cancel(),
              variant: VSButtonVariant.outlined,
            ),
            SizedBox(width: 8),
            VSButton(
              label: 'Save',
              onPressed: () => _save(),
              variant: VSButtonVariant.primary,
            ),
          ],
        ),
      ],
    );
  }
}
```

## Accessibility

The VS Button component includes proper accessibility features:
- Screen reader support for button labels
- Keyboard navigation support
- Proper focus indicators
- Semantic button role

## Related Components

- **VS Split Button**: Button with dropdown menu
- **VS Icon Button**: Circular icon-only button
- **VS Link**: Text-based navigation link</content>
<parameter name="filePath">c:\vs_design_system\lib\markdown2\VS_BUTTON.md