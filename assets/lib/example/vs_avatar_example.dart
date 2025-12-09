import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

/// Comprehensive examples for VSAvatar widget
class VSAvatarExample extends StatefulWidget {
  const VSAvatarExample({super.key});

  @override
  State<VSAvatarExample> createState() => _VSAvatarExampleState();
}

class _VSAvatarExampleState extends State<VSAvatarExample> {
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

  Widget buildAvatarShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Introduction
        Text(
          'VS Avatar Overview',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.sm),
        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.neutral100,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'VSAvatar provides circular user avatars with support for images, initials, status indicators, and online presence. Available in 6 sizes with customizable colors and status states.',
                style: AppTypography.bodyMediumRegular,
              ),
              SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  VSBadge(label: 'Image Support', variant: VSBadgeVariant.primary),
                  SizedBox(width: AppSpacing.sm),
                  VSBadge(label: 'Initials Fallback', variant: VSBadgeVariant.secondary),
                  SizedBox(width: AppSpacing.sm),
                  VSBadge(label: 'Status Indicators', variant: VSBadgeVariant.success),
                  SizedBox(width: AppSpacing.sm),
                  VSBadge(label: 'Online Presence', variant: VSBadgeVariant.warning),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.lg),

        // Size Variations
        Text(
          'Size Variations',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),
        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.neutral100,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose from 6 predefined sizes based on your design needs',
                style: AppTypography.bodyMediumRegular,
              ),
              SizedBox(height: AppSpacing.md),
              Wrap(
                spacing: AppSpacing.lg,
                runSpacing: AppSpacing.md,
                alignment: WrapAlignment.center,
                children: [
                  _buildSizeExample('XXS (18px)', VSAvatarSize.xxsmall),
                  _buildSizeExample('XS (24px)', VSAvatarSize.xsmall),
                  _buildSizeExample('S (28px)', VSAvatarSize.small),
                  _buildSizeExample('M (32px)', VSAvatarSize.medium),
                  _buildSizeExample('L (40px)', VSAvatarSize.large),
                  _buildSizeExample('XL (48px)', VSAvatarSize.xlarge),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.lg),

        // Initials Examples
        Text(
          'Initials Avatars',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),

        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.neutral100,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Avatars with user initials when no image is available',
                style: AppTypography.bodyMediumRegular,
              ),
              SizedBox(height: AppSpacing.md),
              Wrap(
                spacing: AppSpacing.lg,
                runSpacing: AppSpacing.md,
                alignment: WrapAlignment.center,
                children: [
                  VSAvatar(
                    initials: 'JD',
                    size: VSAvatarSize.large,
                    backgroundColor: AppColors.primaryDefault,
                  ),
                  VSAvatar(
                    initials: 'AB',
                    size: VSAvatarSize.large,
                    backgroundColor: AppColors.secondaryDefault,
                  ),
                  VSAvatar(
                    initials: 'MK',
                    size: VSAvatarSize.large,
                    backgroundColor: AppColors.successDefault,
                  ),
                  VSAvatar(
                    initials: 'SR',
                    size: VSAvatarSize.large,
                    backgroundColor: AppColors.warningDefault,
                  ),
                  VSAvatar(
                    initials: 'TW',
                    size: VSAvatarSize.large,
                    backgroundColor: AppColors.dangerDefault,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.lg),

        // Status Indicators
        Text(
          'Status Indicators',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),

        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.neutral100,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Status indicators for user verification or account states',
                style: AppTypography.bodyMediumRegular,
              ),
              SizedBox(height: AppSpacing.md),
              Wrap(
                spacing: AppSpacing.lg,
                runSpacing: AppSpacing.md,
                alignment: WrapAlignment.center,
                children: [
                  Column(
                    children: [
                      VSAvatar(
                        initials: 'JD',
                        size: VSAvatarSize.large,
                        status: VSAvatarStatus.success,
                      ),
                      SizedBox(height: AppSpacing.xs),
                      Text('Verified', style: AppTypography.bodySmallRegular),
                    ],
                  ),
                  Column(
                    children: [
                      VSAvatar(
                        initials: 'AB',
                        size: VSAvatarSize.large,
                        status: VSAvatarStatus.error,
                      ),
                      SizedBox(height: AppSpacing.xs),
                      Text('Suspended', style: AppTypography.bodySmallRegular),
                    ],
                  ),
                  Column(
                    children: [
                      VSAvatar(
                        initials: 'MK',
                        size: VSAvatarSize.large,
                      ),
                      SizedBox(height: AppSpacing.xs),
                      Text('No Status', style: AppTypography.bodySmallRegular),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.lg),

        // Online Presence
        Text(
          'Online Presence Indicators',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),

        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.neutral100,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Green indicator shows online presence',
                style: AppTypography.bodyMediumRegular,
              ),
              SizedBox(height: AppSpacing.md),
              Wrap(
                spacing: AppSpacing.lg,
                runSpacing: AppSpacing.md,
                alignment: WrapAlignment.center,
                children: [
                  Column(
                    children: [
                      VSAvatar(
                        initials: 'JD',
                        size: VSAvatarSize.large,
                        isOnline: true,
                      ),
                      SizedBox(height: AppSpacing.xs),
                      Text('Online', style: AppTypography.bodySmallRegular),
                    ],
                  ),
                  Column(
                    children: [
                      VSAvatar(
                        initials: 'AB',
                        size: VSAvatarSize.large,
                        isOnline: false,
                      ),
                      SizedBox(height: AppSpacing.xs),
                      Text('Offline', style: AppTypography.bodySmallRegular),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.lg),

        // Custom Colors
        Text(
          'Custom Colors',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),

        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.neutral100,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Custom background and text colors for branding',
                style: AppTypography.bodyMediumRegular,
              ),
              SizedBox(height: AppSpacing.md),
              Wrap(
                spacing: AppSpacing.lg,
                runSpacing: AppSpacing.md,
                alignment: WrapAlignment.center,
                children: [
                  VSAvatar(
                    initials: 'BR',
                    size: VSAvatarSize.large,
                    backgroundColor: AppColors.primaryBg,
                    textColor: AppColors.primaryDefault,
                  ),
                  VSAvatar(
                    initials: 'DG',
                    size: VSAvatarSize.large,
                    backgroundColor: AppColors.secondaryBg,
                    textColor: AppColors.secondaryDefault,
                  ),
                  VSAvatar(
                    initials: 'YW',
                    size: VSAvatarSize.large,
                    backgroundColor: AppColors.successBg,
                    textColor: AppColors.successDefault,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.lg),

        // Interactive Examples
        Text(
          'Interactive Examples',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),

        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.neutral100,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Click avatars to see their information',
                style: AppTypography.bodyMediumRegular,
              ),
              SizedBox(height: AppSpacing.md),
              Wrap(
                spacing: AppSpacing.lg,
                runSpacing: AppSpacing.md,
                alignment: WrapAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => _showAvatarInfo('John Doe\nSoftware Engineer\nOnline'),
                    child: VSAvatar(
                      initials: 'JD',
                      size: VSAvatarSize.large,
                      isOnline: true,
                      status: VSAvatarStatus.success,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _showAvatarInfo('Alice Brown\nProduct Manager\nOffline'),
                    child: VSAvatar(
                      initials: 'AB',
                      size: VSAvatarSize.large,
                      backgroundColor: AppColors.secondaryDefault,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _showAvatarInfo('Mike Chen\nDesigner\nVerified Account'),
                    child: VSAvatar(
                      initials: 'MC',
                      size: VSAvatarSize.large,
                      status: VSAvatarStatus.success,
                      backgroundColor: AppColors.successDefault,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.lg),

        // Usage in Lists
        Text(
          'Usage in Lists and Cards',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),

        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.neutral100,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Common usage patterns in user lists and profile cards',
                style: AppTypography.bodyMediumRegular,
              ),
              SizedBox(height: AppSpacing.md),
              // User List Example
              Container(
                padding: EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.neutral0,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColors.neutral300),
                ),
                child: Column(
                  children: [
                    Text(
                      'Team Members',
                      style: AppTypography.bodyMediumSemibold,
                    ),
                    SizedBox(height: AppSpacing.md),
                    Row(
                      children: [
                        VSAvatar(
                          initials: 'JD',
                          size: VSAvatarSize.medium,
                          isOnline: true,
                        ),
                        SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('John Doe', style: AppTypography.bodyMediumSemibold),
                              Text('Software Engineer', style: AppTypography.bodySmallRegular),
                            ],
                          ),
                        ),
                        VSBadge(label: 'Lead', variant: VSBadgeVariant.primary),
                      ],
                    ),
                    SizedBox(height: AppSpacing.sm),
                    Divider(color: AppColors.neutral300),
                    SizedBox(height: AppSpacing.sm),
                    Row(
                      children: [
                        VSAvatar(
                          initials: 'AB',
                          size: VSAvatarSize.medium,
                          status: VSAvatarStatus.success,
                        ),
                        SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Alice Brown', style: AppTypography.bodyMediumSemibold),
                              Text('Product Manager', style: AppTypography.bodySmallRegular),
                            ],
                          ),
                        ),
                        VSBadge(label: 'Verified', variant: VSBadgeVariant.success),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.lg),

        // Usage Guidelines
        Text(
          'Usage Guidelines',
          style: AppTypography.bodyLargeSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSpacing.md),
        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.warningBg,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.warningDefault),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.info_outline, size: 20, color: AppColors.textPrimary),
                  SizedBox(width: AppSpacing.sm),
                  Text(
                    'Best Practices',
                    style: AppTypography.bodyMediumSemibold.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.sm),
              Text(
                '• Use images when available, fall back to initials\n• Choose appropriate sizes based on context (medium for lists, large for profiles)\n• Use status indicators sparingly for important states only\n• Online indicators are for real-time presence, not account status\n• Custom colors should match your brand guidelines\n• Ensure sufficient contrast between background and text colors',
                style: AppTypography.bodySmallRegular.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showAvatarInfo(String info) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.approve,
        message: info,
        actions: [
          VSDialogAction(
            label: 'OK',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: _buildSection(
          title: 'VS Avatar Components',
          description: 'Comprehensive collection of avatar components with various sizes, states, and customization options',
          child: buildAvatarShowcase(),
        ),
      ),
    );
  }

  Widget _buildSizeExample(String label, VSAvatarSize size) {
    return Column(
      children: [
        VSAvatar(
          initials: 'JD',
          size: size,
          backgroundColor: AppColors.primaryDefault,
        ),
        SizedBox(height: AppSpacing.xs),
        Text(label, style: AppTypography.bodySmallRegular),
      ],
    );
  }
}