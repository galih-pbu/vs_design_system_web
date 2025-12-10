import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSDottedBorderExample extends StatefulWidget {
  const VSDottedBorderExample({super.key});

  @override
  State<VSDottedBorderExample> createState() => _VSDottedBorderExampleState();
}

class _VSDottedBorderExampleState extends State<VSDottedBorderExample> {
  bool _isAnimated = false;
  VSBorderType _selectedBorderType = VSBorderType.rRect;
  List<double> _dashPattern = [6, 6];
  double _strokeWidth = 2.0;
  Color _borderColor = AppColors.primaryDefault;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Dotted Border Examples',
      //   actions: [
      //     VSButton(
      //       label: 'Info',
      //       onPressed: () => _showBorderInfo(context),
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
              title: 'VS Dotted Border Variants & Types',
              description: 'Comprehensive demonstration of dotted border configurations, animations, and real-world usage patterns',
              child: _buildBorderShowcase(),
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

  Widget _buildBorderShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic Border Types
        _buildBorderGroup(
          title: 'Border Types & Shapes',
          description: 'Different border shapes and configurations',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton(
                  label: 'Rectangle',
                  onPressed: () => setState(() => _selectedBorderType = VSBorderType.rect),
                  variant: _selectedBorderType == VSBorderType.rect ? VSButtonVariant.primary : VSButtonVariant.outlined,
                ),
                VSButton(
                  label: 'Rounded Rectangle',
                  onPressed: () => setState(() => _selectedBorderType = VSBorderType.rRect),
                  variant: _selectedBorderType == VSBorderType.rRect ? VSButtonVariant.primary : VSButtonVariant.outlined,
                ),
                VSButton(
                  label: 'Circle',
                  onPressed: () => setState(() => _selectedBorderType = VSBorderType.circle),
                  variant: _selectedBorderType == VSBorderType.circle ? VSButtonVariant.primary : VSButtonVariant.outlined,
                ),
                VSButton(
                  label: 'Oval',
                  onPressed: () => setState(() => _selectedBorderType = VSBorderType.oval),
                  variant: _selectedBorderType == VSBorderType.oval ? VSButtonVariant.primary : VSButtonVariant.outlined,
                ),
              ],
            ),
            SizedBox(height: AppSpacing.md),
            VSDottedBorder(
              borderType: _selectedBorderType,
              color: _borderColor,
              strokeWidth: _strokeWidth,
              dashPattern: _dashPattern,
              radius: const Radius.circular(12),
              padding: EdgeInsets.all(AppSpacing.md),
              animated: _isAnimated,
              child: Container(
                width: 150,
                height: 100,
                color: AppColors.neutral100,
                child: Center(
                  child: Text(
                    'Border Type: ${_selectedBorderType.name}',
                    style: AppTypography.bodySmallRegular,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Dash Patterns
        _buildBorderGroup(
          title: 'Dash Pattern Variations',
          description: 'Different dash and gap combinations',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton(
                  label: 'Solid',
                  onPressed: () => setState(() => _dashPattern = [10, 0]),
                  variant: _dashPattern == [10, 0] ? VSButtonVariant.primary : VSButtonVariant.outlined,
                  size: VSButtonSize.small,
                ),
                VSButton(
                  label: 'Dashed',
                  onPressed: () => setState(() => _dashPattern = [6, 6]),
                  variant: _dashPattern == [6, 6] ? VSButtonVariant.primary : VSButtonVariant.outlined,
                  size: VSButtonSize.small,
                ),
                VSButton(
                  label: 'Dotted',
                  onPressed: () => setState(() => _dashPattern = [2, 4]),
                  variant: _dashPattern == [2, 4] ? VSButtonVariant.primary : VSButtonVariant.outlined,
                  size: VSButtonSize.small,
                ),
                VSButton(
                  label: 'Mixed',
                  onPressed: () => setState(() => _dashPattern = [8, 3, 2, 3]),
                  variant: _dashPattern == [8, 3, 2, 3] ? VSButtonVariant.primary : VSButtonVariant.outlined,
                  size: VSButtonSize.small,
                ),
              ],
            ),
            SizedBox(height: AppSpacing.md),
            Row(
              children: [
                VSDottedBorder(
                  borderType: VSBorderType.rRect,
                  color: AppColors.primaryDefault,
                  strokeWidth: 2,
                  dashPattern: _dashPattern,
                  radius: const Radius.circular(8),
                  padding: EdgeInsets.all(AppSpacing.sm),
                  child: Container(
                    width: 80,
                    height: 60,
                    color: AppColors.primaryBg,
                    child: Center(
                      child: Text(
                        'Pattern',
                        style: AppTypography.bodySmallRegular.copyWith(
                          color: AppColors.primaryDefault,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: AppSpacing.md),
                Container(
                  padding: EdgeInsets.all(AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: AppColors.neutral100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Pattern: ${_dashPattern.join(', ')}',
                    style: AppTypography.bodySmallRegular,
                  ),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Stroke Width Variations
        _buildBorderGroup(
          title: 'Stroke Width Variations',
          description: 'Different border thickness options',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton(
                  label: 'Thin (1px)',
                  onPressed: () => setState(() => _strokeWidth = 1.0),
                  variant: _strokeWidth == 1.0 ? VSButtonVariant.primary : VSButtonVariant.outlined,
                  size: VSButtonSize.small,
                ),
                VSButton(
                  label: 'Medium (2px)',
                  onPressed: () => setState(() => _strokeWidth = 2.0),
                  variant: _strokeWidth == 2.0 ? VSButtonVariant.primary : VSButtonVariant.outlined,
                  size: VSButtonSize.small,
                ),
                VSButton(
                  label: 'Thick (4px)',
                  onPressed: () => setState(() => _strokeWidth = 4.0),
                  variant: _strokeWidth == 4.0 ? VSButtonVariant.primary : VSButtonVariant.outlined,
                  size: VSButtonSize.small,
                ),
              ],
            ),
            SizedBox(height: AppSpacing.md),
            VSDottedBorder(
              borderType: VSBorderType.rRect,
              color: AppColors.secondaryDefault,
              strokeWidth: _strokeWidth,
              dashPattern: [6, 6],
              radius: const Radius.circular(12),
              padding: EdgeInsets.all(AppSpacing.md),
              child: Container(
                width: 120,
                height: 80,
                color: AppColors.secondaryBg,
                child: Center(
                  child: Text(
                    '${_strokeWidth}px',
                    style: AppTypography.bodyMediumSemibold.copyWith(
                      color: AppColors.secondaryDefault,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Color Variations
        _buildBorderGroup(
          title: 'Color Variations',
          description: 'Different border colors and gradients',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton(
                  label: 'Primary',
                  onPressed: () => setState(() => _borderColor = AppColors.primaryDefault),
                  variant: _borderColor == AppColors.primaryDefault ? VSButtonVariant.primary : VSButtonVariant.outlined,
                  size: VSButtonSize.small,
                ),
                VSButton(
                  label: 'Success',
                  onPressed: () => setState(() => _borderColor = AppColors.successDefault),
                  variant: _borderColor == AppColors.successDefault ? VSButtonVariant.primary : VSButtonVariant.outlined,
                  size: VSButtonSize.small,
                ),
                VSButton(
                  label: 'Warning',
                  onPressed: () => setState(() => _borderColor = AppColors.warningDefault),
                  variant: _borderColor == AppColors.warningDefault ? VSButtonVariant.primary : VSButtonVariant.outlined,
                  size: VSButtonSize.small,
                ),
                VSButton(
                  label: 'Danger',
                  onPressed: () => setState(() => _borderColor = AppColors.dangerDefault),
                  variant: _borderColor == AppColors.dangerDefault ? VSButtonVariant.primary : VSButtonVariant.outlined,
                  size: VSButtonSize.small,
                ),
              ],
            ),
            SizedBox(height: AppSpacing.md),
            Row(
              children: [
                VSDottedBorder(
                  borderType: VSBorderType.circle,
                  color: _borderColor,
                  strokeWidth: 3,
                  dashPattern: [4, 4],
                  padding: EdgeInsets.all(AppSpacing.sm),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: _borderColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.palette,
                      color: _borderColor,
                      size: 24,
                    ),
                  ),
                ),
                SizedBox(width: AppSpacing.md),
                VSDottedBorder(
                  borderType: VSBorderType.rRect,
                  gradient: LinearGradient(
                    colors: [AppColors.primaryDefault, AppColors.secondaryDefault],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  strokeWidth: 3,
                  dashPattern: [6, 3],
                  radius: const Radius.circular(8),
                  padding: EdgeInsets.all(AppSpacing.sm),
                  child: Container(
                    width: 100,
                    height: 60,
                    color: AppColors.neutral100,
                    child: Center(
                      child: Text(
                        'Gradient',
                        style: AppTypography.bodySmallRegular,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Animation Controls
        _buildBorderGroup(
          title: 'Animation Controls',
          description: 'Animated and static border options',
          children: [
            Row(
              children: [
                VSToggle(
                  value: _isAnimated,
                  onChanged: (value) => setState(() => _isAnimated = value),
                  label: 'Enable Animation',
                ),
                SizedBox(width: AppSpacing.md),
                VSButton(
                  label: 'Demo Animation',
                  onPressed: () => _showAnimationDemo(context),
                  variant: VSButtonVariant.secondary,
                  size: VSButtonSize.small,
                ),
              ],
            ),
            SizedBox(height: AppSpacing.md),
            VSDottedBorder(
              borderType: VSBorderType.rRect,
              color: AppColors.warningDefault,
              strokeWidth: 2,
              dashPattern: [8, 4],
              radius: const Radius.circular(12),
              padding: EdgeInsets.all(AppSpacing.md),
              animated: _isAnimated,
              animationDuration: const Duration(seconds: 3),
              child: Container(
                width: 200,
                height: 100,
                color: AppColors.warningBg,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _isAnimated ? Icons.animation : Icons.stop,
                        color: AppColors.warningDefault,
                        size: 24,
                      ),
                      SizedBox(height: AppSpacing.xs),
                      Text(
                        _isAnimated ? 'Animated Border' : 'Static Border',
                        style: AppTypography.bodySmallRegular.copyWith(
                          color: AppColors.warningDefault,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Real-world Usage Examples
        _buildBorderGroup(
          title: 'Real-world Usage Examples',
          description: 'Common patterns for dotted borders in applications',
          children: [
            // Upload Area
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
                    'File Upload Area',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSDottedBorder(
                    borderType: VSBorderType.rRect,
                    color: AppColors.primaryDefault,
                    strokeWidth: 2,
                    dashPattern: [8, 8],
                    radius: const Radius.circular(8),
                    padding: EdgeInsets.all(AppSpacing.xl),
                    child: Container(
                      width: double.infinity,
                      height: 120,
                      color: AppColors.primaryBg.withValues(alpha: 0.3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cloud_upload,
                            color: AppColors.primaryDefault,
                            size: 32,
                          ),
                          SizedBox(height: AppSpacing.sm),
                          Text(
                            'Drop files here or click to upload',
                            style: AppTypography.bodyMediumRegular.copyWith(
                              color: AppColors.primaryDefault,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: AppSpacing.xs),
                          Text(
                            'Supported formats: PDF, DOC, JPG, PNG',
                            style: AppTypography.bodySmallRegular.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Profile Picture Placeholder
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
                    'Profile Picture Upload',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      VSDottedBorder(
                        borderType: VSBorderType.circle,
                        color: AppColors.secondaryDefault,
                        strokeWidth: 3,
                        dashPattern: [6, 6],
                        padding: EdgeInsets.all(AppSpacing.sm),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: AppColors.secondaryBg.withValues(alpha: 0.3),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person_add,
                            color: AppColors.secondaryDefault,
                            size: 32,
                          ),
                        ),
                      ),
                      SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add Profile Picture',
                              style: AppTypography.bodyMediumSemibold,
                            ),
                            SizedBox(height: AppSpacing.xs),
                            Text(
                              'Upload a photo to personalize your profile',
                              style: AppTypography.bodySmallRegular.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                            SizedBox(height: AppSpacing.sm),
                            VSButton(
                              label: 'Choose File',
                              onPressed: () => _showActionDialog(context, 'File picker would open here'),
                              size: VSButtonSize.small,
                              variant: VSButtonVariant.outlined,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Card Selection
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
                    'Payment Method Selection',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Expanded(
                        child: VSDottedBorder(
                          borderType: VSBorderType.rRect,
                          color: AppColors.successDefault,
                          strokeWidth: 2,
                          dashPattern: [4, 4],
                          radius: const Radius.circular(8),
                          padding: EdgeInsets.all(AppSpacing.md),
                          child: Container(
                            padding: EdgeInsets.all(AppSpacing.md),
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColors.successBg.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.credit_card,
                                  color: AppColors.successDefault,
                                  size: 24,
                                ),
                                SizedBox(height: AppSpacing.xs),
                                Text(
                                  'Credit Card',
                                  style: AppTypography.bodySmallSemibold.copyWith(
                                    color: AppColors.successDefault,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: VSDottedBorder(
                          borderType: VSBorderType.rRect,
                          color: AppColors.neutral400,
                          strokeWidth: 2,
                          dashPattern: [4, 4],
                          radius: const Radius.circular(8),
                          padding: EdgeInsets.all(AppSpacing.md),
                          child: Container(
                            padding: EdgeInsets.all(AppSpacing.md),
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColors.neutral100,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.account_balance,
                                  color: AppColors.neutral500,
                                  size: 24,
                                ),
                                SizedBox(height: AppSpacing.xs),
                                Text(
                                  'Bank Transfer',
                                  style: AppTypography.bodySmallRegular.copyWith(
                                    color: AppColors.neutral500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Form Section
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
                    'Form Section Divider',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Container(
                    padding: EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Personal Information',
                          style: AppTypography.bodyMediumSemibold,
                        ),
                        SizedBox(height: AppSpacing.sm),
                        // Mock form fields
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.neutral100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Text(
                              'Full Name Field',
                              style: AppTypography.bodySmallRegular.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: AppSpacing.sm),
                        VSDottedBorder(
                          borderType: VSBorderType.rect,
                          color: AppColors.neutral300,
                          strokeWidth: 1,
                          dashPattern: [2, 2],
                          padding: EdgeInsets.zero,
                          child: Container(height: 1),
                        ),
                        SizedBox(height: AppSpacing.sm),
                        Text(
                          'Contact Details',
                          style: AppTypography.bodyMediumSemibold,
                        ),
                        SizedBox(height: AppSpacing.sm),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.neutral100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Text(
                              'Email Field',
                              style: AppTypography.bodySmallRegular.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ),
                      ],
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

  Widget _buildBorderGroup({
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

  void _showAnimationDemo(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black.withValues(alpha: 0.5),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: VSDottedBorder(
              borderType: VSBorderType.circle,
              color: AppColors.primaryDefault,
              strokeWidth: 4,
              dashPattern: [12, 8],
              padding: EdgeInsets.all(AppSpacing.lg),
              animated: true,
              animationDuration: const Duration(seconds: 2),
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.primaryBg.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.animation,
                      color: AppColors.primaryDefault,
                      size: 48,
                    ),
                    SizedBox(height: AppSpacing.sm),
                    Text(
                      'Animated Border',
                      style: AppTypography.bodyMediumSemibold.copyWith(
                        color: AppColors.primaryDefault,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
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