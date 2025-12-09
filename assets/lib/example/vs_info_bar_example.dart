import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSInfoBarExample extends StatefulWidget {
  const VSInfoBarExample({super.key});

  @override
  State<VSInfoBarExample> createState() => _VSInfoBarExampleState();
}

class _VSInfoBarExampleState extends State<VSInfoBarExample> {
  VSInfoBarType _selectedType = VSInfoBarType.info;
  bool _showActions = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Info Bar Examples',
      //   actions: [
      //     VSButton(
      //       label: 'Info',
      //       onPressed: () => _showInfoBarInfo(context),
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
              title: 'VS Info Bar Variants & Types',
              description: 'Comprehensive demonstration of info bar configurations, types, and real-world usage patterns',
              child: _buildInfoBarShowcase(),
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

  Widget _buildInfoBarShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Info Bar Types
        _buildInfoBarGroup(
          title: 'Info Bar Types',
          description: 'Different semantic types for various message categories',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton(
                  label: 'Info',
                  onPressed: () => setState(() => _selectedType = VSInfoBarType.info),
                  variant: _selectedType == VSInfoBarType.info ? VSButtonVariant.primary : VSButtonVariant.outlined,
                  size: VSButtonSize.small,
                ),
                VSButton(
                  label: 'Success',
                  onPressed: () => setState(() => _selectedType = VSInfoBarType.success),
                  variant: _selectedType == VSInfoBarType.success ? VSButtonVariant.primary : VSButtonVariant.outlined,
                  size: VSButtonSize.small,
                ),
                VSButton(
                  label: 'Warning',
                  onPressed: () => setState(() => _selectedType = VSInfoBarType.warning),
                  variant: _selectedType == VSInfoBarType.warning ? VSButtonVariant.primary : VSButtonVariant.outlined,
                  size: VSButtonSize.small,
                ),
                VSButton(
                  label: 'Error',
                  onPressed: () => setState(() => _selectedType = VSInfoBarType.error),
                  variant: _selectedType == VSInfoBarType.error ? VSButtonVariant.primary : VSButtonVariant.outlined,
                  size: VSButtonSize.small,
                ),
              ],
            ),
            SizedBox(height: AppSpacing.md),
            VSInfoBar(
              type: _selectedType,
              message: 'This is a ${_selectedType.name} message with important information for the user.',
              icon: _getIconForType(_selectedType),
              actions: _showActions ? [
                VSInfoBarAction(
                  label: 'Action',
                  onPressed: () => _showActionDialog(context, '${_selectedType.name} action clicked'),
                ),
                VSInfoBarAction(
                  label: 'Dismiss',
                  onPressed: () => _showActionDialog(context, 'Info bar dismissed'),
                ),
              ] : null,
            ),
            SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                VSToggle(
                  value: _showActions,
                  onChanged: (value) => setState(() => _showActions = value),
                  label: 'Show Actions',
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // All Types Display
        _buildInfoBarGroup(
          title: 'All Info Bar Types',
          description: 'Complete showcase of all available info bar variants',
          children: [
            VSInfoBar(
              type: VSInfoBarType.info,
              message: 'This is an informational message that provides helpful context or guidance.',
              icon: Icons.info_outline,
              actions: [
                VSInfoBarAction(
                  label: 'Learn More',
                  onPressed: () => _showActionDialog(context, 'Learn more clicked'),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.sm),
            VSInfoBar(
              type: VSInfoBarType.success,
              message: 'Operation completed successfully! Your changes have been saved.',
              icon: Icons.check_circle_outline,
              actions: [
                VSInfoBarAction(
                  label: 'View Changes',
                  onPressed: () => _showActionDialog(context, 'View changes clicked'),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.sm),
            VSInfoBar(
              type: VSInfoBarType.warning,
              message: 'Warning: This action cannot be undone. Please review your changes carefully.',
              icon: Icons.warning_amber_outlined,
              actions: [
                VSInfoBarAction(
                  label: 'Review',
                  onPressed: () => _showActionDialog(context, 'Review clicked'),
                ),
                VSInfoBarAction(
                  label: 'Cancel',
                  onPressed: () => _showActionDialog(context, 'Action cancelled'),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.sm),
            VSInfoBar(
              type: VSInfoBarType.error,
              message: 'Error: Failed to save changes. Please check your connection and try again.',
              icon: Icons.error_outline,
              actions: [
                VSInfoBarAction(
                  label: 'Retry',
                  onPressed: () => _showActionDialog(context, 'Retry clicked'),
                ),
                VSInfoBarAction(
                  label: 'Report Issue',
                  onPressed: () => _showActionDialog(context, 'Report issue clicked'),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Floating Info Bar
        _buildInfoBarGroup(
          title: 'Floating Info Bar',
          description: 'Bottom-positioned floating info bar for bulk operations with auto-dismissal and stacking prevention',
          children: [
            // Demo controls
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
                    'Demo Controls',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.md,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSButton(
                        label: 'Show 3 Files Selected',
                        onPressed: () => _showFloatingInfoBarDemo(context, 3, 'files'),
                        variant: VSButtonVariant.primary,
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Show 12 Items Selected',
                        onPressed: () => _showFloatingInfoBarDemo(context, 12, 'items'),
                        variant: VSButtonVariant.secondary,
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Show 1 User Selected',
                        onPressed: () => _showFloatingInfoBarDemo(context, 1, 'user'),
                        variant: VSButtonVariant.outlined,
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Test Stacking Prevention',
                        onPressed: () => _testStackingPrevention(context),
                        variant: VSButtonVariant.danger,
                        size: VSButtonSize.small,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Features explanation
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.successBg,
                border: Border.all(color: AppColors.successDefault, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.check_circle, color: AppColors.successDefault, size: 20),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'New Features',
                        style: AppTypography.bodyMediumSemibold.copyWith(
                          color: AppColors.successDefault,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Text(
                    '• No stacking: Only one floating bar can exist at a time\n'
                    '• Auto-dismissal: Disappears when navigating to different pages\n'
                    '• Smart cleanup: Monitors context and route changes\n'
                    '• Memory safe: Proper cleanup prevents memory leaks',
                    style: AppTypography.bodySmallRegular.copyWith(
                      color: AppColors.successDefault,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Usage examples
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.secondaryBg,
                border: Border.all(color: AppColors.secondaryDefault, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Usage Examples',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Text(
                    'Perfect for bulk operations like:\n'
                    '• File management (select multiple files)\n'
                    '• Data tables (select multiple rows)\n'
                    '• User management (select multiple users)\n'
                    '• Email operations (select multiple messages)',
                    style: AppTypography.bodySmallRegular.copyWith(
                      color: AppColors.secondaryDefault,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Real-world Usage Examples
        _buildInfoBarGroup(
          title: 'Real-world Usage Examples',
          description: 'Common patterns for info bars in application interfaces',
          children: [
            // Form Validation
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
                    'Form Validation Feedback',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSInfoBar(
                    type: VSInfoBarType.error,
                    message: 'Please fill in all required fields marked with an asterisk (*).',
                    icon: Icons.error_outline,
                    actions: [
                      VSInfoBarAction(
                        label: 'Show Required Fields',
                        onPressed: () => _showActionDialog(context, 'Required fields highlighted'),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSInfoBar(
                    type: VSInfoBarType.success,
                    message: 'Your profile has been updated successfully.',
                    icon: Icons.check_circle_outline,
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // System Status
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
                    'System Status Notifications',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSInfoBar(
                    type: VSInfoBarType.warning,
                    message: 'Scheduled maintenance will begin in 30 minutes. Save your work.',
                    icon: Icons.schedule,
                    actions: [
                      VSInfoBarAction(
                        label: 'Save Now',
                        onPressed: () => _showActionDialog(context, 'Work saved'),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSInfoBar(
                    type: VSInfoBarType.info,
                    message: 'New feature available: Enhanced search with filters.',
                    icon: Icons.new_releases,
                    actions: [
                      VSInfoBarAction(
                        label: 'Try It Now',
                        onPressed: () => _showActionDialog(context, 'Enhanced search opened'),
                      ),
                      VSInfoBarAction(
                        label: 'Learn More',
                        onPressed: () => _showActionDialog(context, 'Feature documentation opened'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // File Operations
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
                    'File Operation Feedback',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSInfoBar(
                    type: VSInfoBarType.success,
                    message: '5 files uploaded successfully to the Documents folder.',
                    icon: Icons.cloud_done,
                    actions: [
                      VSInfoBarAction(
                        label: 'View Files',
                        onPressed: () => _showActionDialog(context, 'Files view opened'),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSInfoBar(
                    type: VSInfoBarType.error,
                    message: 'Upload failed: File "document.pdf" exceeds the maximum size limit of 10MB.',
                    icon: Icons.error_outline,
                    actions: [
                      VSInfoBarAction(
                        label: 'Compress File',
                        onPressed: () => _showActionDialog(context, 'File compression started'),
                      ),
                      VSInfoBarAction(
                        label: 'Choose Different File',
                        onPressed: () => _showActionDialog(context, 'File picker opened'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // User Actions
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
                    'User Action Confirmations',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSInfoBar(
                    type: VSInfoBarType.warning,
                    message: 'You are about to delete "Project Alpha". This action cannot be undone.',
                    icon: Icons.delete_forever,
                    actions: [
                      VSInfoBarAction(
                        label: 'Delete',
                        onPressed: () => _showActionDialog(context, 'Project deleted'),
                      ),
                      VSInfoBarAction(
                        label: 'Cancel',
                        onPressed: () => _showActionDialog(context, 'Action cancelled'),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSInfoBar(
                    type: VSInfoBarType.info,
                    message: 'Your session will expire in 5 minutes due to inactivity.',
                    icon: Icons.timer,
                    actions: [
                      VSInfoBarAction(
                        label: 'Extend Session',
                        onPressed: () => _showActionDialog(context, 'Session extended'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Bulk Operations
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
                    'Bulk Operations',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSInfoBar(
                    type: VSInfoBarType.info,
                    message: '12 items selected. Choose an action to perform on selected items.',
                    icon: Icons.checklist,
                    actions: [
                      VSInfoBarAction(
                        label: 'Move',
                        onPressed: () => _showActionDialog(context, 'Move dialog opened'),
                      ),
                      VSInfoBarAction(
                        label: 'Copy',
                        onPressed: () => _showActionDialog(context, 'Copy dialog opened'),
                      ),
                      VSInfoBarAction(
                        label: 'Delete',
                        onPressed: () => _showActionDialog(context, 'Delete confirmation shown'),
                      ),
                      VSInfoBarAction(
                        label: 'Export',
                        onPressed: () => _showActionDialog(context, 'Export options shown'),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSButton(
                    label: 'Demo Floating Info Bar',
                    onPressed: () => _showFloatingInfoBarDemo(context),
                    variant: VSButtonVariant.outlined,
                    size: VSButtonSize.small,
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

  Widget _buildInfoBarGroup({
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

  IconData _getIconForType(VSInfoBarType type) {
    switch (type) {
      case VSInfoBarType.info:
        return Icons.info_outline;
      case VSInfoBarType.success:
        return Icons.check_circle_outline;
      case VSInfoBarType.warning:
        return Icons.warning_amber_outlined;
      case VSInfoBarType.error:
        return Icons.error_outline;
    }
  }

  void _showFloatingInfoBarDemo(BuildContext context, [int selectedCount = 5, String itemLabel = 'files']) {
    VSInfoBar.showFloating(
      context,
      selectedCount: selectedCount,
      itemLabel: itemLabel,
      actions: [
        VSFloatingInfoBarAction(
          label: 'Download',
          icon: Icons.download,
          onPressed: () => _showActionDialog(context, 'Download started'),
        ),
        VSFloatingInfoBarAction(
          label: 'Move',
          icon: Icons.drive_file_move,
          onPressed: () => _showActionDialog(context, 'Move dialog opened'),
        ),
        VSFloatingInfoBarAction(
          label: 'Delete',
          icon: Icons.delete,
          onPressed: () => _showActionDialog(context, 'Delete confirmation shown'),
          isPrimary: true,
        ),
      ],
      onClose: () => _showActionDialog(context, 'Floating bar closed'),
      duration: const Duration(seconds: 10),
    );
  }

  void _testStackingPrevention(BuildContext context) {
    // Show first floating bar
    VSInfoBar.showFloating(
      context,
      selectedCount: 3,
      itemLabel: 'files',
      actions: [
        VSFloatingInfoBarAction(
          label: 'Action 1',
          icon: Icons.star,
          onPressed: () => _showActionDialog(context, 'Action 1 executed'),
        ),
      ],
      onClose: () => _showActionDialog(context, 'First floating bar closed'),
      duration: const Duration(seconds: 5),
    );

    // After 1 second, try to show another one (should replace the first)
    Future.delayed(const Duration(seconds: 1), () {
      VSInfoBar.showFloating(
        context,
        selectedCount: 7,
        itemLabel: 'items',
        actions: [
          VSFloatingInfoBarAction(
            label: 'Action 2',
            icon: Icons.favorite,
            onPressed: () => _showActionDialog(context, 'Action 2 executed'),
          ),
        ],
        onClose: () => _showActionDialog(context, 'Second floating bar closed'),
        duration: const Duration(seconds: 8),
      );
    });

    // Show success message
    VSToastService.showToast(
      context,
      title: 'Stacking Test Started',
      description: 'Watch how the second bar replaces the first one',
      type: VSToastType.info,
      duration: const Duration(seconds: 3),
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
}