import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

/// Comprehensive examples for VSInputField widget
class VSInputFieldExample extends StatefulWidget {
  const VSInputFieldExample({super.key});

  @override
  State<VSInputFieldExample> createState() => _VSInputFieldExampleState();
}

class _VSInputFieldExampleState extends State<VSInputFieldExample> {
  Widget _buildSection({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.h3,
        ),
        SizedBox(height: AppSpacing.sm),
        Text(
          description,
          style: AppTypography.bodyMediumRegular.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.lg),
        child,
        SizedBox(height: AppSpacing.xl),
      ],
    );
  }

  Widget buildInputFieldShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic Input Fields
        Text(
          'Basic Input Fields',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),

        // Basic Input
        VSInputField(
          label: 'Name',
          hintText: 'Enter your name',
        ),
        SizedBox(height: AppSpacing.lg),

        // Email (Required)
        VSInputField(
          label: 'Email',
          isRequired: true,
          type: VSInputFieldType.email,
          hintText: 'user@email.com',
        ),
        SizedBox(height: AppSpacing.lg),

        // Password
        VSInputField(
          label: 'Password',
          type: VSInputFieldType.password,
          hintText: 'Enter password',
        ),
        SizedBox(height: AppSpacing.lg),

        // With Error
        VSInputField(
          label: 'Phone',
          errorText: 'Invalid phone number',
          hintText: 'Enter phone',
        ),
        SizedBox(height: AppSpacing.lg),

        // Disabled
        VSInputField(
          label: 'Username',
          initialValue: 'readonly_user',
          isEnabled: false,
        ),
        SizedBox(height: AppSpacing.lg),

        // Required with Placeholder
        VSInputField(
          label: 'Tenor',
          isRequired: true,
          hintText: 'e.g 25',
        ),
        SizedBox(height: AppSpacing.lg),

        // Filled State
        VSInputField(
          label: 'Tenor',
          isRequired: true,
          initialValue: '25',
        ),
        SizedBox(height: AppSpacing.lg),

        // Multiline (Textarea)
        VSInputField(
          label: 'Description',
          type: VSInputFieldType.textarea,
        ),
        SizedBox(height: AppSpacing.lg),

        // Number Fields Section
        Text(
          'Number Fields',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),

        Row(
          children: [
            Expanded(
              child: VSInputField(
                label: 'Integer',
                type: VSInputFieldType.integer,
              ),
            ),
            SizedBox(width: AppSpacing.md),
            Expanded(
              child: VSInputField(
                label: 'Decimal',
                type: VSInputFieldType.decimal,
              ),
            ),
            SizedBox(width: AppSpacing.md),
            Expanded(
              child: VSInputField(
                label: 'Percent',
                type: VSInputFieldType.percent,
                suffix: '%',
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.lg),

        // Currency Fields Section
        Text(
          'Currency Fields',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),

        Row(
          children: [
            Expanded(
              child: VSInputField(
                label: 'Price',
                type: VSInputFieldType.currency,
                prefix: '\$',
              ),
            ),
            SizedBox(width: AppSpacing.md),
            Expanded(
              child: VSInputField(
                label: 'Amount (Rp)',
                type: VSInputFieldType.currency,
                prefix: 'Rp',
                initialValue: InputFieldHelper.formatCurrency(1234567.89),
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.lg),

        // Date & Time Fields Section
        Text(
          'Date & Time Fields',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),

        Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.md,
          children: [
            SizedBox(
              width: 180,
              child: VSInputField(
                label: 'Date',
                type: VSInputFieldType.date,
              ),
            ),
            SizedBox(
              width: 220,
              child: VSInputField(
                label: 'Date & Time',
                type: VSInputFieldType.dateTime,
              ),
            ),
            SizedBox(
              width: 120,
              child: VSInputField(
                label: 'Time',
                type: VSInputFieldType.time,
              ),
            ),
            SizedBox(
              width: 280,
              child: VSInputField(
                label: 'Date Range',
                type: VSInputFieldType.dateRange,
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.lg),

        // Phone, Email & URL Fields
        Text(
          'Phone, Email & URL Fields',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),

        Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.md,
          children: [
            SizedBox(
              width: 200,
              child: VSInputField(
                label: 'Phone Number',
                type: VSInputFieldType.phone,
                leading: Icon(
                  Icons.phone,
                  size: 16,
                  color: AppColors.neutral500,
                ),
              ),
            ),
            SizedBox(
              width: 250,
              child: VSInputField(
                label: 'Email',
                type: VSInputFieldType.email,
                leading: Icon(
                  Icons.email,
                  size: 16,
                  color: AppColors.neutral500,
                ),
              ),
            ),
            SizedBox(
              width: 250,
              child: VSInputField(
                label: 'Website',
                type: VSInputFieldType.url,
                leading: Icon(
                  Icons.language,
                  size: 16,
                  color: AppColors.neutral500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.lg),

        // Search Field
        Text(
          'Search Field',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),

        VSInputField(
          type: VSInputFieldType.search,
          hintText: 'Search contacts...',
        ),
        SizedBox(height: AppSpacing.lg),

        // Search with Debounce
        Text(
          'Search with Debounce (500ms)',
          style: AppTypography.bodyMediumSemibold,
        ),
        SizedBox(height: AppSpacing.sm),
        VSInputField(
          type: VSInputFieldType.search,
          hintText: 'Search with 500ms debounce...',
          debounceDuration: Duration(milliseconds: 500),
          onChanged: (value) {
            VSToastService.showToast(
              context,
              title: 'Debounced Search',
              description: 'Searching for: "$value"',
              type: VSToastType.info,
            );
          },
        ),
        SizedBox(height: AppSpacing.lg),

        // Search on Enter
        Text(
          'Search on Enter Key Press',
          style: AppTypography.bodyMediumSemibold,
        ),
        SizedBox(height: AppSpacing.sm),
        VSInputField(
          type: VSInputFieldType.search,
          hintText: 'Press Enter to search...',
          triggerOnEnter: true,
          onChanged: (value) {
            VSToastService.showToast(
              context,
              title: 'Search Triggered',
              description: 'Searching for: "$value"',
              type: VSToastType.success,
            );
          },
        ),
        SizedBox(height: AppSpacing.lg),

        // Auto-Number (Read-only)
        Text(
          'Auto-Number (Read-only)',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),

        VSInputField(
          label: 'Record ID',
          type: VSInputFieldType.autoNumber,
          initialValue: 'AUTO-00123',
        ),
        SizedBox(height: AppSpacing.lg),

        // Enhanced Features Section
        Text(
          'Enhanced Features',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),

        // Label Control
        Text(
          'Label Control',
          style: AppTypography.bodyMediumSemibold,
        ),
        SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            Expanded(
              child: VSInputField(
                label: 'With Label',
                hintText: 'Field with visible label',
                showLabel: true,
              ),
            ),
            SizedBox(width: AppSpacing.md),
            Expanded(
              child: VSInputField(
                label: 'Hidden Label',
                hintText: 'Field with hidden label',
                showLabel: false,
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.lg),

        // Autofocus
        Text(
          'Autofocus Field',
          style: AppTypography.bodyMediumSemibold,
        ),
        SizedBox(height: AppSpacing.sm),
        VSInputField(
          label: 'Auto-focus Field',
          hintText: 'This field will auto-focus when the page loads',
          autofocus: true,
        ),
        SizedBox(height: AppSpacing.lg),

        // Suffix Text and Icon
        Text(
          'Suffix Text and Icon',
          style: AppTypography.bodyMediumSemibold,
        ),
        SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            Expanded(
              child: VSInputField(
                label: 'With Suffix Text',
                hintText: 'Field with suffix text',
                suffixText: 'kg',
              ),
            ),
            SizedBox(width: AppSpacing.md),
            Expanded(
              child: VSInputField(
                label: 'With Suffix Icon',
                hintText: 'Field with suffix icon',
                suffixIcon: Icon(
                  Icons.search,
                  size: 16,
                  color: AppColors.neutral500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.lg),

        // Custom Styling
        Text(
          'Custom Styling',
          style: AppTypography.bodyMediumSemibold,
        ),
        SizedBox(height: AppSpacing.sm),
        Column(
          children: [
            VSInputField(
              label: 'Custom Height',
              hintText: 'Field with custom height',
              height: 48,
              fillColor: AppColors.primaryBg.withValues(alpha: 0.1),
            ),
            SizedBox(height: AppSpacing.md),
            VSInputField(
              label: 'Center Aligned Text',
              hintText: 'Center aligned text',
              textAlign: TextAlign.center,
              fillColor: AppColors.secondaryBg.withValues(alpha: 0.1),
            ),
            SizedBox(height: AppSpacing.md),
            VSInputField(
              label: 'Custom Padding',
              hintText: 'Field with custom padding',
              padding: EdgeInsets.all(AppSpacing.lg),
              contentPadding: EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md),
              fillColor: AppColors.successBg.withValues(alpha: 0.1),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.lg),

        // Min Lines for Textarea
        Text(
          'Textarea with Min Lines',
          style: AppTypography.bodyMediumSemibold,
        ),
        SizedBox(height: AppSpacing.sm),
        VSInputField(
          label: 'Multi-line Text',
          hintText: 'This textarea has minimum 3 lines',
          type: VSInputFieldType.textarea,
          minLines: 3,
          maxLines: 6,
        ),
        SizedBox(height: AppSpacing.lg),

        // Form Actions
        Text(
          'Form Actions',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),

        Row(
          children: [
            Expanded(
              child: VSButton(
                label: 'Submit Form',
                onPressed: _submitForm,
                variant: VSButtonVariant.primary,
              ),
            ),
            SizedBox(width: AppSpacing.md),
            Expanded(
              child: VSButton(
                label: 'Clear Form',
                onPressed: _clearForm,
                variant: VSButtonVariant.secondary,
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.lg),

        // Field States Demo
        Text(
          'Field States & Validation',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),

        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.neutral100,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'This section demonstrates different field states and validation features:',
                style: AppTypography.bodyMediumRegular,
              ),
              SizedBox(height: AppSpacing.sm),
              VSBadge(
                label: 'Required fields with * indicator',
                variant: VSBadgeVariant.primary,
              ),
              SizedBox(height: AppSpacing.xs),
              VSBadge(
                label: 'Optional fields with (Optional) text',
                variant: VSBadgeVariant.secondary,
              ),
              SizedBox(height: AppSpacing.xs),
              VSBadge(
                label: 'Real-time validation',
                variant: VSBadgeVariant.success,
              ),
              SizedBox(height: AppSpacing.xs),
              VSBadge(
                label: 'Character counters for limited fields',
                variant: VSBadgeVariant.warning,
              ),
              SizedBox(height: AppSpacing.xs),
              VSBadge(
                label: 'Custom validation functions',
                variant: VSBadgeVariant.danger,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Form data controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _percentageController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  // Form validation states
  String? _nameError;
  String? _emailError;
  String? _phoneError;
  String? _priceError;
  String? _percentageError;

  void _validateName(String value) {
    setState(() {
      if (value.isEmpty) {
        _nameError = 'Name is required';
      } else if (value.length < 2) {
        _nameError = 'Name must be at least 2 characters';
      } else {
        _nameError = null;
      }
    });
  }

  void _validateEmail(String value) {
    setState(() {
      if (value.isEmpty) {
        _emailError = 'Email is required';
      } else {
        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!emailRegex.hasMatch(value)) {
          _emailError = 'Please enter a valid email address';
        } else {
          _emailError = null;
        }
      }
    });
  }

  void _validatePhone(String value) {
    setState(() {
      if (value.isEmpty) {
        _phoneError = null; // Optional field
      } else {
        final digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');
        if (digitsOnly.length < 8) {
          _phoneError = 'Phone number must be at least 8 digits';
        } else if (digitsOnly.length > 15) {
          _phoneError = 'Phone number must not exceed 15 digits';
        } else {
          _phoneError = null;
        }
      }
    });
  }

  void _validatePrice(String value) {
    setState(() {
      if (value.isEmpty) {
        _priceError = 'Price is required';
      } else {
        final cleanValue = value.replaceAll(',', '');
        if (double.tryParse(cleanValue) == null) {
          _priceError = 'Please enter a valid price';
        } else {
          _priceError = null;
        }
      }
    });
  }

  void _validatePercentage(String value) {
    setState(() {
      if (value.isEmpty) {
        _percentageError = null; // Optional field
      } else {
        final number = double.tryParse(value);
        if (number == null) {
          _percentageError = 'Please enter a valid percentage';
        } else if (number < 0 || number > 100) {
          _percentageError = 'Percentage must be between 0 and 100';
        } else {
          _percentageError = null;
        }
      }
    });
  }

  void _submitForm() {
    // Validate all fields
    _validateName(_nameController.text);
    _validateEmail(_emailController.text);
    _validatePhone(_phoneController.text);
    _validatePrice(_priceController.text);
    _validatePercentage(_percentageController.text);

    // Check if all validations pass
    if (_nameError == null &&
        _emailError == null &&
        _phoneError == null &&
        _priceError == null &&
        _percentageError == null) {
      // Show success dialog
      showDialog(
        context: context,
        builder: (context) => VSDialog(
          type: VSDialogType.approve,
          message:
              'Form submitted successfully!\n\nName: ${_nameController.text}\nEmail: ${_emailController.text}\nPhone: ${_phoneController.text}\nPrice: ${_priceController.text}\nNotes: ${_notesController.text}',
          actions: [
            VSDialogAction(
              label: 'OK',
              onPressed: () {},
            ),
          ],
        ),
      );
    } else {
      // Show error dialog
      showDialog(
        context: context,
        builder: (context) => VSDialog(
          type: VSDialogType.reject,
          message: 'Please fix the errors in the form before submitting.',
          actions: [
            VSDialogAction(
              label: 'OK',
              onPressed: () {},
            ),
          ],
        ),
      );
    }
  }

  void _clearForm() {
    setState(() {
      _nameController.clear();
      _emailController.clear();
      _phoneController.clear();
      _priceController.clear();
      _percentageController.clear();
      _notesController.clear();
      _nameError = null;
      _emailError = null;
      _phoneError = null;
      _priceError = null;
      _percentageError = null;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _priceController.dispose();
    _percentageController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: _buildSection(
          title: 'VS Input Field Components',
          description: 'Comprehensive collection of input field components with various types, validation, and formatting options',
          child: buildInputFieldShowcase(),
        ),
      ),
    );
  }
}