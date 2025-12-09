import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSToastExample extends StatefulWidget {
  const VSToastExample({super.key});

  @override
  State<VSToastExample> createState() => _VSToastExampleState();
}

class _VSToastExampleState extends State<VSToastExample> {
  String _selectedPosition = 'top';
  String _selectedDuration = 'short';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Toast Examples',
      //   actions: [
      //     VSButton(
      //       label: 'Info',
      //       onPressed: () => _showToastInfo(context),
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
              title: 'VS Toast Variants & Types',
              description: 'Comprehensive demonstration of toast notification configurations and real-world usage patterns',
              child: _buildToastShowcase(),
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

  Widget _buildToastShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic Toast Types
        _buildToastGroup(
          title: 'Basic Toast Types',
          description: 'Different toast variants for various notification scenarios',
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
                    'Toast Variants',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.md),
                  Wrap(
                    spacing: AppSpacing.md,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSButton(
                        label: 'Success Toast',
                        onPressed: () => _showToast(
                          context,
                          message: 'Operation completed successfully!',
                          type: VSToastType.success,
                        ),
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.primary,
                      ),
                      VSButton(
                        label: 'Error Toast',
                        onPressed: () => _showToast(
                          context,
                          message: 'An error occurred while processing your request.',
                          type: VSToastType.error,
                        ),
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.danger,
                      ),
                      VSButton(
                        label: 'Warning Toast',
                        onPressed: () => _showToast(
                          context,
                          message: 'Please review your input before proceeding.',
                          type: VSToastType.warning,
                        ),
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.primary,
                      ),
                      VSButton(
                        label: 'Info Toast',
                        onPressed: () => _showToast(
                          context,
                          message: 'New updates are available for download.',
                          type: VSToastType.info,
                        ),
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Toast with Actions
        _buildToastGroup(
          title: 'Toast with Actions',
          description: 'Interactive toasts with action buttons for user responses',
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
                    'Interactive Toasts',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.md),
                  Wrap(
                    spacing: AppSpacing.md,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSButton(
                        label: 'Update Available',
                        onPressed: () => _showToast(
                          context,
                          message: 'A new version is available. Would you like to update now?',
                          type: VSToastType.info,
                          actionLabel: 'Update',
                          onActionTap: () => _showActionDialog(context, 'Update started...'),
                        ),
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'File Saved',
                        onPressed: () => _showToast(
                          context,
                          message: 'Document saved successfully.',
                          type: VSToastType.success,
                          actionLabel: 'View',
                          onActionTap: () => _showActionDialog(context, 'Opening document...'),
                        ),
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Delete Confirmation',
                        onPressed: () => _showToast(
                          context,
                          message: 'Item deleted. This action cannot be undone.',
                          type: VSToastType.warning,
                          actionLabel: 'Undo',
                          onActionTap: () => _showActionDialog(context, 'Action undone!'),
                        ),
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Connection Lost',
                        onPressed: () => _showToast(
                          context,
                          message: 'Connection lost. Trying to reconnect...',
                          type: VSToastType.error,
                          actionLabel: 'Retry',
                          onActionTap: () => _showActionDialog(context, 'Retrying connection...'),
                        ),
                        size: VSButtonSize.small,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Toast Positions
        _buildToastGroup(
          title: 'Toast Positions',
          description: 'Different positioning options for toast notifications',
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
                    'Position Configuration',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.xs,
                    children: ['top', 'bottom', 'center'].map((position) => VSButton(
                      label: position.toUpperCase(),
                      onPressed: () => setState(() => _selectedPosition = position),
                      size: VSButtonSize.small,
                      variant: _selectedPosition == position ? VSButtonVariant.primary : VSButtonVariant.outlined,
                    )).toList(),
                  ),
                  SizedBox(height: AppSpacing.md),
                  Wrap(
                    spacing: AppSpacing.md,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSButton(
                        label: 'Top Position',
                        onPressed: () => _showToast(
                          context,
                          message: 'This toast appears at the top of the screen.',
                          type: VSToastType.info,
                          position: Alignment.topRight,
                        ),
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Bottom Position',
                        onPressed: () => _showToast(
                          context,
                          message: 'This toast appears at the bottom of the screen.',
                          type: VSToastType.info,
                          position: Alignment.bottomRight,
                        ),
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Center Position',
                        onPressed: () => _showToast(
                          context,
                          message: 'This toast appears in the center of the screen.',
                          type: VSToastType.info,
                          position: Alignment.center,
                        ),
                        size: VSButtonSize.small,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Toast Duration
        _buildToastGroup(
          title: 'Toast Duration',
          description: 'Controlling how long toasts remain visible',
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
                    'Duration Settings',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.xs,
                    children: ['short', 'long', 'persistent'].map((duration) => VSButton(
                      label: duration.toUpperCase(),
                      onPressed: () => setState(() => _selectedDuration = duration),
                      size: VSButtonSize.small,
                      variant: _selectedDuration == duration ? VSButtonVariant.primary : VSButtonVariant.outlined,
                    )).toList(),
                  ),
                  SizedBox(height: AppSpacing.md),
                  Wrap(
                    spacing: AppSpacing.md,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSButton(
                        label: 'Short Duration (2s)',
                        onPressed: () => _showToast(
                          context,
                          message: 'This toast disappears quickly.',
                          type: VSToastType.success,
                          duration: const Duration(seconds: 2),
                        ),
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Long Duration (5s)',
                        onPressed: () => _showToast(
                          context,
                          message: 'This toast stays visible longer.',
                          type: VSToastType.warning,
                          duration: const Duration(seconds: 5),
                        ),
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Persistent Toast',
                        onPressed: () => _showToast(
                          context,
                          message: 'This toast stays until dismissed manually.',
                          type: VSToastType.info,
                          duration: null, // Persistent
                          actionLabel: 'Dismiss',
                          onActionTap: () => {},
                        ),
                        size: VSButtonSize.small,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Real-world Usage Examples
        _buildToastGroup(
          title: 'Real-world Usage Examples',
          description: 'Common toast patterns in actual applications and user workflows',
          children: [
            // E-commerce Actions
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
                      Icon(Icons.shopping_cart, color: AppColors.primaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'E-commerce Actions',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.md,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSButton(
                        label: 'Add to Cart',
                        onPressed: () => _showToast(
                          context,
                          message: 'Wireless headphones added to cart!',
                          type: VSToastType.success,
                          actionLabel: 'View Cart',
                          onActionTap: () => _showActionDialog(context, 'Opening cart...'),
                        ),
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Out of Stock',
                        onPressed: () => _showToast(
                          context,
                          message: 'Sorry, this item is currently out of stock.',
                          type: VSToastType.warning,
                        ),
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Order Placed',
                        onPressed: () => _showToast(
                          context,
                          message: 'Your order has been placed successfully! Order #12345',
                          type: VSToastType.success,
                          actionLabel: 'Track Order',
                          onActionTap: () => _showActionDialog(context, 'Opening order tracking...'),
                        ),
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Payment Failed',
                        onPressed: () => _showToast(
                          context,
                          message: 'Payment failed. Please check your card details and try again.',
                          type: VSToastType.error,
                          actionLabel: 'Retry',
                          onActionTap: () => _showActionDialog(context, 'Retrying payment...'),
                        ),
                        size: VSButtonSize.small,
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
                  Row(
                    children: [
                      Icon(Icons.folder, color: AppColors.successDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'File Operations',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.md,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSButton(
                        label: 'File Saved',
                        onPressed: () => _showToast(
                          context,
                          message: 'Document saved successfully.',
                          type: VSToastType.success,
                        ),
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Upload Complete',
                        onPressed: () => _showToast(
                          context,
                          message: 'File uploaded successfully to the cloud.',
                          type: VSToastType.success,
                          actionLabel: 'View File',
                          onActionTap: () => _showActionDialog(context, 'Opening file...'),
                        ),
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'File Too Large',
                        onPressed: () => _showToast(
                          context,
                          message: 'File size exceeds the maximum limit of 10MB.',
                          type: VSToastType.error,
                        ),
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Download Started',
                        onPressed: () => _showToast(
                          context,
                          message: 'Download started. Check your downloads folder.',
                          type: VSToastType.info,
                        ),
                        size: VSButtonSize.small,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // User Authentication
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
                      Icon(Icons.lock, color: AppColors.warningDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Authentication',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.md,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSButton(
                        label: 'Login Success',
                        onPressed: () => _showToast(
                          context,
                          message: 'Welcome back! You have successfully logged in.',
                          type: VSToastType.success,
                        ),
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Invalid Credentials',
                        onPressed: () => _showToast(
                          context,
                          message: 'Invalid email or password. Please try again.',
                          type: VSToastType.error,
                        ),
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Password Reset',
                        onPressed: () => _showToast(
                          context,
                          message: 'Password reset email sent. Check your inbox.',
                          type: VSToastType.info,
                        ),
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Session Expired',
                        onPressed: () => _showToast(
                          context,
                          message: 'Your session has expired. Please log in again.',
                          type: VSToastType.warning,
                          actionLabel: 'Login',
                          onActionTap: () => _showActionDialog(context, 'Redirecting to login...'),
                        ),
                        size: VSButtonSize.small,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // System Notifications
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
                      Icon(Icons.notifications, color: AppColors.secondaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'System Notifications',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.md,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSButton(
                        label: 'Update Available',
                        onPressed: () => _showToast(
                          context,
                          message: 'Version 2.1.0 is available. New features and improvements!',
                          type: VSToastType.info,
                          actionLabel: 'Update Now',
                          onActionTap: () => _showActionDialog(context, 'Starting update...'),
                        ),
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Maintenance',
                        onPressed: () => _showToast(
                          context,
                          message: 'Scheduled maintenance in 30 minutes. Save your work.',
                          type: VSToastType.warning,
                        ),
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Backup Complete',
                        onPressed: () => _showToast(
                          context,
                          message: 'Automatic backup completed successfully.',
                          type: VSToastType.success,
                        ),
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Connection Restored',
                        onPressed: () => _showToast(
                          context,
                          message: 'Internet connection restored.',
                          type: VSToastType.success,
                        ),
                        size: VSButtonSize.small,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

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
                  Row(
                    children: [
                      Icon(Icons.check_circle, color: AppColors.successDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Form Validation',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.md,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSButton(
                        label: 'Form Saved',
                        onPressed: () => _showToast(
                          context,
                          message: 'Your changes have been saved successfully.',
                          type: VSToastType.success,
                        ),
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Validation Error',
                        onPressed: () => _showToast(
                          context,
                          message: 'Please fill in all required fields before submitting.',
                          type: VSToastType.error,
                        ),
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Email Sent',
                        onPressed: () => _showToast(
                          context,
                          message: 'Message sent successfully. We\'ll get back to you soon!',
                          type: VSToastType.success,
                        ),
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Duplicate Entry',
                        onPressed: () => _showToast(
                          context,
                          message: 'This email address is already registered.',
                          type: VSToastType.warning,
                        ),
                        size: VSButtonSize.small,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Interactive Demo
        _buildToastGroup(
          title: 'Interactive Demo',
          description: 'Experiment with different toast configurations and see live results',
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
                    'Toast Configuration Demo',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.md),
                  Wrap(
                    spacing: AppSpacing.md,
                    runSpacing: AppSpacing.sm,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Position',
                            style: AppTypography.bodySmallSemibold,
                          ),
                          SizedBox(height: AppSpacing.xs),
                          Wrap(
                            spacing: AppSpacing.xs,
                            children: ['top', 'bottom', 'center'].map((pos) => VSButton(
                              label: pos,
                              onPressed: () => setState(() => _selectedPosition = pos),
                              size: VSButtonSize.small,
                              variant: _selectedPosition == pos ? VSButtonVariant.primary : VSButtonVariant.outlined,
                            )).toList(),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Duration',
                            style: AppTypography.bodySmallSemibold,
                          ),
                          SizedBox(height: AppSpacing.xs),
                          Wrap(
                            spacing: AppSpacing.xs,
                            children: ['short', 'long', 'persistent'].map((dur) => VSButton(
                              label: dur,
                              onPressed: () => setState(() => _selectedDuration = dur),
                              size: VSButtonSize.small,
                              variant: _selectedDuration == dur ? VSButtonVariant.primary : VSButtonVariant.outlined,
                            )).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.md),
                  Wrap(
                    spacing: AppSpacing.md,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSButton(
                        label: 'Test Success',
                        onPressed: () => _showToast(
                          context,
                          message: 'Success toast with current settings.',
                          type: VSToastType.success,
                          position: _getPositionFromString(_selectedPosition),
                          duration: _getDurationFromString(_selectedDuration),
                        ),
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.primary,
                      ),
                      VSButton(
                        label: 'Test Error',
                        onPressed: () => _showToast(
                          context,
                          message: 'Error toast with current settings.',
                          type: VSToastType.error,
                          position: _getPositionFromString(_selectedPosition),
                          duration: _getDurationFromString(_selectedDuration),
                        ),
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.danger,
                      ),
                      VSButton(
                        label: 'Test with Action',
                        onPressed: () => _showToast(
                          context,
                          message: 'Toast with action button using current settings.',
                          type: VSToastType.info,
                          position: _getPositionFromString(_selectedPosition),
                          duration: _getDurationFromString(_selectedDuration),
                          actionLabel: 'Action',
                          onActionTap: () => _showActionDialog(context, 'Action executed!'),
                        ),
                        size: VSButtonSize.small,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.md),
                  VSButton(
                    label: 'Hide All Toasts',
                    onPressed: () => VSToast,
                    size: VSButtonSize.small,
                    variant: VSButtonVariant.outlined,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildToastGroup({
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

  void _showToast(
    BuildContext context, {
    required String message,
    required VSToastType type,
    Alignment position = Alignment.topRight,
    Duration? duration,
    String? actionLabel,
    VoidCallback? onActionTap,
  }) {
    VSToastService.showToast(
      context,
      title: message,
      description: '',
      type: type,
      alignment: position,
      duration: duration ?? const Duration(seconds: 5),
      actionLabel: actionLabel,
      onActionTap: onActionTap,
    );
  }

  Alignment _getPositionFromString(String position) {
    switch (position) {
      case 'top':
        return Alignment.topRight;
      case 'bottom':
        return Alignment.bottomRight;
      case 'center':
        return Alignment.center;
      default:
        return Alignment.topRight;
    }
  }

  Duration? _getDurationFromString(String duration) {
    switch (duration) {
      case 'short':
        return const Duration(seconds: 2);
      case 'long':
        return const Duration(seconds: 5);
      case 'persistent':
        return null;
      default:
        return const Duration(seconds: 3);
    }
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

  void _showToastInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'VS Toast Information',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The VS Toast component provides non-intrusive notifications for user feedback with VS Design System styling.',
              style: AppTypography.bodyMediumRegular,
            ),
            SizedBox(height: AppSpacing.md),
            Text(
              'Key Features:',
              style: AppTypography.bodyMediumSemibold,
            ),
            SizedBox(height: AppSpacing.sm),
            Text(
              '• Multiple toast types (success, error, warning, info)\n'
              '• Configurable positioning (top, bottom, center)\n'
              '• Customizable duration or persistent display\n'
              '• Optional action buttons for user interaction\n'
              '• VS Design System styling integration\n'
              '• Smooth animations and transitions\n'
              '• Proper accessibility support\n'
              '• Queue management for multiple toasts\n'
              '• Auto-dismiss functionality\n'
              '• Theme-aware color schemes\n'
              '• Responsive layout design',
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
