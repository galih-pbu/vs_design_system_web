# VS Date Range Picker

The VS Date Range Picker component provides an input field interface for selecting date ranges with comprehensive customization options and VS Design System integration.

## Overview

The `VSDateRangePicker` widget creates a text input field that opens a date range picker dialog when tapped. It supports various configurations including validation, loading states, date constraints, and callback functions for handling user selections.

## Features

- **Input Field Interface**: Clean text input with picker dialog
- **Date Range Selection**: Visual selection of start and end dates via dialog
- **Validation Support**: Built-in validation with error display
- **Loading States**: Loading indicator and disabled states
- **Date Constraints**: Configurable minimum and maximum selectable dates
- **Custom Styling**: Extensive customization of text styles and colors
- **Callback Support**: Multiple callback functions for range and individual date changes
- **Accessibility**: Screen reader support and keyboard navigation
- **VS Design Integration**: Consistent with VS Design System tokens

## Basic Usage

```dart
VSDateRangePicker(
  hint: 'Select date range',
  controller: TextEditingController(),
  onRangeSelected: (DateTimeRange range) {
    print('Selected range: ${range.start} - ${range.end}');
  },
)
```

## Configuration Options

### Basic Date Range Picker
Simple picker with default styling.

```dart
class BasicDatePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VSDateRangePicker(
      hint: 'Select date range',
      controller: TextEditingController(),
      onRangeSelected: (range) {
        // Handle range selection
        print('Selected: ${range.start} to ${range.end}');
      },
    );
  }
}
```

### Picker with Initial Range
Pre-select a date range when the picker opens.

```dart
VSDateRangePicker(
  hint: 'Select date range',
  controller: TextEditingController(),
  initialDateRange: DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 7)),
    end: DateTime.now(),
  ),
  onRangeSelected: (range) {
    // Handle the selected range
  },
)
```

### Restricted Date Range
Limit selectable dates with minimum and maximum constraints.

```dart
VSDateRangePicker(
  hint: 'Select date range',
  controller: TextEditingController(),
  minDate: DateTime.now(),
  maxDate: DateTime.now().add(const Duration(days: 30)),
  onRangeSelected: (range) {
    // Only ranges within the next 30 days can be selected
  },
)
```

### With Validation and Loading
Picker with validation, loading states, and error handling.

```dart
VSDateRangePicker(
  title: 'Booking Period',
  hint: 'Select check-in and check-out dates',
  controller: TextEditingController(),
  require: true,
  isLoading: false,
  loadingDesc: 'Loading available dates...',
  errorNotes: 'Please select a valid date range',
  dateValidatorFunction: (range) {
    if (range == null) return 'Date range is required';
    if (range.duration.inDays > 30) return 'Maximum stay is 30 days';
    return null;
  },
  onRangeSelected: (range) {
    // Handle valid range selection
  },
)
```

### Custom Styled Picker
Customize appearance and behavior.

```dart
VSDateRangePicker(
  hint: 'Select date range',
  controller: TextEditingController(),
  title: 'Date Range',
  require: true,
  enable: true,
  padding: const EdgeInsets.all(16),
  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
  height: 48,
  dateShowFormat: 'MMM dd, yyyy',
  onRangeSelected: (range) {
    // Handle range selection
  },
  onDateChanged: (range) {
    // Called when range changes
  },
  dateSaveCallBack: (range) {
    // Called when range is saved
  },
  onClear: () {
    // Called when clear button is pressed
  },
)
```
    // Handle selection
  },
)
```

## Real-world Usage Examples

### Analytics Dashboard
Date range picker for filtering analytics data.

```dart
class AnalyticsDashboard extends StatefulWidget {
  @override
  _AnalyticsDashboardState createState() => _AnalyticsDashboardState();
}

class _AnalyticsDashboardState extends State<AnalyticsDashboard> {
  final TextEditingController _dateController = TextEditingController();
  DateTimeRange? _selectedRange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VSAppBar(
        title: 'Analytics Dashboard',
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: VSDateRangePicker(
              title: 'Date Range',
              hint: 'Select date range for analytics',
              controller: _dateController,
              initialDateRange: _selectedRange ?? DateTimeRange(
                start: DateTime.now().subtract(const Duration(days: 7)),
                end: DateTime.now(),
              ),
              onRangeSelected: (range) {
                setState(() => _selectedRange = range);
                // Refresh analytics data
                _loadAnalyticsData(range);
              },
            ),
          ),
          // Analytics content
          Text('Showing data for: ${_selectedRange?.toString() ?? 'All time'}'),
        ],
      ),
    );
  }

  void _loadAnalyticsData(DateTimeRange range) {
    // Load analytics data for the selected range
  }
}
```

### Booking System
Date range picker for hotel/restaurant bookings with validation.

```dart
class BookingForm extends StatefulWidget {
  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final TextEditingController _dateController = TextEditingController();
  DateTimeRange? _selectedRange;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return VSDialog(
      type: VSDialogType.input,
      title: 'Book Your Stay',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VSDateRangePicker(
            title: 'Check-in / Check-out',
            hint: 'Select your dates',
            controller: _dateController,
            require: true,
            isLoading: _isLoading,
            loadingDesc: 'Checking availability...',
            minDate: DateTime.now(),
            maxDate: DateTime.now().add(const Duration(days: 365)),
            dateValidatorFunction: (range) {
              if (range == null) return 'Please select check-in and check-out dates';
              if (range.duration.inDays < 1) return 'Minimum stay is 1 night';
              if (range.duration.inDays > 30) return 'Maximum stay is 30 nights';
              return null;
            },
            onRangeSelected: (range) {
              setState(() => _selectedRange = range);
            },
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              VSTextButton(
                label: 'Cancel',
                onPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(width: 8),
              VSButton(
                label: 'Book Now',
                onPressed: _selectedRange != null ? _submitBooking : null,
                isLoading: _isLoading,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _submitBooking() async {
    setState(() => _isLoading = true);
    try {
      // Submit booking
      await _processBooking(_selectedRange!);
      Navigator.of(context).pop();
      VSToast.show(
        context: context,
        message: 'Booking confirmed!',
        type: VSToastType.success,
      );
    } catch (e) {
      VSToast.show(
        context: context,
        message: 'Booking failed. Please try again.',
        type: VSToastType.error,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }
}
```

### Report Generation
Date range picker for generating reports with custom formatting.

```dart
class ReportGenerator extends StatefulWidget {
  @override
  _ReportGeneratorState createState() => _ReportGeneratorState();
}

class _ReportGeneratorState extends State<ReportGenerator> {
  final TextEditingController _dateController = TextEditingController();
  DateTimeRange? _selectedRange;
  String _dateFormat = 'MMM dd, yyyy';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VSDateRangePicker(
          title: 'Report Period',
          hint: 'Select period for report',
          controller: _dateController,
          dateShowFormat: _dateFormat,
          initialDateRange: DateTimeRange(
            start: DateTime.now().subtract(const Duration(days: 30)),
            end: DateTime.now(),
          ),
          onRangeSelected: (range) {
            setState(() => _selectedRange = range);
            _generateReport(range);
          },
        ),
        const SizedBox(height: 16),
        VSDropdown(
          label: 'Date Format',
          value: _dateFormat,
          items: const [
            VSDropdownItem(value: 'MMM dd, yyyy', label: 'Dec 25, 2023'),
            VSDropdownItem(value: 'MM/dd/yyyy', label: '12/25/2023'),
            VSDropdownItem(value: 'yyyy-MM-dd', label: '2023-12-25'),
          ],
          onChanged: (value) {
            setState(() => _dateFormat = value!);
            if (_selectedRange != null) {
              _updateControllerText(_selectedRange!);
            }
          },
        ),
      ],
    );
  }

  void _generateReport(DateTimeRange range) {
    // Generate report for the selected date range
  }

  void _updateControllerText(DateTimeRange range) {
    final formatted = '${range.start.toString().split(' ')[0]} - ${range.end.toString().split(' ')[0]}';
    _dateController.text = formatted;
  }
}
```
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

  void _loadAnalyticsData(DateTimeRange range) {
    // Load analytics data for the selected range
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }
}
```

### Travel Booking
Date range picker for flight or hotel bookings.

```dart
class TravelBooking extends StatefulWidget {
  @override
  _TravelBookingState createState() => _TravelBookingState();
}

class _TravelBookingState extends State<TravelBooking> {
  DateTimeRange? _travelDates;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Travel Dates', style: AppTypography.bodyMediumSemibold),
          SizedBox(height: 8),
          VSButton(
            label: _travelDates != null
                ? '${_formatDate(_travelDates!.start)} - ${_formatDate(_travelDates!.end)}'
                : 'Select Travel Dates',
            onPressed: () => _showTravelPicker(context),
            variant: VSButtonVariant.outlined,
            rightIcon: Icons.calendar_today,
          ),
          if (_travelDates != null) ...[
            SizedBox(height: 8),
            Text(
              '${_travelDates!.duration.inDays + 1} days trip',
              style: AppTypography.bodySmallRegular.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showTravelPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.input,
        message: 'Choose your travel dates',
        title: 'Select Travel Dates',
        content: SizedBox(
          height: 400,
          child: VSDateRangePicker(
            minDate: DateTime.now(),
            maxDate: DateTime.now().add(const Duration(days: 365)),
            onRangeSelected: (range) {
              setState(() => _travelDates = range);
              Navigator.of(context).pop();
              // Search for flights/hotels
              _searchAvailability(range);
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

  void _searchAvailability(DateTimeRange range) {
    // Search for available travel options
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }
}
```

### Project Timeline Management
Date range picker for project planning.

```dart
class ProjectTimeline extends StatefulWidget {
  @override
  _ProjectTimelineState createState() => _ProjectTimelineState();
}

class _ProjectTimelineState extends State<ProjectTimeline> {
  DateTimeRange _projectTimeline = DateTimeRange(
    start: DateTime(2024, 3, 1),
    end: DateTime(2024, 6, 30),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Project Timeline', style: AppTypography.bodyMediumSemibold),
              Spacer(),
              VSBadge(
                label: 'IN PROGRESS',
                variant: VSBadgeVariant.warning,
              ),
            ],
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.neutral100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.flag, color: AppColors.successDefault),
                    SizedBox(width: 8),
                    Text(
                      'Start: ${_formatDate(_projectTimeline.start)}',
                      style: AppTypography.bodySmallRegular,
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.flag_outlined, color: AppColors.dangerDefault),
                    SizedBox(width: 8),
                    Text(
                      'End: ${_formatDate(_projectTimeline.end)}',
                      style: AppTypography.bodySmallRegular,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          VSButton(
            label: 'Adjust Timeline',
            onPressed: () => _showTimelinePicker(context),
            size: VSButtonSize.small,
            variant: VSButtonVariant.outlined,
            leftIcon: Icons.edit_calendar,
          ),
        ],
      ),
    );
  }

  void _showTimelinePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.input,
        message: 'Adjust the project timeline',
        title: 'Project Timeline',
        content: SizedBox(
          height: 400,
          child: VSDateRangePicker(
            initialDateRange: _projectTimeline,
            minDate: DateTime(2024, 1, 1),
            maxDate: DateTime(2024, 12, 31),
            onRangeSelected: (range) {
              setState(() => _projectTimeline = range);
              Navigator.of(context).pop();
              // Update project timeline
              _updateProjectTimeline(range);
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

  void _updateProjectTimeline(DateTimeRange range) {
    // Update project timeline in backend
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }
}
```

### Expense Report Period
Date range picker for financial reporting.

```dart
class ExpenseReport extends StatefulWidget {
  @override
  _ExpenseReportState createState() => _ExpenseReportState();
}

class _ExpenseReportState extends State<ExpenseReport> {
  DateTimeRange _reportPeriod = DateTimeRange(
    start: DateTime(2024, 1, 1),
    end: DateTime(2024, 1, 31),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Expense Report', style: AppTypography.bodyMediumSemibold),
              Spacer(),
              VSBadge(
                label: 'PENDING',
                variant: VSBadgeVariant.danger,
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Report Period', style: AppTypography.bodySmallSemibold),
                    Text(
                      '${_formatDate(_reportPeriod.start)} - ${_formatDate(_reportPeriod.end)}',
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              VSButton(
                label: 'Edit Period',
                onPressed: () => _showPeriodPicker(context),
                size: VSButtonSize.small,
                variant: VSButtonVariant.outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showPeriodPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.input,
        message: 'Select the period for the expense report',
        title: 'Report Period',
        content: SizedBox(
          height: 400,
          child: VSDateRangePicker(
            initialDateRange: _reportPeriod,
            onRangeSelected: (range) {
              setState(() => _reportPeriod = range);
              Navigator.of(context).pop();
              // Reload expense data
              _loadExpenseData(range);
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

  void _loadExpenseData(DateTimeRange range) {
    // Load expense data for the selected period
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }
}
```

## Preset Date Ranges

Create quick selection buttons for common date ranges.

```dart
class PresetDateRanges extends StatefulWidget {
  @override
  _PresetDateRangesState createState() => _PresetDateRangesState();
}

class _PresetDateRangesState extends State<PresetDateRanges> {
  DateTimeRange? _selectedRange;
  String _selectedPreset = 'Custom Range';

  final DateTime _today = DateTime.now();
  late final DateTimeRange _thisWeek;
  late final DateTimeRange _thisMonth;
  late final DateTimeRange _lastMonth;

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Quick Select', style: AppTypography.bodyMediumSemibold),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildPresetButton('This Week', _thisWeek),
            _buildPresetButton('This Month', _thisMonth),
            _buildPresetButton('Last Month', _lastMonth),
            _buildPresetButton('Custom Range', null),
          ],
        ),
        SizedBox(height: 12),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.neutral100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(Icons.calendar_today, size: 16, color: AppColors.textSecondary),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  _selectedRange != null
                      ? '${_formatDate(_selectedRange!.start)} - ${_formatDate(_selectedRange!.end)}'
                      : 'No range selected',
                  style: AppTypography.bodySmallRegular,
                ),
              ),
              if (_selectedRange != null)
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
    );
  }

  Widget _buildPresetButton(String label, DateTimeRange? range) {
    final isSelected = _selectedPreset == label;
    return VSButton(
      label: label,
      onPressed: () {
        setState(() {
          _selectedPreset = label;
          _selectedRange = range;
        });
        if (range != null) {
          // Handle preset selection
          _onRangeSelected(range);
        } else {
          // Show custom picker
          _showCustomPicker(context);
        }
      },
      size: VSButtonSize.small,
      variant: isSelected ? VSButtonVariant.primary : VSButtonVariant.outlined,
    );
  }

  void _showCustomPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.input,
        message: 'Select custom date range',
        content: SizedBox(
          height: 400,
          child: VSDateRangePicker(
            initialDateRange: _selectedRange,
            onRangeSelected: (range) {
              setState(() => _selectedRange = range);
              Navigator.of(context).pop();
              _onRangeSelected(range);
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

  void _onRangeSelected(DateTimeRange range) {
    // Handle range selection
    print('Selected range: $range');
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }
}
```

## Advanced Usage

### Custom Date Picker Dialog
Create a reusable date picker dialog component.

```dart
class DateRangePickerDialog extends StatelessWidget {
  final String title;
  final String message;
  final DateTimeRange? initialRange;
  final DateTime? minDate;
  final DateTime? maxDate;
  final Function(DateTimeRange) onRangeSelected;

  const DateRangePickerDialog({
    required this.title,
    required this.message,
    this.initialRange,
    this.minDate,
    this.maxDate,
    required this.onRangeSelected,
  });

  static Future<void> show(
    BuildContext context, {
    required String title,
    required String message,
    DateTimeRange? initialRange,
    DateTime? minDate,
    DateTime? maxDate,
    required Function(DateTimeRange) onRangeSelected,
  }) {
    return showDialog(
      context: context,
      builder: (context) => DateRangePickerDialog(
        title: title,
        message: message,
        initialRange: initialRange,
        minDate: minDate,
        maxDate: maxDate,
        onRangeSelected: onRangeSelected,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return VSDialog(
      type: VSDialogType.input,
      message: message,
      title: title,
      content: SizedBox(
        height: 400,
        child: VSDateRangePicker(
          initialDateRange: initialRange,
          minDate: minDate,
          maxDate: maxDate,
          onRangeSelected: (range) {
            Navigator.of(context).pop();
            onRangeSelected(range);
          },
        ),
      ),
      actions: [
        VSDialogAction(
          label: 'Cancel',
          onPressed: () {},
        ),
      ],
    );
  }
}

// Usage
VSButton(
  label: 'Select Date Range',
  onPressed: () => DateRangePickerDialog.show(
    context,
    title: 'Select Date Range',
    message: 'Choose the date range for your report',
    initialRange: DateTimeRange(
      start: DateTime.now().subtract(const Duration(days: 7)),
      end: DateTime.now(),
    ),
    onRangeSelected: (range) {
      // Handle selection
    },
  ),
)
```

### Date Range with Validation
Add validation logic to date range selection.

```dart
class ValidatedDateRangePicker extends StatefulWidget {
  final Function(DateTimeRange)? onValidRangeSelected;
  final int maxDays;

  const ValidatedDateRangePicker({
    this.onValidRangeSelected,
    this.maxDays = 30,
  });

  @override
  _ValidatedDateRangePickerState createState() => _ValidatedDateRangePickerState();
}

class _ValidatedDateRangePickerState extends State<ValidatedDateRangePicker> {
  DateTimeRange? _selectedRange;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VSDateRangePicker(
          onRangeSelected: _validateAndSelectRange,
        ),
        if (_errorMessage != null) ...[
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.dangerBg.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: AppColors.dangerDefault.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                Icon(Icons.error, size: 16, color: AppColors.dangerDefault),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _errorMessage!,
                    style: AppTypography.bodySmallRegular.copyWith(
                      color: AppColors.dangerDefault,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        if (_selectedRange != null) ...[
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.successBg.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: AppColors.successDefault.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                Icon(Icons.check_circle, size: 16, color: AppColors.successDefault),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Valid range selected: ${_formatDate(_selectedRange!.start)} - ${_formatDate(_selectedRange!.end)}',
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
    );
  }

  void _validateAndSelectRange(DateTimeRange range) {
    final days = range.duration.inDays + 1;

    if (days > widget.maxDays) {
      setState(() {
        _errorMessage = 'Date range cannot exceed ${widget.maxDays} days';
        _selectedRange = null;
      });
    } else if (range.start.isAfter(range.end)) {
      setState(() {
        _errorMessage = 'Start date must be before end date';
        _selectedRange = null;
      });
    } else {
      setState(() {
        _selectedRange = range;
        _errorMessage = null;
      });
      widget.onValidRangeSelected?.call(range);
    }
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }
}
```

## API Reference

### Constructor Parameters

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `hint` | `String` | Yes | - | The hint text displayed in the input field |
| `controller` | `TextEditingController` | Yes | - | Controller for the input field text |
| `title` | `String?` | No | `null` | Title text displayed above the input field |
| `placeHolder` | `String?` | No | `null` | Placeholder text when no date is selected |
| `require` | `bool` | No | `false` | Whether this field is required |
| `enable` | `bool` | No | `true` | Whether the field is enabled for interaction |
| `isLoading` | `bool` | No | `false` | Whether to show loading state |
| `loadingDesc` | `String?` | No | `null` | Description text shown during loading |
| `errorNotes` | `String?` | No | `null` | Error message displayed as tooltip |
| `startDate` | `DateTime?` | No | `null` | Earliest selectable date |
| `endDate` | `DateTime?` | No | `null` | Latest selectable date |
| `initialDateRange` | `DateTimeRange?` | No | `null` | Initially selected date range |
| `minDate` | `DateTime?` | No | `null` | Minimum selectable date |
| `maxDate` | `DateTime?` | No | `null` | Maximum selectable date |
| `dateSaveCallBack` | `Function(DateTimeRange?)?` | No | `null` | Called when date range is saved |
| `dateValidatorFunction` | `Function(DateTimeRange?)?` | No | `null` | Function to validate selected range |
| `onDateChanged` | `ValueChanged<DateTimeRange>?` | No | `null` | Called when date range changes |
| `onClear` | `Function()?` | No | `null` | Called when clear button is pressed |
| `flex` | `int?` | No | `null` | Flex factor for expanded layout |
| `padding` | `EdgeInsets` | No | `EdgeInsets.zero` | Padding around the widget |
| `contentPadding` | `EdgeInsets?` | No | `null` | Padding inside the input field |
| `height` | `double?` | No | `null` | Height of the input field |
| `dateShowFormat` | `String` | No | `"yyyy-MM-dd"` | Format for displaying dates |
| `onRangeSelected` | `ValueChanged<DateTimeRange>?` | No | `null` | Called when range is selected |
| `onStartDateChanged` | `ValueChanged<DateTime>?` | No | `null` | Called when start date changes |
| `onEndDateChanged` | `ValueChanged<DateTime>?` | No | `null` | Called when end date changes |
| `currentDate` | `DateTime?` | No | `null` | Current date for highlighting |

### Callback Functions

- **`onRangeSelected(DateTimeRange range)`**: Called when user selects a date range
- **`onDateChanged(DateTimeRange range)`**: Called when the selected range changes
- **`dateSaveCallBack(DateTimeRange? range)`**: Called when range is saved/confirmed
- **`dateValidatorFunction(DateTimeRange? range)`**: Returns validation error message or null
- **`onClear()`**: Called when clear button is pressed

### VSDateRangePickerWithActions

Helper widget that wraps the picker with confirm/cancel buttons.

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `initialDateRange` | `DateTimeRange?` | No | `null` | Initially selected date range |
| `minDate` | `DateTime?` | No | `null` | Minimum selectable date |
| `maxDate` | `DateTime?` | No | `null` | Maximum selectable date |
| `onConfirm` | `ValueChanged<DateTimeRange>?` | No | `null` | Called when user confirms selection |
| `onCancel` | `VoidCallback?` | No | `null` | Called when user cancels |
| `cancelLabel` | `String` | No | `"Cancel"` | Label for cancel button |
| `confirmLabel` | `String` | No | `"Confirm"` | Label for confirm button |
| `showActions` | `bool` | No | `true` | Whether to show action buttons |

## Accessibility

The VS Date Range Picker component includes comprehensive accessibility features:
- Proper ARIA labels for calendar elements
- Keyboard navigation support (arrow keys, enter, escape)
- Screen reader announcements for date selection
- Focus management and visual focus indicators
- Semantic markup for calendar structure

## Design Guidelines

- Use clear, descriptive labels for date range selections
- Provide visual feedback for selected ranges
- Consider date format localization
- Test with different screen sizes and orientations
- Ensure adequate touch targets for mobile devices
- Provide clear validation messages for invalid selections
- Consider users with motor impairments when designing interactions

## Related Components

- **VS Button**: For triggering date picker dialogs
- **VS Dialog**: For displaying date picker in modal context
- **VS Input Field**: For manual date entry alternatives
- **VS Badge**: For displaying selected date information</content>
<parameter name="filePath">c:\vs_design_system\lib\markdown2\VS_DATE_RANGE_PICKER_IMPLEMENTATION.md