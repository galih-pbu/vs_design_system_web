# VS Checkbox

The VS Checkbox component provides interactive checkboxes for boolean selection with multiple sizes, states, and customization options.

## Overview

The `VSCheckbox` widget allows users to make binary choices with a familiar checkbox interface, supporting various sizes and interactive states.

## Features

- **Multiple Sizes**: Small, medium, and large checkbox sizes
- **Tri-state Support**: Checked, unchecked, and indeterminate states
- **Custom Labels**: Text labels and descriptions
- **Validation**: Built-in validation and error states
- **Accessibility**: Screen reader support and keyboard navigation
- **Custom Styling**: Customizable colors and appearance
- **Form Integration**: Seamless integration with form systems

## Basic Usage

```dart
VSCheckbox(
  value: _isChecked,
  onChanged: (value) => setState(() => _isChecked = value ?? false),
)
```

## States

### Checked State
Checkbox is selected.

```dart
VSCheckbox(
  value: true,
  onChanged: (value) => print('Checked: $value'),
)
```

### Unchecked State
Checkbox is not selected.

```dart
VSCheckbox(
  value: false,
  onChanged: (value) => print('Unchecked: $value'),
)
```

### Indeterminate State
Checkbox is in an indeterminate state (useful for partial selections).

```dart
VSCheckbox(
  value: null, // null represents indeterminate state
  tristate: true,
  onChanged: (value) => print('Indeterminate: $value'),
)
```

## Sizes

### Small
Compact checkbox for tight spaces.

```dart
VSCheckbox(
  value: _checked,
  size: VSCheckboxSize.small,
  onChanged: (value) => setState(() => _checked = value ?? false),
)
```

### Medium (Default)
Standard checkbox size.

```dart
VSCheckbox(
  value: _checked,
  size: VSCheckboxSize.medium,
  onChanged: (value) => setState(() => _checked = value ?? false),
)
```

### Large
Prominent checkbox for important selections.

```dart
VSCheckbox(
  value: _checked,
  size: VSCheckboxSize.large,
  onChanged: (value) => setState(() => _checked = value ?? false),
)
```

## With Labels

### Simple Label
Checkbox with text label.

```dart
VSCheckbox(
  value: _agree,
  label: 'I agree to the terms and conditions',
  onChanged: (value) => setState(() => _agree = value ?? false),
)
```

### Label with Description
Checkbox with label and additional description.

```dart
VSCheckbox(
  value: _subscribe,
  label: 'Subscribe to newsletter',
  description: 'Receive weekly updates about new features and tips',
  onChanged: (value) => setState(() => _subscribe = value ?? false),
)
```

### Required Checkbox
Checkbox marked as required.

```dart
VSCheckbox(
  value: _accept,
  label: 'Accept privacy policy',
  required: true,
  onChanged: (value) => setState(() => _accept = value ?? false),
)
```

## Validation

### Error State
Checkbox with validation error.

```dart
VSCheckbox(
  value: _agreed,
  label: 'I agree to the terms',
  errorText: 'You must agree to continue',
  hasError: true,
  onChanged: (value) => setState(() => _agreed = value ?? false),
)
```

### Custom Validation
```dart
class TermsAgreement extends StatefulWidget {
  @override
  _TermsAgreementState createState() => _TermsAgreementState();
}

class _TermsAgreementState extends State<TermsAgreement> {
  bool _agreed = false;
  String? _errorText;

  void _validateAgreement(bool? value) {
    setState(() {
      _agreed = value ?? false;
      _errorText = _agreed ? null : 'You must agree to the terms to continue';
    });
  }

  @override
  Widget build(BuildContext context) {
    return VSCheckbox(
      value: _agreed,
      label: 'I agree to the Terms of Service and Privacy Policy',
      description: 'By checking this box, you agree to our terms and conditions.',
      errorText: _errorText,
      hasError: _errorText != null,
      onChanged: _validateAgreement,
    );
  }
}
```

## Form Integration

### Complete Form Example
```dart
class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  bool _agreeToTerms = false;
  bool _subscribeNewsletter = false;
  bool _receiveNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VSInputField(
            label: 'Full Name',
            hintText: 'Enter your full name',
            validator: (value) {
              if (value?.isEmpty ?? true) return 'Name is required';
              return null;
            },
          ),
          SizedBox(height: 16),
          VSInputField(
            label: 'Email',
            hintText: 'Enter your email',
            type: VSInputFieldType.email,
          ),
          SizedBox(height: 24),
          VSCheckbox(
            value: _agreeToTerms,
            label: 'I agree to the Terms of Service',
            required: true,
            errorText: _agreeToTerms ? null : 'You must agree to continue',
            hasError: !_agreeToTerms,
            onChanged: (value) => setState(() => _agreeToTerms = value ?? false),
          ),
          SizedBox(height: 16),
          VSCheckbox(
            value: _subscribeNewsletter,
            label: 'Subscribe to newsletter',
            description: 'Receive weekly updates and tips',
            onChanged: (value) => setState(() => _subscribeNewsletter = value ?? false),
          ),
          SizedBox(height: 16),
          VSCheckbox(
            value: _receiveNotifications,
            label: 'Receive push notifications',
            description: 'Get notified about important updates',
            onChanged: (value) => setState(() => _receiveNotifications = value ?? false),
          ),
          SizedBox(height: 24),
          VSButton(
            label: 'Register',
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                if (_agreeToTerms) {
                  // Process registration
                  print('Registration successful');
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
```

## Multi-Select Lists

### Simple Multi-Select
```dart
class MultiSelectOptions extends StatefulWidget {
  @override
  _MultiSelectOptionsState createState() => _MultiSelectOptionsState();
}

class _MultiSelectOptionsState extends State<MultiSelectOptions> {
  final Map<String, bool> _options = {
    'Email notifications': false,
    'SMS notifications': true,
    'Push notifications': false,
    'Weekly digest': true,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Notification Preferences', style: AppTypography.h4),
        SizedBox(height: 16),
        ..._options.entries.map((entry) => VSCheckbox(
          value: entry.value,
          label: entry.key,
          onChanged: (value) => setState(() => _options[entry.key] = value ?? false),
        )),
      ],
    );
  }
}
```

### Select All Functionality
```dart
class SelectableList extends StatefulWidget {
  @override
  _SelectableListState createState() => _SelectableListState();
}

class _SelectableListState extends State<SelectableList> {
  bool _selectAll = false;
  final List<bool> _items = List.generate(5, (index) => false);

  void _onSelectAllChanged(bool? value) {
    setState(() {
      _selectAll = value ?? false;
      for (int i = 0; i < _items.length; i++) {
        _items[i] = _selectAll;
      }
    });
  }

  void _onItemChanged(int index, bool? value) {
    setState(() {
      _items[index] = value ?? false;
      _selectAll = _items.every((item) => item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSCheckbox(
          value: _selectAll,
          label: 'Select All',
          onChanged: _onSelectAllChanged,
        ),
        Divider(),
        ...List.generate(_items.length, (index) => VSCheckbox(
          value: _items[index],
          label: 'Item ${index + 1}',
          onChanged: (value) => _onItemChanged(index, value),
        )),
      ],
    );
  }
}
```

## Advanced Features

### Custom Styling
Override default colors and styling.

```dart
VSCheckbox(
  value: _checked,
  label: 'Custom styled checkbox',
  activeColor: Colors.purple,
  checkColor: Colors.white,
  onChanged: (value) => setState(() => _checked = value ?? false),
)
```

### Disabled State
Checkbox that cannot be interacted with.

```dart
VSCheckbox(
  value: true,
  label: 'Disabled checked',
  enabled: false,
  onChanged: null,
)
```

## Accessibility

The VS Checkbox component includes comprehensive accessibility features:
- Screen reader support for labels and states
- Keyboard navigation (Space to toggle)
- Focus indicators and management
- ARIA attributes for web platforms
- High contrast support

## Design Guidelines

- Use checkboxes for binary choices or multi-select scenarios
- Provide clear, descriptive labels
- Group related checkboxes logically
- Consider using toggle switches for binary settings
- Show validation errors clearly and helpfully
- Test with keyboard-only navigation

## Related Components

- **VS Radio Button**: Single selection from multiple options
- **VS Toggle**: Binary on/off switch
- **VS Select/Dropdown**: Single selection from many options
- **VS Chip**: Multi-select tags</content>
<parameter name="filePath">c:\vs_design_system\lib\markdown2\VS_CHECKBOX_IMPLEMENTATION.md