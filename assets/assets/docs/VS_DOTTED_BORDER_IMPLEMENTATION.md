# VS Dotted Border

The VS Dotted Border component provides flexible dotted and dashed border styling around any widget with support for animations, gradients, and various border shapes.

## Overview

The `VSDottedBorder` widget creates customizable dotted or dashed borders around child widgets. It supports multiple border types, dash patterns, animations, and integrates seamlessly with the VS Design System.

## Features

- **Multiple Border Types**: Rectangle, rounded rectangle, circle, and oval shapes
- **Customizable Dash Patterns**: Control dash and gap lengths for different visual effects
- **Animation Support**: Optional animated borders with configurable duration
- **Color and Gradient Support**: Solid colors or linear gradients for borders
- **Flexible Stroke Width**: Adjustable border thickness
- **Padding Control**: Configurable spacing between border and content
- **Stroke Cap Options**: Customize line endings (butt, round, square)
- **Custom Path Support**: Advanced custom border shapes
- **VS Design Integration**: Consistent theming with design tokens

## Basic Usage

```dart
VSDottedBorder(
  borderType: VSBorderType.rRect,
  color: AppColors.primaryDefault,
  strokeWidth: 2,
  dashPattern: [6, 6],
  radius: const Radius.circular(8),
  padding: EdgeInsets.all(16),
  child: Container(
    width: 100,
    height: 100,
    color: AppColors.neutral100,
    child: Center(child: Text('Content')),
  ),
)
```

## Border Types

### Rectangle Border
Basic rectangular border with sharp corners.

```dart
VSDottedBorder(
  borderType: VSBorderType.rect,
  color: AppColors.primaryDefault,
  strokeWidth: 2,
  dashPattern: [8, 4],
  padding: EdgeInsets.all(12),
  child: Container(
    width: 120,
    height: 80,
    color: AppColors.neutral100,
    child: Center(child: Text('Rectangle')),
  ),
)
```

### Rounded Rectangle Border
Rectangular border with rounded corners.

```dart
VSDottedBorder(
  borderType: VSBorderType.rRect,
  color: AppColors.secondaryDefault,
  strokeWidth: 2,
  dashPattern: [6, 6],
  radius: const Radius.circular(12),
  padding: EdgeInsets.all(16),
  child: Container(
    width: 140,
    height: 90,
    color: AppColors.secondaryBg,
    child: Center(child: Text('Rounded')),
  ),
)
```

### Circle Border
Circular border for circular content.

```dart
VSDottedBorder(
  borderType: VSBorderType.circle,
  color: AppColors.successDefault,
  strokeWidth: 3,
  dashPattern: [4, 4],
  padding: EdgeInsets.all(8),
  child: Container(
    width: 80,
    height: 80,
    decoration: BoxDecoration(
      color: AppColors.successBg,
      shape: BoxShape.circle,
    ),
    child: Icon(Icons.check, color: AppColors.successDefault),
  ),
)
```

### Oval Border
Elliptical border for oval-shaped content.

```dart
VSDottedBorder(
  borderType: VSBorderType.oval,
  color: AppColors.warningDefault,
  strokeWidth: 2,
  dashPattern: [10, 5],
  padding: EdgeInsets.all(12),
  child: Container(
    width: 160,
    height: 100,
    decoration: BoxDecoration(
      color: AppColors.warningBg,
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(80),
        right: Radius.circular(80),
      ),
    ),
    child: Center(child: Text('Oval')),
  ),
)
```

## Dash Patterns

### Common Dash Patterns
Different dash and gap combinations for various visual effects.

```dart
Column(
  children: [
    // Solid line (no gaps)
    VSDottedBorder(
      borderType: VSBorderType.rRect,
      color: AppColors.primaryDefault,
      strokeWidth: 2,
      dashPattern: [10, 0],
      radius: const Radius.circular(8),
      padding: EdgeInsets.all(8),
      child: Container(
        width: 100,
        height: 50,
        color: AppColors.neutral100,
        child: Center(child: Text('Solid')),
      ),
    ),
    SizedBox(height: 16),
    // Dashed line
    VSDottedBorder(
      borderType: VSBorderType.rRect,
      color: AppColors.secondaryDefault,
      strokeWidth: 2,
      dashPattern: [6, 6],
      radius: const Radius.circular(8),
      padding: EdgeInsets.all(8),
      child: Container(
        width: 100,
        height: 50,
        color: AppColors.neutral100,
        child: Center(child: Text('Dashed')),
      ),
    ),
    SizedBox(height: 16),
    // Dotted line
    VSDottedBorder(
      borderType: VSBorderType.rRect,
      color: AppColors.successDefault,
      strokeWidth: 2,
      dashPattern: [2, 4],
      radius: const Radius.circular(8),
      padding: EdgeInsets.all(8),
      child: Container(
        width: 100,
        height: 50,
        color: AppColors.neutral100,
        child: Center(child: Text('Dotted')),
      ),
    ),
    SizedBox(height: 16),
    // Mixed pattern
    VSDottedBorder(
      borderType: VSBorderType.rRect,
      color: AppColors.warningDefault,
      strokeWidth: 2,
      dashPattern: [8, 3, 2, 3],
      radius: const Radius.circular(8),
      padding: EdgeInsets.all(8),
      child: Container(
        width: 100,
        height: 50,
        color: AppColors.neutral100,
        child: Center(child: Text('Mixed')),
      ),
    ),
  ],
)
```

## Stroke Width Variations

Different border thickness options.

```dart
Row(
  children: [
    // Thin border
    VSDottedBorder(
      borderType: VSBorderType.circle,
      color: AppColors.primaryDefault,
      strokeWidth: 1,
      dashPattern: [4, 4],
      padding: EdgeInsets.all(8),
      child: Container(
        width: 60,
        height: 60,
        color: AppColors.neutral100,
        child: Center(child: Text('1px')),
      ),
    ),
    SizedBox(width: 16),
    // Medium border
    VSDottedBorder(
      borderType: VSBorderType.circle,
      color: AppColors.secondaryDefault,
      strokeWidth: 2,
      dashPattern: [4, 4],
      padding: EdgeInsets.all(8),
      child: Container(
        width: 60,
        height: 60,
        color: AppColors.neutral100,
        child: Center(child: Text('2px')),
      ),
    ),
    SizedBox(width: 16),
    // Thick border
    VSDottedBorder(
      borderType: VSBorderType.circle,
      color: AppColors.successDefault,
      strokeWidth: 4,
      dashPattern: [4, 4],
      padding: EdgeInsets.all(8),
      child: Container(
        width: 60,
        height: 60,
        color: AppColors.neutral100,
        child: Center(child: Text('4px')),
      ),
    ),
  ],
)
```

## Color and Gradient Support

### Solid Colors
Using design system color tokens.

```dart
Row(
  children: [
    VSDottedBorder(
      borderType: VSBorderType.rRect,
      color: AppColors.primaryDefault,
      strokeWidth: 3,
      dashPattern: [6, 6],
      radius: const Radius.circular(8),
      padding: EdgeInsets.all(12),
      child: Container(
        width: 80,
        height: 60,
        color: AppColors.primaryBg,
        child: Center(child: Text('Primary')),
      ),
    ),
    SizedBox(width: 16),
    VSDottedBorder(
      borderType: VSBorderType.rRect,
      color: AppColors.dangerDefault,
      strokeWidth: 3,
      dashPattern: [6, 6],
      radius: const Radius.circular(8),
      padding: EdgeInsets.all(12),
      child: Container(
        width: 80,
        height: 60,
        color: AppColors.dangerBg,
        child: Center(child: Text('Danger')),
      ),
    ),
  ],
)
```

### Gradient Borders
Linear gradients for more visual appeal.

```dart
VSDottedBorder(
  borderType: VSBorderType.rRect,
  gradient: LinearGradient(
    colors: [AppColors.primaryDefault, AppColors.secondaryDefault],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  strokeWidth: 3,
  dashPattern: [8, 4],
  radius: const Radius.circular(12),
  padding: EdgeInsets.all(16),
  child: Container(
    width: 150,
    height: 100,
    color: AppColors.neutral100,
    child: Center(
      child: Text(
        'Gradient Border',
        style: AppTypography.bodyMediumSemibold,
      ),
    ),
  ),
)
```

## Animation Support

### Animated Borders
Borders that animate continuously.

```dart
VSDottedBorder(
  borderType: VSBorderType.circle,
  color: AppColors.primaryDefault,
  strokeWidth: 4,
  dashPattern: [12, 8],
  padding: EdgeInsets.all(16),
  animated: true,
  animationDuration: const Duration(seconds: 3),
  child: Container(
    width: 120,
    height: 120,
    decoration: BoxDecoration(
      color: AppColors.primaryBg,
      shape: BoxShape.circle,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.animation, color: AppColors.primaryDefault, size: 32),
        SizedBox(height: 8),
        Text(
          'Animated',
          style: AppTypography.bodySmallSemibold.copyWith(
            color: AppColors.primaryDefault,
          ),
        ),
      ],
    ),
  ),
)
```

### Animation Toggle
Controlling animation state dynamically.

```dart
class AnimatedBorderExample extends StatefulWidget {
  @override
  _AnimatedBorderExampleState createState() => _AnimatedBorderExampleState();
}

class _AnimatedBorderExampleState extends State<AnimatedBorderExample> {
  bool _isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSToggle(
          value: _isAnimated,
          onChanged: (value) => setState(() => _isAnimated = value),
          label: 'Enable Animation',
        ),
        SizedBox(height: 16),
        VSDottedBorder(
          borderType: VSBorderType.rRect,
          color: AppColors.warningDefault,
          strokeWidth: 2,
          dashPattern: [8, 4],
          radius: const Radius.circular(12),
          padding: EdgeInsets.all(16),
          animated: _isAnimated,
          animationDuration: const Duration(seconds: 2),
          child: Container(
            width: 200,
            height: 100,
            color: AppColors.warningBg,
            child: Center(
              child: Text(
                _isAnimated ? 'Animated Border' : 'Static Border',
                style: AppTypography.bodyMediumRegular.copyWith(
                  color: AppColors.warningDefault,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
```

## Real-world Usage Examples

### File Upload Area
Interactive upload zone with visual feedback.

```dart
class FileUploadArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Upload Files', style: AppTypography.bodyMediumSemibold),
          SizedBox(height: 12),
          VSDottedBorder(
            borderType: VSBorderType.rRect,
            color: AppColors.primaryDefault,
            strokeWidth: 2,
            dashPattern: [8, 8],
            radius: const Radius.circular(8),
            padding: EdgeInsets.all(24),
            child: Container(
              width: double.infinity,
              height: 120,
              color: AppColors.primaryBg.withValues(alpha: 0.3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_upload,
                    color: AppColors.primaryDefault,
                    size: 32,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Drop files here or click to upload',
                    style: AppTypography.bodyMediumRegular.copyWith(
                      color: AppColors.primaryDefault,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Supported formats: PDF, DOC, JPG, PNG',
                    style: AppTypography.bodySmallRegular.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

### Profile Picture Upload
Circular upload area for profile images.

```dart
class ProfilePictureUpload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Profile Picture', style: AppTypography.bodyMediumSemibold),
          SizedBox(height: 12),
          Row(
            children: [
              VSDottedBorder(
                borderType: VSBorderType.circle,
                color: AppColors.secondaryDefault,
                strokeWidth: 3,
                dashPattern: [6, 6],
                padding: EdgeInsets.all(8),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryBg.withValues(alpha: 0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person_add,
                    color: AppColors.secondaryDefault,
                    size: 32,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Profile Picture',
                      style: AppTypography.bodyMediumSemibold,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Upload a photo to personalize your profile',
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 12),
                    VSButton(
                      label: 'Choose File',
                      onPressed: () => _pickImage(),
                      size: VSButtonSize.small,
                      variant: VSButtonVariant.outlined,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _pickImage() {
    // Implement image picker
  }
}
```

### Payment Method Selection
Visual selection of payment options.

```dart
class PaymentMethodSelection extends StatefulWidget {
  @override
  _PaymentMethodSelectionState createState() => _PaymentMethodSelectionState();
}

class _PaymentMethodSelectionState extends State<PaymentMethodSelection> {
  String _selectedMethod = 'credit_card';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Payment Method', style: AppTypography.bodyMediumSemibold),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selectedMethod = 'credit_card'),
                  child: VSDottedBorder(
                    borderType: VSBorderType.rRect,
                    color: _selectedMethod == 'credit_card'
                        ? AppColors.successDefault
                        : AppColors.neutral400,
                    strokeWidth: 2,
                    dashPattern: [4, 4],
                    radius: const Radius.circular(8),
                    padding: EdgeInsets.all(16),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: _selectedMethod == 'credit_card'
                            ? AppColors.successBg.withValues(alpha: 0.2)
                            : AppColors.neutral100,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.credit_card,
                            color: _selectedMethod == 'credit_card'
                                ? AppColors.successDefault
                                : AppColors.neutral500,
                            size: 24,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Credit Card',
                            style: AppTypography.bodySmallSemibold.copyWith(
                              color: _selectedMethod == 'credit_card'
                                  ? AppColors.successDefault
                                  : AppColors.neutral500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selectedMethod = 'bank_transfer'),
                  child: VSDottedBorder(
                    borderType: VSBorderType.rRect,
                    color: _selectedMethod == 'bank_transfer'
                        ? AppColors.successDefault
                        : AppColors.neutral400,
                    strokeWidth: 2,
                    dashPattern: [4, 4],
                    radius: const Radius.circular(8),
                    padding: EdgeInsets.all(16),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: _selectedMethod == 'bank_transfer'
                            ? AppColors.successBg.withValues(alpha: 0.2)
                            : AppColors.neutral100,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_balance,
                            color: _selectedMethod == 'bank_transfer'
                                ? AppColors.successDefault
                                : AppColors.neutral500,
                            size: 24,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Bank Transfer',
                            style: AppTypography.bodySmallRegular.copyWith(
                              color: _selectedMethod == 'bank_transfer'
                                  ? AppColors.successDefault
                                  : AppColors.neutral500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

### Form Section Divider
Visual separation between form sections.

```dart
class FormWithSections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.neutral0,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Personal Information', style: AppTypography.bodyMediumSemibold),
          SizedBox(height: 12),
          // Form fields for personal info
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.neutral100,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                'Full Name Field',
                style: AppTypography.bodySmallRegular.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          // Section divider
          VSDottedBorder(
            borderType: VSBorderType.rect,
            color: AppColors.neutral300,
            strokeWidth: 1,
            dashPattern: [2, 2],
            padding: EdgeInsets.zero,
            child: Container(height: 1),
          ),
          SizedBox(height: 16),
          Text('Contact Details', style: AppTypography.bodyMediumSemibold),
          SizedBox(height: 12),
          // Form fields for contact info
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.neutral100,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                'Email Field',
                style: AppTypography.bodySmallRegular.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

## Advanced Usage

### Custom Path Border
Using custom paths for complex border shapes.

```dart
class CustomPathBorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VSDottedBorder(
      customPath: (size) => Path()
        ..moveTo(0, size.height * 0.5)
        ..lineTo(size.width * 0.3, 0)
        ..lineTo(size.width * 0.7, 0)
        ..lineTo(size.width, size.height * 0.5)
        ..lineTo(size.width * 0.7, size.height)
        ..lineTo(size.width * 0.3, size.height)
        ..close(),
      color: AppColors.primaryDefault,
      strokeWidth: 2,
      dashPattern: [6, 6],
      padding: EdgeInsets.all(8),
      child: Container(
        width: 150,
        height: 100,
        color: AppColors.neutral100,
        child: Center(child: Text('Custom Path')),
      ),
    );
  }
}
```

### Interactive Border States
Borders that change based on interaction state.

```dart
class InteractiveBorder extends StatefulWidget {
  @override
  _InteractiveBorderState createState() => _InteractiveBorderState();
}

class _InteractiveBorderState extends State<InteractiveBorder> {
  bool _isHovered = false;
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isSelected = !_isSelected),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: VSDottedBorder(
          borderType: VSBorderType.rRect,
          color: _isSelected
              ? AppColors.successDefault
              : _isHovered
                  ? AppColors.primaryDefault
                  : AppColors.neutral400,
          strokeWidth: _isSelected ? 3 : 2,
          dashPattern: _isSelected ? [8, 4] : [4, 4],
          radius: const Radius.circular(8),
          padding: EdgeInsets.all(16),
          animated: _isHovered && !_isSelected,
          animationDuration: const Duration(milliseconds: 500),
          child: Container(
            width: 120,
            height: 80,
            color: _isSelected
                ? AppColors.successBg.withValues(alpha: 0.2)
                : _isHovered
                    ? AppColors.primaryBg.withValues(alpha: 0.1)
                    : AppColors.neutral100,
            child: Center(
              child: Text(
                _isSelected ? 'Selected' : 'Tap to Select',
                style: AppTypography.bodySmallRegular.copyWith(
                  color: _isSelected
                      ? AppColors.successDefault
                      : _isHovered
                          ? AppColors.primaryDefault
                          : AppColors.textSecondary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

## Accessibility

The VS Dotted Border component includes comprehensive accessibility features:
- Proper semantic structure for screen readers
- Focus management for interactive content
- ARIA labels and descriptions
- Keyboard navigation support
- Color contrast compliance

## Design Guidelines

- Use dotted borders for upload areas and interactive zones
- Choose appropriate dash patterns for different contexts
- Consider animation for loading states and user feedback
- Ensure sufficient contrast between border and background
- Use consistent border widths throughout the application
- Test on different screen densities and zoom levels
- Provide clear visual hierarchy with border styling

## Related Components

- **VS Button**: For primary actions and triggers
- **VS Input Field**: For form inputs with border styling
- **VS Card**: For content containers that may use dotted borders
- **VS Badge**: For status indicators that complement borders</content>
<parameter name="filePath">c:\vs_design_system\lib\markdown2\VS_DOTTED_BORDER_IMPLEMENTATION.md