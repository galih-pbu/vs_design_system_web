import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSPageViewExample extends StatelessWidget {
  const VSPageViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Page View Examples',
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: 'VS Page View Examples',
              description: 'Comprehensive demonstration of page view widget with various configurations',
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
          description: 'Simple page view with title and table content',
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.neutral300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: VSPageView(
              isMobile: false,
              title: 'Basic Page View',
              tableContent: _buildSampleTable(),
            ),
          ),
        ),

        SizedBox(height: AppSpacing.lg),

        // Page View with Search
        _buildPageViewGroup(
          title: 'Page View with Search',
          description: 'Page view including search functionality',
          child: Container(
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
              tableContent: _buildSampleTable(),
            ),
          ),
        ),

        SizedBox(height: AppSpacing.lg),

        // Page View with Add Button
        _buildPageViewGroup(
          title: 'Page View with Add Button',
          description: 'Page view with add button functionality',
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.neutral300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: VSPageView(
              isMobile: false,
              title: 'Page with Add Button',
              addButtonCallback: () {
                VSToastService.showToast(
                  context,
                  title: 'Add Button',
                  description: 'Add button clicked',
                  type: VSToastType.info,
                );
              },
              customNameButtonAdd: 'Add New Item',
              tableContent: _buildSampleTable(),
            ),
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
              tableContent: _buildSampleTable(),
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
              tableContent: _buildSampleTable(),
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
              tableContent: _buildSampleTable(),
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
              addButtonCallback: () {
                VSToastService.showToast(
                  context,
                  title: 'Add Item',
                  description: 'Add new item',
                  type: VSToastType.info,
                );
              },
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
              customWidgetRight: VSButton(
                label: 'Custom Action',
                onPressed: () {
                  VSToastService.showToast(
                    context,
                    title: 'Custom Action',
                    description: 'Custom action executed',
                    type: VSToastType.success,
                  );
                },
                size: VSButtonSize.small,
                variant: VSButtonVariant.secondary,
              ),
              tableContent: _buildSampleTable(),
              footer: Container(
                padding: EdgeInsets.all(AppSpacing.md),
                color: AppColors.neutral100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '© 2025 VS Design System',
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
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

  Widget _buildSampleTable() {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md),
      child: Column(
        children: [
          // Table Header
          Container(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.neutral300)),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Name',
                    style: AppTypography.bodySmallSemibold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Status',
                    style: AppTypography.bodySmallSemibold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Date',
                    style: AppTypography.bodySmallSemibold,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Actions',
                    style: AppTypography.bodySmallSemibold,
                  ),
                ),
              ],
            ),
          ),
          // Sample Rows
          ...List.generate(5, (index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.neutral200)),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Sample Item ${index + 1}',
                      style: AppTypography.bodySmallRegular,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: VSBadge(
                        label: index % 2 == 0 ? 'Active' : 'Inactive',
                        variant: index % 2 == 0 ? VSBadgeVariant.success : VSBadgeVariant.secondary,
                        size: VSBadgeSize.xsmall,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '2025-12-09',
                      style: AppTypography.bodySmallRegular,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
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
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
