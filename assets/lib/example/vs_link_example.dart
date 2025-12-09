import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSLinkExample extends StatefulWidget {
  const VSLinkExample({super.key});

  @override
  State<VSLinkExample> createState() => _VSLinkExampleState();
}

class _VSLinkExampleState extends State<VSLinkExample> {
  bool _isLinkEnabled = true;
  int _clickCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Link Examples',
      //   actions: [
      //     VSButton(
      //       label: 'Info',
      //       onPressed: () => _showLinkInfo(context),
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
              title: 'VS Link Variants & Types',
              description: 'Comprehensive demonstration of link configurations and real-world usage patterns',
              child: _buildLinkShowcase(),
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

  Widget _buildLinkShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic Link Examples
        _buildLinkGroup(
          title: 'Basic Link Examples',
          description: 'Standard link implementations with different states',
          children: [
            Row(
              children: [
                VSToggle(
                  value: _isLinkEnabled,
                  onChanged: (value) => setState(() => _isLinkEnabled = value),
                  label: 'Enable Links',
                ),
                SizedBox(width: AppSpacing.md),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
                  decoration: BoxDecoration(
                    color: AppColors.neutral100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Clicks: $_clickCount',
                    style: AppTypography.bodySmallRegular,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.lg,
              runSpacing: AppSpacing.sm,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Basic Link',
                      style: AppTypography.bodySmallSemibold,
                    ),
                    SizedBox(height: AppSpacing.xs),
                    VSLink(
                      label: 'Click me',
                      onTap: _isLinkEnabled ? () => _handleLinkClick('Basic Link') : () {},
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Longer Link Text',
                      style: AppTypography.bodySmallSemibold,
                    ),
                    SizedBox(height: AppSpacing.xs),
                    VSLink(
                      label: 'Learn more about our services',
                      onTap: _isLinkEnabled ? () => _handleLinkClick('Longer Link Text') : () {},
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Disabled Link',
                      style: AppTypography.bodySmallSemibold,
                    ),
                    SizedBox(height: AppSpacing.xs),
                    VSLink(
                      label: 'This link is disabled',
                      onTap: !_isLinkEnabled ? () => _handleLinkClick('Disabled Link') : () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Link in Context
        _buildLinkGroup(
          title: 'Links in Context',
          description: 'Links used within text content and UI elements',
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
                    'Terms and Conditions',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  RichText(
                    text: TextSpan(
                      style: AppTypography.bodyMediumRegular.copyWith(
                        color: AppColors.textPrimary,
                      ),
                      children: [
                        const TextSpan(text: 'By continuing, you agree to our '),
                        WidgetSpan(
                          child: VSLink(
                            label: 'Terms of Service',
                            onTap: _isLinkEnabled ? () => _handleLinkClick('Terms of Service') : () {},
                          ),
                        ),
                        const TextSpan(text: ' and '),
                        WidgetSpan(
                          child: VSLink(
                            label: 'Privacy Policy',
                            onTap: _isLinkEnabled ? () => _handleLinkClick('Privacy Policy') : () {},
                          ),
                        ),
                        const TextSpan(text: '.'),
                      ],
                    ),
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
                    'Help & Support',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Text(
                    'Need help? Visit our support center or contact us directly.',
                    style: AppTypography.bodyMediumRegular,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      VSLink(
                        label: 'Visit Support Center',
                        onTap: _isLinkEnabled ? () => _handleLinkClick('Support Center') : () {},
                      ),
                      Text(' • ', style: AppTypography.bodyMediumRegular),
                      VSLink(
                        label: 'Contact Us',
                        onTap: _isLinkEnabled ? () => _handleLinkClick('Contact Us') : () {},
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
        _buildLinkGroup(
          title: 'Real-world Usage Examples',
          description: 'Common patterns for links in application interfaces',
          children: [
            // Navigation Footer
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
                    'Website Footer Navigation',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.lg,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSLink(
                        label: 'About Us',
                        onTap: _isLinkEnabled ? () => _handleLinkClick('About Us') : () {},
                      ),
                      VSLink(
                        label: 'Careers',
                        onTap: _isLinkEnabled ? () => _handleLinkClick('Careers') : () {},
                      ),
                      VSLink(
                        label: 'Press',
                        onTap: _isLinkEnabled ? () => _handleLinkClick('Press') : () {},
                      ),
                      VSLink(
                        label: 'Blog',
                        onTap: _isLinkEnabled ? () => _handleLinkClick('Blog') : () {},
                      ),
                      VSLink(
                        label: 'Contact',
                        onTap: _isLinkEnabled ? () => _handleLinkClick('Contact') : () {},
                      ),
                      VSLink(
                        label: 'Privacy',
                        onTap: _isLinkEnabled ? () => _handleLinkClick('Privacy') : () {},
                      ),
                      VSLink(
                        label: 'Terms',
                        onTap: _isLinkEnabled ? () => _handleLinkClick('Terms') : () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Breadcrumb Navigation
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
                    'Breadcrumb Navigation',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      VSLink(
                        label: 'Home',
                        onTap: _isLinkEnabled ? () => _handleLinkClick('Home') : () {},
                      ),
                      Text(' / ', style: AppTypography.bodyMediumRegular.copyWith(color: AppColors.textSecondary)),
                      VSLink(
                        label: 'Products',
                        onTap: _isLinkEnabled ? () => _handleLinkClick('Products') : () {},
                      ),
                      Text(' / ', style: AppTypography.bodyMediumRegular.copyWith(color: AppColors.textSecondary)),
                      VSLink(
                        label: 'Electronics',
                        onTap: _isLinkEnabled ? () => _handleLinkClick('Electronics') : () {},
                      ),
                      Text(' / ', style: AppTypography.bodyMediumRegular.copyWith(color: AppColors.textSecondary)),
                      Text(
                        'Smartphone',
                        style: AppTypography.bodyMediumRegular.copyWith(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Action Links
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
                    'Quick Actions',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Icon(Icons.edit, size: 16, color: AppColors.primaryDefault),
                      SizedBox(width: AppSpacing.xs),
                      VSLink(
                        label: 'Edit Profile',
                        onTap: _isLinkEnabled ? () => _handleLinkClick('Edit Profile') : () {},
                      ),
                      SizedBox(width: AppSpacing.md),
                      Icon(Icons.settings, size: 16, color: AppColors.secondaryDefault),
                      SizedBox(width: AppSpacing.xs),
                      VSLink(
                        label: 'Account Settings',
                        onTap: _isLinkEnabled ? () => _handleLinkClick('Account Settings') : () {},
                      ),
                      SizedBox(width: AppSpacing.md),
                      Icon(Icons.logout, size: 16, color: AppColors.dangerDefault),
                      SizedBox(width: AppSpacing.xs),
                      VSLink(
                        label: 'Sign Out',
                        onTap: _isLinkEnabled ? () => _handleLinkClick('Sign Out') : () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Related Content
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
                    'Related Articles',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.article, size: 16, color: AppColors.primaryDefault),
                          SizedBox(width: AppSpacing.xs),
                          Expanded(
                            child: VSLink(
                              label: 'Getting Started with Flutter Development',
                              onTap: _isLinkEnabled ? () => _handleLinkClick('Getting Started with Flutter') : () {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSpacing.xs),
                      Row(
                        children: [
                          Icon(Icons.article, size: 16, color: AppColors.primaryDefault),
                          SizedBox(width: AppSpacing.xs),
                          Expanded(
                            child: VSLink(
                              label: 'Best Practices for UI/UX Design',
                              onTap: _isLinkEnabled ? () => _handleLinkClick('Best Practices for UI/UX') : () {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSpacing.xs),
                      Row(
                        children: [
                          Icon(Icons.article, size: 16, color: AppColors.primaryDefault),
                          SizedBox(width: AppSpacing.xs),
                          Expanded(
                            child: VSLink(
                              label: 'State Management in Flutter Apps',
                              onTap: _isLinkEnabled ? () => _handleLinkClick('State Management in Flutter') : () {},
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

            // Social Links
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
                    'Follow Us',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Icon(Icons.facebook, size: 16, color: AppColors.primaryDefault),
                      SizedBox(width: AppSpacing.xs),
                      VSLink(
                        label: 'Facebook',
                        onTap: _isLinkEnabled ? () => _handleLinkClick('Facebook') : () {},
                      ),
                      SizedBox(width: AppSpacing.md),
                      Icon(Icons.link, size: 16, color: AppColors.secondaryDefault),
                      SizedBox(width: AppSpacing.xs),
                      VSLink(
                        label: 'LinkedIn',
                        onTap: _isLinkEnabled ? () => _handleLinkClick('LinkedIn') : () {},
                      ),
                      SizedBox(width: AppSpacing.md),
                      Icon(Icons.camera_alt, size: 16, color: AppColors.dangerDefault),
                      SizedBox(width: AppSpacing.xs),
                      VSLink(
                        label: 'Instagram',
                        onTap: _isLinkEnabled ? () => _handleLinkClick('Instagram') : () {},
                      ),
                      SizedBox(width: AppSpacing.md),
                      Icon(Icons.play_arrow, size: 16, color: AppColors.warningDefault),
                      SizedBox(width: AppSpacing.xs),
                      VSLink(
                        label: 'YouTube',
                        onTap: _isLinkEnabled ? () => _handleLinkClick('YouTube') : () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Error Page Links
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
                    'Error Page Actions',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Container(
                    padding: EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.dangerBg.withValues(alpha: 0.1),
                      border: Border.all(color: AppColors.dangerDefault.withValues(alpha: 0.3)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.error_outline, color: AppColors.dangerDefault),
                            SizedBox(width: AppSpacing.sm),
                            Text(
                              'Page Not Found',
                              style: AppTypography.bodyMediumSemibold.copyWith(
                                color: AppColors.dangerDefault,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSpacing.sm),
                        Text(
                          'The page you\'re looking for doesn\'t exist.',
                          style: AppTypography.bodySmallRegular,
                        ),
                        SizedBox(height: AppSpacing.sm),
                        Row(
                          children: [
                            VSLink(
                              label: 'Go Home',
                              onTap: _isLinkEnabled ? () => _handleLinkClick('Go Home') : () {},
                            ),
                            Text(' • ', style: AppTypography.bodySmallRegular),
                            VSLink(
                              label: 'Search',
                              onTap: _isLinkEnabled ? () => _handleLinkClick('Search') : () {},
                            ),
                            Text(' • ', style: AppTypography.bodySmallRegular),
                            VSLink(
                              label: 'Contact Support',
                              onTap: _isLinkEnabled ? () => _handleLinkClick('Contact Support') : () {},
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

  Widget _buildLinkGroup({
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

  void _handleLinkClick(String linkName) {
    setState(() => _clickCount++);
    _showActionDialog(context, 'Link clicked: $linkName');
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

  void _showLinkInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'VS Link Information',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The VS Link component provides clickable text elements that follow the VS Design System styling and interaction patterns.',
              style: AppTypography.bodyMediumRegular,
            ),
            SizedBox(height: AppSpacing.md),
            Text(
              'Key Features:',
              style: AppTypography.bodyMediumSemibold,
            ),
            SizedBox(height: AppSpacing.sm),
            Text(
              '• Consistent underline styling\n'
              '• Primary color theming\n'
              '• Hover and tap feedback\n'
              '• Disabled state support\n'
              '• Accessible touch targets\n'
              '• Integration with Flutter\'s gesture system\n'
              '• Customizable tap callbacks\n'
              '• VS Design System typography integration',
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