import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSDateRangePickerExample extends StatefulWidget {
  const VSDateRangePickerExample({super.key});

  @override
  State<VSDateRangePickerExample> createState() => _VSDateRangePickerExampleState();
}

class _VSDateRangePickerExampleState extends State<VSDateRangePickerExample> {
  // Date range states
  DateTimeRange? _selectedDateRange;
  DateTimeRange? _customDateRange;
  DateTimeRange? _restrictedDateRange;

  // Preset ranges
  final DateTime _today = DateTime.now();
  late final DateTimeRange _thisWeek;
  late final DateTimeRange _thisMonth;
  late final DateTimeRange _lastMonth;

  // Display states
  String _selectedPreset = 'Custom Range';

  @override
  void initState() {
    super.initState();
    _thisWeek = DateTimeRange(
      start: _today.subtract(Duration(days: _today.weekday - 1)),
      end: _today.add(Duration(days: 7 - _today.weekday)),
    );
    _thisMonth = DateTimeRange(
      start: DateTime(_today.year, _today.month, 1),
      end: DateTime(_today.year, _today.month + 1, 0),
    );
    _lastMonth = DateTimeRange(
      start: DateTime(_today.year, _today.month - 1, 1),
      end: DateTime(_today.year, _today.month, 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Date Range Picker Examples',
      //   actions: [
      //     VSButton(
      //       label: 'Info',
      //       onPressed: () => _showPickerInfoDialog(context),
      //       size: VSButtonSize.small,
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: 'VS Date Range Picker Variants',
              description: 'Comprehensive demonstration of date range pickers with various configurations and use cases',
              child: _buildPickerShowcase(),
            ),
          ],
        ),
      ),
    );
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

  Widget _buildPickerShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic Date Range Picker
        _buildPickerGroup(
          title: 'Basic Date Range Picker',
          description: 'Simple date range picker with default styling',
          children: [
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Date Range',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSButton(
                    label: _selectedDateRange != null
                        ? '${_formatDate(_selectedDateRange!.start)} - ${_formatDate(_selectedDateRange!.end)}'
                        : 'Choose Date Range',
                    onPressed: () => _showBasicPicker(context),
                    variant: VSButtonVariant.outlined,
                    rightIcon: Icons.calendar_today,
                  ),
                  if (_selectedDateRange != null) ...[
                    SizedBox(height: AppSpacing.sm),
                    Row(
                      children: [
                        const VSBadge(
                          label: 'SELECTED',
                          variant: VSBadgeVariant.success,
                        ),
                        SizedBox(width: AppSpacing.sm),
                        Text(
                          '${_selectedDateRange!.duration.inDays + 1} days selected',
                          style: AppTypography.bodySmallRegular.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Preset Ranges
        _buildPickerGroup(
          title: 'Preset Date Ranges',
          description: 'Quick selection with predefined date ranges',
          children: [
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Select',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      _buildPresetButton('This Week', _thisWeek),
                      _buildPresetButton('This Month', _thisMonth),
                      _buildPresetButton('Last Month', _lastMonth),
                      _buildPresetButton('Custom Range', null),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Container(
                    padding: EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: AppColors.neutral200),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today, size: 16, color: AppColors.textSecondary),
                        SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: Text(
                            _customDateRange != null
                                ? '${_formatDate(_customDateRange!.start)} - ${_formatDate(_customDateRange!.end)}'
                                : 'No range selected',
                            style: AppTypography.bodySmallRegular,
                          ),
                        ),
                        if (_customDateRange != null)
                          VSButton(
                            label: 'Change',
                            onPressed: () => _showCustomPicker(context),
                            size: VSButtonSize.xsmall,
                            variant: VSButtonVariant.text,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Restricted Date Range
        _buildPickerGroup(
          title: 'Restricted Date Range',
          description: 'Date picker with minimum and maximum date constraints',
          children: [
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Booking Period',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                      const Spacer(),
                      const VSBadge(
                        label: 'RESTRICTED',
                        variant: VSBadgeVariant.warning,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Text(
                    'Available dates: Next 30 days only',
                    style: AppTypography.bodySmallRegular.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSButton(
                    label: _restrictedDateRange != null
                        ? '${_formatDate(_restrictedDateRange!.start)} - ${_formatDate(_restrictedDateRange!.end)}'
                        : 'Select Booking Dates',
                    onPressed: () => _showRestrictedPicker(context),
                    variant: VSButtonVariant.outlined,
                    rightIcon: Icons.event_available,
                  ),
                  if (_restrictedDateRange != null) ...[
                    SizedBox(height: AppSpacing.sm),
                    Container(
                      padding: EdgeInsets.all(AppSpacing.sm),
                      decoration: BoxDecoration(
                        color: AppColors.successBg.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.successDefault.withValues(alpha: 0.3)),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.check_circle, size: 16, color: AppColors.successDefault),
                          SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: Text(
                              'Booking confirmed for ${_restrictedDateRange!.duration.inDays + 1} days',
                              style: AppTypography.bodySmallRegular.copyWith(
                                color: AppColors.successDefault,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Custom Styled Picker
        _buildPickerGroup(
          title: 'Custom Styled Picker',
          description: 'Date picker with custom text styles and colors',
          children: [
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Report Period',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSButton(
                    label: 'Generate Report',
                    onPressed: () => _showStyledPicker(context),
                    leftIcon: Icons.bar_chart,
                    variant: VSButtonVariant.primary,
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Real-world Usage Examples
        _buildPickerGroup(
          title: 'Real-world Usage Examples',
          description: 'Common patterns for using date range pickers in applications',
          children: [
            // Analytics Dashboard
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.analytics, color: AppColors.primaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Analytics Dashboard',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                      const Spacer(),
                      const VSBadge(
                        label: 'LIVE',
                        variant: VSBadgeVariant.success,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date Range',
                              style: AppTypography.bodySmallSemibold,
                            ),
                            Text(
                              'Last 7 days',
                              style: AppTypography.bodySmallRegular.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      VSButton(
                        label: 'Change',
                        onPressed: () => _showAnalyticsPicker(context),
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.outlined,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      _buildMetricCard('Users', '12,543', AppColors.primaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      _buildMetricCard('Revenue', '\$45,231', AppColors.successDefault),
                      SizedBox(width: AppSpacing.sm),
                      _buildMetricCard('Conversion', '3.2%', AppColors.warningDefault),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Travel Booking
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.flight, color: AppColors.secondaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Flight Search',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Departure - Return',
                              style: AppTypography.bodySmallSemibold,
                            ),
                            Text(
                              'Select travel dates',
                              style: AppTypography.bodySmallRegular.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      VSButton(
                        label: 'Select Dates',
                        onPressed: () => _showTravelPicker(context),
                        size: VSButtonSize.small,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      const VSChip(label: 'Round Trip', type: VSChipType.color, variant: VSChipVariant.primary),
                      const VSChip(label: '2 Adults', type: VSChipType.color, variant: VSChipVariant.neutral),
                      const VSChip(label: 'Economy', type: VSChipType.color, variant: VSChipVariant.neutral),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Project Timeline
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.timeline, color: AppColors.warningDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Project Timeline',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                      const Spacer(),
                      const VSBadge(
                        label: 'IN PROGRESS',
                        variant: VSBadgeVariant.warning,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Container(
                    padding: EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: AppColors.neutral200),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.flag, size: 16, color: AppColors.successDefault),
                            SizedBox(width: AppSpacing.sm),
                            Text(
                              'Start Date: March 1, 2024',
                              style: AppTypography.bodySmallRegular,
                            ),
                          ],
                        ),
                        SizedBox(height: AppSpacing.xs),
                        Row(
                          children: [
                            Icon(Icons.flag_outlined, size: 16, color: AppColors.dangerDefault),
                            SizedBox(width: AppSpacing.sm),
                            Text(
                              'End Date: June 30, 2024',
                              style: AppTypography.bodySmallRegular,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSButton(
                    label: 'Adjust Timeline',
                    onPressed: () => _showProjectPicker(context),
                    size: VSButtonSize.small,
                    variant: VSButtonVariant.outlined,
                    leftIcon: Icons.edit_calendar,
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Expense Report
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.receipt, color: AppColors.dangerDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Expense Report',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                      const Spacer(),
                      const VSBadge(
                        label: 'PENDING',
                        variant: VSBadgeVariant.danger,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Report Period',
                              style: AppTypography.bodySmallSemibold,
                            ),
                            Text(
                              'January 1 - January 31, 2024',
                              style: AppTypography.bodySmallRegular.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      VSButton(
                        label: 'Edit Period',
                        onPressed: () => _showExpensePicker(context),
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.outlined,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Container(
                    padding: EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: AppColors.dangerBg.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: AppColors.dangerDefault.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.warning, size: 16, color: AppColors.dangerDefault),
                        SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: Text(
                            'Report is overdue. Please submit by end of day.',
                            style: AppTypography.bodySmallRegular.copyWith(
                              color: AppColors.dangerDefault,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPickerGroup({
    required String title,
    required String description,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.bodyLargeSemibold,
        ),
        SizedBox(height: AppSpacing.xs),
        Text(
          description,
          style: AppTypography.bodySmallRegular.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),
        ...children,
      ],
    );
  }

  Widget _buildPresetButton(String label, DateTimeRange? range) {
    final isSelected = _selectedPreset == label;
    return VSButton(
      label: label,
      onPressed: () {
        setState(() {
          _selectedPreset = label;
          _customDateRange = range;
        });
        if (range != null) {
          _showActionDialog(context, 'Selected: ${label} (${_formatDate(range.start)} - ${_formatDate(range.end)})');
        }
      },
      size: VSButtonSize.small,
      variant: isSelected ? VSButtonVariant.primary : VSButtonVariant.outlined,
    );
  }

  Widget _buildMetricCard(String title, String value, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color: AppColors.neutral0,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.neutral200),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: AppTypography.bodyMediumSemibold.copyWith(color: color),
            ),
            Text(
              title,
              style: AppTypography.bodyXSmallRegular.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBasicPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.input,
        message: 'Select Date Range',
        content: SizedBox(
          height: 400,
          width: 400,
          child: VSDateRangePicker(
            onRangeSelected: (range) {
              setState(() => _selectedDateRange = range);
              Navigator.of(context).pop();
              _showActionDialog(context, 'Date range selected: ${_formatDate(range.start)} - ${_formatDate(range.end)}');
            },
          ),
        ),
        actions: [
          VSDialogAction(
            label: 'Cancel',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  void _showCustomPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.input,
        message: 'Custom Date Range',
        content: SizedBox(
          height: 400,
          width: 400,
          child: VSDateRangePicker(
            initialDateRange: _customDateRange,
            onRangeSelected: (range) {
              setState(() => _customDateRange = range);
              Navigator.of(context).pop();
              _showActionDialog(context, 'Custom range updated: ${_formatDate(range.start)} - ${_formatDate(range.end)}');
            },
          ),
        ),
        actions: [
          VSDialogAction(
            label: 'Cancel',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  void _showRestrictedPicker(BuildContext context) {
    final minDate = DateTime.now();
    final maxDate = minDate.add(const Duration(days: 30));

    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.input,
        message: 'Please select your booking dates from the available range.',
        title: 'Select Booking Dates',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Available dates: ${minDate.day}/${minDate.month} - ${maxDate.day}/${maxDate.month}',
              style: AppTypography.bodySmallRegular.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            SizedBox(height: AppSpacing.sm),
            SizedBox(
              height: 400,
              width: 400,
              child: VSDateRangePicker(
                minDate: minDate,
                maxDate: maxDate,
                onRangeSelected: (range) {
                  setState(() => _restrictedDateRange = range);
                  Navigator.of(context).pop();
                  _showActionDialog(context, 'Booking confirmed: ${_formatDate(range.start)} - ${_formatDate(range.end)}');
                },
              ),
            ),
          ],
        ),
        actions: [
          VSDialogAction(
            label: 'Cancel',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  void _showStyledPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.input,
        message: 'Select the date range for your report.',
        title: 'Report Date Range',
        content: SizedBox(
          height: 400,
          width: 400,
          child: VSDateRangePicker(
            daysOfTheWeekTextStyle: AppTypography.bodySmallSemibold.copyWith(
              color: AppColors.primaryDefault,
            ),
            enabledCellsTextStyle: AppTypography.bodyMediumRegular,
            currentDateTextStyle: AppTypography.bodyMediumSemibold.copyWith(
              color: AppColors.secondaryDefault,
            ),
            selectedCellsTextStyle: AppTypography.bodyMediumSemibold.copyWith(
              color: AppColors.neutral0,
            ),
            leadingDateTextStyle: AppTypography.h5.copyWith(
              color: AppColors.primaryDefault,
            ),
            onRangeSelected: (range) {
              Navigator.of(context).pop();
              _showActionDialog(context, 'Report will be generated for: ${_formatDate(range.start)} - ${_formatDate(range.end)}');
            },
          ),
        ),
        actions: [
          VSDialogAction(
            label: 'Cancel',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  void _showAnalyticsPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.input,
        message: 'Select the date range for analytics.',
        title: 'Analytics Date Range',
        content: SizedBox(
          height: 400,
          child: VSDateRangePicker(
            initialDateRange: DateTimeRange(
              start: DateTime.now().subtract(const Duration(days: 7)),
              end: DateTime.now(),
            ),
            onRangeSelected: (range) {
              Navigator.of(context).pop();
              _showActionDialog(context, 'Analytics updated for: ${_formatDate(range.start)} - ${_formatDate(range.end)}');
            },
          ),
        ),
        actions: [
          VSDialogAction(
            label: 'Cancel',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  void _showTravelPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.input,
        message: 'Choose your travel dates.',
        title: 'Select Travel Dates',
        content: SizedBox(
          height: 400,
          child: VSDateRangePicker(
            minDate: DateTime.now(),
            maxDate: DateTime.now().add(const Duration(days: 365)),
            onRangeSelected: (range) {
              Navigator.of(context).pop();
              _showActionDialog(context, 'Flight search for: ${_formatDate(range.start)} - ${_formatDate(range.end)}');
            },
          ),
        ),
        actions: [
          VSDialogAction(
            label: 'Cancel',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  void _showProjectPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.input,
        message: 'Adjust the project timeline dates.',
        title: 'Adjust Project Timeline',
        content: SizedBox(
          height: 400,
          child: VSDateRangePicker(
            initialDateRange: DateTimeRange(
              start: DateTime(2024, 3, 1),
              end: DateTime(2024, 6, 30),
            ),
            minDate: DateTime(2024, 1, 1),
            maxDate: DateTime(2024, 12, 31),
            onRangeSelected: (range) {
              Navigator.of(context).pop();
              _showActionDialog(context, 'Project timeline updated: ${_formatDate(range.start)} - ${_formatDate(range.end)}');
            },
          ),
        ),
        actions: [
          VSDialogAction(
            label: 'Cancel',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  void _showExpensePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.input,
        message: 'Select the period for the expense report.',
        title: 'Expense Report Period',
        content: SizedBox(
          height: 400,
          child: VSDateRangePicker(
            initialDateRange: DateTimeRange(
              start: DateTime(2024, 1, 1),
              end: DateTime(2024, 1, 31),
            ),
            onRangeSelected: (range) {
              Navigator.of(context).pop();
              _showActionDialog(context, 'Expense report period updated: ${_formatDate(range.start)} - ${_formatDate(range.end)}');
            },
          ),
        ),
        actions: [
          VSDialogAction(
            label: 'Cancel',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _showActionDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.confirmation,
        message: message,
        title: 'Date Range Selected',
        actions: [
          VSDialogAction(
            label: 'OK',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  void _showPickerInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        message: 'VS Date Range Picker Information',
        title: 'VS Date Range Picker Information',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The VS Date Range Picker provides a calendar-based interface for selecting date ranges with VS Design System styling.',
              style: AppTypography.bodyMediumRegular,
            ),
            SizedBox(height: AppSpacing.md),
            Text(
              'Key Features:',
              style: AppTypography.bodyMediumSemibold,
            ),
            SizedBox(height: AppSpacing.sm),
            Text(
              '• Calendar-based date range selection\n'
              '• Configurable min/max date constraints\n'
              '• Custom text styles for all elements\n'
              '• Callback functions for range and individual date changes\n'
              '• Custom colors and sizing options\n'
              '• Standalone implementation (no external dependencies)\n'
              '• VS Design System integration',
              style: AppTypography.bodySmallRegular,
            ),
          ],
        ),
        actions: [
          VSDialogAction(
            label: 'Close',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}