import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSRadioButtonExample extends StatefulWidget {
  const VSRadioButtonExample({super.key});

  @override
  State<VSRadioButtonExample> createState() => _VSRadioButtonExampleState();
}

class _VSRadioButtonExampleState extends State<VSRadioButtonExample> {
  // Basic radio button selections
  String _selectedOption = 'option1';
  String _selectedSize = 'medium';
  String _selectedColor = 'blue';

  // Form selections
  String _selectedPaymentMethod = 'credit_card';
  String _selectedShippingMethod = 'standard';
  String _selectedNotificationPreference = 'email';

  // Survey selections
  String _selectedSatisfaction = 'very_satisfied';
  String _selectedFrequency = 'weekly';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Radio Button Examples',
      //   actions: [
      //     VSButton(
      //       label: 'Info',
      //       onPressed: () => _showRadioButtonInfo(context),
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
              title: 'VS Radio Button Variants & States',
              description: 'Comprehensive demonstration of radio button configurations and interactive states',
              child: _buildRadioButtonShowcase(),
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

  Widget _buildRadioButtonShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic Radio Buttons
        _buildRadioButtonGroup(
          title: 'Basic Radio Buttons',
          description: 'Standard radio button implementation with different states',
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
                    'Select an option:',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'option1',
                    groupValue: _selectedOption,
                    onChanged: (value) => setState(() => _selectedOption = value!),
                    label: 'Option 1',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'option2',
                    groupValue: _selectedOption,
                    onChanged: (value) => setState(() => _selectedOption = value!),
                    label: 'Option 2',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'option3',
                    groupValue: _selectedOption,
                    onChanged: null,
                    label: 'Option 3 (Disabled)',
                    enabled: false,
                  ),
                  SizedBox(height: AppSpacing.md),
                  Container(
                    padding: EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Selected: $_selectedOption',
                      style: AppTypography.bodySmallRegular,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Radio Buttons with Descriptions
        _buildRadioButtonGroup(
          title: 'Radio Buttons with Descriptions',
          description: 'Radio buttons with additional descriptive text for better user guidance',
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
                    'Choose your preferred size:',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'compact',
                    groupValue: _selectedSize,
                    onChanged: (value) => setState(() => _selectedSize = value!),
                    label: 'Compact',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'medium',
                    groupValue: _selectedSize,
                    onChanged: (value) => setState(() => _selectedSize = value!),
                    label: 'Medium',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'large',
                    groupValue: _selectedSize,
                    onChanged: (value) => setState(() => _selectedSize = value!),
                    label: 'Large',
                  ),
                  SizedBox(height: AppSpacing.md),
                  Container(
                    padding: EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Selected size: $_selectedSize',
                      style: AppTypography.bodySmallRegular,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Radio Buttons in Forms
        _buildRadioButtonGroup(
          title: 'Form Integration Examples',
          description: 'Common form patterns using radio buttons for user input',
          children: [
            // Payment Method Selection
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
                    'Payment Method',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'credit_card',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) => setState(() => _selectedPaymentMethod = value!),
                    label: 'Credit Card',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'paypal',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) => setState(() => _selectedPaymentMethod = value!),
                    label: 'PayPal',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'bank_transfer',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) => setState(() => _selectedPaymentMethod = value!),
                    label: 'Bank Transfer',
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Shipping Method Selection
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
                    'Shipping Method',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'standard',
                    groupValue: _selectedShippingMethod,
                    onChanged: (value) => setState(() => _selectedShippingMethod = value!),
                    label: 'Standard Shipping',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'express',
                    groupValue: _selectedShippingMethod,
                    onChanged: (value) => setState(() => _selectedShippingMethod = value!),
                    label: 'Express Shipping',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'overnight',
                    groupValue: _selectedShippingMethod,
                    onChanged: (value) => setState(() => _selectedShippingMethod = value!),
                    label: 'Overnight Shipping',
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Notification Preferences
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
                    'Notification Preferences',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'email',
                    groupValue: _selectedNotificationPreference,
                    onChanged: (value) => setState(() => _selectedNotificationPreference = value!),
                    label: 'Email Notifications',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'sms',
                    groupValue: _selectedNotificationPreference,
                    onChanged: (value) => setState(() => _selectedNotificationPreference = value!),
                    label: 'SMS Notifications',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'push',
                    groupValue: _selectedNotificationPreference,
                    onChanged: (value) => setState(() => _selectedNotificationPreference = value!),
                    label: 'Push Notifications',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'none',
                    groupValue: _selectedNotificationPreference,
                    onChanged: (value) => setState(() => _selectedNotificationPreference = value!),
                    label: 'No Notifications',
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Survey and Feedback Forms
        _buildRadioButtonGroup(
          title: 'Survey & Feedback Examples',
          description: 'Radio buttons in survey forms and user feedback collection',
          children: [
            // Customer Satisfaction Survey
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
                    'How satisfied are you with our service?',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'very_satisfied',
                    groupValue: _selectedSatisfaction,
                    onChanged: (value) => setState(() => _selectedSatisfaction = value!),
                    label: 'Very Satisfied',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'satisfied',
                    groupValue: _selectedSatisfaction,
                    onChanged: (value) => setState(() => _selectedSatisfaction = value!),
                    label: 'Satisfied',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'neutral',
                    groupValue: _selectedSatisfaction,
                    onChanged: (value) => setState(() => _selectedSatisfaction = value!),
                    label: 'Neutral',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'dissatisfied',
                    groupValue: _selectedSatisfaction,
                    onChanged: (value) => setState(() => _selectedSatisfaction = value!),
                    label: 'Dissatisfied',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'very_dissatisfied',
                    groupValue: _selectedSatisfaction,
                    onChanged: (value) => setState(() => _selectedSatisfaction = value!),
                    label: 'Very Dissatisfied',
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Usage Frequency Survey
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
                    'How often do you use our platform?',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'daily',
                    groupValue: _selectedFrequency,
                    onChanged: (value) => setState(() => _selectedFrequency = value!),
                    label: 'Daily',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'weekly',
                    groupValue: _selectedFrequency,
                    onChanged: (value) => setState(() => _selectedFrequency = value!),
                    label: 'Weekly',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'monthly',
                    groupValue: _selectedFrequency,
                    onChanged: (value) => setState(() => _selectedFrequency = value!),
                    label: 'Monthly',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'rarely',
                    groupValue: _selectedFrequency,
                    onChanged: (value) => setState(() => _selectedFrequency = value!),
                    label: 'Rarely',
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Real-world Application Examples
        _buildRadioButtonGroup(
          title: 'Real-world Usage Examples',
          description: 'Common patterns in actual applications and interfaces',
          children: [
            // Theme Selection
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
                      Icon(Icons.palette, color: AppColors.primaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Theme Selection',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'light',
                    groupValue: _selectedColor,
                    onChanged: (value) => setState(() => _selectedColor = value!),
                    label: 'Light Theme',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'dark',
                    groupValue: _selectedColor,
                    onChanged: (value) => setState(() => _selectedColor = value!),
                    label: 'Dark Theme',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'auto',
                    groupValue: _selectedColor,
                    onChanged: (value) => setState(() => _selectedColor = value!),
                    label: 'Auto (System)',
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Account Type Selection
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
                      Icon(Icons.account_circle, color: AppColors.successDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Account Type',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'personal',
                    groupValue: _selectedOption,
                    onChanged: (value) => setState(() => _selectedOption = value!),
                    label: 'Personal Account',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'professional',
                    groupValue: _selectedOption,
                    onChanged: (value) => setState(() => _selectedOption = value!),
                    label: 'Professional Account',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'enterprise',
                    groupValue: _selectedOption,
                    onChanged: (value) => setState(() => _selectedOption = value!),
                    label: 'Enterprise Account',
                    ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Privacy Settings
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
                      Icon(Icons.security, color: AppColors.warningDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Privacy Settings',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'public',
                    groupValue: _selectedOption,
                    onChanged: (value) => setState(() => _selectedOption = value!),
                    label: 'Public Profile',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'friends',
                    groupValue: _selectedOption,
                    onChanged: (value) => setState(() => _selectedOption = value!),
                    label: 'Friends Only',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'private',
                    groupValue: _selectedOption,
                    onChanged: (value) => setState(() => _selectedOption = value!),
                    label: 'Private Profile',
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Language Selection
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
                      Icon(Icons.language, color: AppColors.secondaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Language Preference',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'english',
                    groupValue: _selectedOption,
                    onChanged: (value) => setState(() => _selectedOption = value!),
                    label: 'English',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'spanish',
                    groupValue: _selectedOption,
                    onChanged: (value) => setState(() => _selectedOption = value!),
                    label: 'Español',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'french',
                    groupValue: _selectedOption,
                    onChanged: (value) => setState(() => _selectedOption = value!),
                    label: 'Français',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'german',
                    groupValue: _selectedOption,
                    onChanged: (value) => setState(() => _selectedOption = value!),
                    label: 'Deutsch',
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Subscription Plan Selection
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
                      Icon(Icons.subscriptions, color: AppColors.primaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Subscription Plan',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'free',
                    groupValue: _selectedOption,
                    onChanged: (value) => setState(() => _selectedOption = value!),
                    label: 'Free Plan',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'pro',
                    groupValue: _selectedOption,
                    onChanged: (value) => setState(() => _selectedOption = value!),
                    label: 'Pro Plan',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSRadioButton<String>(
                    value: 'team',
                    groupValue: _selectedOption,
                    onChanged: (value) => setState(() => _selectedOption = value!),
                    label: 'Team Plan',
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Interactive Demo
        _buildRadioButtonGroup(
          title: 'Interactive Demo',
          description: 'Try different radio button configurations and see live updates',
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
                    'Live Configuration Demo',
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
                            'Selection State',
                            style: AppTypography.bodySmallSemibold,
                          ),
                          SizedBox(height: AppSpacing.xs),
                          Wrap(
                            spacing: AppSpacing.xs,
                            children: ['option1', 'option2', 'option3'].map((option) => VSButton(
                              label: option,
                              onPressed: () => setState(() => _selectedOption = option),
                              size: VSButtonSize.small,
                              variant: _selectedOption == option ? VSButtonVariant.primary : VSButtonVariant.outlined,
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
                        VSRadioButton<String>(
                          value: 'option1',
                          groupValue: _selectedOption,
                          onChanged: (value) => setState(() => _selectedOption = value!),
                          label: 'Option 1',
                        ),
                        SizedBox(height: AppSpacing.sm),
                        VSRadioButton<String>(
                          value: 'option2',
                          groupValue: _selectedOption,
                          onChanged: (value) => setState(() => _selectedOption = value!),
                          label: 'Option 2',
                        ),
                        SizedBox(height: AppSpacing.sm),
                        VSRadioButton<String>(
                          value: 'option3',
                          groupValue: _selectedOption,
                          onChanged: (value) => setState(() => _selectedOption = value!),
                          label: 'Option 3 (Disabled)',
                          enabled: false,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpacing.md),
                  VSButton(
                    label: 'Reset Selection',
                    onPressed: () => setState(() => _selectedOption = 'option1'),
                    size: VSButtonSize.small,
                    variant: VSButtonVariant.outlined,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRadioButtonGroup({
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

  void _showRadioButtonInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'VS Radio Button Information',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The VS Radio Button component provides single-selection controls for forms and settings with VS Design System styling.',
              style: AppTypography.bodyMediumRegular,
            ),
            SizedBox(height: AppSpacing.md),
            Text(
              'Key Features:',
              style: AppTypography.bodyMediumSemibold,
            ),
            SizedBox(height: AppSpacing.sm),
            Text(
              '• Single selection within a group\n'
              '• Optional descriptions for better UX\n'
              '• Disabled state support\n'
              '• VS Design System styling integration\n'
              '• Proper accessibility and keyboard navigation\n'
              '• Consistent spacing and typography\n'
              '• Support for custom labels and descriptions\n'
              '• Form integration ready\n'
              '• Responsive layout design\n'
              '• Theme-aware color schemes',
              style: AppTypography.bodySmallRegular,
            ),
          ],
        ),
        actions: [
          VSDialogAction(
            label: 'Close',
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
