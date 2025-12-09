import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSAppBarExample extends StatefulWidget {
  const VSAppBarExample({super.key});

  @override
  State<VSAppBarExample> createState() => _VSAppBarExampleState();
}

class _VSAppBarExampleState extends State<VSAppBarExample> {
  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.approve,
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

  void _navigateToDetail() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: VSAppBar.detail(
            title: 'Detail Page',
            onBack: () {},
            actions: [
              VSButton(
                label: 'Edit',
                onPressed: () => _showDialog('Edit action clicked'),
                variant: VSButtonVariant.secondary,
                size: VSButtonSize.small,
              ),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.article, size: 64, color: AppColors.neutral500),
                SizedBox(height: AppSpacing.md),
                Text(
                  'Detail Page Content',
                  style: AppTypography.h6,
                ),
                SizedBox(height: AppSpacing.md),
                VSButton(
                  label: 'Back to Examples',
                  onPressed: () {},
                  variant: VSButtonVariant.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDrawer() {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.approve,
        message: 'Drawer would open here in a real implementation',
        actions: [
          VSDialogAction(
            label: 'OK',
            onPressed: () {},
          ),
        ],
      ),
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
              title: 'VS App Bar Variants & Types',
              description:
                  'Comprehensive demonstration of all app bar variants, configurations, and interactive examples',
              child: _buildAppBarShowcase(context),
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

  Widget _buildAppBarShowcase(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Introduction
        Text(
          'VS App Bar Overview',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.sm),
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
                'VSAppBar provides consistent navigation bars with three variants: Main (60px), Detail (48px), and Drawer (48px). Built with design system tokens for seamless integration.',
                style: AppTypography.bodyMediumRegular,
              ),
              SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  VSBadge(label: 'Main Variant', variant: VSBadgeVariant.primary),
                  SizedBox(width: AppSpacing.sm),
                  VSBadge(label: 'Detail Variant', variant: VSBadgeVariant.secondary),
                  SizedBox(width: AppSpacing.sm),
                  VSBadge(label: 'Drawer Variant', variant: VSBadgeVariant.success),
                  SizedBox(width: AppSpacing.sm),
                  VSBadge(label: 'Custom Actions', variant: VSBadgeVariant.warning),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.lg),

        // Main Variant Examples
        Text(
          'Main Variant (60px) - Primary Pages',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),

        // Basic Main App Bar
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.neutral300),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              VSAppBar.main(title: 'Dashboard'),
              Container(
                height: 80,
                alignment: Alignment.center,
                color: AppColors.neutral100,
                child: Text('Page Content Area', style: AppTypography.bodyMediumRegular),
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.md),

        // Main App Bar with Actions
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.neutral300),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              VSAppBar.main(
                title: 'User Management',
                actions: [
                  VSButton(
                    label: 'Import',
                    onPressed: () => _showDialog('Import clicked'),
                    variant: VSButtonVariant.secondary,
                    size: VSButtonSize.small,
                  ),
                  SizedBox(width: AppSpacing.sm),
                  VSButton(
                    label: 'Export',
                    onPressed: () => _showDialog('Export clicked'),
                    variant: VSButtonVariant.primary,
                    size: VSButtonSize.small,
                  ),
                ],
              ),
              Container(
                height: 80,
                alignment: Alignment.center,
                color: AppColors.neutral100,
                child: Text('Page Content Area', style: AppTypography.bodyMediumRegular),
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.md),

        // Main App Bar with Bottom Tab Bar
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.neutral300),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              VSAppBar.main(
                title: 'Reports',
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(48),
                  child: Container(
                    color: AppColors.neutral100,
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => _showDialog('Summary tab selected'),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
                              alignment: Alignment.center,
                              child: Text(
                                'Summary',
                                style: AppTypography.bodyMediumSemibold.copyWith(
                                  color: AppColors.primaryDefault,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(width: 1, height: 32, color: AppColors.neutral300),
                        Expanded(
                          child: InkWell(
                            onTap: () => _showDialog('Details tab selected'),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
                              alignment: Alignment.center,
                              child: Text(
                                'Details',
                                style: AppTypography.bodyMediumRegular.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 80,
                alignment: Alignment.center,
                color: AppColors.neutral100,
                child: Text('Page Content Area', style: AppTypography.bodyMediumRegular),
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.lg),

        // Detail Variant Examples
        Text(
          'Detail Variant (48px) - Detail Pages',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),

        // Basic Detail App Bar
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.neutral300),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              VSAppBar.detail(
                title: 'User Profile',
                onBack: () => _showDialog('Back button clicked'),
              ),
              Container(
                height: 80,
                alignment: Alignment.center,
                color: AppColors.neutral100,
                child: Text('Page Content Area', style: AppTypography.bodyMediumRegular),
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.md),

        // Detail App Bar with Actions and Close
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.neutral300),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              VSAppBar.detail(
                title: 'Edit Project',
                onBack: () => _showDialog('Back button clicked'),
                onClose: () => _showDialog('Close button clicked'),
                actions: [
                  VSButton(
                    label: 'Save',
                    onPressed: () => _showDialog('Save clicked'),
                    variant: VSButtonVariant.primary,
                    size: VSButtonSize.small,
                  ),
                ],
              ),
              Container(
                height: 80,
                alignment: Alignment.center,
                color: AppColors.neutral100,
                child: Text('Page Content Area', style: AppTypography.bodyMediumRegular),
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.lg),

        // Drawer Variant Examples
        Text(
          'Drawer Variant (48px) - Drawer Headers',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),

        // Basic Drawer App Bar
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.neutral300),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              VSAppBar.drawer(
                title: 'Filter Options',
                onClose: () => _showDialog('Close button clicked'),
              ),
              Container(
                height: 80,
                alignment: Alignment.center,
                color: AppColors.neutral100,
                child: Text('Drawer Content Area', style: AppTypography.bodyMediumRegular),
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.lg),

        // Interactive Examples
        Text(
          'Interactive Examples',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),

        Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.md,
          children: [
            VSButton(
              label: 'Navigate to Detail Page',
              onPressed: _navigateToDetail,
              variant: VSButtonVariant.primary,
            ),
            VSButton(
              label: 'Show Drawer Example',
              onPressed: _showDrawer,
              variant: VSButtonVariant.secondary,
            ),
          ],
        ),
        SizedBox(height: AppSpacing.lg),

        // Custom Styling Examples
        Text(
          'Custom Styling Examples',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),

        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.neutral300),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              VSAppBar(
                title: 'Custom Styled App Bar',
                variant: VSAppBarVariant.main,
                backgroundColor: AppColors.primaryBg,
                borderColor: AppColors.primaryDefault,
                titleColor: AppColors.primaryDefault,
                actions: [
                  IconButton(
                    icon: Icon(Icons.search, color: AppColors.primaryDefault),
                    onPressed: () => _showDialog('Search clicked'),
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert, color: AppColors.primaryDefault),
                    onPressed: () => _showDialog('Menu clicked'),
                  ),
                ],
              ),
              Container(
                height: 80,
                alignment: Alignment.center,
                color: AppColors.neutral100,
                child: Text('Page Content Area', style: AppTypography.bodyMediumRegular),
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.lg),

        // Usage Guidelines
        Text(
          'Usage Guidelines',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),
        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.warningBg,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.warningDefault),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.info_outline, size: 20, color: AppColors.textPrimary),
                  SizedBox(width: AppSpacing.sm),
                  Text(
                    'Best Practices',
                    style: AppTypography.bodyMediumSemibold.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.sm),
              Text(
                '• Main Variant: Use for primary pages, dashboards, and list views\n• Detail Variant: Use for detail/edit pages with back navigation\n• Drawer Variant: Use for drawer headers and modal side panels\n• Actions: Keep to 1-3 important actions, use small button size\n• Bottom Widget: Use for tabs or secondary navigation\n• Custom Colors: Use sparingly to maintain design consistency',
                style: AppTypography.bodySmallRegular.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}