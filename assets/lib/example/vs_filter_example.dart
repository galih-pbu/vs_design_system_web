import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSFilterExample extends StatefulWidget {
  const VSFilterExample({super.key});

  @override
  State<VSFilterExample> createState() => _VSFilterExampleState();
}

class _VSFilterExampleState extends State<VSFilterExample> {
  // Filter states
  bool _isStatusFilterActive = false;
  bool _isPriorityFilterActive = false;
  bool _isAssigneeFilterActive = false;
  bool _isDateFilterActive = false;
  bool _isCategoryFilterActive = false;

  // Selected values
  DateTimeRange? _selectedDateRange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Filter Examples',
      //   actions: [
      //     VSButton(
      //       label: 'Info',
      //       onPressed: () => _showFilterInfo(context),
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
              title: 'VS Filter Variants & Types',
              description: 'Comprehensive demonstration of filter configurations, date pickers, and interactive examples',
              child: _buildFilterShowcase(),
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

  Widget _buildFilterShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic Filter Examples
        _buildFilterGroup(
          title: 'Basic Filter Configurations',
          description: 'Standard filter panels with different item types and states',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton(
                  label: 'Basic Filter',
                  onPressed: () => _showBasicFilterDemo(context),
                  variant: VSButtonVariant.primary,
                ),
                VSButton(
                  label: 'Filter with State',
                  onPressed: () => _showFilterWithStateDemo(context),
                  variant: VSButtonVariant.secondary,
                ),
                VSButton(
                  label: 'Interactive Filter',
                  onPressed: () => _showInteractiveFilterDemo(context),
                  variant: VSButtonVariant.outlined,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Date Picker Examples
        _buildFilterGroup(
          title: 'Date Picker Configurations',
          description: 'Date range picker with calendar interface and different configurations',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton(
                  label: 'Basic Date Picker',
                  onPressed: () => _showBasicDatePickerDemo(context),
                  variant: VSButtonVariant.primary,
                  leftIcon: Icons.calendar_today,
                ),
                VSButton(
                  label: 'Pre-selected Range',
                  onPressed: () => _showPreselectedDatePickerDemo(context),
                  variant: VSButtonVariant.secondary,
                  leftIcon: Icons.date_range,
                ),
                VSButton(
                  label: 'Custom Title',
                  onPressed: () => _showCustomDatePickerDemo(context),
                  variant: VSButtonVariant.outlined,
                  leftIcon: Icons.edit_calendar,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Combined Filter Examples
        _buildFilterGroup(
          title: 'Combined Filter & Date Picker',
          description: 'Integrated filter panels with date selection for comprehensive filtering',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton(
                  label: 'Task Filters',
                  onPressed: () => _showTaskFiltersDemo(context),
                  variant: VSButtonVariant.primary,
                  leftIcon: Icons.task,
                ),
                VSButton(
                  label: 'Project Filters',
                  onPressed: () => _showProjectFiltersDemo(context),
                  variant: VSButtonVariant.secondary,
                  leftIcon: Icons.folder,
                ),
                VSButton(
                  label: 'Analytics Filters',
                  onPressed: () => _showAnalyticsFiltersDemo(context),
                  variant: VSButtonVariant.outlined,
                  leftIcon: Icons.analytics,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Real-world Usage Examples
        _buildFilterGroup(
          title: 'Real-world Usage Examples',
          description: 'Common filter patterns in application interfaces',
          children: [
            // Task Management Dashboard
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
                    'Task Management Dashboard',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Icon(Icons.task_alt, color: AppColors.primaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text('Sprint Planning Board', style: AppTypography.bodyMediumRegular),
                      const Spacer(),
                      const VSBadge(
                        label: '8 ACTIVE FILTERS',
                        variant: VSBadgeVariant.primary,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSChip(
                        label: 'Status: Open',
                        type: VSChipType.color,
                        variant: VSChipVariant.primary,
                      ),
                      VSChip(
                        label: 'Priority: High',
                        type: VSChipType.color,
                        variant: VSChipVariant.danger,
                      ),
                      VSChip(
                        label: 'Assignee: Alice',
                        type: VSChipType.color,
                        variant: VSChipVariant.secondary,
                      ),
                      VSChip(
                        label: 'Due: This Week',
                        type: VSChipType.color,
                        variant: VSChipVariant.warning,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSButton(
                    label: 'Advanced Filters',
                    onPressed: () => _showTaskManagementFilters(context),
                    size: VSButtonSize.small,
                    variant: VSButtonVariant.outlined,
                    width: double.infinity,
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // E-commerce Product Filters
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
                    'E-commerce Product Catalog',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Icon(Icons.shopping_bag, color: AppColors.secondaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text('Product Filters', style: AppTypography.bodyMediumRegular),
                      const Spacer(),
                      const VSBadge(
                        label: '5 FILTERS',
                        variant: VSBadgeVariant.secondary,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSChip(
                        label: 'Price: \$50 - \$200',
                        type: VSChipType.color,
                        variant: VSChipVariant.success,
                      ),
                      VSChip(
                        label: 'Category: Electronics',
                        type: VSChipType.color,
                        variant: VSChipVariant.primary,
                      ),
                      VSChip(
                        label: 'Rating: 4+ stars',
                        type: VSChipType.color,
                        variant: VSChipVariant.warning,
                      ),
                      VSChip(
                        label: 'Brand: Samsung',
                        type: VSChipType.color,
                        variant: VSChipVariant.neutral,
                      ),
                      VSChip(
                        label: 'In Stock',
                        type: VSChipType.color,
                        variant: VSChipVariant.success,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSButton(
                    label: 'More Filters',
                    onPressed: () => _showEcommerceFilters(context),
                    size: VSButtonSize.small,
                    variant: VSButtonVariant.outlined,
                    width: double.infinity,
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

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
                  Text(
                    'Analytics Dashboard',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Icon(Icons.analytics, color: AppColors.warningDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text('Performance Metrics', style: AppTypography.bodyMediumRegular),
                      const Spacer(),
                      const VSBadge(
                        label: 'DATE RANGE',
                        variant: VSBadgeVariant.warning,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSChip(
                        label: 'Last 30 days',
                        type: VSChipType.color,
                        variant: VSChipVariant.primary,
                      ),
                      VSChip(
                        label: 'Revenue',
                        type: VSChipType.color,
                        variant: VSChipVariant.success,
                      ),
                      VSChip(
                        label: 'Users',
                        type: VSChipType.color,
                        variant: VSChipVariant.secondary,
                      ),
                      VSChip(
                        label: 'Conversion Rate',
                        type: VSChipType.color,
                        variant: VSChipVariant.warning,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSButton(
                    label: 'Custom Date Range',
                    onPressed: () => _showAnalyticsFilters(context),
                    size: VSButtonSize.small,
                    variant: VSButtonVariant.outlined,
                    width: double.infinity,
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Customer Support Tickets
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
                    'Customer Support System',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Icon(Icons.support_agent, color: AppColors.dangerDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text('Support Tickets', style: AppTypography.bodyMediumRegular),
                      const Spacer(),
                      const VSBadge(
                        label: '12 TICKETS',
                        variant: VSBadgeVariant.danger,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSChip(
                        label: 'Status: Open',
                        type: VSChipType.color,
                        variant: VSChipVariant.danger,
                      ),
                      VSChip(
                        label: 'Priority: High',
                        type: VSChipType.color,
                        variant: VSChipVariant.warning,
                      ),
                      VSChip(
                        label: 'Type: Bug Report',
                        type: VSChipType.color,
                        variant: VSChipVariant.neutral,
                      ),
                      VSChip(
                        label: 'Agent: Unassigned',
                        type: VSChipType.color,
                        variant: VSChipVariant.secondary,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSButton(
                    label: 'Filter Tickets',
                    onPressed: () => _showSupportFilters(context),
                    size: VSButtonSize.small,
                    variant: VSButtonVariant.outlined,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFilterGroup({
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

  void _showBasicFilterDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: VSFilter(
          items: [
            VSFilterItem(
              id: 'status',
              label: 'Status',
              icon: Icons.flag,
              onChanged: (selected) {
                setState(() => _isStatusFilterActive = selected);
              },
            ),
            VSFilterItem(
              id: 'priority',
              label: 'Priority',
              icon: Icons.priority_high,
              onChanged: (selected) {
                setState(() => _isPriorityFilterActive = selected);
              },
            ),
            VSFilterItem(
              id: 'assignee',
              label: 'Assignee',
              icon: Icons.person,
              onChanged: (selected) {
                setState(() => _isAssigneeFilterActive = selected);
              },
            ),
          ],
          onReset: () {
            setState(() {
              _isStatusFilterActive = false;
              _isPriorityFilterActive = false;
              _isAssigneeFilterActive = false;
            });
          },
        ),
      ),
    );
  }

  void _showFilterWithStateDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSFilter(
              items: [
                VSFilterItem(
                  id: 'status',
                  label: 'Status',
                  icon: Icons.flag,
                  onChanged: (selected) {
                    setState(() => _isStatusFilterActive = selected);
                  },
                ),
                VSFilterItem(
                  id: 'priority',
                  label: 'Priority',
                  icon: Icons.priority_high,
                  onChanged: (selected) {
                    setState(() => _isPriorityFilterActive = selected);
                  },
                ),
                VSFilterItem(
                  id: 'date',
                  label: 'Date Range',
                  icon: Icons.calendar_today,
                  onChanged: (selected) {
                    setState(() => _isDateFilterActive = selected);
                  },
                ),
              ],
              onReset: () {
                setState(() {
                  _isStatusFilterActive = false;
                  _isPriorityFilterActive = false;
                  _isDateFilterActive = false;
                });
              },
            ),
            SizedBox(width: AppSpacing.md),
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral0,
                border: Border.all(color: AppColors.neutral300),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Filter State:', style: AppTypography.bodyMediumSemibold),
                  SizedBox(height: AppSpacing.sm),
                  Text('Status: ${_isStatusFilterActive ? 'Active' : 'Inactive'}'),
                  Text('Priority: ${_isPriorityFilterActive ? 'Active' : 'Inactive'}'),
                  Text('Assignee: ${_isAssigneeFilterActive ? 'Active' : 'Inactive'}'),
                  Text('Date: ${_isDateFilterActive ? 'Active' : 'Inactive'}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showInteractiveFilterDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: StatefulBuilder(
          builder: (context, setState) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                VSFilter(
                  items: [
                    VSFilterItem(
                      id: 'category',
                      label: 'Category',
                      icon: Icons.category,
                      onChanged: (selected) {
                        this.setState(() => _isCategoryFilterActive = selected);
                        setState(() {});
                      },
                    ),
                    VSFilterItem(
                      id: 'status',
                      label: 'Status',
                      icon: Icons.flag,
                      onChanged: (selected) {
                        this.setState(() => _isStatusFilterActive = selected);
                        setState(() {});
                      },
                    ),
                    VSFilterItem(
                      id: 'priority',
                      label: 'Priority',
                      icon: Icons.priority_high,
                      onChanged: (selected) {
                        this.setState(() => _isPriorityFilterActive = selected);
                        setState(() {});
                      },
                    ),
                  ],
                  onReset: () {
                    this.setState(() {
                      _isCategoryFilterActive = false;
                      _isStatusFilterActive = false;
                      _isPriorityFilterActive = false;
                    });
                    setState(() {});
                  },
                ),
                SizedBox(width: AppSpacing.md),
                Container(
                  width: 200,
                  padding: EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.neutral0,
                    border: Border.all(color: AppColors.neutral300),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Active Filters:', style: AppTypography.bodyMediumSemibold),
                      SizedBox(height: AppSpacing.sm),
                      if (_isCategoryFilterActive)
                        VSChip(
                          label: 'Category Filter',
                          type: VSChipType.color,
                          variant: VSChipVariant.primary,
                        ),
                      if (_isStatusFilterActive)
                        VSChip(
                          label: 'Status Filter',
                          type: VSChipType.color,
                          variant: VSChipVariant.secondary,
                        ),
                      if (_isPriorityFilterActive)
                        VSChip(
                          label: 'Priority Filter',
                          type: VSChipType.color,
                          variant: VSChipVariant.warning,
                        ),
                      if (!_isCategoryFilterActive && !_isStatusFilterActive && !_isPriorityFilterActive && !_isAssigneeFilterActive)
                        Text('No filters active', style: AppTypography.bodySmallRegular),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showBasicDatePickerDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: VSFilterDatePicker(
          title: 'Select Date Range',
          placeholder: 'Choose start and end dates',
          onDateRangeChanged: (range) {
            setState(() => _selectedDateRange = range);
          },
        ),
      ),
    );
  }

  void _showPreselectedDatePickerDemo(BuildContext context) {
    final now = DateTime.now();
    final lastWeek = now.subtract(const Duration(days: 7));

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: VSFilterDatePicker(
          title: 'Last Week',
          placeholder: 'Pre-selected date range',
          initialDateRange: DateTimeRange(start: lastWeek, end: now),
          onDateRangeChanged: (range) {
            setState(() => _selectedDateRange = range);
          },
        ),
      ),
    );
  }

  void _showCustomDatePickerDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: VSFilterDatePicker(
          title: 'Custom Report Period',
          placeholder: 'Select reporting period',
          onDateRangeChanged: (range) {
            setState(() => _selectedDateRange = range);
          },
        ),
      ),
    );
  }

  void _showTaskFiltersDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSFilter(
              items: [
                VSFilterItem(
                  id: 'status',
                  label: 'Status',
                  icon: Icons.flag,
                ),
                VSFilterItem(
                  id: 'priority',
                  label: 'Priority',
                  icon: Icons.priority_high,
                ),
                VSFilterItem(
                  id: 'assignee',
                  label: 'Assignee',
                  icon: Icons.person,
                ),
                VSFilterItem(
                  id: 'category',
                  label: 'Category',
                  icon: Icons.category,
                ),
              ],
            ),
            SizedBox(width: AppSpacing.md),
            VSFilterDatePicker(
              title: 'Due Date',
              placeholder: 'Select due date range',
            ),
          ],
        ),
      ),
    );
  }

  void _showProjectFiltersDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSFilter(
              items: [
                VSFilterItem(
                  id: 'status',
                  label: 'Project Status',
                  icon: Icons.folder,
                ),
                VSFilterItem(
                  id: 'type',
                  label: 'Project Type',
                  icon: Icons.build,
                ),
                VSFilterItem(
                  id: 'team',
                  label: 'Team',
                  icon: Icons.group,
                ),
                VSFilterItem(
                  id: 'budget',
                  label: 'Budget Range',
                  icon: Icons.attach_money,
                ),
              ],
            ),
            SizedBox(width: AppSpacing.md),
            VSFilterDatePicker(
              title: 'Project Timeline',
              placeholder: 'Select project dates',
            ),
          ],
        ),
      ),
    );
  }

  void _showAnalyticsFiltersDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSFilter(
              items: [
                VSFilterItem(
                  id: 'metric',
                  label: 'Metrics',
                  icon: Icons.analytics,
                ),
                VSFilterItem(
                  id: 'segment',
                  label: 'User Segment',
                  icon: Icons.people,
                ),
                VSFilterItem(
                  id: 'source',
                  label: 'Traffic Source',
                  icon: Icons.traffic,
                ),
                VSFilterItem(
                  id: 'device',
                  label: 'Device Type',
                  icon: Icons.devices,
                ),
              ],
            ),
            SizedBox(width: AppSpacing.md),
            VSFilterDatePicker(
              title: 'Analytics Period',
              placeholder: 'Select date range',
            ),
          ],
        ),
      ),
    );
  }

  void _showTaskManagementFilters(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSFilter(
              items: [
                VSFilterItem(
                  id: 'status',
                  label: 'Status',
                  icon: Icons.flag,
                  onChanged: (selected) => setState(() => _isStatusFilterActive = selected),
                ),
                VSFilterItem(
                  id: 'priority',
                  label: 'Priority',
                  icon: Icons.priority_high,
                  onChanged: (selected) => setState(() => _isPriorityFilterActive = selected),
                ),
                VSFilterItem(
                  id: 'assignee',
                  label: 'Assignee',
                  icon: Icons.person,
                  onChanged: (selected) => setState(() => _isAssigneeFilterActive = selected),
                ),
                VSFilterItem(
                  id: 'category',
                  label: 'Category',
                  icon: Icons.category,
                  onChanged: (selected) => setState(() => _isCategoryFilterActive = selected),
                ),
              ],
              onReset: () => setState(() {
                _isStatusFilterActive = false;
                _isPriorityFilterActive = false;
                _isAssigneeFilterActive = false;
                _isCategoryFilterActive = false;
              }),
            ),
            SizedBox(width: AppSpacing.md),
            VSFilterDatePicker(
              title: 'Due Date Range',
              placeholder: 'Filter by due dates',
              onDateRangeChanged: (range) => setState(() => _selectedDateRange = range),
            ),
          ],
        ),
      ),
    );
  }

  void _showEcommerceFilters(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSFilter(
              items: [
                VSFilterItem(
                  id: 'category',
                  label: 'Category',
                  icon: Icons.category,
                ),
                VSFilterItem(
                  id: 'price',
                  label: 'Price Range',
                  icon: Icons.attach_money,
                ),
                VSFilterItem(
                  id: 'brand',
                  label: 'Brand',
                  icon: Icons.business,
                ),
                VSFilterItem(
                  id: 'rating',
                  label: 'Rating',
                  icon: Icons.star,
                ),
                VSFilterItem(
                  id: 'availability',
                  label: 'Availability',
                  icon: Icons.inventory,
                ),
              ],
            ),
            SizedBox(width: AppSpacing.md),
            VSFilterDatePicker(
              title: 'Added Date',
              placeholder: 'Filter by date added',
            ),
          ],
        ),
      ),
    );
  }

  void _showAnalyticsFilters(BuildContext context) {
    final now = DateTime.now();
    final lastMonth = now.subtract(const Duration(days: 30));

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSFilter(
              items: [
                VSFilterItem(
                  id: 'metrics',
                  label: 'Metrics',
                  icon: Icons.analytics,
                ),
                VSFilterItem(
                  id: 'users',
                  label: 'User Segments',
                  icon: Icons.people,
                ),
                VSFilterItem(
                  id: 'traffic',
                  label: 'Traffic Sources',
                  icon: Icons.traffic,
                ),
                VSFilterItem(
                  id: 'devices',
                  label: 'Device Types',
                  icon: Icons.devices,
                ),
              ],
            ),
            SizedBox(width: AppSpacing.md),
            VSFilterDatePicker(
              title: 'Report Period',
              placeholder: 'Select analytics period',
              initialDateRange: DateTimeRange(start: lastMonth, end: now),
            ),
          ],
        ),
      ),
    );
  }

  void _showSupportFilters(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSFilter(
              items: [
                VSFilterItem(
                  id: 'status',
                  label: 'Ticket Status',
                  icon: Icons.flag,
                ),
                VSFilterItem(
                  id: 'priority',
                  label: 'Priority Level',
                  icon: Icons.priority_high,
                ),
                VSFilterItem(
                  id: 'type',
                  label: 'Issue Type',
                  icon: Icons.bug_report,
                ),
                VSFilterItem(
                  id: 'agent',
                  label: 'Assigned Agent',
                  icon: Icons.support_agent,
                ),
                VSFilterItem(
                  id: 'customer',
                  label: 'Customer Type',
                  icon: Icons.person,
                ),
              ],
            ),
            SizedBox(width: AppSpacing.md),
            VSFilterDatePicker(
              title: 'Created Date',
              placeholder: 'Filter by creation date',
            ),
          ],
        ),
      ),
    );
  }

  void _showActionDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.confirmation,
        message: message,
        actions: [
          VSDialogAction(
            label: 'OK',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  void _showFilterInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'VS Filter Information',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The VS Filter component provides flexible filtering interfaces with collapsible panels and date range selection.',
              style: AppTypography.bodyMediumRegular,
            ),
            SizedBox(height: AppSpacing.md),
            Text(
              'Key Features:',
              style: AppTypography.bodyMediumSemibold,
            ),
            SizedBox(height: AppSpacing.sm),
            Text(
              '• VSFilter: Collapsible filter panel with selectable items\n'
              '• VSFilterItem: Individual filter options with icons and labels\n'
              '• VSFilterDatePicker: Calendar-based date range selection\n'
              '• Reset functionality: Clear all active filters\n'
              '• State management: Track active filters and selections\n'
              '• VS Design System: Consistent styling and theming\n'
              '• Interactive feedback: Visual selection indicators\n'
              '• Flexible layout: Side-by-side filter and date picker combinations\n'
              '• Accessibility: Keyboard navigation and screen reader support',
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