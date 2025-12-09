import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSDrawerExample extends StatefulWidget {
  const VSDrawerExample({super.key});

  @override
  State<VSDrawerExample> createState() => _VSDrawerExampleState();
}

class _VSDrawerExampleState extends State<VSDrawerExample> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Drawer Examples',
      //   actions: [
      //     VSButton(
      //       label: 'Info',
      //       onPressed: () => _showDrawerInfo(context),
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
              title: 'VS Drawer Variants & Types',
              description: 'Comprehensive demonstration of drawer configurations, items, and interactive examples',
              child: _buildDrawerShowcase(),
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

  Widget _buildDrawerShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic Drawer Types
        _buildDrawerGroup(
          title: 'Basic Drawer Configurations',
          description: 'Standard drawer with different item types and actions',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton(size: VSButtonSize.small,
                  label: 'Basic Drawer',
                  onPressed: () => _showBasicDrawer(context),
                  variant: VSButtonVariant.primary,
                ),
                VSButton(size: VSButtonSize.small,
                  label: 'Drawer with Info',
                  onPressed: () => _showDrawerWithInfo(context),
                  variant: VSButtonVariant.secondary,
                ),
                VSButton(size: VSButtonSize.small,
                  label: 'End Drawer',
                  onPressed: () => _showEndDrawer(),
                  variant: VSButtonVariant.outlined,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Drawer Item Types
        _buildDrawerGroup(
          title: 'Drawer Item Types',
          description: 'Different types of drawer items (text input, dropdown)',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton(size: VSButtonSize.small,
                  label: 'Text Items Only',
                  onPressed: () => _showTextItemsDrawer(context),
                ),
                VSButton(size: VSButtonSize.small,
                  label: 'Dropdown Items',
                  onPressed: () => _showDropdownItemsDrawer(context),
                ),
                VSButton(size: VSButtonSize.small,
                  label: 'Mixed Items',
                  onPressed: () => _showMixedItemsDrawer(context),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Drawer Actions
        _buildDrawerGroup(
          title: 'Drawer Actions',
          description: 'Different action button configurations',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton(size: VSButtonSize.small,
                  label: 'Single Action',
                  onPressed: () => _showSingleActionDrawer(context),
                ),
                VSButton(size: VSButtonSize.small,
                  label: 'Multiple Actions',
                  onPressed: () => _showMultipleActionsDrawer(context),
                ),
                VSButton(size: VSButtonSize.small,
                  label: 'No Actions',
                  onPressed: () => _showNoActionsDrawer(context),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Real-world Usage Examples
        _buildDrawerGroup(
          title: 'Real-world Usage Examples',
          description: 'Common drawer patterns in application interfaces',
          children: [
            // User Profile Settings
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
                    'User Profile Settings',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      const VSAvatar(
                        imageUrl: 'https://via.placeholder.com/40',
                        size: VSAvatarSize.medium,
                        isOnline: true,
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
                        label: 'VERIFIED',
                        variant: VSBadgeVariant.success,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSButton(size: VSButtonSize.small,
                        label: 'Edit Profile',
                        onPressed: () => _showProfileSettingsDrawer(context),
                        variant: VSButtonVariant.outlined,
                      ),
                      VSButton(size: VSButtonSize.small,
                        label: 'Privacy Settings',
                        onPressed: () => _showPrivacySettingsDrawer(context),
                        variant: VSButtonVariant.outlined,
                      ),
                      VSButton(size: VSButtonSize.small,
                        label: 'Notification Settings',
                        onPressed: () => _showNotificationSettingsDrawer(context),
                        variant: VSButtonVariant.outlined,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Project Configuration
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
                        'Project Configuration',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                      const Spacer(),
                      const VSBadge(
                        label: 'ACTIVE',
                        variant: VSBadgeVariant.primary,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Icon(Icons.folder, color: AppColors.primaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text('E-commerce Platform', style: AppTypography.bodyMediumRegular),
                      const Spacer(),
                      const VSBadge(
                        label: '12 MEMBERS',
                        variant: VSBadgeVariant.neutral,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSButton(size: VSButtonSize.small,
                        label: 'Project Settings',
                        onPressed: () => _showProjectSettingsDrawer(context),
                        leftIcon: Icons.settings,
                      ),
                      VSButton(size: VSButtonSize.small,
                        label: 'Team Management',
                        onPressed: () => _showTeamManagementDrawer(context),
                        leftIcon: Icons.group,
                      ),
                      VSButton(size: VSButtonSize.small,
                        label: 'Workflow Config',
                        onPressed: () => _showWorkflowConfigDrawer(context),
                        leftIcon: Icons.account_tree,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Data Export/Import
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
                    'Data Management',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Icon(Icons.storage, color: AppColors.secondaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text('Database Operations', style: AppTypography.bodyMediumRegular),
                      const Spacer(),
                      const VSBadge(
                        label: '2.3 GB',
                        variant: VSBadgeVariant.warning,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSButton(size: VSButtonSize.small,
                        label: 'Export Data',
                        onPressed: () => _showDataExportDrawer(context),
                        leftIcon: Icons.download,
                      ),
                      VSButton(size: VSButtonSize.small,
                        label: 'Import Data',
                        onPressed: () => _showDataImportDrawer(context),
                        leftIcon: Icons.upload,
                      ),
                      VSButton(size: VSButtonSize.small,
                        label: 'Backup Settings',
                        onPressed: () => _showBackupSettingsDrawer(context),
                        leftIcon: Icons.backup,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Filter and Search
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
                        'Advanced Filters',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                      const Spacer(),
                      const VSBadge(
                        label: '3 ACTIVE',
                        variant: VSBadgeVariant.primary,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Icon(Icons.filter_list, color: AppColors.neutral600),
                      SizedBox(width: AppSpacing.sm),
                      Text('Product Catalog Filters', style: AppTypography.bodySmallRegular),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSChip(
                        label: 'Price: \$0 - \$100',
                        type: VSChipType.color,
                        variant: VSChipVariant.primary,
                      ),
                      VSChip(
                        label: 'Category: Electronics',
                        type: VSChipType.color,
                        variant: VSChipVariant.secondary,
                      ),
                      VSChip(
                        label: 'Rating: 4+ stars',
                        type: VSChipType.color,
                        variant: VSChipVariant.success,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSButton(size: VSButtonSize.small,
                    label: 'Advanced Filters',
                    onPressed: () => _showAdvancedFiltersDrawer(context),
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

  Widget _buildDrawerGroup({
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

  void _showBasicDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Basic Drawer',
      items: [
        VSDrawerItem(
          label: 'Full Name',
          hint: 'Enter your full name',
        ),
        VSDrawerItem(
          label: 'Email Address',
          hint: 'Enter your email',
        ),
        VSDrawerItem(
          label: 'Phone Number',
          hint: 'Enter your phone number',
        ),
      ],
      actions: [
        VSButton(size: VSButtonSize.small,
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSButton(size: VSButtonSize.small,
          label: 'Save',
          onPressed: () => _showActionDialog(context, 'Settings saved successfully!'),
        ),
      ],
    );
  }

  void _showDrawerWithInfo(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Drawer with Info Bar',
      showInfoBar: true,
      infoMessage: 'Please review all fields before saving. Required fields are marked with *.',
      infoBgColor: AppColors.warningBg,
      infoTextColor: AppColors.warningDefault,
      items: [
        VSDrawerItem(
          label: 'Project Name *',
          hint: 'Enter project name',
        ),
        VSDrawerItem(
          label: 'Description',
          hint: 'Enter project description',
        ),
        VSDrawerItem(
          label: 'Priority',
          type: VSDrawerItemType.dropdown,
          options: ['Low', 'Medium', 'High', 'Critical'],
        ),
      ],
      actions: [
        VSButton(size: VSButtonSize.small,
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSButton(size: VSButtonSize.small,
          label: 'Create Project',
          onPressed: () => _showActionDialog(context, 'Project created successfully!'),
        ),
      ],
    );
  }

  void _showEndDrawer() {
    VSDrawer.show(
      context,
      title: 'End Drawer Example',
      items: [
        VSDrawerItem(
          label: 'Search Query',
          hint: 'Enter search terms',
        ),
        VSDrawerItem(
          label: 'Date Range',
          hint: 'Select date range',
        ),
        VSDrawerItem(
          label: 'Sort By',
          type: VSDrawerItemType.dropdown,
          options: ['Name', 'Date', 'Priority', 'Status'],
        ),
      ],
      actions: [
        VSButton(size: VSButtonSize.small,
          label: 'Clear Filters',
          onPressed: () => _showActionDialog(context, 'Filters cleared!'),
          variant: VSButtonVariant.outlined,
        ),
        VSButton(size: VSButtonSize.small,
          label: 'Apply Filters',
          onPressed: () => _showActionDialog(context, 'Filters applied successfully!'),
        ),
      ],
    );
  }

  void _showTextItemsDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Text Input Fields',
      items: [
        VSDrawerItem(
          label: 'First Name',
          hint: 'Enter first name',
        ),
        VSDrawerItem(
          label: 'Last Name',
          hint: 'Enter last name',
        ),
        VSDrawerItem(
          label: 'Address Line 1',
          hint: 'Street address',
        ),
        VSDrawerItem(
          label: 'Address Line 2',
          hint: 'Apartment, suite, etc.',
        ),
        VSDrawerItem(
          label: 'City',
          hint: 'Enter city',
        ),
        VSDrawerItem(
          label: 'ZIP Code',
          hint: 'Enter ZIP code',
        ),
      ],
      actions: [
        VSButton(size: VSButtonSize.small,
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSButton(size: VSButtonSize.small,
          label: 'Save Address',
          onPressed: () => _showActionDialog(context, 'Address saved successfully!'),
        ),
      ],
    );
  }

  void _showDropdownItemsDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Dropdown Selections',
      items: [
        VSDrawerItem(
          label: 'Country',
          type: VSDrawerItemType.dropdown,
          options: ['United States', 'Canada', 'United Kingdom', 'Germany', 'France'],
        ),
        VSDrawerItem(
          label: 'Language',
          type: VSDrawerItemType.dropdown,
          options: ['English', 'Spanish', 'French', 'German', 'Chinese'],
        ),
        VSDrawerItem(
          label: 'Timezone',
          type: VSDrawerItemType.dropdown,
          options: ['UTC-8 (PST)', 'UTC-5 (EST)', 'UTC+0 (GMT)', 'UTC+1 (CET)', 'UTC+8 (CST)'],
        ),
        VSDrawerItem(
          label: 'Currency',
          type: VSDrawerItemType.dropdown,
          options: ['USD', 'EUR', 'GBP', 'CAD', 'JPY'],
        ),
      ],
      actions: [
        VSButton(size: VSButtonSize.small,
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSButton(size: VSButtonSize.small,
          label: 'Save Preferences',
          onPressed: () => _showActionDialog(context, 'Preferences saved successfully!'),
        ),
      ],
    );
  }

  void _showMixedItemsDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Mixed Item Types',
      items: [
        VSDrawerItem(
          label: 'Task Title',
          hint: 'Enter task title',
        ),
        VSDrawerItem(
          label: 'Priority Level',
          type: VSDrawerItemType.dropdown,
          options: ['Low', 'Medium', 'High', 'Critical'],
        ),
        VSDrawerItem(
          label: 'Assigned To',
          hint: 'Enter assignee name',
        ),
        VSDrawerItem(
          label: 'Due Date',
          hint: 'Select due date',
        ),
        VSDrawerItem(
          label: 'Category',
          type: VSDrawerItemType.dropdown,
          options: ['Bug', 'Feature', 'Improvement', 'Documentation', 'Question'],
        ),
        VSDrawerItem(
          label: 'Description',
          hint: 'Enter task description',
        ),
      ],
      actions: [
        VSButton(size: VSButtonSize.small,
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSButton(size: VSButtonSize.small,
          label: 'Create Task',
          onPressed: () => _showActionDialog(context, 'Task created successfully!'),
        ),
      ],
    );
  }

  void _showSingleActionDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Single Action Drawer',
      items: [
        VSDrawerItem(
          label: 'Confirmation Message',
          hint: 'This drawer has only one action button',
        ),
      ],
      actions: [
        VSButton(size: VSButtonSize.small,
          label: 'OK',
          onPressed: () => _showActionDialog(context, 'Action completed!'),
        ),
      ],
    );
  }

  void _showMultipleActionsDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Multiple Actions Drawer',
      items: [
        VSDrawerItem(
          label: 'Action Type',
          type: VSDrawerItemType.dropdown,
          options: ['Save', 'Publish', 'Archive', 'Delete'],
        ),
        VSDrawerItem(
          label: 'Notes',
          hint: 'Add any additional notes',
        ),
      ],
      actions: [
        VSButton(size: VSButtonSize.small,
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSButton(size: VSButtonSize.small,
          label: 'Save Draft',
          onPressed: () => _showActionDialog(context, 'Draft saved!'),
          variant: VSButtonVariant.secondary,
        ),
        VSButton(size: VSButtonSize.small,
          label: 'Publish',
          onPressed: () => _showActionDialog(context, 'Published successfully!'),
        ),
      ],
    );
  }

  void _showNoActionsDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Information Only',
      items: [
        VSDrawerItem(
          label: 'Status',
          hint: 'Current system status: All systems operational',
        ),
        VSDrawerItem(
          label: 'Last Updated',
          hint: 'Information last updated: 2 minutes ago',
        ),
      ],
      actions: [], // No actions
    );
  }

  void _showProfileSettingsDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Profile Settings',
      items: [
        VSDrawerItem(
          label: 'Display Name',
          hint: 'John Doe',
        ),
        VSDrawerItem(
          label: 'Email',
          hint: 'john.doe@example.com',
        ),
        VSDrawerItem(
          label: 'Phone',
          hint: 'Enter your phone number',
        ),
        VSDrawerItem(
          label: 'Timezone',
          type: VSDrawerItemType.dropdown,
          options: ['PST', 'EST', 'CST', 'MST', 'GMT'],
        ),
        VSDrawerItem(
          label: 'Language',
          type: VSDrawerItemType.dropdown,
          options: ['English', 'Spanish', 'French', 'German'],
        ),
      ],
      actions: [
        VSButton(size: VSButtonSize.small,
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSButton(size: VSButtonSize.small,
          label: 'Save Changes',
          onPressed: () => _showActionDialog(context, 'Profile updated successfully!'),
        ),
      ],
    );
  }

  void _showPrivacySettingsDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Privacy Settings',
      showInfoBar: true,
      infoMessage: 'Changes to privacy settings take effect immediately.',
      infoBgColor: AppColors.primaryBg,
      infoTextColor: AppColors.primaryDefault,
      items: [
        VSDrawerItem(
          label: 'Profile Visibility',
          type: VSDrawerItemType.dropdown,
          options: ['Public', 'Friends Only', 'Private'],
        ),
        VSDrawerItem(
          label: 'Activity Status',
          type: VSDrawerItemType.dropdown,
          options: ['Show when online', 'Show last seen', 'Hide status'],
        ),
        VSDrawerItem(
          label: 'Data Sharing',
          type: VSDrawerItemType.dropdown,
          options: ['Share with everyone', 'Share with friends', 'Don\'t share'],
        ),
      ],
      actions: [
        VSButton(size: VSButtonSize.small,
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSButton(size: VSButtonSize.small,
          label: 'Update Privacy',
          onPressed: () => _showActionDialog(context, 'Privacy settings updated!'),
        ),
      ],
    );
  }

  void _showNotificationSettingsDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Notification Settings',
      items: [
        VSDrawerItem(
          label: 'Email Notifications',
          type: VSDrawerItemType.dropdown,
          options: ['All emails', 'Important only', 'No emails'],
        ),
        VSDrawerItem(
          label: 'Push Notifications',
          type: VSDrawerItemType.dropdown,
          options: ['All notifications', 'Important only', 'No notifications'],
        ),
        VSDrawerItem(
          label: 'SMS Notifications',
          type: VSDrawerItemType.dropdown,
          options: ['All messages', 'Important only', 'No messages'],
        ),
        VSDrawerItem(
          label: 'Quiet Hours Start',
          hint: '10:00 PM',
        ),
        VSDrawerItem(
          label: 'Quiet Hours End',
          hint: '8:00 AM',
        ),
      ],
      actions: [
        VSButton(size: VSButtonSize.small,
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSButton(size: VSButtonSize.small,
          label: 'Save Settings',
          onPressed: () => _showActionDialog(context, 'Notification settings saved!'),
        ),
      ],
    );
  }

  void _showProjectSettingsDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Project Settings',
      items: [
        VSDrawerItem(
          label: 'Project Name',
          hint: 'E-commerce Platform',
        ),
        VSDrawerItem(
          label: 'Project Type',
          type: VSDrawerItemType.dropdown,
          options: ['Web Application', 'Mobile App', 'Desktop App', 'API'],
        ),
        VSDrawerItem(
          label: 'Visibility',
          type: VSDrawerItemType.dropdown,
          options: ['Public', 'Private', 'Team Only'],
        ),
        VSDrawerItem(
          label: 'Repository URL',
          hint: 'https://github.com/...',
        ),
        VSDrawerItem(
          label: 'Documentation URL',
          hint: 'https://docs.example.com/...',
        ),
      ],
      actions: [
        VSButton(size: VSButtonSize.small,
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSButton(size: VSButtonSize.small,
          label: 'Save Settings',
          onPressed: () => _showActionDialog(context, 'Project settings updated!'),
        ),
      ],
    );
  }

  void _showTeamManagementDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Team Management',
      items: [
        VSDrawerItem(
          label: 'Add Team Member',
          hint: 'Enter email address',
        ),
        VSDrawerItem(
          label: 'Role Assignment',
          type: VSDrawerItemType.dropdown,
          options: ['Owner', 'Admin', 'Developer', 'Viewer'],
        ),
        VSDrawerItem(
          label: 'Permissions',
          type: VSDrawerItemType.dropdown,
          options: ['Full Access', 'Edit Only', 'Read Only'],
        ),
      ],
      actions: [
        VSButton(size: VSButtonSize.small,
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSButton(size: VSButtonSize.small,
          label: 'Add Member',
          onPressed: () => _showActionDialog(context, 'Team member added successfully!'),
        ),
      ],
    );
  }

  void _showWorkflowConfigDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Workflow Configuration',
      showInfoBar: true,
      infoMessage: 'Configure automated workflows for your project.',
      infoBgColor: AppColors.secondaryBg,
      infoTextColor: AppColors.secondaryDefault,
      items: [
        VSDrawerItem(
          label: 'Workflow Name',
          hint: 'Enter workflow name',
        ),
        VSDrawerItem(
          label: 'Trigger Event',
          type: VSDrawerItemType.dropdown,
          options: ['Push to main', 'Pull request', 'Issue created', 'Manual trigger'],
        ),
        VSDrawerItem(
          label: 'Action Type',
          type: VSDrawerItemType.dropdown,
          options: ['Run tests', 'Deploy', 'Send notification', 'Create issue'],
        ),
        VSDrawerItem(
          label: 'Conditions',
          hint: 'Optional conditions for execution',
        ),
      ],
      actions: [
        VSButton(size: VSButtonSize.small,
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSButton(size: VSButtonSize.small,
          label: 'Save Workflow',
          onPressed: () => _showActionDialog(context, 'Workflow configured successfully!'),
        ),
      ],
    );
  }

  void _showDataExportDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Data Export',
      items: [
        VSDrawerItem(
          label: 'Export Format',
          type: VSDrawerItemType.dropdown,
          options: ['CSV', 'JSON', 'XML', 'Excel'],
        ),
        VSDrawerItem(
          label: 'Date Range',
          hint: 'Select date range for export',
        ),
        VSDrawerItem(
          label: 'Include Attachments',
          type: VSDrawerItemType.dropdown,
          options: ['Yes', 'No'],
        ),
        VSDrawerItem(
          label: 'Compression',
          type: VSDrawerItemType.dropdown,
          options: ['None', 'ZIP', 'GZIP'],
        ),
      ],
      actions: [
        VSButton(size: VSButtonSize.small,
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSButton(size: VSButtonSize.small,
          label: 'Start Export',
          onPressed: () => _showActionDialog(context, 'Data export initiated!'),
        ),
      ],
    );
  }

  void _showDataImportDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Data Import',
      showInfoBar: true,
      infoMessage: 'Import data from external sources. Supported formats: CSV, JSON, XML.',
      infoBgColor: AppColors.warningBg,
      infoTextColor: AppColors.warningDefault,
      items: [
        VSDrawerItem(
          label: 'Import Source',
          type: VSDrawerItemType.dropdown,
          options: ['File Upload', 'URL', 'Database Connection'],
        ),
        VSDrawerItem(
          label: 'File Path/URL',
          hint: 'Enter file path or URL',
        ),
        VSDrawerItem(
          label: 'Data Mapping',
          type: VSDrawerItemType.dropdown,
          options: ['Auto-detect', 'Manual mapping', 'Template-based'],
        ),
        VSDrawerItem(
          label: 'Duplicate Handling',
          type: VSDrawerItemType.dropdown,
          options: ['Skip duplicates', 'Update existing', 'Create new'],
        ),
      ],
      actions: [
        VSButton(size: VSButtonSize.small,
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSButton(size: VSButtonSize.small,
          label: 'Preview Import',
          onPressed: () => _showActionDialog(context, 'Import preview generated!'),
          variant: VSButtonVariant.secondary,
        ),
        VSButton(size: VSButtonSize.small,
          label: 'Start Import',
          onPressed: () => _showActionDialog(context, 'Data import started!'),
        ),
      ],
    );
  }

  void _showBackupSettingsDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Backup Settings',
      items: [
        VSDrawerItem(
          label: 'Backup Frequency',
          type: VSDrawerItemType.dropdown,
          options: ['Daily', 'Weekly', 'Monthly', 'Manual only'],
        ),
        VSDrawerItem(
          label: 'Retention Period',
          type: VSDrawerItemType.dropdown,
          options: ['30 days', '90 days', '1 year', 'Forever'],
        ),
        VSDrawerItem(
          label: 'Backup Location',
          type: VSDrawerItemType.dropdown,
          options: ['Local storage', 'Cloud storage', 'External drive'],
        ),
        VSDrawerItem(
          label: 'Encryption',
          type: VSDrawerItemType.dropdown,
          options: ['Enabled', 'Disabled'],
        ),
      ],
      actions: [
        VSButton(size: VSButtonSize.small,
          label: 'Cancel',
          onPressed: () {},
          variant: VSButtonVariant.outlined,
        ),
        VSButton(size: VSButtonSize.small,
          label: 'Save Settings',
          onPressed: () => _showActionDialog(context, 'Backup settings updated!'),
        ),
      ],
    );
  }

  void _showAdvancedFiltersDrawer(BuildContext context) {
    VSDrawer.show(
      context,
      title: 'Advanced Filters',
      items: [
        VSDrawerItem(
          label: 'Price Range Min',
          hint: '0',
        ),
        VSDrawerItem(
          label: 'Price Range Max',
          hint: '1000',
        ),
        VSDrawerItem(
          label: 'Category',
          type: VSDrawerItemType.dropdown,
          options: ['Electronics', 'Clothing', 'Books', 'Home & Garden', 'Sports'],
        ),
        VSDrawerItem(
          label: 'Brand',
          hint: 'Enter brand name',
        ),
        VSDrawerItem(
          label: 'Rating',
          type: VSDrawerItemType.dropdown,
          options: ['Any', '4+ stars', '3+ stars', '2+ stars', '1+ star'],
        ),
        VSDrawerItem(
          label: 'Availability',
          type: VSDrawerItemType.dropdown,
          options: ['Any', 'In stock', 'Out of stock'],
        ),
      ],
      actions: [
        VSButton(size: VSButtonSize.small,
          label: 'Clear All',
          onPressed: () => _showActionDialog(context, 'All filters cleared!'),
          variant: VSButtonVariant.outlined,
        ),
        VSButton(size: VSButtonSize.small,
          label: 'Apply Filters',
          onPressed: () => _showActionDialog(context, 'Filters applied successfully!'),
        ),
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

  void _showDrawerInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'VS Drawer Information',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The VS Drawer component provides slide-out panels for forms and configuration with VS Design System styling.',
              style: AppTypography.bodyMediumRegular,
            ),
            SizedBox(height: AppSpacing.md),
            Text(
              'Key Features:',
              style: AppTypography.bodyMediumSemibold,
            ),
            SizedBox(height: AppSpacing.sm),
            Text(
              '• Two drawer types: standard dialog drawer and end drawer\n'
              '• Multiple item types: text input and dropdown selections\n'
              '• Optional info bar with custom colors and messages\n'
              '• Configurable action buttons with different variants\n'
              '• Form validation and state management\n'
              '• Responsive design with proper modal behavior\n'
              '• VS Design System integration\n'
              '• Accessibility support',
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
