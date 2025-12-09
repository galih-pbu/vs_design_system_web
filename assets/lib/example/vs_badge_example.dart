import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSBadgeExample extends StatefulWidget {
  const VSBadgeExample({super.key});

  @override
  State<VSBadgeExample> createState() => _VSBadgeExampleState();
}

class _VSBadgeExampleState extends State<VSBadgeExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Badge Examples',
      //   actions: [
      //     VSButton(
      //       label: 'Show Info',
      //       onPressed: () => _showBadgeInfoDialog(context),
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
              title: 'VS Badge Variants & Types',
              description:
                  'Comprehensive demonstration of all badge variants, sizes, and types with interactive examples',
              child: _buildBadgeShowcase(context),
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

  Widget _buildBadgeShowcase(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Status Badges - All Variants
        _buildBadgeGroup(
          title: 'Status Badges',
          description: 'Standard status indicators with semantic colors',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: VSBadgeVariant.values.map((variant) {
                return VSBadge(
                  label: variant.name.toUpperCase(),
                  variant: variant,
                  type: VSBadgeType.status,
                );
              }).toList(),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // ID Badges
        _buildBadgeGroup(
          title: 'ID Badges',
          description: 'Used for identification and categorization',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                const VSBadge(label: 'ID-001', type: VSBadgeType.id),
                const VSBadge(label: 'CATEGORY', type: VSBadgeType.id),
                const VSBadge(label: 'TAG', type: VSBadgeType.id),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Approval Badges
        _buildBadgeGroup(
          title: 'Approval Badges',
          description:
              'Special badges for approval workflows with check indicators',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                const VSBadge(
                  label: 'APPROVED',
                  type: VSBadgeType.approval,
                  variant: VSBadgeVariant.success,
                ),
                const VSBadge(
                  label: 'PENDING',
                  type: VSBadgeType.approval,
                  variant: VSBadgeVariant.warning,
                ),
                const VSBadge(
                  label: 'REJECTED',
                  type: VSBadgeType.approval,
                  variant: VSBadgeVariant.danger,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Indicator Badges
        _buildBadgeGroup(
          title: 'Indicator Badges',
          description: 'Simple colored dots for status indication',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: VSBadgeVariant.values.map((variant) {
                return VSBadge(
                  label: '', // Empty label for indicator
                  variant: variant,
                  type: VSBadgeType.indicator,
                );
              }).toList(),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Size Comparison
        _buildBadgeGroup(
          title: 'Size Comparison',
          description: 'Badge sizes: xsmall and small',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                const VSBadge(
                  label: 'XS',
                  size: VSBadgeSize.xsmall,
                  variant: VSBadgeVariant.primary,
                ),
                const VSBadge(
                  label: 'SMALL',
                  size: VSBadgeSize.small,
                  variant: VSBadgeVariant.primary,
                ),
                const VSBadge(
                  label: 'XS',
                  size: VSBadgeSize.xsmall,
                  variant: VSBadgeVariant.secondary,
                ),
                const VSBadge(
                  label: 'SMALL',
                  size: VSBadgeSize.small,
                  variant: VSBadgeVariant.secondary,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Badges with Icons
        _buildBadgeGroup(
          title: 'Badges with Icons',
          description:
              'Status badges enhanced with icons for better visual communication',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                const VSBadge(
                  label: 'ACTIVE',
                  variant: VSBadgeVariant.success,
                  icon: Icons.check_circle,
                ),
                const VSBadge(
                  label: 'WARNING',
                  variant: VSBadgeVariant.warning,
                  icon: Icons.warning,
                ),
                const VSBadge(
                  label: 'ERROR',
                  variant: VSBadgeVariant.danger,
                  icon: Icons.error,
                ),
                const VSBadge(
                  label: 'INFO',
                  variant: VSBadgeVariant.primary,
                  icon: Icons.info,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Custom Colors
        _buildBadgeGroup(
          title: 'Custom Colors',
          description: 'Badges with custom background, text, and border colors',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSBadge(
                  label: 'CUSTOM',
                  backgroundColor: Colors.purple.shade100,
                  textColor: Colors.purple.shade800,
                  borderColor: Colors.purple.shade300,
                ),
                VSBadge(
                  label: 'THEME',
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primaryContainer,
                  textColor: Theme.of(context).colorScheme.onPrimaryContainer,
                  borderColor: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Border Control
        _buildBadgeGroup(
          title: 'Border Control',
          description: 'Badges with and without borders',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                const VSBadge(
                  label: 'WITH BORDER',
                  variant: VSBadgeVariant.neutral,
                  showBorder: true,
                ),
                const VSBadge(
                  label: 'NO BORDER',
                  variant: VSBadgeVariant.neutral,
                  showBorder: false,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Real-world Usage Examples
        _buildBadgeGroup(
          title: 'Real-world Usage Examples',
          description: 'Common patterns for using badges in applications',
          children: [
            // User Status
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const VSAvatar(
                    imageUrl: 'https://via.placeholder.com/40',
                    size: VSAvatarSize.small,
                  ),
                  SizedBox(width: AppSpacing.md),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('John Doe', style: AppTypography.bodyMediumSemibold),
                      SizedBox(height: AppSpacing.xs),
                      Row(
                        children: [
                          const VSBadge(
                            label: 'ONLINE',
                            variant: VSBadgeVariant.success,
                            size: VSBadgeSize.xsmall,
                          ),
                          SizedBox(width: AppSpacing.sm),
                          const VSBadge(
                            label: 'VERIFIED',
                            variant: VSBadgeVariant.primary,
                            size: VSBadgeSize.xsmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Task Status
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
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      const VSBadge(label: 'FRONTEND', type: VSBadgeType.id),
                      const VSBadge(
                        label: 'HIGH PRIORITY',
                        variant: VSBadgeVariant.danger,
                      ),
                      const VSBadge(label: 'SPRINT 2', type: VSBadgeType.id),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Approval Workflow
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
                    'Invoice Approval',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      const VSBadge(
                        label: 'APPROVED',
                        type: VSBadgeType.approval,
                        variant: VSBadgeVariant.success,
                      ),
                      SizedBox(width: AppSpacing.sm),
                      Text('by Manager', style: AppTypography.bodySmallRegular),
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

  Widget _buildBadgeGroup({
    required String title,
    required String description,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.bodyLargeSemibold),
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
}