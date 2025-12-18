import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSPageViewExample extends StatefulWidget {
  const VSPageViewExample({super.key});

  @override
  State<VSPageViewExample> createState() => _VSPageViewExampleState();
}

class _VSPageViewExampleState extends State<VSPageViewExample> {
  // Filter state management using ValueNotifier (matching reference pattern)
  final ValueNotifier<List<VSFilterItem>?> statusNotifier = ValueNotifier([
    VSFilterItem(name: 'Active', id: 'active'),
    VSFilterItem(name: 'Inactive', id: 'inactive'),
  ]);

  final ValueNotifier<List<VSFilterItem>?> categoryNotifier = ValueNotifier([
    VSFilterItem(name: 'Electronics', id: 'electronics'),
    VSFilterItem(name: 'Clothing', id: 'clothing'),
    VSFilterItem(name: 'Books', id: 'books'),
  ]);

  // Filter widget method (following reference pattern from invoice_page.dart)
  Widget filterWidget() {
    return VSParentFilterGroup(
      applyCallback: () {
        VSToastService.showToast(
          context,
          title: 'Applied',
          description: 'Page view filter applied successfully',
          type: VSToastType.success,
        );
      },
      children: [
        VSFilterMenuItem2(
          icon: VSIcon(name: VSIcons.user, size: 16),
          title: 'Status',
          lsItemNotifier: statusNotifier,
          isMultiSelect: false,
        ),
        VSFilterMenuItem2(
          icon: VSIcon(name: VSIcons.filterFunnel, size: 16),
          title: 'Category',
          lsItemNotifier: categoryNotifier,
          isMultiSelect: true,
        ),
        VSDateFilterMenuItem(
          icon: VSIcon(name: VSIcons.calendar, size: 16),
          title: 'Created Date',
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2025),
        ),
      ],
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
              title: 'VS Page View Examples',
              description: 'Comprehensive demonstration of page view widget with various configurations using design system components',
              child: _buildPageViewShowcase(context),
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

  Widget _buildPageViewShowcase(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic Page View
        _buildPageViewGroup(
          title: 'Basic Page View',
          description: 'Simple page view with title and table content using design system components',
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.neutral300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: VSPageView(
              isMobile: false,
              title: 'Basic Page View',
              tableContent: _buildSampleTable(context),
            ),
          ),
        ),

        SizedBox(height: AppSpacing.lg),

        // Page View with Search
        _buildPageViewGroup(
          title: 'Page View with Search',
          description: 'Page view including search functionality and info bar',
          child: Column(
            children: [
              VSInfoBar(
                message: 'Use the search functionality to filter results in real-time',
                type: VSInfoBarType.info,
              ),
              SizedBox(height: AppSpacing.md),
              Container(
                height: 400,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.neutral300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: VSPageView(
                  isMobile: false,
                  title: 'Searchable Page View',
                  searchCallback: (query) {
                    VSToastService.showToast(
                      context,
                      title: 'Search',
                      description: 'Searching for: "$query"',
                      type: VSToastType.info,
                    );
                  },
                  tableContent: _buildSampleTable(context),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: AppSpacing.lg),

        // Page View with Add Button
        _buildPageViewGroup(
          title: 'Page View with Add Button',
          description: 'Page view with add button functionality and action buttons',
          child: Column(
            children: [
              Row(
                children: [
                  VSBadge(
                    label: 'FEATURED',
                    variant: VSBadgeVariant.primary,
                  ),
                  SizedBox(width: AppSpacing.sm),
                  VSChip(
                    label: 'Quick Actions',
                    type: VSChipType.color,
                    variant: VSChipVariant.secondary,
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.md),
              Container(
                height: 400,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.neutral300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: VSPageView(
                  isMobile: false,
                  title: 'Page with Add Button',
                  addButtonCallback: () => _showAddItemDrawer(context),
                  customNameButtonAdd: 'Add New Item',
                  tableContent: _buildSampleTable(context),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: AppSpacing.lg),

        // Page View with Tabs
        _buildPageViewGroup(
          title: 'Page View with Tabs',
          description: 'Page view including tab navigation',
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.neutral300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: VSPageView(
              isMobile: false,
              title: 'Tabbed Page View',
              tabs: ['All', 'Active', 'Inactive'],
              status: 0,
              tabbarOnTap: (index) {
                VSToastService.showToast(
                  context,
                  title: 'Tab Switched',
                  description: 'Switched to tab: $index',
                  type: VSToastType.info,
                );
              },
              tableContent: _buildSampleTable(context),
            ),
          ),
        ),

        SizedBox(height: AppSpacing.lg),

        // Mobile Page View
        _buildPageViewGroup(
          title: 'Mobile Page View',
          description: 'Page view optimized for mobile devices',
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.neutral300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: VSPageView(
              isMobile: true,
              title: 'Mobile Page View',
              searchCallback: (query) {
                VSToastService.showToast(
                  context,
                  title: 'Mobile Search',
                  description: 'Searching: "$query"',
                  type: VSToastType.info,
                );
              },
              addButtonCallback: () {
                VSToastService.showToast(
                  context,
                  title: 'Mobile Add',
                  description: 'Add button tapped',
                  type: VSToastType.info,
                );
              },
              tableContent: _buildSampleTable(context),
            ),
          ),
        ),

        SizedBox(height: AppSpacing.lg),

        // Page View with Footer
        _buildPageViewGroup(
          title: 'Page View with Footer',
          description: 'Page view including footer content',
          child: Container(
            height: 450,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.neutral300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: VSPageView(
              isMobile: false,
              title: 'Page with Footer',
              tableContent: _buildSampleTable(context),
              footer: Container(
                padding: EdgeInsets.all(AppSpacing.md),
                color: AppColors.neutral100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Footer Information',
                      style: AppTypography.bodySmallRegular,
                    ),
                    VSButton(
                      label: 'Save',
                      onPressed: () {
                        VSToastService.showToast(
                          context,
                          title: 'Data Saved',
                          description: 'Data saved successfully',
                          type: VSToastType.success,
                        );
                      },
                      size: VSButtonSize.small,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: AppSpacing.lg),

        // Complete Page View
        _buildPageViewGroup(
          title: 'Complete Page View',
          description: 'Full-featured page view with all components',
          child: Container(
            height: 500,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.neutral300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: VSPageView(
              isMobile: false,
              title: 'Complete Page View',
              backButtonCallback: () {
                VSToastService.showToast(
                  context,
                  title: 'Back Button',
                  description: 'Back button pressed',
                  type: VSToastType.info,
                );
              },
              searchCallback: (query) {
                VSToastService.showToast(
                  context,
                  title: 'Search',
                  description: 'Searching: "$query"',
                  type: VSToastType.info,
                );
              },
              addButtonCallback: () => _showAddItemDrawer(context),
              tabs: ['All Items', 'Active', 'Archived'],
              status: 1,
              tabbarOnTap: (index) {
                VSToastService.showToast(
                  context,
                  title: 'Tab Selected',
                  description: 'Tab $index selected',
                  type: VSToastType.info,
                );
              },
              lsChoice: [
                PopupMenuItem(
                  value: 'edit',
                  child: Row(
                    children: [
                      Icon(Icons.edit, size: 16),
                      SizedBox(width: AppSpacing.sm),
                      Text('Edit'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete, size: 16),
                      SizedBox(width: AppSpacing.sm),
                      Text('Delete'),
                    ],
                  ),
                ),
              ],
              lsAdditional: [
                PopupMenuItem(
                  value: 'export',
                  child: Row(
                    children: [
                      Icon(Icons.download, size: 16),
                      SizedBox(width: AppSpacing.sm),
                      Text('Export'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'import',
                  child: Row(
                    children: [
                      Icon(Icons.upload, size: 16),
                      SizedBox(width: AppSpacing.sm),
                      Text('Import'),
                    ],
                  ),
                ),
              ],
              customWidgetRight: Row(
                children: [
                  filterWidget(),
                  SizedBox(width: AppSpacing.sm),
                  VSButton(
                    label: 'Export',
                    leftIcon: Icons.download,
                    onPressed: () {
                      VSToastService.showToast(
                        context,
                        title: 'Export',
                        description: 'Data exported successfully',
                        type: VSToastType.success,
                      );
                    },
                    size: VSButtonSize.small,
                    variant: VSButtonVariant.secondary,
                  ),
                ],
              ),
              tableContent: _buildSampleTable(context),
            ),
          ),
        ),

        SizedBox(height: AppSpacing.lg),

        // Page View with Row Tap
        _buildPageViewGroup(
          title: 'Page View with Row Tap',
          description: 'Page view demonstrating row click functionality with drawer display',
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.neutral300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: VSPageView(
              isMobile: false,
              title: 'Interactive Page View',
              tableContent: _buildSampleTableWithRowTap(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPageViewGroup({
    required String title,
    required String description,
    required Widget child,
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
        child,
      ],
    );
  }

  Widget _buildSampleTable(BuildContext context) {
    return VsTableDynamic(
      tableWidth: double.infinity, // Use full width
      useAutoWidth: true, // Enable auto width for full expansion
      tableData: _createSampleTableData(),
      totalCount: 25, // Total count for pagination
      currentPage: 1,
      pageSize: 10,
      showPagination: true,
      onPageChange: (page) {
        VSToastService.showToast(
          context,
          title: 'Page Changed',
          description: 'Navigated to page $page',
          type: VSToastType.info,
        );
      },
      // Remove onSearchChanged to prevent duplicate search bars
    );
  }

  Widget _buildSampleTableWithRowTap(BuildContext context) {
    return VsTableDynamic(
      tableWidth: double.infinity, // Use full width
      useAutoWidth: true, // Enable auto width for full expansion
      tableData: _createSampleTableData(),
      totalCount: 25, // Total count for pagination
      currentPage: 1,
      pageSize: 10,
      showPagination: true,
      onRowTap: (index) {
        final tableData = _createSampleTableData();
        if (tableData.detail == null || index >= tableData.detail!.length) return;

        final rowData = tableData.detail![index];

        final items = <VSDrawerItem>[];
        for (int i = 0; i < rowData.rowData.length; i++) {
          final cell = rowData.rowData[i];
          final header = tableData.header[i];
          items.add(VSDrawerItem(
            label: header.label,
            hint: cell.data?.toString() ?? '-',
            type: VSDrawerItemType.text,
          ));
        }

        VSDrawer.show(
          context,
          title: 'Row Details - Row ${index + 1}',
          items: items,
          actions: [
            VSButton(
              label: 'Close',
              size: VSButtonSize.small,
              onPressed: () => Navigator.of(context).pop(),
              variant: VSButtonVariant.outlined,
            ),
          ],
        );
      },
      onPageChange: (page) {
        VSToastService.showToast(
          context,
          title: 'Page Changed',
          description: 'Navigated to page $page',
          type: VSToastType.info,
        );
      },
      // Remove onSearchChanged to prevent duplicate search bars
    );
  }

  TableData _createSampleTableData() {
    return TableData(
      header: [
        TableHeader(
          fieldName: 'name',
          label: 'Name',
          toolTip: 'Item Name',
          typeData: TypeData.string, 
        ),
        TableHeader(
          fieldName: 'status',
          label: 'Status',
          toolTip: 'Item Status',
          typeData: TypeData.widget, 
        ),
        TableHeader(
          fieldName: 'date',
          label: 'Date',
          toolTip: 'Created Date',
          typeData: TypeData.string, 
        ),
        TableHeader(
          fieldName: 'actions',
          label: 'Actions',
          toolTip: 'Available Actions',
          typeData: TypeData.widget, 
        ),
      ],
      detail: List.generate(25, (index) {
        final isActive = index % 2 == 0;
        return RowData(
          rowData: [
            ColumnData(
              data: 'Sample Item ${index + 1}',
              typeData: TypeData.string,
            ),
            ColumnData(
              data: Container(
                alignment: Alignment.centerLeft,
                child: VSBadge(
                  label: isActive ? 'Active' : 'Inactive',
                  variant: isActive ? VSBadgeVariant.success : VSBadgeVariant.secondary,
                  size: VSBadgeSize.xsmall,
                ),
              ),
              typeData: TypeData.widget,
            ),
            ColumnData(
              data: '2025-12-09',
              typeData: TypeData.string,
            ),
            ColumnData(
              data: Row(
                children: [
                  VSButton(
                    label: 'Edit',
                    onPressed: () {},
                    size: VSButtonSize.xsmall,
                    variant: VSButtonVariant.outlined,
                  ),
                  SizedBox(width: AppSpacing.xs),
                  VSButton(
                    label: 'Delete',
                    onPressed: () {},
                    size: VSButtonSize.xsmall,
                    variant: VSButtonVariant.danger,
                  ),
                ],
              ),
              typeData: TypeData.widget,
            ),
          ],
        );
      }),
    );
  }

  void _showAddItemDrawer(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.centerRight,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 358,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.neutral0,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(-5, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Header
                  Container(
                    padding: EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppColors.neutral200),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Add New Item',
                          style: AppTypography.h4,
                        ),
                        IconButton(
                          onPressed: () => VSToastService.showToast(
                            context,
                            title: 'Dialog Closed',
                            description: 'Add item dialog has been closed',
                            type: VSToastType.info,
                          ),
                          icon: Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
                  // Content
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(AppSpacing.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          VSInputField(
                            label: 'Item Name',
                            hintText: 'Enter item name',
                            type: VSInputFieldType.text,
                            isRequired: true,
                          ),
                          SizedBox(height: AppSpacing.md),
                          VSInputField(
                            label: 'Description',
                            hintText: 'Enter item description',
                            type: VSInputFieldType.textarea,
                          ),
                          SizedBox(height: AppSpacing.md),
                          VSInputField(
                            label: 'Category',
                            hintText: 'Select category',
                            type: VSInputFieldType.text,
                            dropdownOptions: ['Electronics', 'Clothing', 'Books', 'Home & Garden'],
                          ),
                          SizedBox(height: AppSpacing.md),
                          VSInputField(
                            label: 'Price',
                            hintText: 'Enter price',
                            type: VSInputFieldType.currency,
                            currencySymbol: 'Rp',
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Actions
                  Container(
                    padding: EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: AppColors.neutral200),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        VSButton(
                          label: 'Cancel',
                          onPressed: () => VSToastService.showToast(
                            context,
                            title: 'Cancelled',
                            description: 'Add item operation cancelled',
                            type: VSToastType.warning,
                          ),
                          variant: VSButtonVariant.outlined,
                          size: VSButtonSize.small,
                        ),
                        SizedBox(width: AppSpacing.sm),
                        VSButton(
                          label: 'Add Item',
                          onPressed: () => VSToastService.showToast(
                            context,
                            title: 'Item Added',
                            description: 'New item has been added successfully',
                            type: VSToastType.success,
                          ),
                          size: VSButtonSize.small,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
