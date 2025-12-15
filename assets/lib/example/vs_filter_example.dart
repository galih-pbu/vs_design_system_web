import 'package:flutter/material.dart';
import 'package:vs_design_system/shared/models/drop_down_obj_model.dart';
import 'package:vs_design_system/vs_design_system.dart';
 
class VSFilterExample extends StatefulWidget {
  const VSFilterExample({super.key});

  @override
  State<VSFilterExample> createState() => _VSFilterExampleState();
}

class _VSFilterExampleState extends State<VSFilterExample> {
  // Data untuk filter biasa
  final List<VSFilterMenuItem> lsFilterMenuItem = [
    VSFilterMenuItem(
      icon: VSIcon(name: VSIcons.user, size: 16),
      title: 'Status',
      lsItem: [
        DropDownObj(id: '1', descs: 'Active'),
        DropDownObj(id: '2', descs: 'Inactive'),
        DropDownObj(id: '3', descs: 'Pending'),
      ],
      isMultiSelect: false,
    ),
    VSFilterMenuItem(
      icon: VSIcon(name: VSIcons.filterFunnel, size: 16),
      title: 'Category',
      lsItem: [
        DropDownObj(id: '1', descs: 'Technology'),
        DropDownObj(id: '2', descs: 'Business'),
        DropDownObj(id: '3', descs: 'Design'),
        DropDownObj(id: '4', descs: 'Marketing'),
      ],
      isMultiSelect: true,
      withSearch: true,
      searchBarTitle: 'Search category...',
    ),
  ];

  final List<VSCustomFilterMenuItem> lsCustomFilterMenuItem = [
    VSCustomFilterMenuItem(
      icon: VSIcon(name: VSIcons.calendar, size: 16),
      title: 'Date Range',
      contentBuilder: (closePopup, filtered, lsNotifier) => Builder(
        builder: (context) => Container(
          padding: const EdgeInsets.all(16),
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Custom Date Filter'),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      VSToastService.showToast(
                        context,
                        title: 'Cancelled',
                        description: 'Filter cancelled',
                        type: VSToastType.info,
                      );
                      // closePopup();
                    },
                    child: Text(
                      'Cancel',
                      style: AppTypography.bodySmallRegular.copyWith(color: AppColors.textSecondary),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Custom filter logic here
                      VSToastService.showToast(
                        context,
                        title: 'Applied',
                        description: 'Filter applied successfully',
                        type: VSToastType.success,
                      );
                      // closePopup();
                    },
                    child: Text(
                      'Apply',
                      style: AppTypography.bodySmallRegular.copyWith(color: AppColors.successDefault),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  ];

  // Data untuk filter advance
  final ValueNotifier<List<VSFilterItem>?> statusNotifier = ValueNotifier([
    VSFilterItem(name: 'Active', id: 'active'),
    VSFilterItem(name: 'Inactive', id: 'inactive'),
    VSFilterItem(name: 'Pending', id: 'pending'),
  ]);

  final ValueNotifier<List<VSFilterItem>?> categoryNotifier = ValueNotifier([
    VSFilterItem(name: 'Technology', id: 'tech'),
    VSFilterItem(name: 'Business', id: 'business'),
    VSFilterItem(name: 'Design', id: 'design'),
    VSFilterItem(name: 'Marketing', id: 'marketing'),
  ]);

  final List<VSFilterMenuItem2> advancedFilterItems = [];

  @override
  void initState() {
    super.initState();
    advancedFilterItems.addAll([
      VSFilterMenuItem2(
        icon: VSIcon(name: VSIcons.user, size: 16),
        title: 'Status',
        lsItemNotifier: statusNotifier,
        isMultiSelect: false,
        searchBarTitle: 'Search status...',
      ),
      VSFilterMenuItem2(
        icon: VSIcon(name: VSIcons.filterFunnel, size: 16),
        title: 'Category',
        lsItemNotifier: categoryNotifier,
        isMultiSelect: true,
        sortItem: true,
        searchBarTitle: 'Search category...',
      ),
      VSDateFilterMenuItem(
        icon: VSIcon(name: VSIcons.calendar, size: 16),
        title: 'Created Date',
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2030),
      ),
      VSDateRangeFilterMenuItem(
        icon: VSIcon(name: VSIcons.calendar, size: 16),
        title: 'Date Range',
        initialDateRange: DateTimeRange(
          start: DateTime.now().subtract(const Duration(days: 30)),
          end: DateTime.now(),
        ),
        startDate: DateTime(2020),
        endDate: DateTime(2030),
      ),
    ]);
  }

  void _onApplyAdvancedFilter() {
    // Handle advanced filter apply
    VSToastService.showToast(
      context,
      title: 'Applied',
      description: 'Advanced filter applied successfully',
      type: VSToastType.success,
    );
  }

  void _onResetBasicFilter() {
    // Handle basic filter reset
    VSToastService.showToast(
      context,
      title: 'Reset',
      description: 'Basic filter has been reset',
      type: VSToastType.warning,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: 'VS Filter Showcase',
              description: 'Comprehensive demonstration of all filter components and their usage',
              child: _buildFilterShowcase(context),
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
            color: AppColors.neutral600,
          ),
        ),
        SizedBox(height: AppSpacing.md),
        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.neutral300),
            borderRadius: BorderRadius.circular(AppSpacing.sm),
          ),
          child: child,
        ),
      ],
    );
  }

  Widget _buildFilterShowcase(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic Filter Section
        const Text(
          'Basic Filter (VSFilterButton)',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        const Text(
          'Simple filter with dropdown selection and custom filter support',
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            VSFilterButton(
              lsFilterMenuItem: lsFilterMenuItem,
              lsCustomFilterMenuItem: lsCustomFilterMenuItem,
              resetCallback: _onResetBasicFilter,
            ),
            const SizedBox(width: 16),
            const Text('Click to see filter options'),
          ],
        ),
        const SizedBox(height: 16),
        _buildFeatureList([
          'Single and multi-select options',
          'Search functionality',
          'Custom filter content',
          'Reset functionality',
          'Real-time filter indicators',
        ]),

        const SizedBox(height: AppSpacing.xl),

        // Advanced Filter Section
        const Text(
          'Advanced Filter (VSParentFilterGroup)',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        const Text(
          'Advanced filter with apply/cancel actions, date filters, and reactive updates',
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            VSParentFilterGroup(
              applyCallback: _onApplyAdvancedFilter,
              children: advancedFilterItems,
            ),
            const SizedBox(width: 16),
            const Text('Click to see advanced filter options'),
          ],
        ),
        const SizedBox(height: 16),
        _buildFeatureList([
          'Apply/Cancel actions',
          'Reactive state management',
          'Date and date range filters',
          'Sorting and search',
          'Persistent filter state',
        ]),
      ],
    );
  }

  Widget _buildFeatureList(List<String> features) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: features
          .map((feature) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  children: [
                    const Text('• ', style: TextStyle(color: Colors.green)),
                    Expanded(
                      child: Text(
                        feature,
                        style: AppTypography.bodySmallRegular,
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}