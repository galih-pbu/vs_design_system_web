import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

/// Comprehensive examples for VSInputField widget
class VSInputFieldExample extends StatefulWidget {
  const VSInputFieldExample({super.key});

  @override
  State<VSInputFieldExample> createState() => _VSInputFieldExampleState();
}

class _VSInputFieldExampleState extends State<VSInputFieldExample> {
  final TextEditingController _clearController = TextEditingController(text: 'Sample text');
  bool _isInteractiveLoading = false;
  List<String> _dropdownOptions = [];
  String? _selectedDropdownValue;
  bool _hasLoadedDropdown = false;
  late final FocusNode _dropdownFocusNode;
  late final TextEditingController _dropdownController;

  @override
  void initState() {
    super.initState();
    _dropdownFocusNode = FocusNode()
      ..addListener(() {
        if (!_hasLoadedDropdown && !_isInteractiveLoading) {
          _handleInteractiveLoading();
        }
      });
    _dropdownController = TextEditingController();
    // Load dropdown data on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleInteractiveLoading();
    });
  }

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
          style: AppTypography.h3.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: AppSpacing.sm),
        Text(
          description,
          style: AppTypography.bodyMediumRegular.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),
        child,
      ],
    );
  }

  void _handleInteractiveLoading() async {
    setState(() {
      _isInteractiveLoading = true;
      _dropdownOptions = [];
      _selectedDropdownValue = null;
      _hasLoadedDropdown = true;
    });
    _dropdownController.clear();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isInteractiveLoading = false;
      _dropdownOptions = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
    });
  }

  Widget buildInputFieldShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic Text Fields
        _buildSection(
          title: 'Basic Text Fields',
          description: 'Standard text input fields with different types',
          child: Column(
            children: [
              VSInputField(
                label: 'Text Field',
                hintText: 'Enter any text',
                type: VSInputFieldType.text,
              ),
              SizedBox(height: AppSpacing.md),

              VSInputField(
                label: 'Password Field',
                hintText: 'Enter password',
                type: VSInputFieldType.password,
              ),
              SizedBox(height: AppSpacing.md),

              VSInputField(
                label: 'Email Field',
                hintText: 'user@example.com',
                type: VSInputFieldType.email,
              ),
              SizedBox(height: AppSpacing.md),

              VSInputField(
                label: 'URL Field',
                hintText: 'https://example.com',
                type: VSInputFieldType.url,
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.lg),

        // Number Fields
        _buildSection(
          title: 'Number Fields',
          description: 'Numeric input fields with automatic formatting',
          child: Wrap(
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.md,
            children: [
              SizedBox(
                width: 150,
                child: VSInputField(
                  label: 'Integer',
                  type: VSInputFieldType.integer,
                ),
              ),
              SizedBox(
                width: 150,
                child: VSInputField(
                  label: 'Decimal',
                  type: VSInputFieldType.decimal,
                ),
              ),
              SizedBox(
                width: 150,
                child: VSInputField(
                  label: 'Percent',
                  type: VSInputFieldType.percent,
                  suffix: '%',
                ),
              ),
              SizedBox(
                width: 180,
                child: VSInputField(
                  label: 'Currency',
                  type: VSInputFieldType.currency,
                  prefix: 'Rp',
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.lg),

        // Date & Time Fields
        _buildSection(
          title: 'Date & Time Fields',
          description: 'Date and time picker fields',
          child: Wrap(
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.md,
            children: [
              SizedBox(
                width: 150,
                child: VSInputField(
                  label: 'Date',
                  type: VSInputFieldType.date,
                ),
              ),
              SizedBox(
                width: 150,
                child: VSInputField(
                  label: 'Time',
                  type: VSInputFieldType.time,
                ),
              ),
              SizedBox(
                width: 200,
                child: VSInputField(
                  label: 'Date & Time',
                  type: VSInputFieldType.dateTime,
                ),
              ),
              SizedBox(
                width: 250,
                child: VSInputField(
                  label: 'Date Range',
                  type: VSInputFieldType.dateRange,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.lg),

        // Phone Field with Country Flag
        _buildSection(
          title: 'Phone Field',
          description: 'Phone input with country code selection',
          child: Wrap(
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.md,
            children: [
              SizedBox(
                width: 200,
                child: VSInputField(
                  label: 'Phone (Code)',
                  type: VSInputFieldType.phone,
                ),
              ),
              SizedBox(
                width: 220,
                child: VSInputField(
                  label: 'Phone (Flag)',
                  type: VSInputFieldType.phone,
                  showCountryFlag: true,
                ),
              ),
              SizedBox(
                width: 240,
                child: VSInputField(
                  label: 'Phone (Flag + Code)',
                  type: VSInputFieldType.phone,
                  showCountryFlagAndCode: true,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.lg),

        // Search Field
        _buildSection(
          title: 'Search Field',
          description: 'Search input with built-in search icon',
          child: VSInputField(
            type: VSInputFieldType.search,
            hintText: 'Search...',
          ),
        ),
        SizedBox(height: AppSpacing.lg),

        // Textarea
        _buildSection(
          title: 'Textarea',
          description: 'Multi-line text input',
          child: VSInputField(
            label: 'Description',
            type: VSInputFieldType.textarea,
            hintText: 'Enter description...',
            minLines: 3,
          ),
        ),
        SizedBox(height: AppSpacing.lg),

        // Field States
        _buildSection(
          title: 'Field States',
          description: 'Different field states and configurations',
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: VSInputField(
                      label: 'Required Field',
                      hintText: 'This field is required',
                      isRequired: true,
                    ),
                  ),
                  SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: VSInputField(
                      label: 'Optional Field',
                      hintText: 'This field is optional',
                      isOptional: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.md),

              Row(
                children: [
                  Expanded(
                    child: VSInputField(
                      label: 'Disabled Field',
                      hintText: 'Cannot edit this',
                      initialValue: 'Disabled content',
                      isEnabled: false,
                    ),
                  ),
                  SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: VSInputField(
                      label: 'Read-only Field',
                      hintText: 'Cannot edit this',
                      initialValue: 'Read-only content',
                      isReadOnly: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.md),

              VSInputField(
                label: 'Field with Error',
                hintText: 'This field has an error',
                errorText: 'This is an error message',
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.lg),

        // Custom Styling
        _buildSection(
          title: 'Custom Styling',
          description: 'Fields with custom appearance and behavior',
          child: Column(
            children: [
              VSInputField(
                label: 'Custom Height',
                hintText: 'Field with custom height',
                height: 60,
                fillColor: AppColors.primaryBg.withValues(alpha: 0.1),
              ),
              SizedBox(height: AppSpacing.md),

              Row(
                children: [
                  Expanded(
                    child: VSInputField(
                      label: 'Center Aligned',
                      hintText: 'Center text',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: VSInputField(
                      label: 'Right Aligned',
                      hintText: 'Right text',
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.md),

              VSInputField(
                label: 'With Prefix & Suffix',
                hintText: 'Field with icons',
                prefix: '🔍',
                suffixText: 'Search',
                suffixIcon: Icon(
                  Icons.search,
                  size: 16,
                  color: AppColors.neutral500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.lg),

        // Loading States
        _buildSection(
          title: 'Loading States',
          description: 'Fields with loading indicators and interactive loading',
          child: Column(
            children: [
              VSInputField(
                label: 'Loading Field',
                hintText: 'This field is loading',
                isLoading: true,
              ),
              SizedBox(height: AppSpacing.md),

              VSInputField(
                label: 'Interactive Loading with Dropdown',
                hintText: 'Click to load data',
                controller: _dropdownController,
                isLoadingData: _isInteractiveLoading,
                dropdownOptions: _dropdownOptions,
                focusNode: _dropdownFocusNode,
                onDropdownSelected: (value) {
                  setState(() {
                    _selectedDropdownValue = value;
                  });
                },
                onClear: () {
                  _dropdownController.clear();
                  setState(() {
                    _selectedDropdownValue = null;
                  });
                  VSToastService.showToast(
                    context,
                    title: 'Cleared',
                    description: 'Selection has been cleared',
                    type: VSToastType.info,
                  );
                },
              ),
              if (_selectedDropdownValue != null)
                Padding(
                  padding: EdgeInsets.only(top: AppSpacing.sm),
                  child: Text(
                    'Selected: $_selectedDropdownValue',
                    style: AppTypography.bodySmallRegular.copyWith(
                      color: AppColors.primaryDefault,
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.lg),

        // Clear Functionality
        _buildSection(
          title: 'Clear Functionality',
          description: 'Fields with clear buttons',
          child: VSInputField(
            label: 'Clearable Field',
            hintText: 'Type something and click the X to clear',
            controller: _clearController,
            onClear: () {
              _clearController.text = '';
              VSToastService.showToast(
                context,
                title: 'Cleared',
                description: 'Field has been cleared',
                type: VSToastType.info,
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _clearController.dispose();
    _dropdownFocusNode.dispose();
    _dropdownController.dispose();
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