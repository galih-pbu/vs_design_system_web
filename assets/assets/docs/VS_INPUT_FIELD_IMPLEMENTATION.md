# VS Input Field

The VS Input Field component provides comprehensive text input functionality with validation, formatting, and multiple input types.

## Overview

The `VSInputField` widget is a versatile text input component that supports various input types, validation, formatting, and accessibility features.

## Features

- **Multiple Input Types**: Text, email, password, number, phone, URL, and search
- **Validation Support**: Built-in and custom validation with error messages
- **Formatting Options**: Currency, percentage, and custom formatters
- **Icon Support**: Left and right icons for enhanced UX
- **Size Variants**: Small, medium, and large sizes
- **State Management**: Enabled, disabled, readonly, and loading states
- **Accessibility**: Screen reader support and keyboard navigation
- **Masking**: Input masking for phone numbers, credit cards, etc.

## Basic Usage

```dart
VSInputField(
  label: 'Full Name',
  hintText: 'Enter your full name',
  onChanged: (value) {
    // Handle input changes
  },
)
```

## Input Types

### Text Input (Default)
Standard text input for general use.

```dart
VSInputField(
  label: 'Description',
  hintText: 'Enter a description',
  type: VSInputFieldType.text,
)
```

### Email Input
Input with email validation and keyboard optimization.

```dart
VSInputField(
  label: 'Email Address',
  hintText: 'Enter your email',
  type: VSInputFieldType.email,
  validator: (value) {
    if (value?.isEmpty ?? true) return 'Email is required';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value!)) return 'Invalid email format';
    return null;
  },
)
```

### Password Input
Secure password input with visibility toggle.

```dart
VSInputField(
  label: 'Password',
  hintText: 'Enter your password',
  type: VSInputFieldType.password,
  obscureText: true,
)
```

### Number Input
Numeric input with validation.

```dart
VSInputField(
  label: 'Age',
  hintText: 'Enter your age',
  type: VSInputFieldType.number,
  keyboardType: TextInputType.number,
)
```

### Phone Input
Phone number input with formatting.

```dart
VSInputField(
  label: 'Phone Number',
  hintText: 'Enter your phone number',
  type: VSInputFieldType.phone,
  inputFormatters: [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(15),
  ],
)
```

### URL Input
URL input with validation.

```dart
VSInputField(
  label: 'Website',
  hintText: 'Enter website URL',
  type: VSInputFieldType.url,
)
```

### Search Input
Search input with search icon.

```dart
VSInputField(
  label: 'Search',
  hintText: 'Search for items...',
  type: VSInputFieldType.search,
  leftIcon: Icon(Icons.search),
)
```

## Sizes

### Small
Compact input for tight spaces.

```dart
VSInputField(
  label: 'Code',
  hintText: 'Enter code',
  size: VSInputFieldSize.small,
)
```

### Medium (Default)
Standard input size.

```dart
VSInputField(
  label: 'Name',
  hintText: 'Enter name',
  size: VSInputFieldSize.medium,
)
```

### Large
Prominent input for important fields.

```dart
VSInputField(
  label: 'Title',
  hintText: 'Enter title',
  size: VSInputFieldSize.large,
)
```

## With Icons

### Left Icon
Icon positioned at the start of the input.

```dart
VSInputField(
  label: 'Search',
  hintText: 'Search...',
  leftIcon: Icon(Icons.search),
)
```

### Right Icon
Icon positioned at the end of the input.

```dart
VSInputField(
  label: 'Password',
  hintText: 'Enter password',
  rightIcon: Icon(Icons.visibility_off),
  type: VSInputFieldType.password,
)
```

## Validation

### Required Field Validation
```dart
VSInputField(
  label: 'Full Name',
  hintText: 'Enter your full name',
  validator: (value) {
    if (value?.isEmpty ?? true) {
      return 'Full name is required';
    }
    if (value!.length < 2) {
      return 'Full name must be at least 2 characters';
    }
    return null;
  },
)
```

### Email Validation
```dart
VSInputField(
  label: 'Email',
  hintText: 'Enter email address',
  type: VSInputFieldType.email,
  validator: (value) {
    if (value?.isEmpty ?? true) return 'Email is required';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value!)) return 'Invalid email format';
    return null;
  },
)
```

### Custom Validation
```dart
VSInputField(
  label: 'Age',
  hintText: 'Enter age',
  type: VSInputFieldType.number,
  validator: (value) {
    if (value?.isEmpty ?? true) return 'Age is required';
    final age = int.tryParse(value!);
    if (age == null) return 'Please enter a valid number';
    if (age < 0 || age > 150) return 'Age must be between 0 and 150';
    return null;
  },
)
```

## Formatting

### Currency Input
```dart
VSInputField(
  label: 'Price',
  hintText: 'Enter price',
  type: VSInputFieldType.number,
  inputFormatters: [
    CurrencyTextInputFormatter.currency(
      locale: 'en_US',
      decimalDigits: 2,
      symbol: '\$',
    ),
  ],
)
```

### Percentage Input
```dart
VSInputField(
  label: 'Discount',
  hintText: 'Enter discount percentage',
  type: VSInputFieldType.number,
  suffixText: '%',
  inputFormatters: [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(3),
  ],
)
```

### Phone Number Formatting
```dart
VSInputField(
  label: 'Phone',
  hintText: '(555) 123-4567',
  type: VSInputFieldType.phone,
  inputFormatters: [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(10),
    PhoneNumberTextInputFormatter(),
  ],
)
```

## States

### Disabled State
```dart
VSInputField(
  label: 'Disabled Field',
  hintText: 'This field is disabled',
  enabled: false,
)
```

### Readonly State
```dart
VSInputField(
  label: 'Readonly Field',
  hintText: 'This field is readonly',
  readOnly: true,
)
```

### Loading State
```dart
VSInputField(
  label: 'Loading Field',
  hintText: 'Loading...',
  isLoading: true,
)
```

## Form Integration

### Complete Form Example
```dart
class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          VSInputField(
            controller: _nameController,
            label: 'Full Name',
            hintText: 'Enter your full name',
            validator: (value) {
              if (value?.isEmpty ?? true) return 'Name is required';
              return null;
            },
          ),
          SizedBox(height: 16),
          VSInputField(
            controller: _emailController,
            label: 'Email',
            hintText: 'Enter your email',
            type: VSInputFieldType.email,
            validator: (value) {
              if (value?.isEmpty ?? true) return 'Email is required';
              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(value!)) return 'Invalid email';
              return null;
            },
          ),
          SizedBox(height: 16),
          VSInputField(
            controller: _phoneController,
            label: 'Phone (Optional)',
            hintText: 'Enter your phone number',
            type: VSInputFieldType.phone,
          ),
          SizedBox(height: 24),
          VSButton(
            label: 'Submit',
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // Process form data
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
```

## Advanced Features

### Custom Input Formatters
```dart
VSInputField(
  label: 'Credit Card',
  hintText: '1234 5678 9012 3456',
  inputFormatters: [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(16),
    CreditCardNumberInputFormatter(),
  ],
)
```

### Autocomplete
```dart
VSInputField(
  label: 'Country',
  hintText: 'Select your country',
  suggestions: [
    'United States',
    'United Kingdom',
    'Canada',
    'Australia',
    'Germany',
    'France',
  ],
)
```

## Accessibility

The VS Input Field component includes comprehensive accessibility features:
- Proper labels and hints for screen readers
- Error announcements for validation messages
- Keyboard navigation support
- Focus management and indicators
- ARIA attributes for web platforms

## Design Guidelines

- Use appropriate input types for better UX
- Provide clear, descriptive labels
- Include helpful hint text
- Show validation errors clearly
- Consider mobile keyboard types
- Group related fields logically

## Related Components

- **VS Text Area**: Multi-line text input
- **VS Select/Dropdown**: Selection from predefined options
- **VS Checkbox/Radio**: Boolean and multiple choice inputs
- **VS Date Picker**: Date and time selection</content>
<parameter name="filePath">c:\vs_design_system\lib\markdown2\VS_INPUT_FIELD_IMPLEMENTATION.md