import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSCheckboxExample extends StatefulWidget {
  const VSCheckboxExample({super.key});

  @override
  State<VSCheckboxExample> createState() => _VSCheckboxExampleState();
}

class _VSCheckboxExampleState extends State<VSCheckboxExample> {
  // Basic checkbox states
  bool _basicChecked = true;
  bool _basicUnchecked = false;

  // Size demonstrations
  bool _smallChecked = true;
  bool _mediumChecked = true;
  bool _largeChecked = true;

  // Form-like states
  bool _agreeTerms = false;
  bool _subscribeNewsletter = true;
  bool _receiveNotifications = false;

  // Multi-select states
  bool _option1 = false;
  bool _option2 = true;
  bool _option3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Checkbox Examples',
      //   actions: [
      //     VSButton(
      //       label: 'Info',
      //       onPressed: () => _showCheckboxInfoDialog(context),
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
              title: 'VS Checkbox Variants & States',
              description: 'Comprehensive demonstration of checkbox sizes, states, and interactive examples',
              child: _buildCheckboxShowcase(),
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

  Widget _buildCheckboxShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic States
        _buildCheckboxGroup(
          title: 'Basic States',
          description: 'Checked and unchecked checkbox states',
          children: [
            Row(
              children: [
                VSCheckbox(
                  value: _basicChecked,
                  onChanged: (value) => setState(() => _basicChecked = value),
                  label: 'Checked state',
                ),
              ],
            ),
            SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                VSCheckbox(
                  value: _basicUnchecked,
                  onChanged: (value) => setState(() => _basicUnchecked = value),
                  label: 'Unchecked state',
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Sizes
        _buildCheckboxGroup(
          title: 'Sizes',
          description: 'Small, medium, and large checkbox sizes',
          children: [
            Row(
              children: [
                VSCheckbox(
                  value: _smallChecked,
                  onChanged: (value) => setState(() => _smallChecked = value),
                  label: 'Small',
                  size: VSCheckboxSize.small,
                ),
              ],
            ),
            SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                VSCheckbox(
                  value: _mediumChecked,
                  onChanged: (value) => setState(() => _mediumChecked = value),
                  label: 'Medium (default)',
                  size: VSCheckboxSize.medium,
                ),
              ],
            ),
            SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                VSCheckbox(
                  value: _largeChecked,
                  onChanged: (value) => setState(() => _largeChecked = value),
                  label: 'Large',
                  size: VSCheckboxSize.large,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Without Labels
        _buildCheckboxGroup(
          title: 'Without Labels',
          description: 'Checkboxes without text labels for compact layouts',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              children: [
                VSCheckbox(
                  value: _option1,
                  onChanged: (value) => setState(() => _option1 = value),
                ),
                VSCheckbox(
                  value: _option2,
                  onChanged: (value) => setState(() => _option2 = value),
                ),
                VSCheckbox(
                  value: _option3,
                  onChanged: (value) => setState(() => _option3 = value),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.sm),
            Text(
              'Selected: ${_getSelectedOptions()}',
              style: AppTypography.bodySmallRegular.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Disabled States
        _buildCheckboxGroup(
          title: 'Disabled States',
          description: 'Checkboxes in disabled state with visual feedback',
          children: [
            Row(
              children: [
                VSCheckbox(
                  value: true,
                  onChanged: null,
                  label: 'Disabled checked',
                  isEnabled: false,
                ),
              ],
            ),
            SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                VSCheckbox(
                  value: false,
                  onChanged: null,
                  label: 'Disabled unchecked',
                  isEnabled: false,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Real-world Usage Examples
        _buildCheckboxGroup(
          title: 'Real-world Usage Examples',
          description: 'Common checkbox patterns in application interfaces',
          children: [
            // Terms and Conditions
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
                    'Terms & Conditions',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSCheckbox(
                    value: _agreeTerms,
                    onChanged: (value) => setState(() => _agreeTerms = value),
                    label: 'I agree to the Terms of Service and Privacy Policy',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSButton(
                    label: 'Continue',
                    onPressed: _agreeTerms ? () => _showActionDialog(context, 'Terms accepted!') : () {},
                    isEnabled: _agreeTerms,
                    size: VSButtonSize.small,
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Preferences
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
                    'Email Preferences',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSCheckbox(
                    value: _subscribeNewsletter,
                    onChanged: (value) => setState(() => _subscribeNewsletter = value),
                    label: 'Subscribe to newsletter',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSCheckbox(
                    value: _receiveNotifications,
                    onChanged: (value) => setState(() => _receiveNotifications = value),
                    label: 'Receive email notifications',
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      VSButton(
                        label: 'Save Preferences',
                        onPressed: () => _showActionDialog(
                          context,
                          'Preferences saved!\nNewsletter: $_subscribeNewsletter\nNotifications: $_receiveNotifications',
                        ),
                        size: VSButtonSize.small,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Multi-select List
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
                        'Select Items',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                      const Spacer(),
                      VSBadge(
                        label: '${_getSelectedCount()}/3',
                        variant: VSBadgeVariant.primary,
                        size: VSBadgeSize.xsmall,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildSelectableItem('Item 1', _option1, (value) => setState(() => _option1 = value)),
                  _buildSelectableItem('Item 2', _option2, (value) => setState(() => _option2 = value)),
                  _buildSelectableItem('Item 3', _option3, (value) => setState(() => _option3 = value)),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      VSButton(
                        label: 'Select All',
                        onPressed: () => setState(() {
                          _option1 = true;
                          _option2 = true;
                          _option3 = true;
                        }),
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.outlined,
                      ),
                      SizedBox(width: AppSpacing.sm),
                      VSButton(
                        label: 'Clear All',
                        onPressed: () => setState(() {
                          _option1 = false;
                          _option2 = false;
                          _option3 = false;
                        }),
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.text,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Settings Panel
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
                    'Application Settings',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildSettingItem(
                    'Enable dark mode',
                    'Switch to dark theme',
                    true,
                    (value) => _showActionDialog(context, 'Dark mode ${value ? 'enabled' : 'disabled'}'),
                  ),
                  _buildSettingItem(
                    'Auto-save documents',
                    'Automatically save changes',
                    false,
                    (value) => _showActionDialog(context, 'Auto-save ${value ? 'enabled' : 'disabled'}'),
                  ),
                  _buildSettingItem(
                    'Show notifications',
                    'Display system notifications',
                    true,
                    (value) => _showActionDialog(context, 'Notifications ${value ? 'enabled' : 'disabled'}'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCheckboxGroup({
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

  Widget _buildSelectableItem(String label, bool value, ValueChanged<bool> onChanged) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSpacing.sm),
      padding: EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: value ? AppColors.primaryBg.withValues(alpha: 0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: value ? AppColors.primaryDefault : AppColors.neutral200,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          VSCheckbox(
            value: value,
            onChanged: onChanged,
            label: label,
          ),
          if (value) ...[
            const Spacer(),
            Icon(Icons.check_circle, color: AppColors.primaryDefault, size: 16),
          ],
        ],
      ),
    );
  }

  Widget _buildSettingItem(String title, String subtitle, bool initialValue, ValueChanged<bool> onChanged) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool value = initialValue;
        return Container(
          margin: EdgeInsets.only(bottom: AppSpacing.sm),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTypography.bodyMediumRegular,
                    ),
                    Text(
                      subtitle,
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              VSCheckbox(
                value: value,
                onChanged: (newValue) {
                  setState(() => value = newValue);
                  onChanged(newValue);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  String _getSelectedOptions() {
    final selected = [];
    if (_option1) selected.add('Option 1');
    if (_option2) selected.add('Option 2');
    if (_option3) selected.add('Option 3');
    return selected.isEmpty ? 'None' : selected.join(', ');
  }

  int _getSelectedCount() {
    int count = 0;
    if (_option1) count++;
    if (_option2) count++;
    if (_option3) count++;
    return count;
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