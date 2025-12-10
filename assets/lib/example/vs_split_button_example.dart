import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSSplitButtonExample extends StatelessWidget {
  const VSSplitButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Split Button Examples',
      //   actions: [
      //     VSButton(
      //       label: 'Info',
      //       onPressed: () => _showSplitButtonInfoDialog(context),
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
              title: 'VS Split Button Variants & Sizes',
              description: 'Comprehensive demonstration of split buttons with dropdown menus and interactive examples',
              child: _buildSplitButtonShowcase(context),
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

  Widget _buildSplitButtonShowcase(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic Variants
        _buildSplitButtonGroup(
          title: 'Basic Variants',
          description: 'Primary, secondary, danger, and outlined split button variants',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSSplitButton(
                  label: 'Primary',
                  onPressed: () => _showActionDialog(context, 'Primary action executed'),
                  onDropdownPressed: () => _showActionDialog(context, 'Primary dropdown opened'),
                  menuItems: _getBasicMenuItems(context, 'Primary'),
                  variant: VSSplitButtonVariant.primary,
                ),
                VSSplitButton(
                  label: 'Secondary',
                  onPressed: () => _showActionDialog(context, 'Secondary action executed'),
                  onDropdownPressed: () => _showActionDialog(context, 'Secondary dropdown opened'),
                  menuItems: _getBasicMenuItems(context, 'Secondary'),
                  variant: VSSplitButtonVariant.secondary,
                ),
                VSSplitButton(
                  label: 'Danger',
                  onPressed: () => _showActionDialog(context, 'Danger action executed'),
                  onDropdownPressed: () => _showActionDialog(context, 'Danger dropdown opened'),
                  menuItems: _getBasicMenuItems(context, 'Danger'),
                  variant: VSSplitButtonVariant.danger,
                ),
                VSSplitButton(
                  label: 'Outlined',
                  onPressed: () => _showActionDialog(context, 'Outlined action executed'),
                  onDropdownPressed: () => _showActionDialog(context, 'Outlined dropdown opened'),
                  menuItems: _getBasicMenuItems(context, 'Outlined'),
                  variant: VSSplitButtonVariant.outlined,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Button Sizes
        _buildSplitButtonGroup(
          title: 'Button Sizes',
          description: 'All available split button sizes from xsmall to large',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              alignment: WrapAlignment.start,
              children: [
                VSSplitButton(
                  label: 'XS',
                  onPressed: () => _showActionDialog(context, 'XSmall action executed'),
                  onDropdownPressed: () => _showActionDialog(context, 'XSmall dropdown opened'),
                  menuItems: _getSizeMenuItems(context, 'XSmall'),
                  size: VSSplitButtonSize.xsmall,
                ),
                VSSplitButton(
                  label: 'Small',
                  onPressed: () => _showActionDialog(context, 'Small action executed'),
                  onDropdownPressed: () => _showActionDialog(context, 'Small dropdown opened'),
                  menuItems: _getSizeMenuItems(context, 'Small'),
                  size: VSSplitButtonSize.small,
                ),
                VSSplitButton(
                  label: 'Medium',
                  onPressed: () => _showActionDialog(context, 'Medium action executed'),
                  onDropdownPressed: () => _showActionDialog(context, 'Medium dropdown opened'),
                  menuItems: _getSizeMenuItems(context, 'Medium'),
                  size: VSSplitButtonSize.medium,
                ),
                VSSplitButton(
                  label: 'Large',
                  onPressed: () => _showActionDialog(context, 'Large action executed'),
                  onDropdownPressed: () => _showActionDialog(context, 'Large dropdown opened'),
                  menuItems: _getSizeMenuItems(context, 'Large'),
                  size: VSSplitButtonSize.large,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Menu Items with Icons
        _buildSplitButtonGroup(
          title: 'Menu Items with Icons',
          description: 'Split buttons with menu items that include icons for better visual communication',
          children: [
            VSSplitButton(
              label: 'Actions',
              onPressed: () => _showActionDialog(context, 'Main action executed'),
              onDropdownPressed: () => _showActionDialog(context, 'Actions dropdown opened'),
              menuItems: [
                VSSplitButtonMenuItem(
                  label: 'Create New',
                  icon: Icons.add,
                  onTap: () => _showActionDialog(context, 'Create New selected'),
                ),
                VSSplitButtonMenuItem(
                  label: 'Edit',
                  icon: Icons.edit,
                  onTap: () => _showActionDialog(context, 'Edit selected'),
                ),
                VSSplitButtonMenuItem(
                  label: 'Delete',
                  icon: Icons.delete,
                  onTap: () => _showActionDialog(context, 'Delete selected'),
                ),
                VSSplitButtonMenuItem(
                  label: 'Share',
                  icon: Icons.share,
                  onTap: () => _showActionDialog(context, 'Share selected'),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Custom Colors
        _buildSplitButtonGroup(
          title: 'Custom Colors',
          description: 'Split buttons with custom background and text colors',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSSplitButton(
                  label: 'Custom',
                  onPressed: () => _showActionDialog(context, 'Custom action executed'),
                  onDropdownPressed: () => _showActionDialog(context, 'Custom dropdown opened'),
                  menuItems: _getBasicMenuItems(context, 'Custom'),
                  backgroundColor: Colors.teal.shade600,
                  textColor: Colors.white,
                ),
                VSSplitButton(
                  label: 'Theme',
                  onPressed: () => _showActionDialog(context, 'Theme action executed'),
                  onDropdownPressed: () => _showActionDialog(context, 'Theme dropdown opened'),
                  menuItems: _getBasicMenuItems(context, 'Theme'),
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  textColor: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Disabled State
        _buildSplitButtonGroup(
          title: 'Disabled State',
          description: 'Split buttons in disabled state with visual feedback',
          children: [
            VSSplitButton(
              label: 'Disabled',
              onPressed: () {},
              onDropdownPressed: () {},
              menuItems: [],
              isEnabled: false,
              variant: VSSplitButtonVariant.primary,
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Real-world Usage Examples
        _buildSplitButtonGroup(
          title: 'Real-world Usage Examples',
          description: 'Common split button patterns in application interfaces',
          children: [
            // Document Actions
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
                      Icon(Icons.description, color: AppColors.textSecondary),
                      SizedBox(width: AppSpacing.sm),
                      Text('Document Management', style: AppTypography.bodyMediumSemibold),
                      const Spacer(),
                      const VSBadge(
                        label: 'PDF',
                        type: VSBadgeType.id,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSSplitButton(
                    label: 'Open',
                    onPressed: () => _showActionDialog(context, 'Document opened'),
                    onDropdownPressed: () => _showActionDialog(context, 'Open options shown'),
                    menuItems: [
                      VSSplitButtonMenuItem(
                        label: 'Open in Browser',
                        icon: Icons.open_in_browser,
                        onTap: () => _showActionDialog(context, 'Opened in browser'),
                      ),
                      VSSplitButtonMenuItem(
                        label: 'Download',
                        icon: Icons.download,
                        onTap: () => _showActionDialog(context, 'Download started'),
                      ),
                      VSSplitButtonMenuItem(
                        label: 'Print',
                        icon: Icons.print,
                        onTap: () => _showActionDialog(context, 'Print dialog opened'),
                      ),
                      VSSplitButtonMenuItem(
                        label: 'Share',
                        icon: Icons.share,
                        onTap: () => _showActionDialog(context, 'Share options shown'),
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
                  Row(
                    children: [
                      const VSAvatar(
                        imageUrl: 'https://via.placeholder.com/32',
                        size: VSAvatarSize.medium,
                      ),
                      SizedBox(width: AppSpacing.sm),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('John Doe', style: AppTypography.bodyMediumSemibold),
                          Row(
                            children: [
                              const VSBadge(
                                label: 'ADMIN',
                                variant: VSBadgeVariant.primary,
                                size: VSBadgeSize.xsmall,
                              ),
                              SizedBox(width: AppSpacing.xs),
                              const VSBadge(
                                label: 'ONLINE',
                                variant: VSBadgeVariant.success,
                                size: VSBadgeSize.xsmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSSplitButton(
                    label: 'Message',
                    onPressed: () => _showActionDialog(context, 'Direct message sent'),
                    onDropdownPressed: () => _showActionDialog(context, 'Message options shown'),
                    menuItems: [
                      VSSplitButtonMenuItem(
                        label: 'Send Email',
                        icon: Icons.email,
                        onTap: () => _showActionDialog(context, 'Email composer opened'),
                      ),
                      VSSplitButtonMenuItem(
                        label: 'Call',
                        icon: Icons.call,
                        onTap: () => _showActionDialog(context, 'Call initiated'),
                      ),
                      VSSplitButtonMenuItem(
                        label: 'Video Call',
                        icon: Icons.video_call,
                        onTap: () => _showActionDialog(context, 'Video call started'),
                      ),
                    ],
                    size: VSSplitButtonSize.small,
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Data Export
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
                    'Data Export',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Text(
                    'Export your data in various formats',
                    style: AppTypography.bodySmallRegular.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSSplitButton(
                    label: 'Export',
                    onPressed: () => _showActionDialog(context, 'Exported as default format'),
                    onDropdownPressed: () => _showActionDialog(context, 'Export options shown'),
                    menuItems: [
                      VSSplitButtonMenuItem(
                        label: 'Export as CSV',
                        icon: Icons.table_chart,
                        onTap: () => _showActionDialog(context, 'CSV export started'),
                      ),
                      VSSplitButtonMenuItem(
                        label: 'Export as PDF',
                        icon: Icons.picture_as_pdf,
                        onTap: () => _showActionDialog(context, 'PDF export started'),
                      ),
                      VSSplitButtonMenuItem(
                        label: 'Export as Excel',
                        icon: Icons.grid_on,
                        onTap: () => _showActionDialog(context, 'Excel export started'),
                      ),
                      VSSplitButtonMenuItem(
                        label: 'Export as JSON',
                        icon: Icons.data_object,
                        onTap: () => _showActionDialog(context, 'JSON export started'),
                      ),
                    ],
                    variant: VSSplitButtonVariant.secondary,
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Bulk Actions
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
                        'Bulk Actions',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                      SizedBox(width: AppSpacing.sm),
                      const VSBadge(
                        label: '5 SELECTED',
                        variant: VSBadgeVariant.primary,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSSplitButton(
                    label: 'Apply',
                    onPressed: () => _showActionDialog(context, 'Default action applied'),
                    onDropdownPressed: () => _showActionDialog(context, 'Bulk actions shown'),
                    menuItems: [
                      VSSplitButtonMenuItem(
                        label: 'Move to Folder',
                        icon: Icons.folder,
                        onTap: () => _showActionDialog(context, 'Move dialog opened'),
                      ),
                      VSSplitButtonMenuItem(
                        label: 'Add Tags',
                        icon: Icons.tag,
                        onTap: () => _showActionDialog(context, 'Tag dialog opened'),
                      ),
                      VSSplitButtonMenuItem(
                        label: 'Archive',
                        icon: Icons.archive,
                        onTap: () => _showActionDialog(context, 'Items archived'),
                      ),
                      VSSplitButtonMenuItem(
                        label: 'Delete',
                        icon: Icons.delete_forever,
                        onTap: () => _showActionDialog(context, 'Delete confirmation shown'),
                      ),
                    ],
                    variant: VSSplitButtonVariant.danger,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSplitButtonGroup({
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

  List<VSSplitButtonMenuItem> _getBasicMenuItems(BuildContext context, String prefix) {
    return [
      VSSplitButtonMenuItem(
        label: '$prefix Option 1',
        onTap: () => _showActionDialog(context, '$prefix Option 1 selected'),
      ),
      VSSplitButtonMenuItem(
        label: '$prefix Option 2',
        onTap: () => _showActionDialog(context, '$prefix Option 2 selected'),
      ),
      VSSplitButtonMenuItem(
        label: '$prefix Option 3',
        onTap: () => _showActionDialog(context, '$prefix Option 3 selected'),
      ),
    ];
  }

  List<VSSplitButtonMenuItem> _getSizeMenuItems(BuildContext context, String size) {
    return [
      VSSplitButtonMenuItem(
        label: '$size Action A',
        onTap: () => _showActionDialog(context, '$size Action A executed'),
      ),
      VSSplitButtonMenuItem(
        label: '$size Action B',
        onTap: () => _showActionDialog(context, '$size Action B executed'),
      ),
    ];
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