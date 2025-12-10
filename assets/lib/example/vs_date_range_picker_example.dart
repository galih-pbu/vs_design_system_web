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
  DateTimeRange? _analyticsDateRange;
  DateTimeRange? _bookingDateRange;
  DateTimeRange? _reportDateRange;

  // Controllers for input fields
  final TextEditingController _basicController = TextEditingController();
  final TextEditingController _customController = TextEditingController();
  final TextEditingController _restrictedController = TextEditingController();
  final TextEditingController _analyticsController = TextEditingController();
  final TextEditingController _bookingController = TextEditingController();
  final TextEditingController _reportController = TextEditingController();

  // Loading and validation states
  bool _isBookingLoading = false;
  bool _isReportLoading = false;
  String? _bookingError;
  String? _reportError;

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

    // Initialize with default ranges
    _analyticsDateRange = DateTimeRange(
      start: _today.subtract(const Duration(days: 7)),
      end: _today,
    );
    _analyticsController.text = '${_formatDate(_analyticsDateRange!.start)} - ${_formatDate(_analyticsDateRange!.end)}';

    // Initialize other controllers with placeholder text
    _basicController.text = '';
    _customController.text = '';
    _restrictedController.text = '';
    _bookingController.text = '${_formatDate(_today.add(const Duration(days: 30)))} - ${_formatDate(_today.add(const Duration(days: 37)))}';
    _reportController.text = '${_formatDate(DateTime(_today.year, _today.month, 1))} - ${_formatDate(DateTime(_today.year, _today.month + 1, 0))}';
  }

  @override
  void dispose() {
    _basicController.dispose();
    _customController.dispose();
    _restrictedController.dispose();
    _analyticsController.dispose();
    _bookingController.dispose();
    _reportController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Date Range Picker Examples',
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
          description: 'Simple date range picker with default styling and minimal parameters',
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: VSDateRangePicker(
                title: 'Select Date Range',
                hint: 'Choose your preferred date range',
                controller: _basicController,
                placeHolder: 'No date selected',
                onRangeSelected: (range) {
                  setState(() => _selectedDateRange = range);
                },
                dateShowFormat: 'MMM dd, yyyy',
                height: 48,
              ),
            ),
            if (_selectedDateRange != null) ...[
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
              ),
            ],
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Preset Ranges with Input Field
        _buildPickerGroup(
          title: 'Date Range Picker with Validation',
          description: 'Input field with preset ranges, validation, and error handling',
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Select with Validation',
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
                  VSDateRangePicker(
                    title: 'Selected Range',
                    hint: 'Select or enter date range',
                    controller: _customController,
                    require: true,
                    initialDateRange: _customDateRange,
                    minDate: DateTime(_today.year, _today.month - 3, 1),
                    maxDate: DateTime(_today.year, _today.month + 3, 0),
                    dateValidatorFunction: (range) {
                      if (range == null) return 'Please select a date range';
                      if (range.duration.inDays > 90) return 'Maximum range is 90 days';
                      if (range.duration.inDays < 1) return 'Minimum range is 1 day';
                      return null;
                    },
                    onRangeSelected: (range) {
                      setState(() => _customDateRange = range);
                    },
                    onDateChanged: (range) {
                      // Handle date changes
                      VSToastService.showToast(
                        context,
                        title: 'Date Changed',
                        description: 'Range updated to: ${_formatDate(range.start)} - ${_formatDate(range.end)}',
                        type: VSToastType.info,
                      );
                    },
                    dateSaveCallBack: (range) {
                      // Handle save callback
                      VSToastService.showToast(
                        context,
                        title: 'Range Saved',
                        description: 'Date range has been saved successfully',
                        type: VSToastType.success,
                      );
                    },
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    height: 48,
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Restricted Date Range with Loading
        _buildPickerGroup(
          title: 'Restricted Date Range with Loading',
          description: 'Date picker with constraints, loading states, and validation feedback',
          children: [
            Container(
              width: double.infinity,
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
                  VSDateRangePicker(
                    title: 'Check-in / Check-out',
                    hint: 'Select your booking dates',
                    controller: _restrictedController,
                    require: true,
                    enable: !_isBookingLoading,
                    isLoading: _isBookingLoading,
                    loadingDesc: 'Checking availability...',
                    errorNotes: _bookingError,
                    minDate: _today,
                    maxDate: _today.add(const Duration(days: 30)),
                    initialDateRange: _restrictedDateRange,
                    dateValidatorFunction: (range) {
                      if (range == null) return 'Please select check-in and check-out dates';
                      if (range.duration.inDays < 1) return 'Minimum stay is 1 night';
                      if (range.duration.inDays > 14) return 'Maximum stay is 14 nights';
                      if (range.start.isBefore(_today)) return 'Check-in cannot be in the past';
                      return null;
                    },
                    onRangeSelected: (range) async {
                      setState(() {
                        _isBookingLoading = true;
                        _bookingError = null;
                      });

                      // Simulate API call
                      await Future.delayed(const Duration(seconds: 2));

                      setState(() {
                        _restrictedDateRange = range;
                        _isBookingLoading = false;
                      });
                    },
                    onClear: () {
                      setState(() {
                        _restrictedDateRange = null;
                        _bookingError = null;
                      });
                      _restrictedController.clear();
                    },
                    dateShowFormat: 'MMM dd, yyyy',
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    height: 48,
                  ),
                  if (_restrictedDateRange != null && !_isBookingLoading) ...[
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

        // Custom Styled Picker with Report Generation
        _buildPickerGroup(
          title: 'Report Generation with Custom Styling',
          description: 'Advanced date picker with custom formatting, loading states, and report generation',
          children: [
            Container(
              width: double.infinity,
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
                        'Report Period',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                      const Spacer(),
                      if (_isReportLoading)
                        const VSBadge(
                          label: 'GENERATING',
                          variant: VSBadgeVariant.warning,
                        )
                      else
                        const VSBadge(
                          label: 'READY',
                          variant: VSBadgeVariant.success,
                        ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSDateRangePicker(
                    title: 'Generate Report For',
                    hint: 'Select period for detailed report',
                    controller: _reportController,
                    require: true,
                    enable: !_isReportLoading,
                    isLoading: _isReportLoading,
                    loadingDesc: 'Generating comprehensive report...',
                    errorNotes: _reportError,
                    initialDateRange: _reportDateRange ?? DateTimeRange(
                      start: DateTime(_today.year, _today.month, 1),
                      end: DateTime(_today.year, _today.month + 1, 0),
                    ),
                    minDate: DateTime(_today.year - 1, 1, 1),
                    maxDate: _today,
                    dateValidatorFunction: (range) {
                      if (range == null) return 'Please select a report period';
                      if (range.duration.inDays > 365) return 'Report period cannot exceed 1 year';
                      if (range.start.isAfter(_today)) return 'Start date cannot be in the future';
                      return null;
                    },
                    onRangeSelected: (range) async {
                      setState(() {
                        _isReportLoading = true;
                        _reportError = null;
                      });

                      // Simulate report generation
                      await Future.delayed(const Duration(seconds: 3));

                      if (mounted) {
                        setState(() {
                          _reportDateRange = range;
                          _isReportLoading = false;
                        });

                        // Show success message
                        VSToastService.showToast(
                          context,
                          title: 'Report Generated',
                          description: 'Report created for ${range.duration.inDays + 1} days',
                          type: VSToastType.success,
                        );
                      }
                    },
                    onClear: () {
                      setState(() {
                        _reportDateRange = null;
                        _reportError = null;
                      });
                      _reportController.clear();
                    },
                    dateShowFormat: 'MMMM dd, yyyy',
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    height: 56,
                  ),
                  if (_reportDateRange != null && !_isReportLoading) ...[
                    SizedBox(height: AppSpacing.sm),
                    Container(
                      padding: EdgeInsets.all(AppSpacing.sm),
                      decoration: BoxDecoration(
                        color: AppColors.primaryBg.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.primaryDefault.withValues(alpha: 0.3)),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.description, size: 16, color: AppColors.primaryDefault),
                          SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: Text(
                              'Report generated: ${_reportDateRange!.duration.inDays + 1} days of data',
                              style: AppTypography.bodySmallRegular.copyWith(
                                color: AppColors.primaryDefault,
                              ),
                            ),
                          ),
                          VSButton(
                            label: 'Download',
                            onPressed: () {
                              // Handle download
                              VSToastService.showToast(
                                context,
                                title: 'Download Started',
                                description: 'Your report download has begun',
                                type: VSToastType.info,
                              );
                            },
                            size: VSButtonSize.xsmall,
                            variant: VSButtonVariant.text,
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

        // Real-world Usage Examples
        _buildPickerGroup(
          title: 'Real-world Usage Examples',
          description: 'Common patterns for using date range pickers in applications',
          children: [
            // Analytics Dashboard with Real-time Updates
            Container(
              width: double.infinity,
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
                  VSDateRangePicker(
                    title: 'Analytics Period',
                    hint: 'Select date range for analytics',
                    controller: _analyticsController,
                    initialDateRange: _analyticsDateRange,
                    minDate: DateTime(_today.year - 2, 1, 1),
                    maxDate: _today,
                    dateValidatorFunction: (range) {
                      if (range == null) return 'Please select an analytics period';
                      if (range.duration.inDays > 365) return 'Maximum analytics period is 1 year';
                      return null;
                    },
                    onRangeSelected: (range) {
                      setState(() => _analyticsDateRange = range);
                      // Trigger analytics refresh
                      _refreshAnalytics(context, range);
                    },
                    onDateChanged: (range) {
                      // Real-time updates as user changes dates
                      VSToastService.showToast(
                        context,
                        title: 'Analytics Updating',
                        description: 'Range: ${_formatDate(range.start)} - ${_formatDate(range.end)}',
                        type: VSToastType.info,
                        duration: const Duration(seconds: 2),
                      );
                    },
                    dateShowFormat: 'MMM dd, yyyy',
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    height: 48,
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

            // Travel Booking with Flexible Dates
            Container(
              width: double.infinity,
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
                      const Spacer(),
                      const VSBadge(
                        label: 'FLEXIBLE',
                        variant: VSBadgeVariant.primary,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSDateRangePicker(
                    title: 'Departure - Return',
                    hint: 'Select your travel dates',
                    controller: _bookingController,
                    initialDateRange: _bookingDateRange ?? DateTimeRange(
                      start: _today.add(const Duration(days: 30)),
                      end: _today.add(const Duration(days: 37)),
                    ),
                    minDate: _today,
                    maxDate: _today.add(const Duration(days: 365)),
                    dateValidatorFunction: (range) {
                      if (range == null) return 'Please select travel dates';
                      if (range.duration.inDays < 1) return 'Return date must be after departure';
                      if (range.duration.inDays > 30) return 'Maximum trip length is 30 days';
                      return null;
                    },
                    onRangeSelected: (range) {
                      setState(() => _bookingDateRange = range);
                      // Search for flights
                      _searchFlights(context, range);
                    },
                    dateShowFormat: 'EEE, MMM dd',
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    height: 48,
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
                  if (_bookingDateRange != null) ...[
                    SizedBox(height: AppSpacing.sm),
                    Container(
                      padding: EdgeInsets.all(AppSpacing.sm),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryBg.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.secondaryDefault.withValues(alpha: 0.3)),
                      ),
                      child: Text(
                        '${_bookingDateRange!.duration.inDays + 1} day trip • Searching flights...',
                        style: AppTypography.bodySmallRegular.copyWith(
                          color: AppColors.secondaryDefault,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Project Timeline Management
            Container(
              width: double.infinity,
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
                  VSDateRangePicker(
                    title: 'Project Duration',
                    hint: 'Set project start and end dates',
                    controller: TextEditingController(),
                    initialDateRange: DateTimeRange(
                      start: DateTime(_today.year, 3, 1),
                      end: DateTime(_today.year, 6, 30),
                    ),
                    minDate: DateTime(_today.year, 1, 1),
                    maxDate: DateTime(_today.year, 12, 31),
                    dateValidatorFunction: (range) {
                      if (range == null) return 'Please set project dates';
                      if (range.duration.inDays < 30) return 'Minimum project duration is 30 days';
                      if (range.duration.inDays > 365) return 'Maximum project duration is 1 year';
                      return null;
                    },
                    onRangeSelected: (range) {
                      // Update project timeline
                      _updateProjectTimeline(context, range);
                    },
                    dateShowFormat: 'MMM dd, yyyy',
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    height: 48,
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
                              'Start: March 1, ${_today.year}',
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
                              'End: June 30, ${_today.year}',
                              style: AppTypography.bodySmallRegular,
                            ),
                          ],
                        ),
                      ],
                    ),
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
                        onPressed: () {
                          VSToastService.showToast(
                            context,
                            title: 'Report Period',
                            description: 'January 1 - January 31, 2024 (fixed period for demo)',
                            type: VSToastType.info,
                          );
                        },
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
      mainAxisSize: MainAxisSize.min,
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
          _customController.text = '${_formatDate(range.start)} - ${_formatDate(range.end)}';
          VSToastService.showToast(
            context,
            title: 'Preset Selected',
            description: 'Selected: $label (${_formatDate(range.start)} - ${_formatDate(range.end)})',
            type: VSToastType.info,
          );
        } else {
          _customController.clear();
        }
      },
      size: VSButtonSize.small,
      variant: isSelected ? VSButtonVariant.primary : VSButtonVariant.outlined,
    );
  }

  Widget _buildMetricCard(String title, String value, Color color) {
    return Flexible(
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

  // Helper Methods
  void _refreshAnalytics(BuildContext context, DateTimeRange range) {
    // Simulate analytics refresh
    VSToastService.showToast(
      context,
      title: 'Analytics Refreshed',
      description: 'Data updated for: ${_formatDate(range.start)} - ${_formatDate(range.end)}',
      type: VSToastType.success,
    );
  }

  void _searchFlights(BuildContext context, DateTimeRange range) {
    // Simulate flight search
    VSToastService.showToast(
      context,
      title: 'Flight Search',
      description: 'Searching flights for: ${_formatDate(range.start)} - ${_formatDate(range.end)}',
      type: VSToastType.info,
    );
  }

  void _updateProjectTimeline(BuildContext context, DateTimeRange range) {
    // Simulate project timeline update
    VSToastService.showToast(
      context,
      title: 'Project Updated',
      description: 'Timeline adjusted to: ${_formatDate(range.start)} - ${_formatDate(range.end)}',
      type: VSToastType.success,
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}