import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSToggleExample extends StatefulWidget {
  const VSToggleExample({super.key});

  @override
  State<VSToggleExample> createState() => _VSToggleExampleState();
}

class _VSToggleExampleState extends State<VSToggleExample> {
  // Basic toggle states
  bool _basicToggle = false;
  bool _labeledToggle = true;
  bool _disabledToggle = false;

  // Settings toggles
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  bool _autoSaveEnabled = true;
  bool _soundEnabled = false;

  // Feature toggles
  bool _premiumFeature = false;
  bool _betaFeatures = false;
  bool _analyticsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Toggle Examples',
      //   actions: [
      //     VSButton(
      //       label: 'Info',
      //       onPressed: () => _showToggleInfo(context),
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
              title: 'VS Toggle Variants & States',
              description: 'Comprehensive demonstration of toggle configurations and real-world usage patterns',
              child: _buildToggleShowcase(),
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

  Widget _buildToggleShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic Toggles
        _buildToggleGroup(
          title: 'Basic Toggle States',
          description: 'Standard toggle implementation with different states and configurations',
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
                    'Toggle States',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Basic Toggle',
                    toggle: VSToggle(
                      value: _basicToggle,
                      onChanged: (value) => setState(() => _basicToggle = value),
                    ),
                    description: 'Simple on/off toggle',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Labeled Toggle',
                    toggle: VSToggle(
                      value: _labeledToggle,
                      onChanged: (value) => setState(() => _labeledToggle = value),
                    ),
                    description: 'Toggle with descriptive text',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Disabled Toggle',
                    toggle: VSToggle(
                      value: _disabledToggle,
                      onChanged: null, // Disabled
                    ),
                    description: 'Non-interactive toggle',
                  ),
                  SizedBox(height: AppSpacing.md),
                  Container(
                    padding: EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'States: Basic=${_basicToggle}, Labeled=${_labeledToggle}, Disabled=${_disabledToggle}',
                      style: AppTypography.bodySmallRegular,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Settings Panel
        _buildToggleGroup(
          title: 'Settings & Preferences',
          description: 'Common toggle patterns in application settings and user preferences',
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
                  Row(
                    children: [
                      Icon(Icons.settings, color: AppColors.primaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Application Settings',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Push Notifications',
                    toggle: VSToggle(
                      value: _notificationsEnabled,
                      onChanged: (value) => setState(() => _notificationsEnabled = value),
                    ),
                    description: 'Receive notifications about updates and messages',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Dark Mode',
                    toggle: VSToggle(
                      value: _darkModeEnabled,
                      onChanged: (value) => setState(() => _darkModeEnabled = value),
                    ),
                    description: 'Switch to dark theme for better visibility',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Auto-save',
                    toggle: VSToggle(
                      value: _autoSaveEnabled,
                      onChanged: (value) => setState(() => _autoSaveEnabled = value),
                    ),
                    description: 'Automatically save changes as you work',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Sound Effects',
                    toggle: VSToggle(
                      value: _soundEnabled,
                      onChanged: (value) => setState(() => _soundEnabled = value),
                    ),
                    description: 'Play sounds for interactions and notifications',
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Feature Toggles
        _buildToggleGroup(
          title: 'Feature Toggles',
          description: 'Toggles for enabling/disabling application features and experimental options',
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
                  Row(
                    children: [
                      Icon(Icons.new_releases, color: AppColors.warningDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Feature Management',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Premium Features',
                    toggle: VSToggle(
                      value: _premiumFeature,
                      onChanged: (value) => setState(() => _premiumFeature = value),
                    ),
                    description: 'Enable advanced features (requires subscription)',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Beta Features',
                    toggle: VSToggle(
                      value: _betaFeatures,
                      onChanged: (value) => setState(() => _betaFeatures = value),
                    ),
                    description: 'Try experimental features before release',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Analytics Tracking',
                    toggle: VSToggle(
                      value: _analyticsEnabled,
                      onChanged: (value) => setState(() => _analyticsEnabled = value),
                    ),
                    description: 'Help improve the app by sharing usage data',
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Real-world Usage Examples
        _buildToggleGroup(
          title: 'Real-world Usage Examples',
          description: 'Common toggle patterns in actual applications and interfaces',
          children: [
            // Privacy Settings
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
                      Icon(Icons.privacy_tip, color: AppColors.warningDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Privacy & Security',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Location Services',
                    toggle: VSToggle(
                      value: true,
                      onChanged: (value) => _showActionDialog(context, 'Location services ${value ? 'enabled' : 'disabled'}'),
                    ),
                    description: 'Allow access to your location for better recommendations',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Camera Access',
                    toggle: VSToggle(
                      value: false,
                      onChanged: (value) => _showActionDialog(context, 'Camera access ${value ? 'granted' : 'revoked'}'),
                    ),
                    description: 'Enable camera for profile pictures and video calls',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Contact Sync',
                    toggle: VSToggle(
                      value: true,
                      onChanged: (value) => _showActionDialog(context, 'Contact sync ${value ? 'enabled' : 'disabled'}'),
                    ),
                    description: 'Sync contacts for easier communication',
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Account Preferences
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
                      Icon(Icons.account_circle, color: AppColors.primaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Account Preferences',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Email Marketing',
                    toggle: VSToggle(
                      value: false,
                      onChanged: (value) => _showActionDialog(context, 'Email marketing ${value ? 'subscribed' : 'unsubscribed'}'),
                    ),
                    description: 'Receive promotional emails and special offers',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Two-Factor Auth',
                    toggle: VSToggle(
                      value: true,
                      onChanged: (value) => _showActionDialog(context, 'Two-factor authentication ${value ? 'enabled' : 'disabled'}'),
                    ),
                    description: 'Add an extra layer of security to your account',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Profile Visibility',
                    toggle: VSToggle(
                      value: true,
                      onChanged: (value) => _showActionDialog(context, 'Profile ${value ? 'public' : 'private'}'),
                    ),
                    description: 'Make your profile visible to other users',
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Device Settings
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
                      Icon(Icons.devices, color: AppColors.secondaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Device Settings',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Wi-Fi Only',
                    toggle: VSToggle(
                      value: false,
                      onChanged: (value) => _showActionDialog(context, 'Wi-Fi only mode ${value ? 'enabled' : 'disabled'}'),
                    ),
                    description: 'Download updates only when connected to Wi-Fi',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Background Refresh',
                    toggle: VSToggle(
                      value: true,
                      onChanged: (value) => _showActionDialog(context, 'Background refresh ${value ? 'enabled' : 'disabled'}'),
                    ),
                    description: 'Refresh content in the background',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Low Power Mode',
                    toggle: VSToggle(
                      value: false,
                      onChanged: (value) => _showActionDialog(context, 'Low power mode ${value ? 'activated' : 'deactivated'}'),
                    ),
                    description: 'Reduce battery usage by limiting background activity',
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Notification Settings
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
                      Icon(Icons.notifications, color: AppColors.successDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Notification Settings',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Message Notifications',
                    toggle: VSToggle(
                      value: true,
                      onChanged: (value) => _showActionDialog(context, 'Message notifications ${value ? 'enabled' : 'disabled'}'),
                    ),
                    description: 'Get notified when you receive new messages',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Friend Requests',
                    toggle: VSToggle(
                      value: true,
                      onChanged: (value) => _showActionDialog(context, 'Friend request notifications ${value ? 'enabled' : 'disabled'}'),
                    ),
                    description: 'Receive notifications for new friend requests',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Event Reminders',
                    toggle: VSToggle(
                      value: false,
                      onChanged: (value) => _showActionDialog(context, 'Event reminders ${value ? 'enabled' : 'disabled'}'),
                    ),
                    description: 'Get reminded about upcoming events and deadlines',
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Developer Options
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
                      Icon(Icons.developer_mode, color: AppColors.dangerDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Developer Options',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Debug Mode',
                    toggle: VSToggle(
                      value: false,
                      onChanged: (value) => _showActionDialog(context, 'Debug mode ${value ? 'enabled' : 'disabled'}'),
                    ),
                    description: 'Enable detailed logging and debugging information',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Performance Monitoring',
                    toggle: VSToggle(
                      value: true,
                      onChanged: (value) => _showActionDialog(context, 'Performance monitoring ${value ? 'enabled' : 'disabled'}'),
                    ),
                    description: 'Track app performance and identify bottlenecks',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildToggleRow(
                    label: 'Crash Reporting',
                    toggle: VSToggle(
                      value: true,
                      onChanged: (value) => _showActionDialog(context, 'Crash reporting ${value ? 'enabled' : 'disabled'}'),
                    ),
                    description: 'Automatically report crashes to help improve stability',
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Interactive Demo
        _buildToggleGroup(
          title: 'Interactive Demo',
          description: 'Experiment with different toggle configurations and see live updates',
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
                    'Toggle State Playground',
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
                            'Quick Actions',
                            style: AppTypography.bodySmallSemibold,
                          ),
                          SizedBox(height: AppSpacing.xs),
                          Wrap(
                            spacing: AppSpacing.xs,
                            children: [
                              VSButton(
                                label: 'All On',
                                onPressed: () => setState(() {
                                  _basicToggle = true;
                                  _labeledToggle = true;
                                  _notificationsEnabled = true;
                                  _darkModeEnabled = true;
                                  _autoSaveEnabled = true;
                                  _soundEnabled = true;
                                }),
                                size: VSButtonSize.small,
                              ),
                              VSButton(
                                label: 'All Off',
                                onPressed: () => setState(() {
                                  _basicToggle = false;
                                  _labeledToggle = false;
                                  _notificationsEnabled = false;
                                  _darkModeEnabled = false;
                                  _autoSaveEnabled = false;
                                  _soundEnabled = false;
                                }),
                                size: VSButtonSize.small,
                                variant: VSButtonVariant.outlined,
                              ),
                              VSButton(
                                label: 'Random',
                                onPressed: () => setState(() {
                                  _basicToggle = !_basicToggle;
                                  _labeledToggle = !_labeledToggle;
                                  _notificationsEnabled = !_notificationsEnabled;
                                  _darkModeEnabled = !_darkModeEnabled;
                                  _autoSaveEnabled = !_autoSaveEnabled;
                                  _soundEnabled = !_soundEnabled;
                                }),
                                size: VSButtonSize.small,
                                variant: VSButtonVariant.secondary,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.md),
                  Container(
                    padding: EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      border: Border.all(color: AppColors.neutral300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        _buildToggleRow(
                          label: 'Interactive Toggle 1',
                          toggle: VSToggle(
                            value: _basicToggle,
                            onChanged: (value) => setState(() => _basicToggle = value),
                          ),
                          description: 'Toggle this to see live state changes',
                        ),
                        SizedBox(height: AppSpacing.sm),
                        _buildToggleRow(
                          label: 'Interactive Toggle 2',
                          toggle: VSToggle(
                            value: _labeledToggle,
                            onChanged: (value) => setState(() => _labeledToggle = value),
                          ),
                          description: 'Another interactive toggle for testing',
                        ),
                        SizedBox(height: AppSpacing.sm),
                        _buildToggleRow(
                          label: 'Notifications',
                          toggle: VSToggle(
                            value: _notificationsEnabled,
                            onChanged: (value) => setState(() => _notificationsEnabled = value),
                          ),
                          description: 'Control notification preferences',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpacing.md),
                  Container(
                    padding: EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBg.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Live States: Toggle1=${_basicToggle}, Toggle2=${_labeledToggle}, Notifications=${_notificationsEnabled}',
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.primaryDefault,
                      ),
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

  Widget _buildToggleGroup({
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

  Widget _buildToggleRow({
    required String label,
    required Widget toggle,
    required String description,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTypography.bodySmallSemibold,
              ),
              Text(
                description,
                style: AppTypography.bodySmallRegular.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: AppSpacing.md),
        toggle,
      ],
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

  void _showToggleInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'VS Toggle Information',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The VS Toggle component provides binary choice controls for settings and preferences with VS Design System styling.',
              style: AppTypography.bodyMediumRegular,
            ),
            SizedBox(height: AppSpacing.md),
            Text(
              'Key Features:',
              style: AppTypography.bodyMediumSemibold,
            ),
            SizedBox(height: AppSpacing.sm),
            Text(
              '• Clean toggle switch design\n'
              '• Enabled and disabled states\n'
              '• Smooth animations and transitions\n'
              '• VS Design System styling integration\n'
              '• Proper accessibility and keyboard navigation\n'
              '• Consistent spacing and visual feedback\n'
              '• Support for custom styling\n'
              '• Form integration ready\n'
              '• Theme-aware color schemes\n'
              '• Responsive touch targets\n'
              '• Clear visual indication of state',
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