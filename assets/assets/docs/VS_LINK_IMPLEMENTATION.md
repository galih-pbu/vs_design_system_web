# VS Link Implementation

## Overview

The VS Link component provides clickable text elements that follow the VS Design System styling and interaction patterns. It offers consistent underline styling, primary color theming, and proper accessibility support for navigation and actions.

## Features

- **Consistent Styling**: Underlined text with primary color theming
- **Interactive Feedback**: Hover and tap state changes
- **Accessibility**: Proper touch targets and screen reader support
- **Disabled State**: Visual indication for disabled links
- **VS Design System**: Typography and color integration
- **Gesture Support**: Flutter's gesture system integration
- **Custom Callbacks**: Flexible tap handling

## Basic Usage

### Simple Link

```dart
VSLink(
  label: 'Click me',
  onTap: () {
    print('Link clicked');
  },
)
```

### Link with Longer Text

```dart
VSLink(
  label: 'Learn more about our services',
  onTap: () {
    // Navigate to services page
    Navigator.pushNamed(context, '/services');
  },
)
```

### Disabled Link

```dart
VSLink(
  label: 'This link is disabled',
  onTap: () {
    // Empty callback for disabled state
  },
)
```

## Variants

### Link States

#### Enabled Link

```dart
VSLink(
  label: 'Enabled Link',
  onTap: () {
    // Handle navigation or action
    print('Link activated');
  },
)
```

#### Disabled Link

```dart
VSLink(
  label: 'Disabled Link',
  onTap: () {}, // Empty callback indicates disabled state
)
```

### Contextual Usage

#### Inline Links in Text

```dart
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
          onTap: () {
            // Open terms of service
            print('Terms opened');
          },
        ),
      ),
      const TextSpan(text: ' and '),
      WidgetSpan(
        child: VSLink(
          label: 'Privacy Policy',
          onTap: () {
            // Open privacy policy
            print('Privacy policy opened');
          },
        ),
      ),
      const TextSpan(text: '.'),
    ],
  ),
)
```

#### Link with Icon

```dart
Row(
  children: [
    Icon(Icons.edit, size: 16, color: AppColors.primaryDefault),
    SizedBox(width: AppSpacing.xs),
    VSLink(
      label: 'Edit Profile',
      onTap: () {
        // Open edit profile
        print('Edit profile opened');
      },
    ),
  ],
)
```

## Advanced Examples

### Terms and Conditions

```dart
class TermsAndConditions extends StatelessWidget {
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
                    onTap: () {
                      // Navigate to terms page
                      print('Terms of Service opened');
                    },
                  ),
                ),
                const TextSpan(text: ' and '),
                WidgetSpan(
                  child: VSLink(
                    label: 'Privacy Policy',
                    onTap: () {
                      // Navigate to privacy page
                      print('Privacy Policy opened');
                    },
                  ),
                ),
                const TextSpan(text: '.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

### Help and Support

```dart
class HelpAndSupport extends StatelessWidget {
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
                onTap: () {
                  // Open support center
                  print('Support center opened');
                },
              ),
              Text(' • ', style: AppTypography.bodyMediumRegular),
              VSLink(
                label: 'Contact Us',
                onTap: () {
                  // Open contact form
                  print('Contact form opened');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

### Website Footer Navigation

```dart
class FooterNavigation extends StatelessWidget {
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
                onTap: () => print('About Us clicked'),
              ),
              VSLink(
                label: 'Careers',
                onTap: () => print('Careers clicked'),
              ),
              VSLink(
                label: 'Press',
                onTap: () => print('Press clicked'),
              ),
              VSLink(
                label: 'Blog',
                onTap: () => print('Blog clicked'),
              ),
              VSLink(
                label: 'Contact',
                onTap: () => print('Contact clicked'),
              ),
              VSLink(
                label: 'Privacy',
                onTap: () => print('Privacy clicked'),
              ),
              VSLink(
                label: 'Terms',
                onTap: () => print('Terms clicked'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

### Breadcrumb Navigation

```dart
class BreadcrumbNavigation extends StatelessWidget {
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
            'Breadcrumb Navigation',
            style: AppTypography.bodyMediumSemibold,
          ),
          SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              VSLink(
                label: 'Home',
                onTap: () => print('Home clicked'),
              ),
              Text(' / ', style: AppTypography.bodyMediumRegular.copyWith(color: AppColors.textSecondary)),
              VSLink(
                label: 'Products',
                onTap: () => print('Products clicked'),
              ),
              Text(' / ', style: AppTypography.bodyMediumRegular.copyWith(color: AppColors.textSecondary)),
              VSLink(
                label: 'Electronics',
                onTap: () => print('Electronics clicked'),
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
    );
  }
}
```

### Quick Actions

```dart
class QuickActions extends StatelessWidget {
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
                onTap: () => print('Edit profile clicked'),
              ),
              SizedBox(width: AppSpacing.md),
              Icon(Icons.settings, size: 16, color: AppColors.secondaryDefault),
              SizedBox(width: AppSpacing.xs),
              VSLink(
                label: 'Account Settings',
                onTap: () => print('Account settings clicked'),
              ),
              SizedBox(width: AppSpacing.md),
              Icon(Icons.logout, size: 16, color: AppColors.dangerDefault),
              SizedBox(width: AppSpacing.xs),
              VSLink(
                label: 'Sign Out',
                onTap: () => print('Sign out clicked'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

### Related Content

```dart
class RelatedArticles extends StatelessWidget {
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
                      onTap: () => print('Flutter article clicked'),
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
                      onTap: () => print('UI/UX article clicked'),
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
                      onTap: () => print('State management article clicked'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

### Social Media Links

```dart
class SocialLinks extends StatelessWidget {
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
                onTap: () => print('Facebook clicked'),
              ),
              SizedBox(width: AppSpacing.md),
              Icon(Icons.link, size: 16, color: AppColors.secondaryDefault),
              SizedBox(width: AppSpacing.xs),
              VSLink(
                label: 'LinkedIn',
                onTap: () => print('LinkedIn clicked'),
              ),
              SizedBox(width: AppSpacing.md),
              Icon(Icons.camera_alt, size: 16, color: AppColors.dangerDefault),
              SizedBox(width: AppSpacing.xs),
              VSLink(
                label: 'Instagram',
                onTap: () => print('Instagram clicked'),
              ),
              SizedBox(width: AppSpacing.md),
              Icon(Icons.play_arrow, size: 16, color: AppColors.warningDefault),
              SizedBox(width: AppSpacing.xs),
              VSLink(
                label: 'YouTube',
                onTap: () => print('YouTube clicked'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

### Error Page Actions

```dart
class ErrorPageActions extends StatelessWidget {
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
                      onTap: () => print('Go home clicked'),
                    ),
                    Text(' • ', style: AppTypography.bodySmallRegular),
                    VSLink(
                      label: 'Search',
                      onTap: () => print('Search clicked'),
                    ),
                    Text(' • ', style: AppTypography.bodySmallRegular),
                    VSLink(
                      label: 'Contact Support',
                      onTap: () => print('Contact support clicked'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

### Interactive Link with State

```dart
class InteractiveLinkExample extends StatefulWidget {
  @override
  _InteractiveLinkExampleState createState() => _InteractiveLinkExampleState();
}

class _InteractiveLinkExampleState extends State<InteractiveLinkExample> {
  bool _isEnabled = true;
  int _clickCount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            VSToggle(
              value: _isEnabled,
              onChanged: (value) => setState(() => _isEnabled = value),
              label: 'Enable Link',
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
        VSLink(
          label: _isEnabled ? 'Click me to test' : 'Link is disabled',
          onTap: _isEnabled ? () => setState(() => _clickCount++) : () {},
        ),
      ],
    );
  }
}
```

## Configuration Options

### VSLink Properties

| Property | Type | Description | Default |
|----------|------|-------------|---------|
| `label` | `String` | The text displayed for the link | Required |
| `onTap` | `VoidCallback` | Callback function when link is tapped | Required |

## Best Practices

1. **Clear Labeling**: Use descriptive, actionable link text that clearly indicates the destination or action
2. **Consistent Styling**: Maintain consistent link appearance throughout the application
3. **Proper Context**: Ensure links are used in appropriate contexts (navigation, actions, references)
4. **Accessibility**: Provide sufficient touch targets and consider screen reader users
5. **State Management**: Clearly indicate disabled states and provide appropriate feedback
6. **Semantic Usage**: Use links for navigation and actions, not for static text styling
7. **Visual Hierarchy**: Consider link prominence in relation to surrounding content

## Accessibility

- Proper touch target sizes for mobile interaction
- Screen reader support with semantic link announcements
- Keyboard navigation support
- Focus indicators for keyboard users
- High contrast support for visual accessibility
- Reduced motion preferences respected