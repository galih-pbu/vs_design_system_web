import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';
import 'dart:async';

class VSDialogExample extends StatefulWidget {
  const VSDialogExample({super.key});

  @override
  State<VSDialogExample> createState() => _VSDialogExampleState();
}

class _VSDialogExampleState extends State<VSDialogExample> {
  // Form states for input dialog
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _selectedPriority = 'Medium';

  // Loading states
  final GlobalKey _loadingKey = GlobalKey();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VSAppBar(
        title: 'VS Dialog Examples',
        actions: [
          VSButton(
            label: 'Info',
            onPressed: () => _showDialogInfo(context),
            size: VSButtonSize.small,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: 'VS Dialog Variants & Types',
              description: 'Comprehensive demonstration of dialog types with custom alert logos, actions, and interactive examples',
              child: _buildDialogShowcase(),
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

  Widget _buildDialogShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Standard Dialog Types
        _buildDialogGroup(
          title: 'Standard Dialog Types',
          description: 'Basic confirmation, delete, approve, and reject dialogs',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton(
                  label: 'Confirmation',
                  onPressed: () => _showConfirmationDialog(context),
                  variant: VSButtonVariant.primary,
                ),
                VSButton(
                  label: 'Delete',
                  onPressed: () => _showDeleteDialog(context),
                  variant: VSButtonVariant.danger,
                ),
                VSButton(
                  label: 'Approve',
                  onPressed: () => _showApproveDialog(context),
                  variant: VSButtonVariant.primary,
                ),
                VSButton(
                  label: 'Reject',
                  onPressed: () => _showRejectDialog(context),
                  variant: VSButtonVariant.danger,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Summary Dialog
        _buildDialogGroup(
          title: 'Summary Dialog',
          description: 'Detailed summary dialogs with custom content and info messages',
          children: [
            VSButton(
              label: 'Show Summary',
              onPressed: () => _showSummaryDialog(context),
              variant: VSButtonVariant.secondary,
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Input Dialog
        _buildDialogGroup(
          title: 'Input Dialog',
          description: 'Interactive input dialogs with forms and validation',
          children: [
            VSButton(
              label: 'User Registration',
              onPressed: () => _showInputDialog(context),
              variant: VSButtonVariant.primary,
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Loading Dialogs
        _buildDialogGroup(
          title: 'Loading Dialogs',
          description: 'Progress indicators and loading states',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton(
                  label: 'Simple Loading',
                  onPressed: () => _showSimpleLoadingDialog(context),
                  variant: VSButtonVariant.outlined,
                ),
                VSButton(
                  label: 'Progress Loading',
                  onPressed: () => _showProgressLoadingDialog(context),
                  variant: VSButtonVariant.outlined,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Dialog Actions
        _buildDialogGroup(
          title: 'Dialog Actions',
          description: 'Different action button configurations and variants',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton(
                  label: 'Single Action',
                  onPressed: () => _showSingleActionDialog(context),
                  size: VSButtonSize.small,
                ),
                VSButton(
                  label: 'Dual Actions',
                  onPressed: () => _showDualActionDialog(context),
                  size: VSButtonSize.small,
                ),
                VSButton(
                  label: 'Multiple Actions',
                  onPressed: () => _showMultipleActionDialog(context),
                  size: VSButtonSize.small,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Real-world Usage Examples
        _buildDialogGroup(
          title: 'Real-world Usage Examples',
          description: 'Common dialog patterns in application interfaces',
          children: [
            // User Account Actions
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
                    'Account Management',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      const VSAvatar(
                        imageUrl: 'https://via.placeholder.com/32',
                        size: VSAvatarSize.small,
                      ),
                      SizedBox(width: AppSpacing.sm),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('John Doe', style: AppTypography.bodyMediumSemibold),
                          Text('john.doe@example.com', style: AppTypography.bodySmallRegular),
                        ],
                      ),
                      const Spacer(),
                      const VSBadge(
                        label: 'ACTIVE',
                        variant: VSBadgeVariant.success,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSButton(
                        label: 'Edit Profile',
                        onPressed: () => _showEditProfileDialog(context),
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.outlined,
                      ),
                      VSButton(
                        label: 'Change Password',
                        onPressed: () => _showChangePasswordDialog(context),
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.outlined,
                      ),
                      VSButton(
                        label: 'Delete Account',
                        onPressed: () => _showDeleteAccountDialog(context),
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.danger,
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
                    'File Operations',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Icon(Icons.folder, color: AppColors.primaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text('Project Documents', style: AppTypography.bodyMediumRegular),
                      const Spacer(),
                      const VSBadge(
                        label: '5 FILES',
                        variant: VSBadgeVariant.primary,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSButton(
                        label: 'Upload',
                        onPressed: () => _showUploadDialog(context),
                        size: VSButtonSize.small,
                        leftIcon: Icons.upload,
                      ),
                      VSButton(
                        label: 'Download All',
                        onPressed: () => _showDownloadDialog(context),
                        size: VSButtonSize.small,
                        leftIcon: Icons.download,
                      ),
                      VSButton(
                        label: 'Delete All',
                        onPressed: () => _showDeleteFilesDialog(context),
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.danger,
                        leftIcon: Icons.delete_forever,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Task Management
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
                        'Task Management',
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
                  _buildTaskItem('Implement user authentication', 'Backend', VSChipVariant.danger),
                  _buildTaskItem('Design new dashboard', 'Frontend', VSChipVariant.primary),
                  _buildTaskItem('Write API documentation', 'Documentation', VSChipVariant.neutral),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      VSButton(
                        label: 'Add Task',
                        onPressed: () => _showAddTaskDialog(context),
                        size: VSButtonSize.small,
                        leftIcon: Icons.add,
                      ),
                      SizedBox(width: AppSpacing.sm),
                      VSButton(
                        label: 'Bulk Actions',
                        onPressed: () => _showBulkActionsDialog(context),
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.outlined,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // System Settings
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
                    'System Settings',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      _buildSettingItem(
                        'Notifications',
                        'Configure email and push notifications',
                        () => _showNotificationSettingsDialog(context),
                      ),
                      _buildSettingItem(
                        'Security',
                        'Manage passwords and 2FA settings',
                        () => _showSecuritySettingsDialog(context),
                      ),
                      _buildSettingItem(
                        'Data Export',
                        'Download your data and reports',
                        () => _showDataExportDialog(context),
                      ),
                      _buildSettingItem(
                        'System Reset',
                        'Reset all settings to defaults',
                        () => _showSystemResetDialog(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDialogGroup({
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

  Widget _buildTaskItem(String title, String category, VSChipVariant variant) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSpacing.xs),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTypography.bodySmallRegular,
            ),
          ),
          SizedBox(width: AppSpacing.sm),
          VSChip(
            label: category,
            type: VSChipType.color,
            variant: variant,
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(String title, String subtitle, VoidCallback onPressed) {
    return VSButton(
      label: title,
      onPressed: onPressed,
      size: VSButtonSize.small,
      variant: VSButtonVariant.outlined,
      width: double.infinity,
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Align(
        alignment: Alignment.centerRight,
        child: VSDialog(
          type: VSDialogType.confirmation,
          message: 'Are you sure you want to proceed with this action?',
          actions: [
            VSDialogAction(
              label: 'Cancel',
              onPressed: () {},
              variant: VSButtonVariant.outlined,
            ),
            VSDialogAction(
              label: 'Confirm',
              onPressed: () => _showActionDialog(context, 'Action confirmed!'),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Align(
        alignment: Alignment.centerRight,
        child: VSDialog(
          type: VSDialogType.delete,
          message: 'This action cannot be undone. All associated data will be permanently removed.',
          actions: [
            VSDialogAction(
              label: 'Cancel',
              onPressed: () {},
              variant: VSButtonVariant.outlined,
            ),
            VSDialogAction(
              label: 'Delete',
              onPressed: () => _showActionDialog(context, 'Item deleted successfully'),
              variant: VSButtonVariant.danger,
            ),
          ],
        ),
      ),
    );
  }

  void _showApproveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Align(
        alignment: Alignment.centerRight,
        child: VSDialog(
          type: VSDialogType.approve,
          message: 'Approve this request? The changes will be applied immediately.',
          actions: [
            VSDialogAction(
              label: 'Cancel',
              onPressed: () {},
              variant: VSButtonVariant.outlined,
            ),
            VSDialogAction(
              label: 'Approve',
              onPressed: () => _showActionDialog(context, 'Request approved!'),
              variant: VSButtonVariant.primary,
            ),
          ],
        ),
      ),
    );
  }

  void _showRejectDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Align(
        alignment: Alignment.centerRight,
        child: VSDialog(
          type: VSDialogType.reject,
          message: 'Provide a reason for rejecting this request.',
          actions: [
            VSDialogAction(
              label: 'Cancel',
              onPressed: () {},
              variant: VSButtonVariant.outlined,
            ),
            VSDialogAction(
              label: 'Reject',
              onPressed: () => _showActionDialog(context, 'Request rejected'),
              variant: VSButtonVariant.danger,
            ),
          ],
        ),
      ),
    );
  }

  void _showSummaryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Align(
        alignment: Alignment.centerRight,
        child: VSDialog(
          type: VSDialogType.summary,
          title: 'Order Summary',
          message: '',
          infoMessage: 'Review your order details before proceeding',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSummaryRow('Product', 'Premium Plan'),
              _buildSummaryRow('Quantity', '1'),
              _buildSummaryRow('Unit Price', '\$99.00'),
              _buildSummaryRow('Tax', '\$9.90'),
              Divider(color: AppColors.neutral300),
              _buildSummaryRow('Total', '\$108.90', isBold: true),
            ],
          ),
          actions: [
            VSDialogAction(
              label: 'Edit Order',
              onPressed: () {},
              variant: VSButtonVariant.outlined,
            ),
            VSDialogAction(
              label: 'Place Order',
              onPressed: () => _showActionDialog(context, 'Order placed successfully!'),
            ),
          ],
        ),
      ),
    );
  }

  void _showInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Align(
        alignment: Alignment.centerRight,
        child: VSDialog(
          type: VSDialogType.input,
          title: 'Create New User',
          message: '',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VSInputField(
                label: 'Full Name',
                controller: _nameController,
                hintText: 'Enter full name',
              ),
              SizedBox(height: AppSpacing.md),
              VSInputField(
                label: 'Email Address',
                controller: _emailController,
                hintText: 'Enter email address',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: AppSpacing.md),
              Text(
                'Priority Level',
                style: AppTypography.bodySmallSemibold,
              ),
              SizedBox(height: AppSpacing.sm),
              Wrap(
                spacing: AppSpacing.sm,
                children: ['Low', 'Medium', 'High'].map((priority) {
                  return VSChip(
                    label: priority,
                    type: VSChipType.input,
                    variant: _selectedPriority == priority ? VSChipVariant.primary : VSChipVariant.neutral,
                    onDelete: _selectedPriority == priority ? () => setState(() => _selectedPriority = '') : null,
                  );
                }).toList(),
              ),
            ],
          ),
          actions: [
            VSDialogAction(
              label: 'Cancel',
              onPressed: () {},
              variant: VSButtonVariant.outlined,
            ),
            VSDialogAction(
              label: 'Create User',
              onPressed: () => _showActionDialog(
                context,
                'User created: ${_nameController.text} (${_emailController.text}) - Priority: $_selectedPriority',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSimpleLoadingDialog(BuildContext context) {
    VSDialog.showLoadingDialog(context, _loadingKey);
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pop();
        _showActionDialog(context, 'Loading completed!');
      }
    });
  }

  void _showProgressLoadingDialog(BuildContext context) {
    final progressNotifier = ValueNotifier<int?>(null);
    final descsNotifier = ValueNotifier<String?>('Initializing...');

    VSDialog.showCustomLoadingDialog(
      context,
      descsNotifier: descsNotifier,
      progressNotifier: progressNotifier,
      totalData: 100,
    );

    // Simulate progress
    int progress = 0;
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      progress += 2;
      progressNotifier.value = progress;

      if (progress == 20) descsNotifier.value = 'Loading data...';
      if (progress == 50) descsNotifier.value = 'Processing...';
      if (progress == 80) descsNotifier.value = 'Finalizing...';

      if (progress >= 100) {
        timer.cancel();
        if (mounted) {
          Navigator.of(context).pop();
          _showActionDialog(context, 'Process completed successfully!');
        }
      }
    });
  }

  void _showSingleActionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Align(
        alignment: Alignment.centerRight,
        child: VSDialog(
          type: VSDialogType.confirmation,
          message: 'This is a single action dialog with only one button.',
          actions: [
            VSDialogAction(
              label: 'OK',
              onPressed: () => _showActionDialog(context, 'Single action executed'),
            ),
          ],
        ),
      ),
    );
  }

  void _showDualActionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Align(
        alignment: Alignment.centerRight,
        child: VSDialog(
          type: VSDialogType.confirmation,
          message: 'This dialog has two actions: primary and secondary.',
          actions: [
            VSDialogAction(
              label: 'Secondary',
              onPressed: () => _showActionDialog(context, 'Secondary action executed'),
              variant: VSButtonVariant.outlined,
            ),
            VSDialogAction(
              label: 'Primary',
              onPressed: () => _showActionDialog(context, 'Primary action executed'),
            ),
          ],
        ),
      ),
    );
  }

  void _showMultipleActionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Align(
        alignment: Alignment.centerRight,
        child: VSDialog(
          type: VSDialogType.confirmation,
          message: 'This dialog demonstrates multiple action buttons.',
          actions: [
            VSDialogAction(
              label: 'Cancel',
              onPressed: () => _showActionDialog(context, 'Cancelled'),
              variant: VSButtonVariant.outlined,
            ),
            VSDialogAction(
              label: 'Save Draft',
              onPressed: () => _showActionDialog(context, 'Saved as draft'),
              variant: VSButtonVariant.secondary,
            ),
            VSDialogAction(
              label: 'Publish',
              onPressed: () => _showActionDialog(context, 'Published successfully'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTypography.bodySmallRegular.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          Text(
            value,
            style: (isBold ? AppTypography.bodySmallSemibold : AppTypography.bodySmallRegular),
          ),
        ],
      ),
    );
  }

  void _showEditProfileDialog(BuildContext context) {
    VSDialog.showInput(
      context,
      title: 'Edit Profile',
      content: Column(
        children: [
          VSInputField(
            label: 'Full Name',
            hintText: 'Enter your full name',
          ),
          SizedBox(height: AppSpacing.md),
          VSInputField(
            label: 'Email',
            hintText: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
      actions: [
        VSDialogAction(
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSDialogAction(
          label: 'Save Changes',
          onPressed: () => _showActionDialog(context, 'Profile updated successfully'),
        ),
      ],
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    VSDialog.showInput(
      context,
      title: 'Change Password',
      infoMessage: 'Password must be at least 8 characters long',
      content: Column(
        children: [
          VSInputField(
            label: 'Current Password',
            hintText: 'Enter current password',
            obscureText: true,
          ),
          SizedBox(height: AppSpacing.md),
          VSInputField(
            label: 'New Password',
            hintText: 'Enter new password',
            obscureText: true,
          ),
          SizedBox(height: AppSpacing.md),
          VSInputField(
            label: 'Confirm Password',
            hintText: 'Confirm new password',
            obscureText: true,
          ),
        ],
      ),
      actions: [
        VSDialogAction(
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSDialogAction(
          label: 'Update Password',
          onPressed: () => _showActionDialog(context, 'Password changed successfully'),
        ),
      ],
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Align(
        alignment: Alignment.centerRight,
        child: VSDialog(
          type: VSDialogType.delete,
          message: 'Are you sure you want to delete your account? This action cannot be undone and all your data will be permanently removed.',
          actions: [
            VSDialogAction(
              label: 'Cancel',
              onPressed: () {},
              variant: VSButtonVariant.outlined,
            ),
            VSDialogAction(
              label: 'Delete Account',
              onPressed: () => _showActionDialog(context, 'Account deletion initiated'),
              variant: VSButtonVariant.danger,
            ),
          ],
        ),
      ),
    );
  }

  void _showUploadDialog(BuildContext context) {
    VSDialog.showInput(
      context,
      title: 'Upload Files',
      content: Column(
        children: [
          Container(
            padding: EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.neutral100,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: AppColors.neutral300),
            ),
            child: Column(
              children: [
                Icon(Icons.cloud_upload, size: 48, color: AppColors.primaryDefault),
                SizedBox(height: AppSpacing.sm),
                Text(
                  'Drag and drop files here or click to browse',
                  style: AppTypography.bodySmallRegular,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        VSDialogAction(
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSDialogAction(
          label: 'Upload',
          onPressed: () => _showActionDialog(context, 'Files uploaded successfully'),
        ),
      ],
    );
  }

  void _showDownloadDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Align(
        alignment: Alignment.centerRight,
        child: VSDialog(
          type: VSDialogType.confirmation,
          message: 'Download all 5 files? This may take a few minutes.',
          actions: [
            VSDialogAction(
              label: 'Cancel',
              onPressed: () {},
              variant: VSButtonVariant.outlined,
            ),
            VSDialogAction(
              label: 'Download',
              onPressed: () => _showActionDialog(context, 'Download started'),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteFilesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Align(
        alignment: Alignment.centerRight,
        child: VSDialog(
          type: VSDialogType.delete,
          message: 'Delete all files in this folder? This action cannot be undone.',
          actions: [
            VSDialogAction(
              label: 'Cancel',
              onPressed: () {},
              variant: VSButtonVariant.outlined,
            ),
            VSDialogAction(
              label: 'Delete All',
              onPressed: () => _showActionDialog(context, 'All files deleted'),
              variant: VSButtonVariant.danger,
            ),
          ],
        ),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    VSDialog.showInput(
      context,
      title: 'Add New Task',
      content: Column(
        children: [
          VSInputField(
            label: 'Task Title',
            hintText: 'Enter task title',
          ),
          SizedBox(height: AppSpacing.md),
          VSInputField(
            label: 'Description',
            hintText: 'Enter task description',
            maxLines: 3,
          ),
          SizedBox(height: AppSpacing.md),
          Text(
            'Priority',
            style: AppTypography.bodySmallSemibold,
          ),
          SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            children: ['Low', 'Medium', 'High'].map((priority) {
              return VSChip(
                label: priority,
                type: VSChipType.input,
              );
            }).toList(),
          ),
        ],
      ),
      actions: [
        VSDialogAction(
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSDialogAction(
          label: 'Add Task',
          onPressed: () => _showActionDialog(context, 'Task added successfully'),
        ),
      ],
    );
  }

  void _showBulkActionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Align(
        alignment: Alignment.centerRight,
        child: VSDialog(
          type: VSDialogType.confirmation,
          message: 'Select bulk action to apply to all selected tasks.',
          actions: [
            VSDialogAction(
              label: 'Mark Complete',
              onPressed: () => _showActionDialog(context, 'All tasks marked as complete'),
              variant: VSButtonVariant.primary,
            ),
            VSDialogAction(
              label: 'Delete Selected',
              onPressed: () => _showActionDialog(context, 'Selected tasks deleted'),
              variant: VSButtonVariant.danger,
            ),
          ],
        ),
      ),
    );
  }

  void _showNotificationSettingsDialog(BuildContext context) {
    VSDialog.showInput(
      context,
      title: 'Notification Settings',
      content: Column(
        children: [
          Row(
            children: [
              VSCheckbox(
                value: true,
                onChanged: (value) {},
                label: 'Email notifications',
              ),
              const Spacer(),
            ],
          ),
          Row(
            children: [
              VSCheckbox(
                value: false,
                onChanged: (value) {},
                label: 'Push notifications',
              ),
              const Spacer(),
            ],
          ),
          Row(
            children: [
              VSCheckbox(
                value: true,
                onChanged: (value) {},
                label: 'SMS notifications',
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
      actions: [
        VSDialogAction(
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSDialogAction(
          label: 'Save Settings',
          onPressed: () => _showActionDialog(context, 'Notification settings saved'),
        ),
      ],
    );
  }

  void _showSecuritySettingsDialog(BuildContext context) {
    VSDialog.showInput(
      context,
      title: 'Security Settings',
      content: Column(
        children: [
          VSButton(
            label: 'Change Password',
            onPressed: () => _showChangePasswordDialog(context),
            variant: VSButtonVariant.outlined,
            width: double.infinity,
          ),
          SizedBox(height: AppSpacing.sm),
          VSButton(
            label: 'Enable Two-Factor Authentication',
            onPressed: () => _showActionDialog(context, '2FA setup initiated'),
            variant: VSButtonVariant.outlined,
            width: double.infinity,
          ),
          SizedBox(height: AppSpacing.sm),
          VSButton(
            label: 'View Login History',
            onPressed: () => _showActionDialog(context, 'Login history displayed'),
            variant: VSButtonVariant.outlined,
            width: double.infinity,
          ),
        ],
      ),
      actions: [
        VSDialogAction(
          label: 'Close',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
      ],
    );
  }

  void _showDataExportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'Data Export',
        message: '',
        infoMessage: 'Choose what data to export',
        content: Column(
          children: [
            Row(
              children: [
                VSCheckbox(
                  value: true,
                  onChanged: (value) {},
                  label: 'User profile data',
                ),
                const Spacer(),
              ],
            ),
            Row(
              children: [
                VSCheckbox(
                  value: true,
                  onChanged: (value) {},
                  label: 'Activity history',
                ),
                const Spacer(),
              ],
            ),
            Row(
              children: [
                VSCheckbox(
                  value: false,
                  onChanged: (value) {},
                  label: 'System logs',
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
        actions: [
          VSDialogAction(
            label: 'Cancel',
            onPressed: () {},
            variant: VSButtonVariant.outlined,
          ),
          VSDialogAction(
            label: 'Export Data',
            onPressed: () => _showActionDialog(context, 'Data export initiated'),
          ),
        ],
      ),
    );
  }

  void _showSystemResetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.delete,
        message: 'Reset all system settings to default values? This will remove all your customizations.',
        actions: [
          VSDialogAction(
            label: 'Cancel',
            onPressed: () {},
            variant: VSButtonVariant.outlined,
          ),
          VSDialogAction(
            label: 'Reset Settings',
            onPressed: () => _showActionDialog(context, 'System settings reset to defaults'),
            variant: VSButtonVariant.danger,
          ),
        ],
      ),
    );
  }

  void _showActionDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => Align(
        alignment: Alignment.centerRight,
        child: VSDialog(
          type: VSDialogType.confirmation,
          message: message,
          actions: [
            VSDialogAction(
              label: 'OK',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  void _showDialogInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Align(
        alignment: Alignment.centerRight,
        child: VSDialog(
          type: VSDialogType.summary,
          title: 'VS Dialog Information',
          message: '',
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'The VS Dialog component provides modal dialogs with VS Design System styling, custom alert logos, and multiple interaction patterns.',
                style: AppTypography.bodyMediumRegular,
              ),
              SizedBox(height: AppSpacing.md),
              Text(
                'Key Features:',
                style: AppTypography.bodyMediumSemibold,
              ),
              SizedBox(height: AppSpacing.sm),
              Text(
                '• Six dialog types: confirmation, delete, approve, reject, summary, input\n'
                '• Custom alert logos from assets/alert_logo/ instead of Material icons\n'
                '• Configurable actions with different button variants\n'
                '• Custom content and info messages\n'
                '• Loading dialogs with progress indicators\n'
                '• Static methods for common use cases\n'
                '• Proper modal behavior and accessibility\n'
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
      ),
    );
  }
}
