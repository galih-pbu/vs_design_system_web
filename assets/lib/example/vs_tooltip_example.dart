import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSTooltipExample extends StatefulWidget {
  const VSTooltipExample({super.key});

  @override
  State<VSTooltipExample> createState() => _VSTooltipExampleState();
}

class _VSTooltipExampleState extends State<VSTooltipExample> {
  String _selectedPosition = 'top';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Tooltip Examples',
      //   actions: [
      //     VSButton(
      //       label: 'Info',
      //       onPressed: () => _showTooltipInfo(context),
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
              title: 'VS Tooltip Variants & Positions',
              description: 'Comprehensive demonstration of tooltip configurations and real-world usage patterns',
              child: _buildTooltipShowcase(),
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

  Widget _buildTooltipShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic Tooltips
        _buildTooltipGroup(
          title: 'Basic Tooltip Positions',
          description: 'Standard tooltip implementation with different positioning options',
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
                    'Position Variants',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.md),
                  Wrap(
                    spacing: AppSpacing.lg,
                    runSpacing: AppSpacing.md,
                    children: [
                      VSTooltip(
                        message: 'This tooltip appears on top',
                        position: VSTooltipPosition.top,
                        child: VSButton(
                          label: 'Top',
                          onPressed: () {},
                          size: VSButtonSize.small,
                        ),
                      ),
                      VSTooltip(
                        message: 'This tooltip appears on the bottom',
                        position: VSTooltipPosition.bottom,
                        child: VSButton(
                          label: 'Bottom',
                          onPressed: () {},
                          size: VSButtonSize.small,
                        ),
                      ),
                      VSTooltip(
                        message: 'This tooltip appears on the left side',
                        position: VSTooltipPosition.left,
                        child: VSButton(
                          label: 'Left',
                          onPressed: () {},
                          size: VSButtonSize.small,
                        ),
                      ),
                      VSTooltip(
                        message: 'This tooltip appears on the right side',
                        position: VSTooltipPosition.right,
                        child: VSButton(
                          label: 'Right',
                          onPressed: () {},
                          size: VSButtonSize.small,
                        ),
                      ),
                      VSTooltip(
                        message: 'This tooltip appears on top-left',
                        position: VSTooltipPosition.topLeft,
                        child: VSButton(
                          label: 'Top-Left',
                          onPressed: () {},
                          size: VSButtonSize.small,
                        ),
                      ),
                      VSTooltip(
                        message: 'This tooltip appears on top-right',
                        position: VSTooltipPosition.topRight,
                        child: VSButton(
                          label: 'Top-Right',
                          onPressed: () {},
                          size: VSButtonSize.small,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Tooltip with Rich Content
        _buildTooltipGroup(
          title: 'Rich Content Tooltips',
          description: 'Tooltips with formatted text, icons, and multiple lines of information',
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
                    'Enhanced Tooltips',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.md),
                  Wrap(
                    spacing: AppSpacing.lg,
                    runSpacing: AppSpacing.md,
                    children: [
                      VSTooltip(
                        message: 'Save your work\n\nThis action cannot be undone.',
                        position: VSTooltipPosition.top,
                        child: VSButton(
                          label: 'Save',
                          onPressed: () {},
                          size: VSButtonSize.small,
                          variant: VSButtonVariant.primary,
                        ),
                      ),
                      VSTooltip(
                        message: 'Delete Item\n\nWarning: This will permanently remove the selected item.',
                        position: VSTooltipPosition.bottom,
                        child: VSButton(
                          label: 'Delete',
                          onPressed: () {},
                          size: VSButtonSize.small,
                          variant: VSButtonVariant.danger,
                        ),
                      ),
                      VSTooltip(
                        message: 'Premium Feature\n\nUpgrade to unlock advanced analytics and reporting.',
                        position: VSTooltipPosition.right,
                        child: Icon(
                          Icons.lock,
                          color: AppColors.warningDefault,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Interactive Elements with Tooltips
        _buildTooltipGroup(
          title: 'Interactive Elements',
          description: 'Tooltips on various interactive components and UI elements',
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
                    'UI Component Tooltips',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.md),
                  Wrap(
                    spacing: AppSpacing.lg,
                    runSpacing: AppSpacing.md,
                    children: [
                      VSTooltip(
                        message: 'Toggle notifications on/off',
                        position: VSTooltipPosition.top,
                        child: VSToggle(
                          value: true,
                          onChanged: (value) {},
                        ),
                      ),
                      VSTooltip(
                        message: 'Select your preferred theme',
                        position: VSTooltipPosition.bottom,
                        child: VSDropdown(
                          items: ['Light', 'Dark', 'Auto'],
                          value: 'Light',
                          onChanged: (value) {},
                        ),
                      ),
                      VSTooltip(
                        message: 'Upload files (max 10MB)',
                        position: VSTooltipPosition.right,
                        child: VSButton(
                          label: 'Upload',
                          onPressed: () {},
                          size: VSButtonSize.small,
                          variant: VSButtonVariant.secondary,
                        ),
                      ),
                      VSTooltip(
                        message: 'Search across all content',
                        position: VSTooltipPosition.left,
                        child: Icon(
                          Icons.search,
                          color: AppColors.primaryDefault,
                          size: 24,
                        ),
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
        _buildTooltipGroup(
          title: 'Real-world Usage Examples',
          description: 'Common tooltip patterns in actual applications and interfaces',
          children: [
            // Toolbar Actions
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
                      Icon(Icons.build, color: AppColors.primaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Toolbar Actions',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      VSTooltip(
                        message: 'Bold (Ctrl+B)',
                        position: VSTooltipPosition.bottom,
                        child: IconButton(
                          icon: Icon(Icons.format_bold),
                          onPressed: () {},
                        ),
                      ),
                      VSTooltip(
                        message: 'Italic (Ctrl+I)',
                        position: VSTooltipPosition.bottom,
                        child: IconButton(
                          icon: Icon(Icons.format_italic),
                          onPressed: () {},
                        ),
                      ),
                      VSTooltip(
                        message: 'Underline (Ctrl+U)',
                        position: VSTooltipPosition.bottom,
                        child: IconButton(
                          icon: Icon(Icons.format_underlined),
                          onPressed: () {},
                        ),
                      ),
                      VSTooltip(
                        message: 'Insert Link',
                        position: VSTooltipPosition.bottom,
                        child: IconButton(
                          icon: Icon(Icons.link),
                          onPressed: () {},
                        ),
                      ),
                      VSTooltip(
                        message: 'Add Image',
                        position: VSTooltipPosition.bottom,
                        child: IconButton(
                          icon: Icon(Icons.image),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Navigation Elements
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
                      Icon(Icons.navigation, color: AppColors.successDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Navigation Elements',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      VSTooltip(
                        message: 'Home Dashboard',
                        position: VSTooltipPosition.right,
                        child: IconButton(
                          icon: Icon(Icons.home),
                          onPressed: () {},
                        ),
                      ),
                      VSTooltip(
                        message: 'Messages & Inbox',
                        position: VSTooltipPosition.right,
                        child: VSBadge(
                          label: '3',
                        ),
                      ),
                      VSTooltip(
                        message: 'Notifications',
                        position: VSTooltipPosition.right,
                        child: VSBadge(
                          label: '!',
                          variant: VSBadgeVariant.warning,
                        ),
                      ),
                      VSTooltip(
                        message: 'Settings & Preferences',
                        position: VSTooltipPosition.right,
                        child: IconButton(
                          icon: Icon(Icons.settings),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Form Field Help
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
                      Icon(Icons.help, color: AppColors.secondaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Form Field Assistance',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: VSInputField(
                              label: 'Email Address',
                              hintText: 'Enter your email',
                              controller: TextEditingController(),
                            ),
                          ),
                          SizedBox(width: AppSpacing.sm),
                          VSTooltip(
                            message: 'We use your email to send important updates and notifications. We never share your email with third parties.',
                            position: VSTooltipPosition.left,
                            child: Icon(
                              Icons.help_outline,
                              color: AppColors.textSecondary,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSpacing.sm),
                      Row(
                        children: [
                          Expanded(
                            child: VSInputField(
                              label: 'Password',
                              hintText: 'Create a strong password',
                              controller: TextEditingController(),
                              obscureText: true,
                            ),
                          ),
                          SizedBox(width: AppSpacing.sm),
                          VSTooltip(
                            message: 'Password must be at least 8 characters long and include uppercase, lowercase, and numbers.',
                            position: VSTooltipPosition.left,
                            child: Icon(
                              Icons.help_outline,
                              color: AppColors.textSecondary,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Status Indicators
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
                      Icon(Icons.info, color: AppColors.warningDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Status Indicators',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      VSTooltip(
                        message: 'System is online and operating normally',
                        position: VSTooltipPosition.top,
                        child: VSBadge(
                          label: 'ONLINE',
                          variant: VSBadgeVariant.success,
                        ),
                      ),
                      SizedBox(width: AppSpacing.sm),
                      VSTooltip(
                        message: 'Scheduled maintenance in progress',
                        position: VSTooltipPosition.top,
                        child: VSBadge(
                          label: 'MAINTENANCE',
                          variant: VSBadgeVariant.warning,
                        ),
                      ),
                      SizedBox(width: AppSpacing.sm),
                      VSTooltip(
                        message: 'Service temporarily unavailable',
                        position: VSTooltipPosition.top,
                        child: VSBadge(
                          label: 'OFFLINE',
                          variant: VSBadgeVariant.danger,
                        ),
                      ),
                      SizedBox(width: AppSpacing.sm),
                      VSTooltip(
                        message: 'New feature available',
                        position: VSTooltipPosition.top,
                        child: VSBadge(
                          label: 'NEW',
                          variant: VSBadgeVariant.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Data Table Actions
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
                      Icon(Icons.table_chart, color: AppColors.primaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Data Table Actions',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      border: Border.all(color: AppColors.neutral300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        // Table Header
                        Container(
                          padding: EdgeInsets.all(AppSpacing.sm),
                          decoration: BoxDecoration(
                            color: AppColors.neutral100,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(child: Text('Name', style: AppTypography.bodySmallSemibold)),
                              Expanded(child: Text('Status', style: AppTypography.bodySmallSemibold)),
                              SizedBox(width: 80, child: Text('Actions', style: AppTypography.bodySmallSemibold)),
                            ],
                          ),
                        ),
                        // Table Rows
                        ...List.generate(3, (index) => Container(
                          padding: EdgeInsets.all(AppSpacing.sm),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: AppColors.neutral200),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(child: Text('Item ${index + 1}')),
                              Expanded(
                                child: Row(
                                  children: [
                                    VSChip(
                                      label: ['Active', 'Pending', 'Inactive'][index],
                                      type: VSChipType.color,
                                      variant: index == 0 ? VSChipVariant.success : index == 1 ? VSChipVariant.warning : VSChipVariant.neutral,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 80,
                                child: Row(
                                  children: [
                                    VSTooltip(
                                      message: 'Edit this item',
                                      position: VSTooltipPosition.top,
                                      child: IconButton(
                                        icon: Icon(Icons.edit, size: 16),
                                        onPressed: () {},
                                      ),
                                    ),
                                    VSTooltip(
                                      message: 'Delete this item',
                                      position: VSTooltipPosition.top,
                                      child: IconButton(
                                        icon: Icon(Icons.delete, size: 16),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Advanced Tooltip Variants
        _buildTooltipGroup(
          title: 'Advanced Tooltip Variants',
          description: 'Rich content and approval list tooltips with positioned arrows',
          children: [
            // Rich Content Tooltips with Arrows
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
                    'Rich Content Tooltips',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.md),
                  Wrap(
                    spacing: AppSpacing.lg,
                    runSpacing: AppSpacing.md,
                    children: [
                      VSTooltip(
                        title: 'Advanced Settings',
                        items: [
                          VSTooltipItem(label: 'General Preferences', onTap: () {}),
                          VSTooltipItem(label: 'Notification Settings', onTap: () {}),
                          VSTooltipItem(label: 'Privacy Options', onTap: () {}),
                        ],
                        position: VSTooltipPosition.top,
                        variant: VSTooltipVariant.withContent,
                        child: VSButton(
                          label: 'Settings',
                          onPressed: () {},
                          size: VSButtonSize.small,
                          variant: VSButtonVariant.outlined,
                        ),
                      ),
                      VSTooltip(
                        title: 'Export Options',
                        items: [
                          VSTooltipItem(label: 'Export as PDF', onTap: () {}),
                          VSTooltipItem(label: 'Export as CSV', onTap: () {}),
                          VSTooltipItem(label: 'Export as Excel', onTap: () {}),
                        ],
                        position: VSTooltipPosition.topLeft,
                        variant: VSTooltipVariant.withContent,
                        child: VSButton(
                          label: 'Export',
                          onPressed: () {},
                          size: VSButtonSize.small,
                          variant: VSButtonVariant.secondary,
                        ),
                      ),
                      VSTooltip(
                        title: 'Share Document',
                        items: [
                          VSTooltipItem(label: 'Share via Email', onTap: () {}),
                          VSTooltipItem(label: 'Generate Link', onTap: () {}),
                          VSTooltipItem(label: 'Copy to Clipboard', onTap: () {}),
                        ],
                        position: VSTooltipPosition.topRight,
                        variant: VSTooltipVariant.withContent,
                        child: IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Approval List Tooltips with Arrows
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
                    'Approval List Tooltips',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.md),
                  Wrap(
                    spacing: AppSpacing.lg,
                    runSpacing: AppSpacing.md,
                    children: [
                      VSTooltip(
                        title: 'Document Approvals',
                        approvalItems: [
                          VSTooltipApprovalItem(
                            name: 'John Smith',
                            initial: 'JS',
                            avatarColor: AppColors.primaryDefault,
                            isApproved: true,
                            timestamp: '2h ago',
                          ),
                          VSTooltipApprovalItem(
                            name: 'Sarah Johnson',
                            initial: 'SJ',
                            avatarColor: AppColors.successDefault,
                            isApproved: true,
                            timestamp: '1h ago',
                          ),
                          VSTooltipApprovalItem(
                            name: 'Mike Wilson',
                            initial: 'MW',
                            avatarColor: AppColors.warningDefault,
                            isApproved: false,
                          ),
                        ],
                        position: VSTooltipPosition.top,
                        variant: VSTooltipVariant.approvalList,
                        child: VSBadge(
                          label: '2/3 Approved',
                          variant: VSBadgeVariant.warning,
                        ),
                      ),
                      VSTooltip(
                        title: 'Team Review Status',
                        approvalItems: [
                          VSTooltipApprovalItem(
                            name: 'Alice Brown',
                            initial: 'AB',
                            avatarColor: AppColors.secondaryDefault,
                            isApproved: true,
                            timestamp: '30m ago',
                          ),
                          VSTooltipApprovalItem(
                            name: 'Bob Davis',
                            initial: 'BD',
                            avatarColor: AppColors.primaryDefault,
                            isApproved: true,
                            timestamp: '15m ago',
                          ),
                        ],
                        position: VSTooltipPosition.topLeft,
                        variant: VSTooltipVariant.approvalList,
                        child: VSBadge(
                          label: 'Approved',
                          variant: VSBadgeVariant.success,
                        ),
                      ),
                      VSTooltip(
                        title: 'Pending Reviews',
                        approvalItems: [
                          VSTooltipApprovalItem(
                            name: 'Emma Taylor',
                            initial: 'ET',
                            avatarColor: AppColors.warningDefault,
                            isApproved: false,
                          ),
                          VSTooltipApprovalItem(
                            name: 'David Lee',
                            initial: 'DL',
                            avatarColor: AppColors.neutral600,
                            isApproved: false,
                          ),
                        ],
                        position: VSTooltipPosition.topRight,
                        variant: VSTooltipVariant.approvalList,
                        child: VSBadge(
                          label: 'Pending',
                          variant: VSBadgeVariant.neutral,
                        ),
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
        _buildTooltipGroup(
          title: 'Interactive Demo',
          description: 'Experiment with different tooltip configurations and see live results',
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
                    'Tooltip Configuration Demo',
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
                            children: ['top', 'topLeft', 'topRight', 'bottom', 'left', 'right'].map((pos) => VSButton(
                              label: pos,
                              onPressed: () => setState(() => _selectedPosition = pos),
                              size: VSButtonSize.small,
                              variant: _selectedPosition == pos ? VSButtonVariant.primary : VSButtonVariant.outlined,
                            )).toList(),
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
                        Text(
                          'Hover or tap the button below to see the tooltip',
                          style: AppTypography.bodySmallRegular.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        SizedBox(height: AppSpacing.md),
                        VSTooltip(
                          message: 'This is a $_selectedPosition positioned tooltip with dynamic configuration!',
                          position: _getPositionFromString(_selectedPosition),
                          child: VSButton(
                            label: 'Test Tooltip',
                            onPressed: () => _showActionDialog(context, 'Tooltip triggered!'),
                            size: VSButtonSize.small,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpacing.md),
                  Text(
                    'Current Configuration: Position = $_selectedPosition',
                    style: AppTypography.bodySmallRegular.copyWith(
                      color: AppColors.primaryDefault,
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

  Widget _buildTooltipGroup({
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

  VSTooltipPosition _getPositionFromString(String position) {
    switch (position) {
      case 'top':
        return VSTooltipPosition.top;
      case 'topLeft':
        return VSTooltipPosition.topLeft;
      case 'topRight':
        return VSTooltipPosition.topRight;
      case 'bottom':
        return VSTooltipPosition.bottom;
      case 'left':
        return VSTooltipPosition.left;
      case 'right':
        return VSTooltipPosition.right;
      default:
        return VSTooltipPosition.top;
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

}
