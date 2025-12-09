# VS Toggle Implementation

## Overview

The VS Toggle component provides binary choice controls for settings and preferences with VS Design System styling. It offers a clean, accessible toggle switch that allows users to enable or disable features and options.

## Features

- **Binary State Control**: Simple on/off toggle functionality
- **Smooth Animations**: Fluid transitions between states with 200ms duration
- **Accessibility**: Proper touch targets and keyboard navigation support
- **Disabled State**: Visual feedback for non-interactive toggles
- **Optional Labels**: Built-in label support for better context
- **VS Design System Integration**: Consistent colors, typography, and spacing
- **Theme Integration**: Automatic color adaptation based on state and theme

## Basic Usage

```dart
import 'package:vs_design_system/vs_design_system.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSToggle(
          value: _notificationsEnabled,
          onChanged: (value) => setState(() => _notificationsEnabled = value),
          label: 'Enable Notifications',
        ),
        SizedBox(height: AppSpacing.md),
        VSToggle(
          value: _darkModeEnabled,
          onChanged: (value) => setState(() => _darkModeEnabled = value),
          label: 'Dark Mode',
        ),
      ],
    );
  }
}
```

## States

### Enabled State

```dart
VSToggle(
  value: true,
  onChanged: (value) => print('Toggle changed to: $value'),
  label: 'Enabled Toggle',
)
```

### Disabled State

```dart
VSToggle(
  value: false,
  onChanged: null, // Setting onChanged to null disables the toggle
  label: 'Disabled Toggle',
)
```

### Without Label

```dart
VSToggle(
  value: true,
  onChanged: (value) => print('Toggle: $value'),
  // No label provided
)
```

## Advanced Examples

### Settings Panel

```dart
class AppSettings extends StatefulWidget {
  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  bool _pushNotifications = true;
  bool _emailNotifications = false;
  bool _smsNotifications = true;
  bool _marketingEmails = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.neutral100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Notification Preferences',
            style: AppTypography.bodyLargeSemibold,
          ),
          SizedBox(height: AppSpacing.md),
          _buildToggleRow(
            'Push Notifications',
            'Receive push notifications on your device',
            _pushNotifications,
            (value) => setState(() => _pushNotifications = value),
          ),
          SizedBox(height: AppSpacing.sm),
          _buildToggleRow(
            'Email Notifications',
            'Get notified via email for important updates',
            _emailNotifications,
            (value) => setState(() => _emailNotifications = value),
          ),
          SizedBox(height: AppSpacing.sm),
          _buildToggleRow(
            'SMS Notifications',
            'Receive text messages for critical alerts',
            _smsNotifications,
            (value) => setState(() => _smsNotifications = value),
          ),
          SizedBox(height: AppSpacing.sm),
          _buildToggleRow(
            'Marketing Emails',
            'Receive promotional emails and special offers',
            _marketingEmails,
            (value) => setState(() => _marketingEmails = value),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleRow(String title, String description, bool value, ValueChanged<bool> onChanged) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.bodyMediumSemibold,
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
        VSToggle(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
```

### Privacy Settings

```dart
class PrivacySettings extends StatefulWidget {
  @override
  State<PrivacySettings> createState() => _PrivacySettingsState();
}

class _PrivacySettingsState extends State<PrivacySettings> {
  bool _locationServices = true;
  bool _cameraAccess = false;
  bool _microphoneAccess = false;
  bool _contactSync = true;
  bool _analyticsTracking = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Privacy & Security',
            style: AppTypography.h4,
          ),
          SizedBox(height: AppSpacing.lg),

          // Location Services
          _buildPrivacyToggle(
            icon: Icons.location_on,
            title: 'Location Services',
            description: 'Allow access to your location for better recommendations and services',
            value: _locationServices,
            onChanged: (value) => setState(() => _locationServices = value),
            requiresPermission: true,
          ),

          SizedBox(height: AppSpacing.md),

          // Camera Access
          _buildPrivacyToggle(
            icon: Icons.camera_alt,
            title: 'Camera Access',
            description: 'Enable camera for profile pictures and video calls',
            value: _cameraAccess,
            onChanged: (value) => setState(() => _cameraAccess = value),
            requiresPermission: true,
          ),

          SizedBox(height: AppSpacing.md),

          // Microphone Access
          _buildPrivacyToggle(
            icon: Icons.mic,
            title: 'Microphone Access',
            description: 'Allow microphone access for voice messages and calls',
            value: _microphoneAccess,
            onChanged: (value) => setState(() => _microphoneAccess = value),
            requiresPermission: true,
          ),

          SizedBox(height: AppSpacing.md),

          // Contact Sync
          _buildPrivacyToggle(
            icon: Icons.contacts,
            title: 'Contact Synchronization',
            description: 'Sync your contacts for easier communication and social features',
            value: _contactSync,
            onChanged: (value) => setState(() => _contactSync = value),
            requiresPermission: false,
          ),

          SizedBox(height: AppSpacing.md),

          // Analytics
          _buildPrivacyToggle(
            icon: Icons.analytics,
            title: 'Analytics & Usage Data',
            description: 'Help improve our services by sharing anonymous usage data',
            value: _analyticsTracking,
            onChanged: (value) => setState(() => _analyticsTracking = value),
            requiresPermission: false,
          ),
        ],
      ),
    );
  }

  Widget _buildPrivacyToggle({
    required IconData icon,
    required String title,
    required String description,
    required bool value,
    required ValueChanged<bool> onChanged,
    required bool requiresPermission,
  }) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.neutral0,
        border: Border.all(color: AppColors.neutral300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: requiresPermission ? AppColors.warningBg : AppColors.successBg,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              icon,
              color: requiresPermission ? AppColors.warningDefault : AppColors.successDefault,
              size: 20,
            ),
          ),
          SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: AppTypography.bodyMediumSemibold,
                    ),
                    if (requiresPermission) ...[
                      SizedBox(width: AppSpacing.xs),
                      VSBadge(
                        label: 'Requires Permission',
                        variant: VSBadgeVariant.warning,
                        size: VSBadgeSize.xsmall,
                      ),
                    ],
                  ],
                ),
                SizedBox(height: AppSpacing.xs),
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
          VSToggle(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
```

### Account Preferences

```dart
class AccountPreferences extends StatefulWidget {
  @override
  State<AccountPreferences> createState() => _AccountPreferencesState();
}

class _AccountPreferencesState extends State<AccountPreferences> {
  bool _twoFactorAuth = true;
  bool _profileVisibility = true;
  bool _emailMarketing = false;
  bool _dataSharing = false;
  bool _autoBackup = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account Preferences',
          style: AppTypography.h4,
        ),
        SizedBox(height: AppSpacing.lg),

        // Security Settings
        _buildPreferenceSection(
          'Security',
          [
            _buildPreferenceToggle(
              'Two-Factor Authentication',
              'Add an extra layer of security to your account',
              _twoFactorAuth,
              (value) => setState(() => _twoFactorAuth = value),
              securityLevel: 'High',
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Privacy Settings
        _buildPreferenceSection(
          'Privacy',
          [
            _buildPreferenceToggle(
              'Profile Visibility',
              'Make your profile visible to other users',
              _profileVisibility,
              (value) => setState(() => _profileVisibility = value),
            ),
            _buildPreferenceToggle(
              'Data Sharing',
              'Allow sharing of anonymized data for research',
              _dataSharing,
              (value) => setState(() => _dataSharing = value),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Communication
        _buildPreferenceSection(
          'Communication',
          [
            _buildPreferenceToggle(
              'Marketing Emails',
              'Receive promotional emails and special offers',
              _emailMarketing,
              (value) => setState(() => _emailMarketing = value),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Data Management
        _buildPreferenceSection(
          'Data Management',
          [
            _buildPreferenceToggle(
              'Automatic Backup',
              'Automatically backup your data to the cloud',
              _autoBackup,
              (value) => setState(() => _autoBackup = value),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPreferenceSection(String title, List<Widget> toggles) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.neutral50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTypography.bodyLargeSemibold,
          ),
          SizedBox(height: AppSpacing.md),
          ...toggles,
        ],
      ),
    );
  }

  Widget _buildPreferenceToggle(
    String title,
    String description,
    bool value,
    ValueChanged<bool> onChanged, {
    String? securityLevel,
  }) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.sm),
      margin: EdgeInsets.only(bottom: AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.neutral0,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: AppTypography.bodyMediumSemibold,
                    ),
                    if (securityLevel != null) ...[
                      SizedBox(width: AppSpacing.xs),
                      VSBadge(
                        label: securityLevel,
                        variant: securityLevel == 'High'
                            ? VSBadgeVariant.success
                            : VSBadgeVariant.warning,
                        size: VSBadgeSize.xsmall,
                      ),
                    ],
                  ],
                ),
                SizedBox(height: AppSpacing.xs),
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
          VSToggle(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
```

### Device Settings

```dart
class DeviceSettings extends StatefulWidget {
  @override
  State<DeviceSettings> createState() => _DeviceSettingsState();
}

class _DeviceSettingsState extends State<DeviceSettings> {
  bool _wifiOnly = false;
  bool _backgroundRefresh = true;
  bool _lowPowerMode = false;
  bool _autoUpdate = true;
  bool _hapticFeedback = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.devices, color: AppColors.primaryDefault),
              SizedBox(width: AppSpacing.sm),
              Text(
                'Device Settings',
                style: AppTypography.h4,
              ),
            ],
          ),
          SizedBox(height: AppSpacing.lg),

          // Network Settings
          _buildSettingCard(
            'Network & Data',
            [
              _buildSettingToggle(
                'Wi-Fi Only Downloads',
                'Download updates and media only when connected to Wi-Fi',
                _wifiOnly,
                (value) => setState(() => _wifiOnly = value),
                icon: Icons.wifi,
              ),
              _buildSettingToggle(
                'Background App Refresh',
                'Allow apps to refresh content in the background',
                _backgroundRefresh,
                (value) => setState(() => _backgroundRefresh = value),
                icon: Icons.refresh,
              ),
            ],
          ),

          SizedBox(height: AppSpacing.md),

          // Power Settings
          _buildSettingCard(
            'Power Management',
            [
              _buildSettingToggle(
                'Low Power Mode',
                'Reduce battery usage by limiting background activity',
                _lowPowerMode,
                (value) => setState(() => _lowPowerMode = value),
                icon: Icons.battery_saver,
                warning: true,
              ),
            ],
          ),

          SizedBox(height: AppSpacing.md),

          // Update Settings
          _buildSettingCard(
            'Updates',
            [
              _buildSettingToggle(
                'Automatic Updates',
                'Automatically download and install app updates',
                _autoUpdate,
                (value) => setState(() => _autoUpdate = value),
                icon: Icons.system_update,
              ),
            ],
          ),

          SizedBox(height: AppSpacing.md),

          // Interaction Settings
          _buildSettingCard(
            'Interaction',
            [
              _buildSettingToggle(
                'Haptic Feedback',
                'Provide tactile feedback for interactions',
                _hapticFeedback,
                (value) => setState(() => _hapticFeedback = value),
                icon: Icons.vibration,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingCard(String title, List<Widget> settings) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.neutral0,
        border: Border.all(color: AppColors.neutral300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.neutral50,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Text(
              title,
              style: AppTypography.bodyLargeSemibold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppSpacing.md),
            child: Column(children: settings),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingToggle(
    String title,
    String description,
    bool value,
    ValueChanged<bool> onChanged, {
    required IconData icon,
    bool warning = false,
  }) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.sm),
      margin: EdgeInsets.only(bottom: AppSpacing.sm),
      decoration: BoxDecoration(
        color: warning ? AppColors.warningBg.withValues(alpha: 0.1) : AppColors.neutral50,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(AppSpacing.xs),
            decoration: BoxDecoration(
              color: warning ? AppColors.warningDefault : AppColors.primaryDefault,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              icon,
              color: AppColors.neutral0,
              size: 16,
            ),
          ),
          SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.bodySmallSemibold,
                ),
                Text(
                  description,
                  style: AppTypography.bodyXSmallRegular.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: AppSpacing.sm),
          VSToggle(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
```

## Real-World Usage Patterns

### Notification Settings

```dart
class NotificationSettings extends StatefulWidget {
  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool _messageNotifications = true;
  bool _friendRequests = true;
  bool _eventReminders = false;
  bool _systemUpdates = true;
  bool _marketingNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notification Settings',
          style: AppTypography.h4,
        ),
        SizedBox(height: AppSpacing.lg),

        _buildNotificationToggle(
          'Messages',
          'Get notified when you receive new messages',
          _messageNotifications,
          (value) => setState(() => _messageNotifications = value),
          icon: Icons.message,
          priority: 'High',
        ),

        SizedBox(height: AppSpacing.sm),

        _buildNotificationToggle(
          'Friend Requests',
          'Receive notifications for new friend requests',
          _friendRequests,
          (value) => setState(() => _friendRequests = value),
          icon: Icons.person_add,
          priority: 'Medium',
        ),

        SizedBox(height: AppSpacing.sm),

        _buildNotificationToggle(
          'Event Reminders',
          'Get reminded about upcoming events and deadlines',
          _eventReminders,
          (value) => setState(() => _eventReminders = value),
          icon: Icons.event,
          priority: 'Medium',
        ),

        SizedBox(height: AppSpacing.sm),

        _buildNotificationToggle(
          'System Updates',
          'Receive notifications about app updates and maintenance',
          _systemUpdates,
          (value) => setState(() => _systemUpdates = value),
          icon: Icons.system_update,
          priority: 'Low',
        ),

        SizedBox(height: AppSpacing.sm),

        _buildNotificationToggle(
          'Marketing',
          'Receive promotional notifications and special offers',
          _marketingNotifications,
          (value) => setState(() => _marketingNotifications = value),
          icon: Icons.local_offer,
          priority: 'Low',
        ),
      ],
    );
  }

  Widget _buildNotificationToggle(
    String title,
    String description,
    bool value,
    ValueChanged<bool> onChanged, {
    required IconData icon,
    required String priority,
  }) {
    Color priorityColor;
    switch (priority) {
      case 'High':
        priorityColor = AppColors.dangerDefault;
        break;
      case 'Medium':
        priorityColor = AppColors.warningDefault;
        break;
      case 'Low':
      default:
        priorityColor = AppColors.neutral600;
        break;
    }

    return Container(
      padding: EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.neutral0,
        border: Border.all(color: AppColors.neutral300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: priorityColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              icon,
              color: priorityColor,
              size: 20,
            ),
          ),
          SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: AppTypography.bodyMediumSemibold,
                    ),
                    SizedBox(width: AppSpacing.sm),
                    VSBadge(
                      label: priority,
                      variant: priority == 'High'
                          ? VSBadgeVariant.danger
                          : priority == 'Medium'
                          ? VSBadgeVariant.warning
                          : VSBadgeVariant.neutral,
                      size: VSBadgeSize.xsmall,
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.xs),
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
          VSToggle(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
```

### Developer Options

```dart
class DeveloperSettings extends StatefulWidget {
  @override
  State<DeveloperSettings> createState() => _DeveloperSettingsState();
}

class _DeveloperSettingsState extends State<DeveloperSettings> {
  bool _debugMode = false;
  bool _performanceMonitoring = true;
  bool _crashReporting = true;
  bool _verboseLogging = false;
  bool _experimentalFeatures = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.dangerBg.withValues(alpha: 0.05),
        border: Border.all(color: AppColors.dangerDefault.withValues(alpha: 0.3)),
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
                style: AppTypography.bodyLargeSemibold,
              ),
              SizedBox(width: AppSpacing.sm),
              VSBadge(
                label: 'Advanced',
                variant: VSBadgeVariant.danger,
                size: VSBadgeSize.small,
              ),
            ],
          ),
          SizedBox(height: AppSpacing.sm),
          Text(
            'These settings are intended for developers and advanced users. Changing these may affect app stability.',
            style: AppTypography.bodySmallRegular.copyWith(
              color: AppColors.dangerDefault,
            ),
          ),
          SizedBox(height: AppSpacing.md),

          _buildDeveloperToggle(
            'Debug Mode',
            'Enable detailed logging and debugging information',
            _debugMode,
            (value) => setState(() => _debugMode = value),
            warning: 'May impact performance',
          ),

          SizedBox(height: AppSpacing.sm),

          _buildDeveloperToggle(
            'Performance Monitoring',
            'Track app performance and identify bottlenecks',
            _performanceMonitoring,
            (value) => setState(() => _performanceMonitoring = value),
          ),

          SizedBox(height: AppSpacing.sm),

          _buildDeveloperToggle(
            'Crash Reporting',
            'Automatically report crashes to help improve stability',
            _crashReporting,
            (value) => setState(() => _crashReporting = value),
          ),

          SizedBox(height: AppSpacing.sm),

          _buildDeveloperToggle(
            'Verbose Logging',
            'Enable detailed logging for troubleshooting',
            _verboseLogging,
            (value) => setState(() => _verboseLogging = value),
            warning: 'Generates large log files',
          ),

          SizedBox(height: AppSpacing.sm),

          _buildDeveloperToggle(
            'Experimental Features',
            'Try new features that are still in development',
            _experimentalFeatures,
            (value) => setState(() => _experimentalFeatures = value),
            warning: 'Features may be unstable',
          ),
        ],
      ),
    );
  }

  Widget _buildDeveloperToggle(
    String title,
    String description,
    bool value,
    ValueChanged<bool> onChanged, {
    String? warning,
  }) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.neutral0,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: AppTypography.bodySmallSemibold,
                    ),
                    if (warning != null) ...[
                      SizedBox(width: AppSpacing.xs),
                      Icon(
                        Icons.warning,
                        color: AppColors.warningDefault,
                        size: 14,
                      ),
                    ],
                  ],
                ),
                SizedBox(height: AppSpacing.xs),
                Text(
                  description,
                  style: AppTypography.bodyXSmallRegular.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                if (warning != null) ...[
                  SizedBox(height: AppSpacing.xs),
                  Text(
                    warning,
                    style: AppTypography.bodyXSmallRegular.copyWith(
                      color: AppColors.warningDefault,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ],
            ),
          ),
          SizedBox(width: AppSpacing.sm),
          VSToggle(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
```

## Configuration Options

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `value` | `bool` | Required | Current state of the toggle (true = on, false = off) |
| `onChanged` | `ValueChanged<bool>?` | `null` | Callback when toggle state changes. Set to null to disable |
| `label` | `String?` | `null` | Optional text label displayed next to the toggle |
| `enabled` | `bool` | `true` | Whether the toggle is interactive (automatically set based on onChanged) |
| `key` | `Key?` | `null` | Widget key for identification |

## Best Practices

### When to Use Toggles

- **Binary Choices**: When users need to choose between two mutually exclusive options
- **Settings**: For app preferences, feature enablement, and configuration options
- **Permissions**: For granting or revoking access to features or data
- **Feature Flags**: For enabling/disabling experimental or premium features
- **Quick Actions**: For frequently changed settings that don't require confirmation

### Design Guidelines

- **Clear Labels**: Always provide descriptive labels for toggle actions
- **Default States**: Set sensible defaults based on user expectations and privacy
- **Logical Grouping**: Group related toggles together with clear section headers
- **Progressive Disclosure**: Use toggles to reveal additional options when enabled
- **Immediate Effect**: Changes should take effect immediately or with clear feedback

### Implementation Tips

- **State Management**: Use stateful widgets to manage toggle states
- **Persistence**: Consider saving toggle states to device storage
- **Validation**: Validate toggle combinations that might conflict
- **Feedback**: Provide immediate feedback when toggle states change
- **Accessibility**: Ensure proper screen reader support and keyboard navigation

## Accessibility

- **Touch Targets**: Minimum 44px touch target size for accessibility
- **Screen Reader**: Proper labeling and state announcements
- **Keyboard Navigation**: Full keyboard support with Space/Enter to toggle
- **Visual Indicators**: Clear visual distinction between on/off states
- **Color Contrast**: Sufficient contrast for all states and themes

## Integration with VS Design System

The VS Toggle component integrates seamlessly with other VS Design System components:

- **VSBadge**: For status indicators and priority levels
- **VSButton**: For actions related to toggle states
- **VSDialog**: For confirmation dialogs when toggles affect critical settings
- **VSInputField**: For additional configuration when toggles are enabled
- **AppColors**: Consistent color scheme for enabled/disabled states
- **AppTypography**: Standardized text styling for labels and descriptions
- **AppSpacing**: Consistent spacing and layout within settings panels

## Migration Guide

### From Flutter Switch

```dart
// Before: Flutter Switch
Switch(
  value: _isEnabled,
  onChanged: (value) => setState(() => _isEnabled = value),
)

// After: VS Toggle
VSToggle(
  value: _isEnabled,
  onChanged: (value) => setState(() => _isEnabled = value),
)
```

### From Checkbox for Binary Choices

```dart
// Before: Checkbox for binary choice
Checkbox(
  value: _isSelected,
  onChanged: (value) => setState(() => _isSelected = value ?? false),
)

// After: VS Toggle (for settings/preferences)
VSToggle(
  value: _isSelected,
  onChanged: (value) => setState(() => _isSelected = value),
  label: 'Enable Feature',
)
```

### From Custom Toggle Implementation

```dart
// Before: Custom toggle
class CustomToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 50,
        height: 30,
        decoration: BoxDecoration(
          color: value ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Align(
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 26,
            height: 26,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

// After: VS Toggle
VSToggle(
  value: value,
  onChanged: onChanged,
)
```