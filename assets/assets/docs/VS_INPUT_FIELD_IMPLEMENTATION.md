# VS Input Field

**Version 1.0.1 - December 14, 2025**

The VS Input Field component provides comprehensive text input functionality with validation, formatting, and multiple input types.

## Overview

The VS Input Field component provides comprehensive text input functionality with validation, formatting, and multiple input types. The component includes a helper class `InputFieldHelper` for parsing and formatting various data types including currency, phone numbers, dates, and percentages.

## Features

- **Multiple Input Types**: Text, textarea, email, password, number, phone, URL, search, and specialized types like currency, percent, date/time
- **Built-in Formatting**: Automatic formatting for currency, phone numbers, percentages, and dates
- **Validation Support**: Built-in and custom validation with error messages
- **Helper Utilities**: `InputFieldHelper` class for data parsing and formatting
- **Icon Support**: Leading, trailing, and suffix icons/widgets
- **Label Control**: Show/hide labels and optional indicators
- **Custom Styling**: Height, padding, colors, text alignment, and backgrounds
- **Enhanced UX**: Autofocus, suffix text, min/max lines, and zero value handling
- **State Management**: Enabled, disabled, readonly, and loading states
- **Accessibility**: Screen reader support and keyboard navigation

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

### Textarea
Multi-line text input.

```dart
VSInputField(
  label: 'Description',
  hintText: 'Enter detailed description',
  type: VSInputFieldType.textarea,
  maxLines: 5,
)
```

### Rich Text
Rich text input with formatting capabilities.

```dart
VSInputField(
  label: 'Content',
  hintText: 'Enter rich text content',
  type: VSInputFieldType.richText,
)
```

### Number Input
Numeric input with validation.

```dart
VSInputField(
  label: 'Age',
  hintText: 'Enter your age',
  type: VSInputFieldType.number,
)
```

### Integer Input
Whole number input.

```dart
VSInputField(
  label: 'Quantity',
  hintText: 'Enter quantity',
  type: VSInputFieldType.integer,
)
```

### Decimal Input
Decimal number input.

```dart
VSInputField(
  label: 'Price',
  hintText: 'Enter price',
  type: VSInputFieldType.decimal,
)
```

### Percent Input
Percentage input with validation.

```dart
VSInputField(
  label: 'Discount',
  hintText: 'Enter discount percentage',
  type: VSInputFieldType.percent,
)
```

### Auto Number
Automatically generated number input.

```dart
VSInputField(
  label: 'ID',
  hintText: 'Auto-generated ID',
  type: VSInputFieldType.autoNumber,
)
```

### Currency Input
Currency input with formatting.

```dart
VSInputField(
  label: 'Amount',
  hintText: 'Enter amount',
  type: VSInputFieldType.currency,
  currencySymbol: 'Rp',
)
```

### Date Input
Date input with picker.

```dart
VSInputField(
  label: 'Birth Date',
  hintText: 'Select birth date',
  type: VSInputFieldType.date,
  dateFormat: 'MM/dd/yyyy',
)
```

### DateTime Input
Date and time input.

```dart
VSInputField(
  label: 'Appointment',
  hintText: 'Select date and time',
  type: VSInputFieldType.dateTime,
)
```

### Time Input
Time input.

```dart
VSInputField(
  label: 'Meeting Time',
  hintText: 'Select time',
  type: VSInputFieldType.time,
)
```

### Date Range Input
Date range selection.

```dart
VSInputField(
  label: 'Date Range',
  hintText: 'Select date range',
  type: VSInputFieldType.dateRange,
  onDateRangeChanged: (range) {
    print('Selected range: $range');
  },
)
```

### Email Input
Input with email validation and keyboard optimization.

```dart
VSInputField(
  label: 'Email Address',
  hintText: 'Enter your email',
  type: VSInputFieldType.email,
  validatorFunction: (value) {
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

### Phone Input
Phone number input with formatting.

```dart
VSInputField(
  label: 'Phone Number',
  hintText: 'Enter your phone number',
  type: VSInputFieldType.phone,
  showCountryFlag: true,
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
  leading: Icon(Icons.search),
)

## With Icons

### Leading Icon
Icon positioned at the start of the input.

```dart
VSInputField(
  label: 'Search',
  hintText: 'Search...',
  leading: Icon(Icons.search),
)
```

### Trailing Icon
Icon positioned at the end of the input.

```dart
VSInputField(
  label: 'Password',
  hintText: 'Enter password',
  trailing: Icon(Icons.visibility_off),
  type: VSInputFieldType.password,
)
```

### Suffix Icon
Additional icon at the end of the input.

```dart
VSInputField(
  label: 'Email',
  hintText: 'Enter email',
  suffixIcon: Icon(Icons.email),
  type: VSInputFieldType.email,
)
```

## Validation

### Required Field Validation
```dart
VSInputField(
  label: 'Full Name',
  hintText: 'Enter your full name',
  validatorFunction: (value) {
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
  validatorFunction: (value) {
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
  validatorFunction: (value) {
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
Built-in currency formatting with symbol support.

```dart
VSInputField(
  label: 'Price',
  hintText: 'Enter price',
  type: VSInputFieldType.currency,
  currencySymbol: '\$',
)
```

### Percentage Input
Percentage input with validation (0-100 range).

```dart
VSInputField(
  label: 'Discount',
  hintText: 'Enter discount percentage',
  type: VSInputFieldType.percent,
)
```

### Phone Number Formatting
Automatic phone number formatting for supported countries.

```dart
VSInputField(
  label: 'Phone',
  hintText: 'Enter phone number',
  type: VSInputFieldType.phone,
  showCountryFlag: true, // Show country flag
)
```

### Date Formatting
Date input with customizable format.

```dart
VSInputField(
  label: 'Birth Date',
  hintText: 'MM/DD/YYYY',
  type: VSInputFieldType.date,
  dateFormat: 'MM/dd/yyyy',
)
```

## States

### Disabled State
```dart
VSInputField(
  label: 'Disabled Field',
  hintText: 'This field is disabled',
  isEnabled: false,
)
```

### Readonly State
```dart
VSInputField(
  label: 'Readonly Field',
  hintText: 'This field is readonly',
  isReadOnly: true,
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

## Enhanced Features

### Label Control
Control label visibility and optional indicators.

```dart
// Hide label but keep accessibility
VSInputField(
  label: 'Hidden Label Field',
  hintText: 'Label is hidden',
  showLabel: false,
)

// Optional field indicator
VSInputField(
  label: 'Optional Field',
  hintText: 'This field is optional',
  isOptional: true,
)
```

### Autofocus
Automatically focus the field when it appears.

```dart
VSInputField(
  label: 'First Name',
  hintText: 'Auto-focused field',
  autofocus: true,
)
```

### Suffix Text and Icons
Add text or icons at the end of the input field.

```dart
// Suffix text
VSInputField(
  label: 'Weight',
  hintText: 'Enter weight',
  suffixText: 'kg',
)

// Suffix icon
VSInputField(
  label: 'Search',
  hintText: 'Search items...',
  suffixIcon: Icon(Icons.search, size: 16),
)
```

### Custom Styling
Customize appearance with height, padding, colors, and alignment.

```dart
VSInputField(
  label: 'Custom Styled Field',
  hintText: 'Custom styling',
  height: 48, // Custom height
  textAlign: TextAlign.center, // Center text
  fillColor: Colors.blue.shade50, // Background color
  padding: EdgeInsets.all(16), // External padding
  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Internal padding
)
```

### Textarea with Min Lines
Multi-line text input with minimum line constraints.

```dart
VSInputField(
  label: 'Description',
  hintText: 'Enter detailed description',
  type: VSInputFieldType.textarea,
  minLines: 3, // Minimum 3 lines
  maxLines: 10, // Maximum 10 lines
)
```

### Zero Value Handling
Control whether zero values are allowed in numeric fields.

```dart
VSInputField(
  label: 'Quantity',
  hintText: 'Enter quantity',
  type: VSInputFieldType.integer,
  allowZero: false, // Prevent zero values
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
            validatorFunction: (value) {
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
            validatorFunction: (value) {
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

## Configuration Options

### VSInputField Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String?` | `null` | Field label text |
| `showLabel` | `bool` | `true` | Whether to show the label |
| `hintText` | `String?` | `null` | Placeholder text |
| `placeholder` | `String?` | `null` | Alias for hintText |
| `errorText` | `String?` | `null` | Error message to display |
| `initialValue` | `String?` | `null` | Initial field value |
| `isRequired` | `bool` | `false` | Whether field is required |
| `isOptional` | `bool` | `false` | Show "(Optional)" text |
| `isEnabled` | `bool` | `true` | Whether field is enabled |
| `isReadOnly` | `bool` | `false` | Whether field is read-only |
| `obscureText` | `bool` | `false` | Whether to obscure text (password) |
| `autofocus` | `bool` | `false` | Auto-focus on field |
| `focusNode` | `FocusNode?` | `null` | Custom focus node |
| `denyEnter` | `bool` | `false` | Prevent enter key in single-line |
| `allowNegative` | `bool` | `false` | Allow negative numbers |
| `allowZero` | `bool` | `true` | Allow zero values |
| `leading` | `Widget?` | `null` | Icon/widget at start |
| `trailing` | `Widget?` | `null` | Icon/widget at end |
| `suffixIcon` | `Widget?` | `null` | Additional icon at end |
| `keyboardType` | `TextInputType?` | `null` | Keyboard type |
| `type` | `VSInputFieldType` | `VSInputFieldType.text` | Input field type |
| `showCountryFlag` | `bool` | `false` | Show country flag for phone |
| `showCountryFlagAndCode` | `bool` | `false` | Show flag and code for phone |
| `onChanged` | `ValueChanged<String>?` | `null` | Value change callback |
| `onFieldSubmitted` | `ValueChanged<String>?` | `null` | Submit callback |
| `onDateRangeChanged` | `ValueChanged<DateTimeRange>?` | `null` | Date range callback |
| `onEditingComplete` | `VoidCallback?` | `null` | Editing complete callback |
| `onClear` | `VoidCallback?` | `null` | Clear icon callback |
| `isLoading` | `bool` | `false` | Show loading indicator |
| `dropdownOptions` | `List<String>?` | `null` | Dropdown options |
| `onDropdownSelected` | `ValueChanged<String>?` | `null` | Dropdown selection callback |
| `isLoadingData` | `bool` | `false` | Show loading until data loaded |
| `isDataSelected` | `bool` | `false` | Track dropdown selection |
| `controller` | `TextEditingController?` | `null` | Text controller |
| `maxLength` | `int?` | `null` | Maximum character length |
| `maxLines` | `int?` | `null` | Maximum lines |
| `minLines` | `int?` | `null` | Minimum lines |
| `flex` | `int?` | `null` | Flex factor |
| `validatorFunction` | `Function(String value)?` | `null` | Validation function |
| `saveCallBack` | `Function(String newValue)?` | `null` | Save callback |
| `prefix` | `String?` | `null` | Text prefix |
| `suffix` | `String?` | `null` | Text suffix |
| `suffixText` | `String?` | `null` | Text at end of field |
| `allowedExtensions` | `List<String>?` | `null` | File upload extensions |
| `currencySymbol` | `String?` | `null` | Currency symbol |
| `dateFormat` | `String?` | `null` | Date format |
| `validationPattern` | `RegExp?` | `null` | Validation regex |
| `height` | `double?` | `null` | Custom field height |
| `padding` | `EdgeInsetsGeometry?` | `EdgeInsets.zero` | External padding |
| `contentPadding` | `EdgeInsetsGeometry?` | `null` | Internal padding |
| `textAlign` | `TextAlign?` | `null` | Text alignment |
| `fillColor` | `Color?` | `null` | Background fill color |
| `debounceDuration` | `Duration?` | `null` | Debounce duration |
| `triggerOnEnter` | `bool` | `false` | Trigger on Enter only |

## InputFieldHelper Utilities

The `InputFieldHelper` class provides static methods for parsing and formatting input data:

### Currency Helpers
```dart
// Parse formatted currency to double
double? amount = InputFieldHelper.parseCurrency('\$1,234.56'); // Returns: 1234.56

// Format double to currency string
String formatted = InputFieldHelper.formatCurrency(1234.56); // Returns: "1,234.56"

// Format with currency symbol
String withSymbol = InputFieldHelper.formatWithSymbol(1234.56, symbol: 'Rp'); // Returns: "Rp 1,234.56"
```

### Number Helpers
```dart
// Parse integer
int? integerValue = InputFieldHelper.parseInteger('123'); // Returns: 123

// Parse decimal
double? decimalValue = InputFieldHelper.parseDecimal('123.45'); // Returns: 123.45

// Parse percent (removes % symbol)
double? percentValue = InputFieldHelper.parsePercent('25%'); // Returns: 25.0
```

### Phone Helpers
```dart
// Parse phone to clean digits
String cleanPhone = InputFieldHelper.parsePhone('+62 (811) 1151-111'); // Returns: "628111151111"

// Format phone with country code
String formattedPhone = InputFieldHelper.formatPhone('8111151111', countryCode: '+62'); // Returns: "+62 811 1151 111"
```

### Date Helpers
```dart
// Parse date string (MM/DD/YYYY format)
DateTime? date = InputFieldHelper.parseDate('12/25/2023'); // Returns: DateTime object
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