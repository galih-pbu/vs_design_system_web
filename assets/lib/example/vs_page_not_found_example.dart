import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSPageNotFoundExample extends StatefulWidget {
  const VSPageNotFoundExample({super.key});

  @override
  State<VSPageNotFoundExample> createState() => _VSPageNotFoundExampleState();
}

class _VSPageNotFoundExampleState extends State<VSPageNotFoundExample> {
  bool _showCustomActions = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Page Not Found Examples',
      //   actions: [
      //     VSButton(
      //       label: 'Info',
      //       onPressed: () => _showPageNotFoundInfo(context),
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
              title: 'VS Page Not Found Variants & Types',
              description: 'Comprehensive demonstration of 404 page configurations and real-world usage patterns',
              child: _buildPageNotFoundShowcase(),
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

  Widget _buildPageNotFoundShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic Page Not Found
        _buildPageNotFoundGroup(
          title: 'Basic 404 Page',
          description: 'Standard page not found implementation',
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.neutral300),
              ),
              child: const VSPageNotFound(),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Custom Configurations
        _buildPageNotFoundGroup(
          title: 'Custom Configurations',
          description: 'Different 404 page setups and variations',
          children: [
            Row(
              children: [
                VSToggle(
                  value: _showCustomActions,
                  onChanged: (value) => setState(() => _showCustomActions = value),
                  label: 'Show Custom Actions',
                ),
              ],
            ),
            SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton(
                  label: 'Standard 404',
                  onPressed: () => _showStandard404Demo(context),
                  variant: VSButtonVariant.primary,
                ),
                VSButton(
                  label: 'Custom Message',
                  onPressed: () => _showCustomMessageDemo(context),
                  variant: VSButtonVariant.secondary,
                ),
                VSButton(
                  label: 'With Actions',
                  onPressed: () => _showWithActionsDemo(context),
                  variant: VSButtonVariant.outlined,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Real-world Usage Examples
        _buildPageNotFoundGroup(
          title: 'Real-world Usage Examples',
          description: 'Common 404 page patterns in application interfaces',
          children: [
            // E-commerce 404
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
                    'E-commerce Product Not Found',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.neutral300),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '404',
                          style: AppTypography.h1.copyWith(
                            fontSize: 80,
                            color: AppColors.primaryDefault,
                            height: 1,
                          ),
                        ),
                        SizedBox(height: AppSpacing.md),
                        Text(
                          'Product Not Found',
                          style: AppTypography.h3.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: AppSpacing.sm),
                        Text(
                          'The product you\'re looking for might have been removed or is temporarily unavailable.',
                          style: AppTypography.bodyMediumRegular.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: AppSpacing.xl),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            VSButton(
                              label: 'Continue Shopping',
                              onPressed: () => _showActionDialog(context, 'Continue shopping clicked'),
                              variant: VSButtonVariant.primary,
                            ),
                            SizedBox(width: AppSpacing.md),
                            VSButton(
                              label: 'Search Products',
                              onPressed: () => _showActionDialog(context, 'Search products clicked'),
                              variant: VSButtonVariant.outlined,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Blog/Article 404
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
                    'Blog Article Not Found',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.neutral300),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.article,
                          size: 80,
                          color: AppColors.secondaryDefault,
                        ),
                        SizedBox(height: AppSpacing.md),
                        Text(
                          'Article Not Found',
                          style: AppTypography.h3.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: AppSpacing.sm),
                        Text(
                          'The article you\'re looking for doesn\'t exist or may have been moved.',
                          style: AppTypography.bodyMediumRegular.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: AppSpacing.xl),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            VSButton(
                              label: 'Browse Articles',
                              onPressed: () => _showActionDialog(context, 'Browse articles clicked'),
                              variant: VSButtonVariant.secondary,
                            ),
                            SizedBox(width: AppSpacing.md),
                            VSButton(
                              label: 'Go to Blog',
                              onPressed: () => _showActionDialog(context, 'Go to blog clicked'),
                              variant: VSButtonVariant.outlined,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Admin Panel 404
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
                    'Admin Panel Access Denied',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.neutral300),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.admin_panel_settings,
                          size: 80,
                          color: AppColors.warningDefault,
                        ),
                        SizedBox(height: AppSpacing.md),
                        Text(
                          'Access Denied',
                          style: AppTypography.h3.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: AppSpacing.sm),
                        Text(
                          'You don\'t have permission to access this admin page.',
                          style: AppTypography.bodyMediumRegular.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: AppSpacing.xl),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            VSButton(
                              label: 'Request Access',
                              onPressed: () => _showActionDialog(context, 'Request access clicked'),
                              variant: VSButtonVariant.primary,
                            ),
                            SizedBox(width: AppSpacing.md),
                            VSButton(
                              label: 'Go to Dashboard',
                              onPressed: () => _showActionDialog(context, 'Go to dashboard clicked'),
                              variant: VSButtonVariant.outlined,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // API Endpoint 404
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
                    'API Endpoint Not Found',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.neutral300),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(AppSpacing.md),
                          decoration: BoxDecoration(
                            color: AppColors.dangerBg.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.code,
                            size: 60,
                            color: AppColors.dangerDefault,
                          ),
                        ),
                        SizedBox(height: AppSpacing.md),
                        Text(
                          '404 Not Found',
                          style: AppTypography.h3.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: AppSpacing.sm),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
                          decoration: BoxDecoration(
                            color: AppColors.neutral100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'GET /api/v1/users/123',
                            style: AppTypography.bodySmallRegular.copyWith(
                              fontFamily: 'monospace',
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                        SizedBox(height: AppSpacing.sm),
                        Text(
                          'The requested API endpoint does not exist.',
                          style: AppTypography.bodyMediumRegular.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: AppSpacing.xl),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            VSButton(
                              label: 'View API Docs',
                              onPressed: () => _showActionDialog(context, 'View API docs clicked'),
                              variant: VSButtonVariant.primary,
                            ),
                            SizedBox(width: AppSpacing.md),
                            VSButton(
                              label: 'Go to Homepage',
                              onPressed: () => _showActionDialog(context, 'Go to homepage clicked'),
                              variant: VSButtonVariant.outlined,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Mobile App 404
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
                    'Mobile App Screen Not Found',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Container(
                    height: 300,
                    width: 200,
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.neutral300),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.smartphone,
                          size: 60,
                          color: AppColors.primaryDefault,
                        ),
                        SizedBox(height: AppSpacing.md),
                        Text(
                          'Oops!',
                          style: AppTypography.h4.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: AppSpacing.sm),
                        Text(
                          'This screen is not available',
                          style: AppTypography.bodySmallRegular.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: AppSpacing.lg),
                        VSButton(
                          label: 'Go Back',
                          onPressed: () => _showActionDialog(context, 'Go back clicked'),
                          size: VSButtonSize.small,
                          width: double.infinity,
                        ),
                        SizedBox(height: AppSpacing.sm),
                        VSButton(
                          label: 'Home',
                          onPressed: () => _showActionDialog(context, 'Home clicked'),
                          size: VSButtonSize.small,
                          variant: VSButtonVariant.outlined,
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Game/App Store 404
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
                    'App Store Page Not Found',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.neutral300),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: AppColors.primaryBg,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.apps,
                            color: AppColors.primaryDefault,
                            size: 40,
                          ),
                        ),
                        SizedBox(height: AppSpacing.md),
                        Text(
                          'App Not Found',
                          style: AppTypography.h3.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: AppSpacing.sm),
                        Text(
                          'The app you\'re looking for is no longer available or doesn\'t exist.',
                          style: AppTypography.bodyMediumRegular.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: AppSpacing.xl),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            VSButton(
                              label: 'Browse Apps',
                              onPressed: () => _showActionDialog(context, 'Browse apps clicked'),
                              variant: VSButtonVariant.primary,
                            ),
                            SizedBox(width: AppSpacing.md),
                            VSButton(
                              label: 'Search',
                              onPressed: () => _showActionDialog(context, 'Search clicked'),
                              variant: VSButtonVariant.outlined,
                            ),
                          ],
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

  Widget _buildPageNotFoundGroup({
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

  void _showStandard404Demo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: 500,
          height: 400,
          child: const VSPageNotFound(),
        ),
      ),
    );
  }

  void _showCustomMessageDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: 500,
          height: 400,
          color: AppColors.neutral100,
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              padding: EdgeInsets.all(AppSpacing.xl),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '🚫',
                    style: TextStyle(fontSize: 80),
                  ),
                  SizedBox(height: AppSpacing.lg),
                  Text(
                    'Custom 404',
                    style: AppTypography.h3.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppSpacing.md),
                  Text(
                    'This is a custom 404 page with a different message and styling.',
                    style: AppTypography.bodyLargeRegular.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppSpacing.xl),
                  VSButton(
                    label: 'Go Back',
                    onPressed: () {},
                    variant: VSButtonVariant.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showWithActionsDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: 500,
          height: 400,
          color: AppColors.neutral100,
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              padding: EdgeInsets.all(AppSpacing.xl),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '404',
                    style: AppTypography.h1.copyWith(
                      fontSize: 120,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDefault,
                      height: 1,
                    ),
                  ),
                  SizedBox(height: AppSpacing.lg),
                  Text(
                    'Page Not Found',
                    style: AppTypography.h3.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppSpacing.md),
                  Text(
                    'The page you are looking for doesn\'t exist.',
                    style: AppTypography.bodyLargeRegular.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppSpacing.xl),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      VSButton(
                        label: 'Go Home',
                        onPressed: () => _showActionDialog(context, 'Go home clicked'),
                        variant: VSButtonVariant.primary,
                      ),
                      SizedBox(width: AppSpacing.md),
                      VSButton(
                        label: 'Search',
                        onPressed: () => _showActionDialog(context, 'Search clicked'),
                        variant: VSButtonVariant.outlined,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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

  void _showPageNotFoundInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'VS Page Not Found Information',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The VS Page Not Found component provides a standardized 404 error page layout with VS Design System styling and consistent messaging.',
              style: AppTypography.bodyMediumRegular,
            ),
            SizedBox(height: AppSpacing.md),
            Text(
              'Key Features:',
              style: AppTypography.bodyMediumSemibold,
            ),
            SizedBox(height: AppSpacing.sm),
            Text(
              '• Large 404 number display\n'
              '• Clear error messaging\n'
              '• Consistent VS Design System styling\n'
              '• Centered layout with proper spacing\n'
              '• Primary color accent for the 404 number\n'
              '• Responsive design for different screen sizes\n'
              '• Customizable background and text colors\n'
              '• Integration with VS Typography system\n'
              '• Proper semantic HTML structure\n'
              '• Accessibility considerations',
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