# VS Radio Button Implementation

**Version 1.0.1 - December 14, 2025**

## Overview

The VS Radio Button component provides single-selection controls for forms and settings with VS Design System styling. Radio buttons allow users to select one option from a set of mutually exclusive choices.

## Features

- **Single Selection**: Only one option can be selected within a radio button group
- **Visual Feedback**: Clear visual indication of selected and unselected states
- **Disabled State**: Support for disabled radio buttons
- **Optional Labels**: Text labels for better user experience
- **VS Design System Integration**: Consistent colors, typography, and spacing
- **Accessibility**: Proper keyboard navigation and screen reader support
- **Responsive Design**: Adapts to different screen sizes and layouts
- **Form Integration**: Ready for use in forms and data collection

## Basic Usage

```dart
import 'package:vs_design_system/vs_design_system.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _selectedTheme = 'light';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Choose Theme:', style: AppTypography.bodyMediumSemibold),
        SizedBox(height: AppSpacing.sm),
        VSRadioButton<String>(
          value: 'light',
          groupValue: _selectedTheme,
          onChanged: (value) => setState(() => _selectedTheme = value!),
          label: 'Light Theme',
        ),
        SizedBox(height: AppSpacing.sm),
        VSRadioButton<String>(
          value: 'dark',
          groupValue: _selectedTheme,
          onChanged: (value) => setState(() => _selectedTheme = value!),
          label: 'Dark Theme',
        ),
        SizedBox(height: AppSpacing.sm),
        VSRadioButton<String>(
          value: 'auto',
          groupValue: _selectedTheme,
          onChanged: (value) => setState(() => _selectedTheme = value!),
          label: 'Auto (System)',
        ),
      ],
    );
  }
}
```

## Variants

### Basic Radio Button

```dart
VSRadioButton<String>(
  value: 'option1',
  groupValue: selectedValue,
  onChanged: (value) => setState(() => selectedValue = value!),
  label: 'Option 1',
)
```

### Radio Button without Label

```dart
Row(
  children: [
    VSRadioButton<String>(
      value: 'option1',
      groupValue: selectedValue,
      onChanged: (value) => setState(() => selectedValue = value!),
    ),
    SizedBox(width: AppSpacing.sm),
    Text('Custom label with additional styling'),
  ],
)
```

### Disabled Radio Button

```dart
VSRadioButton<String>(
  value: 'disabled_option',
  groupValue: selectedValue,
  onChanged: null, // or omit this parameter
  enabled: false,
  label: 'Disabled Option',
)
```

## Advanced Examples

### Form Integration with Validation

```dart
class PaymentForm extends StatefulWidget {
  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  String _selectedPaymentMethod = '';
  String? _paymentMethodError;

  void _validatePaymentMethod() {
    if (_selectedPaymentMethod.isEmpty) {
      setState(() => _paymentMethodError = 'Please select a payment method');
    } else {
      setState(() => _paymentMethodError = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment Method', style: AppTypography.bodyMediumSemibold),
        SizedBox(height: AppSpacing.sm),

        VSRadioButton<String>(
          value: 'credit_card',
          groupValue: _selectedPaymentMethod,
          onChanged: (value) {
            setState(() {
              _selectedPaymentMethod = value!;
              _paymentMethodError = null;
            });
          },
          label: 'Credit Card',
        ),
        SizedBox(height: AppSpacing.sm),

        VSRadioButton<String>(
          value: 'paypal',
          groupValue: _selectedPaymentMethod,
          onChanged: (value) {
            setState(() {
              _selectedPaymentMethod = value!;
              _paymentMethodError = null;
            });
          },
          label: 'PayPal',
        ),
        SizedBox(height: AppSpacing.sm),

        VSRadioButton<String>(
          value: 'bank_transfer',
          groupValue: _selectedPaymentMethod,
          onChanged: (value) {
            setState(() {
              _selectedPaymentMethod = value!;
              _paymentMethodError = null;
            });
          },
          label: 'Bank Transfer',
        ),

        if (_paymentMethodError != null) ...[
          SizedBox(height: AppSpacing.sm),
          Text(
            _paymentMethodError!,
            style: AppTypography.bodySmallRegular.copyWith(
              color: AppColors.dangerDefault,
            ),
          ),
        ],
      ],
    );
  }
}
```

### Survey Form with Radio Buttons

```dart
class CustomerSurvey extends StatefulWidget {
  @override
  State<CustomerSurvey> createState() => _CustomerSurveyState();
}

class _CustomerSurveyState extends State<CustomerSurvey> {
  String _satisfaction = '';
  String _usageFrequency = '';
  String _recommendation = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Customer Satisfaction Survey', style: AppTypography.h4),
          SizedBox(height: AppSpacing.lg),

          // Satisfaction Question
          Text('How satisfied are you with our service?', style: AppTypography.bodyMediumSemibold),
          SizedBox(height: AppSpacing.sm),
          ...['very_satisfied', 'satisfied', 'neutral', 'dissatisfied', 'very_dissatisfied']
              .asMap()
              .entries
              .map((entry) => Padding(
                padding: EdgeInsets.only(bottom: AppSpacing.sm),
                child: VSRadioButton<String>(
                  value: entry.value,
                  groupValue: _satisfaction,
                  onChanged: (value) => setState(() => _satisfaction = value!),
                  label: _getSatisfactionLabel(entry.value),
                ),
              )),

          SizedBox(height: AppSpacing.lg),

          // Usage Frequency
          Text('How often do you use our platform?', style: AppTypography.bodyMediumSemibold),
          SizedBox(height: AppSpacing.sm),
          ...['daily', 'weekly', 'monthly', 'rarely']
              .map((frequency) => Padding(
                padding: EdgeInsets.only(bottom: AppSpacing.sm),
                child: VSRadioButton<String>(
                  value: frequency,
                  groupValue: _usageFrequency,
                  onChanged: (value) => setState(() => _usageFrequency = value!),
                  label: _getFrequencyLabel(frequency),
                ),
              )),

          SizedBox(height: AppSpacing.lg),

          // Recommendation
          Text('Would you recommend our service?', style: AppTypography.bodyMediumSemibold),
          SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              VSRadioButton<String>(
                value: 'yes',
                groupValue: _recommendation,
                onChanged: (value) => setState(() => _recommendation = value!),
                label: 'Yes',
              ),
              SizedBox(width: AppSpacing.lg),
              VSRadioButton<String>(
                value: 'no',
                groupValue: _recommendation,
                onChanged: (value) => setState(() => _recommendation = value!),
                label: 'No',
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getSatisfactionLabel(String value) {
    switch (value) {
      case 'very_satisfied': return 'Very Satisfied';
      case 'satisfied': return 'Satisfied';
      case 'neutral': return 'Neutral';
      case 'dissatisfied': return 'Dissatisfied';
      case 'very_dissatisfied': return 'Very Dissatisfied';
      default: return value;
    }
  }

  String _getFrequencyLabel(String value) {
    switch (value) {
      case 'daily': return 'Daily';
      case 'weekly': return 'Weekly';
      case 'monthly': return 'Monthly';
      case 'rarely': return 'Rarely';
      default: return value;
    }
  }
}
```

### Settings Page with Multiple Radio Groups

```dart
class AppSettings extends StatefulWidget {
  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  String _theme = 'light';
  String _language = 'english';
  String _notificationPreference = 'push';

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(AppSpacing.lg),
      children: [
        // Theme Settings
        _buildSettingsSection(
          title: 'Appearance',
          icon: Icons.palette,
          child: Column(
            children: [
              _buildSettingItem(
                label: 'Theme',
                child: Column(
                  children: [
                    VSRadioButton<String>(
                      value: 'light',
                      groupValue: _theme,
                      onChanged: (value) => setState(() => _theme = value!),
                      label: 'Light',
                    ),
                    SizedBox(height: AppSpacing.sm),
                    VSRadioButton<String>(
                      value: 'dark',
                      groupValue: _theme,
                      onChanged: (value) => setState(() => _theme = value!),
                      label: 'Dark',
                    ),
                    SizedBox(height: AppSpacing.sm),
                    VSRadioButton<String>(
                      value: 'auto',
                      groupValue: _theme,
                      onChanged: (value) => setState(() => _theme = value!),
                      label: 'Auto (System)',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: AppSpacing.lg),

        // Language Settings
        _buildSettingsSection(
          title: 'Language & Region',
          icon: Icons.language,
          child: _buildSettingItem(
            label: 'Language',
            child: Column(
              children: [
                VSRadioButton<String>(
                  value: 'english',
                  groupValue: _language,
                  onChanged: (value) => setState(() => _language = value!),
                  label: 'English',
                ),
                SizedBox(height: AppSpacing.sm),
                VSRadioButton<String>(
                  value: 'spanish',
                  groupValue: _language,
                  onChanged: (value) => setState(() => _language = value!),
                  label: 'Español',
                ),
                SizedBox(height: AppSpacing.sm),
                VSRadioButton<String>(
                  value: 'french',
                  groupValue: _language,
                  onChanged: (value) => setState(() => _language = value!),
                  label: 'Français',
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: AppSpacing.lg),

        // Notification Settings
        _buildSettingsSection(
          title: 'Notifications',
          icon: Icons.notifications,
          child: _buildSettingItem(
            label: 'Default Notification Method',
            child: Column(
              children: [
                VSRadioButton<String>(
                  value: 'push',
                  groupValue: _notificationPreference,
                  onChanged: (value) => setState(() => _notificationPreference = value!),
                  label: 'Push Notifications',
                ),
                SizedBox(height: AppSpacing.sm),
                VSRadioButton<String>(
                  value: 'email',
                  groupValue: _notificationPreference,
                  onChanged: (value) => setState(() => _notificationPreference = value!),
                  label: 'Email Notifications',
                ),
                SizedBox(height: AppSpacing.sm),
                VSRadioButton<String>(
                  value: 'sms',
                  groupValue: _notificationPreference,
                  onChanged: (value) => setState(() => _notificationPreference = value!),
                  label: 'SMS Notifications',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsSection({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
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
              Icon(icon, color: AppColors.primaryDefault),
              SizedBox(width: AppSpacing.sm),
              Text(title, style: AppTypography.bodyLargeSemibold),
            ],
          ),
          SizedBox(height: AppSpacing.md),
          child,
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required String label,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.bodyMediumSemibold),
        SizedBox(height: AppSpacing.sm),
        child,
      ],
    );
  }
}
```

## Real-World Usage Patterns

### Payment Method Selection

```dart
class CheckoutPage extends StatefulWidget {
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String _selectedPaymentMethod = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VSAppBar(title: 'Checkout'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order summary (simplified)
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order Summary', style: AppTypography.bodyLargeSemibold),
                  SizedBox(height: AppSpacing.sm),
                  Text('Total: \$129.99', style: AppTypography.bodyMediumRegular),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.lg),

            // Payment method selection
            Text('Select Payment Method', style: AppTypography.h4),
            SizedBox(height: AppSpacing.md),

            // Credit Card Option
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _selectedPaymentMethod == 'credit_card'
                      ? AppColors.primaryDefault
                      : AppColors.neutral300,
                  width: _selectedPaymentMethod == 'credit_card' ? 2 : 1,
                ),
              ),
              child: Row(
                children: [
                  VSRadioButton<String>(
                    value: 'credit_card',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) => setState(() => _selectedPaymentMethod = value!),
                  ),
                  SizedBox(width: AppSpacing.sm),
                  Icon(Icons.credit_card, color: AppColors.primaryDefault),
                  SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Credit Card', style: AppTypography.bodyMediumSemibold),
                        Text('Visa, Mastercard, American Express', style: AppTypography.bodySmallRegular),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.sm),

            // PayPal Option
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _selectedPaymentMethod == 'paypal'
                      ? AppColors.primaryDefault
                      : AppColors.neutral300,
                  width: _selectedPaymentMethod == 'paypal' ? 2 : 1,
                ),
              ),
              child: Row(
                children: [
                  VSRadioButton<String>(
                    value: 'paypal',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) => setState(() => _selectedPaymentMethod = value!),
                  ),
                  SizedBox(width: AppSpacing.sm),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.primaryDefault,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text('P', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('PayPal', style: AppTypography.bodyMediumSemibold),
                        Text('Fast and secure payment', style: AppTypography.bodySmallRegular),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.sm),

            // Bank Transfer Option
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _selectedPaymentMethod == 'bank_transfer'
                      ? AppColors.primaryDefault
                      : AppColors.neutral300,
                  width: _selectedPaymentMethod == 'bank_transfer' ? 2 : 1,
                ),
              ),
              child: Row(
                children: [
                  VSRadioButton<String>(
                    value: 'bank_transfer',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) => setState(() => _selectedPaymentMethod = value!),
                  ),
                  SizedBox(width: AppSpacing.sm),
                  Icon(Icons.account_balance, color: AppColors.successDefault),
                  SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Bank Transfer', style: AppTypography.bodyMediumSemibold),
                        Text('Direct bank transfer (2-3 business days)', style: AppTypography.bodySmallRegular),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.xl),

            VSButton(
              label: 'Complete Purchase',
              onPressed: _selectedPaymentMethod.isNotEmpty ? _processPayment : null,
              variant: VSButtonVariant.primary,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  void _processPayment() {
    // Handle payment processing
    print('Processing payment with method: $_selectedPaymentMethod');
  }
}
```

### Account Type Selection

```dart
class AccountSetupPage extends StatefulWidget {
  @override
  State<AccountSetupPage> createState() => _AccountSetupPageState();
}

class _AccountSetupPageState extends State<AccountSetupPage> {
  String _selectedAccountType = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 600),
          padding: EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose Your Account Type',
                style: AppTypography.h2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.md),
              Text(
                'Select the account type that best fits your needs. You can change this later in settings.',
                style: AppTypography.bodyLargeRegular.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.xl),

              // Personal Account
              Container(
                padding: EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.neutral100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _selectedAccountType == 'personal'
                        ? AppColors.primaryDefault
                        : AppColors.neutral300,
                    width: _selectedAccountType == 'personal' ? 2 : 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        VSRadioButton<String>(
                          value: 'personal',
                          groupValue: _selectedAccountType,
                          onChanged: (value) => setState(() => _selectedAccountType = value!),
                        ),
                        SizedBox(width: AppSpacing.sm),
                        Text('Personal Account', style: AppTypography.h4),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
                          decoration: BoxDecoration(
                            color: AppColors.successBg,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Free',
                            style: AppTypography.bodySmallSemibold.copyWith(
                              color: AppColors.successDefault,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.md),
                    Text(
                      'Perfect for individuals managing personal projects and tasks.',
                      style: AppTypography.bodyMediumRegular,
                    ),
                    SizedBox(height: AppSpacing.sm),
                    Wrap(
                      spacing: AppSpacing.sm,
                      children: [
                        _buildFeatureChip('Up to 10 projects'),
                        _buildFeatureChip('Basic analytics'),
                        _buildFeatureChip('Email support'),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSpacing.lg),

              // Professional Account
              Container(
                padding: EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.neutral100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _selectedAccountType == 'professional'
                        ? AppColors.primaryDefault
                        : AppColors.neutral300,
                    width: _selectedAccountType == 'professional' ? 2 : 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        VSRadioButton<String>(
                          value: 'professional',
                          groupValue: _selectedAccountType,
                          onChanged: (value) => setState(() => _selectedAccountType = value!),
                        ),
                        SizedBox(width: AppSpacing.sm),
                        Text('Professional Account', style: AppTypography.h4),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBg,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '\$9.99/month',
                            style: AppTypography.bodySmallSemibold.copyWith(
                              color: AppColors.primaryDefault,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.md),
                    Text(
                      'Ideal for freelancers and small teams needing advanced features.',
                      style: AppTypography.bodyMediumRegular,
                    ),
                    SizedBox(height: AppSpacing.sm),
                    Wrap(
                      spacing: AppSpacing.sm,
                      children: [
                        _buildFeatureChip('Unlimited projects'),
                        _buildFeatureChip('Advanced analytics'),
                        _buildFeatureChip('Priority support'),
                        _buildFeatureChip('Team collaboration'),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSpacing.lg),

              // Enterprise Account
              Container(
                padding: EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.neutral100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _selectedAccountType == 'enterprise'
                        ? AppColors.primaryDefault
                        : AppColors.neutral300,
                    width: _selectedAccountType == 'enterprise' ? 2 : 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        VSRadioButton<String>(
                          value: 'enterprise',
                          groupValue: _selectedAccountType,
                          onChanged: (value) => setState(() => _selectedAccountType = value!),
                        ),
                        SizedBox(width: AppSpacing.sm),
                        Text('Enterprise Account', style: AppTypography.h4),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
                          decoration: BoxDecoration(
                            color: AppColors.warningBg,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Contact Sales',
                            style: AppTypography.bodySmallSemibold.copyWith(
                              color: AppColors.warningDefault,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.md),
                    Text(
                      'Complete solution for large organizations with custom requirements.',
                      style: AppTypography.bodyMediumRegular,
                    ),
                    SizedBox(height: AppSpacing.sm),
                    Wrap(
                      spacing: AppSpacing.sm,
                      children: [
                        _buildFeatureChip('Everything included'),
                        _buildFeatureChip('Custom integrations'),
                        _buildFeatureChip('Dedicated support'),
                        _buildFeatureChip('SLA guarantee'),
                        _buildFeatureChip('Advanced security'),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSpacing.xl),

              VSButton(
                label: 'Continue',
                onPressed: _selectedAccountType.isNotEmpty ? _continueSetup : null,
                variant: VSButtonVariant.primary,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureChip(String feature) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
      decoration: BoxDecoration(
        color: AppColors.neutral200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        feature,
        style: AppTypography.bodySmallRegular,
      ),
    );
  }

  void _continueSetup() {
    // Navigate to next setup step
    print('Continuing with account type: $_selectedAccountType');
  }
}
```

### Privacy Settings

```dart
class PrivacySettingsPage extends StatefulWidget {
  @override
  State<PrivacySettingsPage> createState() => _PrivacySettingsPageState();
}

class _PrivacySettingsPageState extends State<PrivacySettingsPage> {
  String _profileVisibility = 'public';
  String _dataSharing = 'minimal';
  String _activityStatus = 'show';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VSAppBar(title: 'Privacy Settings'),
      body: ListView(
        padding: EdgeInsets.all(AppSpacing.lg),
        children: [
          // Profile Visibility
          _buildSettingGroup(
            title: 'Profile Visibility',
            description: 'Control who can see your profile information',
            child: Column(
              children: [
                VSRadioButton<String>(
                  value: 'public',
                  groupValue: _profileVisibility,
                  onChanged: (value) => setState(() => _profileVisibility = value!),
                  label: 'Public - Anyone can see your profile',
                ),
                SizedBox(height: AppSpacing.sm),
                VSRadioButton<String>(
                  value: 'friends',
                  groupValue: _profileVisibility,
                  onChanged: (value) => setState(() => _profileVisibility = value!),
                  label: 'Friends Only - Only approved connections',
                ),
                SizedBox(height: AppSpacing.sm),
                VSRadioButton<String>(
                  value: 'private',
                  groupValue: _profileVisibility,
                  onChanged: (value) => setState(() => _profileVisibility = value!),
                  label: 'Private - Only you can see your profile',
                ),
              ],
            ),
          ),

          SizedBox(height: AppSpacing.lg),

          // Data Sharing
          _buildSettingGroup(
            title: 'Data Sharing',
            description: 'Choose how your data is used for personalization',
            child: Column(
              children: [
                VSRadioButton<String>(
                  value: 'minimal',
                  groupValue: _dataSharing,
                  onChanged: (value) => setState(() => _dataSharing = value!),
                  label: 'Minimal - Only essential data for app functionality',
                ),
                SizedBox(height: AppSpacing.sm),
                VSRadioButton<String>(
                  value: 'balanced',
                  groupValue: _dataSharing,
                  onChanged: (value) => setState(() => _dataSharing = value!),
                  label: 'Balanced - Basic personalization features',
                ),
                SizedBox(height: AppSpacing.sm),
                VSRadioButton<String>(
                  value: 'full',
                  groupValue: _dataSharing,
                  onChanged: (value) => setState(() => _dataSharing = value!),
                  label: 'Full - Enhanced personalization and recommendations',
                ),
              ],
            ),
          ),

          SizedBox(height: AppSpacing.lg),

          // Activity Status
          _buildSettingGroup(
            title: 'Activity Status',
            description: 'Show when you\'re active or last seen',
            child: Column(
              children: [
                VSRadioButton<String>(
                  value: 'show',
                  groupValue: _activityStatus,
                  onChanged: (value) => setState(() => _activityStatus = value!),
                  label: 'Show activity status to everyone',
                ),
                SizedBox(height: AppSpacing.sm),
                VSRadioButton<String>(
                  value: 'friends_only',
                  groupValue: _activityStatus,
                  onChanged: (value) => setState(() => _activityStatus = value!),
                  label: 'Show activity status to friends only',
                ),
                SizedBox(height: AppSpacing.sm),
                VSRadioButton<String>(
                  value: 'hide',
                  groupValue: _activityStatus,
                  onChanged: (value) => setState(() => _activityStatus = value!),
                  label: 'Hide activity status',
                ),
              ],
            ),
          ),

          SizedBox(height: AppSpacing.xl),

          VSButton(
            label: 'Save Settings',
            onPressed: _saveSettings,
            variant: VSButtonVariant.primary,
            width: double.infinity,
          ),
        ],
      ),
    );
  }

  Widget _buildSettingGroup({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.neutral100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
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
          child,
        ],
      ),
    );
  }

  void _saveSettings() {
    // Save privacy settings
    print('Saving privacy settings...');
  }
}
```

### Language Selection

```dart
class LanguageSettingsPage extends StatefulWidget {
  @override
  State<LanguageSettingsPage> createState() => _LanguageSettingsPageState();
}

class _LanguageSettingsPageState extends State<LanguageSettingsPage> {
  String _selectedLanguage = 'english';

  final Map<String, String> _languages = {
    'english': 'English',
    'spanish': 'Español',
    'french': 'Français',
    'german': 'Deutsch',
    'italian': 'Italiano',
    'portuguese': 'Português',
    'chinese': '中文',
    'japanese': '日本語',
    'korean': '한국어',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VSAppBar(title: 'Language'),
      body: ListView(
        padding: EdgeInsets.all(AppSpacing.lg),
        children: [
          Text(
            'Select your preferred language',
            style: AppTypography.bodyLargeRegular,
          ),
          SizedBox(height: AppSpacing.lg),

          ..._languages.entries.map((entry) => Padding(
            padding: EdgeInsets.only(bottom: AppSpacing.sm),
            child: Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _selectedLanguage == entry.key
                      ? AppColors.primaryDefault
                      : AppColors.neutral300,
                  width: _selectedLanguage == entry.key ? 2 : 1,
                ),
              ),
              child: Row(
                children: [
                  VSRadioButton<String>(
                    value: entry.key,
                    groupValue: _selectedLanguage,
                    onChanged: (value) => setState(() => _selectedLanguage = value!),
                  ),
                  SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.value,
                          style: AppTypography.bodyMediumSemibold,
                        ),
                        Text(
                          _getNativeLanguageName(entry.key),
                          style: AppTypography.bodySmallRegular.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_selectedLanguage == entry.key)
                    Icon(
                      Icons.check_circle,
                      color: AppColors.primaryDefault,
                      size: 20,
                    ),
                ],
              ),
            ),
          )),

          SizedBox(height: AppSpacing.xl),

          VSButton(
            label: 'Apply Language',
            onPressed: _applyLanguage,
            variant: VSButtonVariant.primary,
            width: double.infinity,
          ),
        ],
      ),
    );
  }

  String _getNativeLanguageName(String languageCode) {
    switch (languageCode) {
      case 'english': return 'English';
      case 'spanish': return 'Español';
      case 'french': return 'Français';
      case 'german': return 'Deutsch';
      case 'italian': return 'Italiano';
      case 'portuguese': return 'Português';
      case 'chinese': return '中文 (Simplified)';
      case 'japanese': return '日本語';
      case 'korean': return '한국어';
      default: return languageCode;
    }
  }

  void _applyLanguage() {
    // Apply language change
    print('Applying language: $_selectedLanguage');
  }
}
```

## Configuration Options

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `groupValue` | `T` | Required | The currently selected value in the radio button group |
| `value` | `T` | Required | The value this radio button represents |
| `label` | `String?` | `null` | Optional text label displayed next to the radio button |
| `onChanged` | `ValueChanged<T?>?` | `null` | Callback invoked when the radio button is selected |
| `enabled` | `bool` | `true` | Whether the radio button is interactive |
| `key` | `Key?` | `null` | Widget key for identification |

## Best Practices

### When to Use Radio Buttons

- **Single Selection**: When users must choose exactly one option from a set
- **Mutually Exclusive**: When options are mutually exclusive
- **Limited Options**: When there are 2-7 options (use dropdown for more)
- **Clear Labels**: When option labels are short and clear
- **Form Inputs**: For required single-choice form fields

### Design Guidelines

- **Group Related Options**: Keep radio buttons in logical groups
- **Clear Labels**: Use descriptive, unambiguous labels
- **Logical Order**: Arrange options in logical or priority order
- **Default Selection**: Pre-select the most common or recommended option
- **Consistent Spacing**: Maintain consistent spacing between radio buttons

### Implementation Tips

- **State Management**: Use a single state variable for the entire group
- **Validation**: Validate that a selection is made for required fields
- **Dynamic Options**: Handle dynamic option lists gracefully
- **Accessibility**: Ensure proper labeling for screen readers
- **Keyboard Navigation**: Support Tab navigation between options

## Accessibility

- **Semantic Grouping**: Use proper grouping for screen readers
- **Keyboard Support**: Full keyboard navigation with Tab and arrow keys
- **Screen Reader**: Proper labels and state announcements
- **Focus Management**: Clear focus indicators and logical tab order
- **Color Contrast**: Sufficient contrast for all interactive states

## Integration with VS Design System

The VS Radio Button component integrates seamlessly with other VS Design System components:

- **VSFormField**: For labeled form inputs with validation
- **VSDropdown**: Alternative for many options or complex selections
- **VSButton**: For action buttons alongside radio button groups
- **VSDialog**: For confirmation dialogs with radio button choices
- **AppColors**: Consistent color scheme for selected/unselected states
- **AppTypography**: Standardized text styling for labels
- **AppSpacing**: Consistent spacing and layout

## Migration Guide

### From Flutter Radio

```dart
// Before: Flutter Radio
Radio<String>(
  value: 'option1',
  groupValue: selectedValue,
  onChanged: (value) => setState(() => selectedValue = value),
)

// After: VS Design System
VSRadioButton<String>(
  value: 'option1',
  groupValue: selectedValue,
  onChanged: (value) => setState(() => selectedValue = value!),
  label: 'Option 1',
)
```

### From Custom Radio Widgets

```dart
// Before: Custom radio implementation
class CustomRadioButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.blue),
        ),
        child: isSelected ? Center(
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
          ),
        ) : null,
      ),
    );
  }
}

// After: VS Design System
VSRadioButton<String>(
  value: value,
  groupValue: groupValue,
  onChanged: onChanged,
  label: label,
)
```

### Form Integration Migration

```dart
// Before: Manual form handling
class OldForm extends StatefulWidget {
  @override
  State<OldForm> createState() => _OldFormState();
}

class _OldFormState extends State<OldForm> {
  String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<String>(
          title: Text('Option 1'),
          value: 'option1',
          groupValue: selectedValue,
          onChanged: (value) => setState(() => selectedValue = value!),
        ),
        RadioListTile<String>(
          title: Text('Option 2'),
          value: 'option2',
          groupValue: selectedValue,
          onChanged: (value) => setState(() => selectedValue = value!),
        ),
      ],
    );
  }
}

// After: VS Design System
class NewForm extends StatefulWidget {
  @override
  State<NewForm> createState() => _NewFormState();
}

class _NewFormState extends State<NewForm> {
  String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSRadioButton<String>(
          value: 'option1',
          groupValue: selectedValue,
          onChanged: (value) => setState(() => selectedValue = value!),
          label: 'Option 1',
        ),
        SizedBox(height: AppSpacing.sm),
        VSRadioButton<String>(
          value: 'option2',
          groupValue: selectedValue,
          onChanged: (value) => setState(() => selectedValue = value!),
          label: 'Option 2',
        ),
      ],
    );
  }
}
```</content>
<parameter name="filePath">c:\vs_design_system\lib\markdown2\VS_RADIO_BUTTON_IMPLEMENTATION.md