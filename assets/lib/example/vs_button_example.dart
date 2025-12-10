import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSButtonExample extends StatelessWidget {
  const VSButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Button Examples',
      //   actions: [
      //     VSButton(
      //       label: 'Info',
      //       onPressed: () => _showButtonInfoDialog(context),
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
              title: 'VS Button Variants & Sizes',
              description: 'Comprehensive demonstration of all button variants, sizes, and interactive examples',
              child: _buildButtonShowcase(context),
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

  Widget _buildButtonShowcase(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic Variants
        _buildButtonGroup(
          title: 'Basic Variants',
          description: 'Primary, secondary, danger, outlined, and text button variants',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton(
                  label: 'Primary',
                  onPressed: () => _showActionDialog(context, 'Primary button pressed'),
                  variant: VSButtonVariant.primary,
                ),
                VSButton(
                  label: 'Secondary',
                  onPressed: () => _showActionDialog(context, 'Secondary button pressed'),
                  variant: VSButtonVariant.secondary,
                ),
                VSButton(
                  label: 'Danger',
                  onPressed: () => _showActionDialog(context, 'Danger button pressed'),
                  variant: VSButtonVariant.danger,
                ),
                VSButton(
                  label: 'Outlined',
                  onPressed: () => _showActionDialog(context, 'Outlined button pressed'),
                  variant: VSButtonVariant.outlined,
                ),
                VSButton(
                  label: 'Text',
                  onPressed: () => _showActionDialog(context, 'Text button pressed'),
                  variant: VSButtonVariant.text,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Button Sizes
        _buildButtonGroup(
          title: 'Button Sizes',
          description: 'All available button sizes from xsmall to large',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              alignment: WrapAlignment.start,
              children: [
                VSButton(
                  label: 'XSmall',
                  onPressed: () => _showActionDialog(context, 'XSmall button pressed'),
                  size: VSButtonSize.xsmall,
                ),
                VSButton(
                  label: 'Small',
                  onPressed: () => _showActionDialog(context, 'Small button pressed'),
                  size: VSButtonSize.small,
                ),
                VSButton(
                  label: 'Medium',
                  onPressed: () => _showActionDialog(context, 'Medium button pressed'),
                  size: VSButtonSize.medium,
                ),
                VSButton(
                  label: 'Large',
                  onPressed: () => _showActionDialog(context, 'Large button pressed'),
                  size: VSButtonSize.large,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Buttons with Icons
        _buildButtonGroup(
          title: 'Buttons with Icons',
          description: 'Buttons with left and right icons for enhanced visual communication',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton(
                  label: 'Left Icon',
                  onPressed: () => _showActionDialog(context, 'Left icon button pressed'),
                  leftIcon: Icons.add,
                ),
                VSButton(
                  label: 'Right Icon',
                  onPressed: () => _showActionDialog(context, 'Right icon button pressed'),
                  rightIcon: Icons.arrow_forward,
                ),
                VSButton(
                  label: 'Both Icons',
                  onPressed: () => _showActionDialog(context, 'Both icons button pressed'),
                  leftIcon: Icons.star,
                  rightIcon: Icons.arrow_forward,
                ),
                VSButton(
                  label: 'Icon Only',
                  onPressed: () => _showActionDialog(context, 'Icon only button pressed'),
                  leftIcon: Icons.favorite,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Factory Constructors
        _buildButtonGroup(
          title: 'Factory Constructors',
          description: 'Pre-configured buttons for common use cases',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton.save(
                  onPressed: () => _showActionDialog(context, 'Save button pressed'),
                ),
                VSButton.delete(
                  onPressed: () => _showActionDialog(context, 'Delete button pressed'),
                ),
                VSButton.edit(
                  onPressed: () => _showActionDialog(context, 'Edit button pressed'),
                ),
                VSButton.cancel(
                  onPressed: () => _showActionDialog(context, 'Cancel button pressed'),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton.posting(
                  onPressed: () => _showActionDialog(context, 'Posting button pressed'),
                ),
                VSButton.resync(
                  onPressed: () => _showActionDialog(context, 'Resync button pressed'),
                ),
                VSButton.export(
                  onPressed: () => _showActionDialog(context, 'Export button pressed'),
                ),
                VSButton.void_(
                  onPressed: () => _showActionDialog(context, 'Void button pressed'),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Disabled State
        _buildButtonGroup(
          title: 'Disabled State',
          description: 'Buttons in disabled state with visual feedback',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton(
                  label: 'Disabled Primary',
                  onPressed: () {},
                  isEnabled: false,
                  variant: VSButtonVariant.primary,
                ),
                VSButton(
                  label: 'Disabled Outlined',
                  onPressed: () {},
                  isEnabled: false,
                  variant: VSButtonVariant.outlined,
                ),
                VSButton(
                  label: 'Disabled Text',
                  onPressed: () {},
                  isEnabled: false,
                  variant: VSButtonVariant.text,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Button Groups
        _buildButtonGroup(
          title: 'Button Groups',
          description: 'Organized button layouts using VSButtonGroup',
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
                    'Action Buttons',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSButton.edit(
                        onPressed: () => _showActionDialog(context, 'Edit pressed'),
                        size: VSButtonSize.small,
                      ),
                      VSButton.delete(
                        onPressed: () => _showActionDialog(context, 'Delete pressed'),
                        size: VSButtonSize.small,
                      ),
                      VSButton.save(
                        onPressed: () => _showActionDialog(context, 'Save pressed'),
                        size: VSButtonSize.small,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

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
                    'Form Actions',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSCancelSubmitButtons(
                    onSubmit: () => _showActionDialog(context, 'Form submitted'),
                    onCancel: () => _showActionDialog(context, 'Form cancelled'),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Real-world Usage Examples
        _buildButtonGroup(
          title: 'Real-world Usage Examples',
          description: 'Common button patterns in application interfaces',
          children: [
            // Card Actions
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
                      VSAvatar(
                        imageUrl: 'https://via.placeholder.com/32',
                        size: VSAvatarSize.small,
                      ),
                      SizedBox(width: AppSpacing.sm),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('User Profile', style: AppTypography.bodyMediumSemibold),
                          Text('Manage user settings', style: AppTypography.bodySmallRegular),
                        ],
                      ),
                      const Spacer(),
                      const VSBadge(
                        label: 'ACTIVE',
                        variant: VSBadgeVariant.success,
                        size: VSBadgeSize.xsmall,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.md),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSButton(
                        label: 'View Profile',
                        onPressed: () => _showActionDialog(context, 'View profile'),
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.outlined,
                      ),
                      VSButton.edit(
                        onPressed: () => _showActionDialog(context, 'Edit profile'),
                        size: VSButtonSize.small,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Dialog Actions
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
                    'Confirmation Dialog',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Text(
                    'This action cannot be undone. Are you sure?',
                    style: AppTypography.bodySmallRegular,
                  ),
                  SizedBox(height: AppSpacing.md),
                  VSCancelSubmitButtons(
                    onSubmit: () => _showActionDialog(context, 'Action confirmed'),
                    onCancel: () => _showActionDialog(context, 'Action cancelled'),
                    submitLabel: 'Confirm',
                    cancelLabel: 'Cancel',
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

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
                  Text(
                    'Data Table Actions',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSButton.action(
                        onPressed: () => _showActionDialog(context, 'Add new item'),
                        label: 'Add',
                        icon: Icons.add,
                        size: VSButtonSize.small,
                      ),
                      VSButton.action(
                        onPressed: () => _showActionDialog(context, 'Import data'),
                        label: 'Import',
                        icon: Icons.upload,
                        size: VSButtonSize.small,
                      ),
                      VSButton.export(
                        onPressed: () => _showActionDialog(context, 'Export data'),
                        size: VSButtonSize.small,
                      ),
                      VSButton.action(
                        onPressed: () => _showActionDialog(context, 'Refresh data'),
                        label: 'Refresh',
                        icon: Icons.refresh,
                        size: VSButtonSize.small,
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

  Widget _buildButtonGroup({
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