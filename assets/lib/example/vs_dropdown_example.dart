import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSDropdownExample extends StatefulWidget {
  const VSDropdownExample({super.key});

  @override
  State<VSDropdownExample> createState() => _VSDropdownExampleState();
}

class _VSDropdownExampleState extends State<VSDropdownExample> {
  // Basic dropdown selections
  String? _selectedCountry = 'United States';
  String? _selectedPriority = 'Medium';
  String? _selectedStatus = 'Open';
  String? _selectedCategory = 'General';

  // Form validation
  String? _countryError;

  // Autocomplete data
  List<String> _allUsers = [
    'Alice Johnson',
    'Bob Smith',
    'Charlie Brown',
    'Diana Prince',
    'Edward Norton',
    'Fiona Green',
    'George Lucas',
    'Helen Troy',
    'Ian Malcolm',
    'Julia Roberts',
    'Kevin Hart',
    'Laura Palmer',
    'Michael Scott',
    'Nancy Drew',
    'Oliver Twist',
    'Paula Abdul',
    'Quincy Jones',
    'Rachel Green',
    'Steve Rogers',
    'Tina Turner',
    'Uma Thurman',
    'Victor Hugo',
    'Wanda Maximoff',
    'Xavier Charles',
    'Yoda Master',
    'Zoe Saldana',
  ];

  String? _selectedUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Dropdown Examples',
      //   actions: [
      //     VSButton(
      //       label: 'Info',
      //       onPressed: () => _showDropdownInfo(context),
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
              title: 'VS Dropdown Variants & Types',
              description: 'Comprehensive demonstration of dropdown configurations, validation, and interactive examples',
              child: _buildDropdownShowcase(),
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

  Widget _buildDropdownShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic Dropdown Examples
        _buildDropdownGroup(
          title: 'Basic Dropdown Configurations',
          description: 'Standard dropdown with different states and configurations',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton(
                  label: 'Basic Dropdown',
                  onPressed: () => _showBasicDropdownDemo(context),
                  variant: VSButtonVariant.primary,
                ),
                VSButton(
                  label: 'With Labels',
                  onPressed: () => _showLabeledDropdownDemo(context),
                  variant: VSButtonVariant.secondary,
                ),
                VSButton(
                  label: 'Required Fields',
                  onPressed: () => _showRequiredDropdownDemo(context),
                  variant: VSButtonVariant.outlined,
                ),
                VSButton(
                  label: 'Error States',
                  onPressed: () => _showErrorDropdownDemo(context),
                  variant: VSButtonVariant.danger,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Dropdown States
        _buildDropdownGroup(
          title: 'Dropdown States',
          description: 'Different states and behaviors of dropdown components',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton(
                  label: 'Disabled State',
                  onPressed: () => _showDisabledDropdownDemo(context),
                  size: VSButtonSize.small,
                ),
                VSButton(
                  label: 'Pre-selected',
                  onPressed: () => _showPreselectedDropdownDemo(context),
                  size: VSButtonSize.small,
                ),
                VSButton(
                  label: 'Empty State',
                  onPressed: () => _showEmptyDropdownDemo(context),
                  size: VSButtonSize.small,
                ),
                VSButton(
                  label: 'Long Options',
                  onPressed: () => _showLongOptionsDropdownDemo(context),
                  size: VSButtonSize.small,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Autocomplete Dropdown
        _buildDropdownGroup(
          title: 'Autocomplete Dropdown',
          description: 'Advanced dropdown with search, lazy loading, debounce (300ms), and enter key support',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton(
                  label: 'Search Users',
                  onPressed: () => _showAutocompleteDemo(context),
                  variant: VSButtonVariant.primary,
                  leftIcon: Icons.search,
                ),
                VSButton(
                  label: 'Lazy Loading',
                  onPressed: () => _showLazyLoadingDemo(context),
                  variant: VSButtonVariant.secondary,
                  leftIcon: Icons.refresh,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Real-world Usage Examples
        _buildDropdownGroup(
          title: 'Real-world Usage Examples',
          description: 'Common dropdown patterns in application interfaces',
          children: [
            // User Profile Form
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
                    'User Profile Settings',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      const VSAvatar(
                        imageUrl: 'https://via.placeholder.com/40',
                        size: VSAvatarSize.medium,
                        isOnline: true,
                      ),
                      SizedBox(width: AppSpacing.sm),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('John Doe', style: AppTypography.bodyMediumSemibold),
                          Text('john.doe@example.com', style: AppTypography.bodySmallRegular),
                        ],
                      ),
                      const Spacer(),
                      const VSBadge(
                        label: 'VERIFIED',
                        variant: VSBadgeVariant.success,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSButton(
                        label: 'Edit Profile',
                        onPressed: () => _showProfileSettingsForm(context),
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.outlined,
                      ),
                      VSButton(
                        label: 'Privacy Settings',
                        onPressed: () => _showPrivacySettingsForm(context),
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.outlined,
                      ),
                      VSButton(
                        label: 'Notification Settings',
                        onPressed: () => _showNotificationSettingsForm(context),
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.outlined,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Project Configuration
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
                        'Project Configuration',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                      const Spacer(),
                      const VSBadge(
                        label: 'ACTIVE',
                        variant: VSBadgeVariant.primary,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Icon(Icons.folder, color: AppColors.primaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text('E-commerce Platform', style: AppTypography.bodyMediumRegular),
                      const Spacer(),
                      const VSBadge(
                        label: '12 MEMBERS',
                        variant: VSBadgeVariant.neutral,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSButton(
                        label: 'Project Settings',
                        onPressed: () => _showProjectSettingsForm(context),
                        size: VSButtonSize.small,
                        leftIcon: Icons.settings,
                      ),
                      VSButton(
                        label: 'Team Management',
                        onPressed: () => _showTeamManagementForm(context),
                        size: VSButtonSize.small,
                        leftIcon: Icons.group,
                      ),
                      VSButton(
                        label: 'Workflow Config',
                        onPressed: () => _showWorkflowConfigForm(context),
                        size: VSButtonSize.small,
                        leftIcon: Icons.account_tree,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Data Filtering
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
                    'Advanced Data Filters',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Icon(Icons.filter_list, color: AppColors.secondaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text('Product Catalog Filters', style: AppTypography.bodySmallRegular),
                      const Spacer(),
                      const VSBadge(
                        label: '3 ACTIVE',
                        variant: VSBadgeVariant.primary,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSChip(
                        label: 'Price: \$0 - \$100',
                        type: VSChipType.color,
                        variant: VSChipVariant.primary,
                      ),
                      VSChip(
                        label: 'Category: Electronics',
                        type: VSChipType.color,
                        variant: VSChipVariant.secondary,
                      ),
                      VSChip(
                        label: 'Rating: 4+ stars',
                        type: VSChipType.color,
                        variant: VSChipVariant.success,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSButton(
                    label: 'Advanced Filters',
                    onPressed: () => _showAdvancedFiltersForm(context),
                    size: VSButtonSize.small,
                    variant: VSButtonVariant.outlined,
                    width: double.infinity,
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Task Management
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
                        label: '8 TASKS',
                        variant: VSBadgeVariant.warning,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Icon(Icons.task, color: AppColors.warningDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text('Sprint Planning Board', style: AppTypography.bodyMediumRegular),
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
                      VSButton(
                        label: 'Create Task',
                        onPressed: () => _showTaskCreationForm(context),
                        size: VSButtonSize.small,
                        leftIcon: Icons.add,
                      ),
                      VSButton(
                        label: 'Bulk Actions',
                        onPressed: () => _showBulkActionsForm(context),
                        size: VSButtonSize.small,
                        leftIcon: Icons.more_horiz,
                      ),
                      VSButton(
                        label: 'Export Tasks',
                        onPressed: () => _showTaskExportForm(context),
                        size: VSButtonSize.small,
                        leftIcon: Icons.download,
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

  Widget _buildDropdownGroup({
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

  void _showBasicDropdownDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'Basic Dropdown Demo',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSDropdown(
              label: 'Select Country',
              items: ['United States', 'Canada', 'United Kingdom', 'Germany', 'France', 'Japan'],
              value: _selectedCountry,
              hint: 'Choose a country',
              onChanged: (value) {
                setState(() => _selectedCountry = value);
              },
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Select Priority',
              items: ['Low', 'Medium', 'High', 'Critical'],
              value: _selectedPriority,
              onChanged: (value) {
                setState(() => _selectedPriority = value);
              },
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

  void _showLabeledDropdownDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'Dropdown with Labels',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSDropdown(
              label: 'Project Status',
              hint: 'Select current status',
              items: ['Planning', 'In Development', 'Testing', 'Completed', 'On Hold'],
              value: _selectedStatus,
              onChanged: (value) {
                setState(() => _selectedStatus = value);
              },
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Support Category',
              hint: 'Choose category',
              items: ['Technical Issue', 'Feature Request', 'Bug Report', 'General Inquiry', 'Account Issue'],
              value: _selectedCategory,
              onChanged: (value) {
                setState(() => _selectedCategory = value);
              },
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

  void _showRequiredDropdownDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'Required Fields Demo',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSDropdown(
              label: 'Country of Residence',
              items: ['United States', 'Canada', 'United Kingdom', 'Germany', 'France'],
              isRequired: true,
              hint: 'Required field',
              value: _selectedCountry,
              onChanged: (value) {
                setState(() => _selectedCountry = value);
              },
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Priority Level',
              items: ['Low', 'Medium', 'High'],
              isRequired: true,
              value: _selectedPriority,
              onChanged: (value) {
                setState(() => _selectedPriority = value);
              },
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

  void _showErrorDropdownDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'Error States Demo',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSDropdown(
              label: 'Country',
              items: ['United States', 'Canada', 'United Kingdom'],
              errorMessage: 'Please select a country',
              value: null,
              onChanged: (value) {
                setState(() {
                  _selectedCountry = value;
                  _countryError = null;
                });
              },
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Priority',
              items: ['Low', 'Medium', 'High'],
              errorMessage: 'Priority selection is required',
              value: null,
              onChanged: (value) {
                setState(() {
                  _selectedPriority = value;
                });
              },
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

  void _showDisabledDropdownDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'Disabled Dropdown Demo',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSDropdown(
              label: 'Disabled Dropdown',
              items: ['Option 1', 'Option 2', 'Option 3'],
              isEnabled: false,
              hint: 'This dropdown is disabled',
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Read-only Selection',
              items: ['Selected Item'],
              value: 'Selected Item',
              isEnabled: false,
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

  void _showPreselectedDropdownDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'Pre-selected Values',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSDropdown(
              label: 'Default Country',
              items: ['United States', 'Canada', 'United Kingdom', 'Germany'],
              value: 'United States',
              onChanged: (value) {
                setState(() => _selectedCountry = value);
              },
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Default Priority',
              items: ['Low', 'Medium', 'High', 'Critical'],
              value: 'Medium',
              onChanged: (value) {
                setState(() => _selectedPriority = value);
              },
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

  void _showEmptyDropdownDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'Empty State Demo',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSDropdown(
              label: 'No Selection',
              items: ['Option 1', 'Option 2', 'Option 3'],
              hint: 'Please make a selection',
              value: null,
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Empty List',
              items: [],
              hint: 'No options available',
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

  void _showLongOptionsDropdownDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'Long Options Demo',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSDropdown(
              label: 'Long Option Names',
              items: [
                'Very Long Option Name That Might Overflow',
                'Another Extremely Long Option Description',
                'Short',
                'Medium Length Option',
                'This is a very long option name that should be truncated properly in the UI',
                'Final Long Option Name for Testing',
              ],
              hint: 'Select an option with long text',
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

  void _showAutocompleteDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'Autocomplete Dropdown Demo',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSAutocompleteDropdown(
              label: 'Search Users',
              hint: 'Type to search (debounce 300ms) or press Enter...',
              value: _selectedUser,
              onLoadMore: (page) async {
                // Simulate API delay
                await Future.delayed(const Duration(milliseconds: 500));

                // Return paginated results
                final startIndex = (page - 1) * 10;
                final endIndex = startIndex + 10;
                final pageItems = _allUsers.sublist(
                  startIndex,
                  endIndex > _allUsers.length ? _allUsers.length : endIndex,
                );

                return pageItems;
              },
              onChanged: (value) {
                setState(() => _selectedUser = value);
              },
            ),
            SizedBox(height: AppSpacing.sm),
            if (_selectedUser != null)
              Text(
                'Selected: $_selectedUser',
                style: AppTypography.bodySmallRegular.copyWith(
                  color: AppColors.primaryDefault,
                ),
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

  void _showLazyLoadingDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'Lazy Loading Demo',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'This demo shows lazy loading with pagination. Scroll to the bottom to load more items.',
              style: AppTypography.bodySmallRegular,
            ),
            SizedBox(height: AppSpacing.md),
            VSAutocompleteDropdown(
              label: 'Lazy Load Items',
              hint: 'Start typing or scroll to load...',
              onLoadMore: (page) async {
                // Simulate network delay
                await Future.delayed(const Duration(seconds: 1));

                // Generate mock data for demonstration
                final items = List.generate(
                  20,
                  (index) => 'Item ${(page - 1) * 20 + index + 1}',
                );

                return items;
              },
              onChanged: (value) {
                // Handle selection
              },
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

  void _showProfileSettingsForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'Edit Profile',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSDropdown(
              label: 'Display Name',
              items: ['John Doe', 'Johnny D', 'JD'],
              value: 'John Doe',
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Timezone',
              items: ['PST', 'EST', 'CST', 'MST', 'GMT'],
              value: 'PST',
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Language',
              items: ['English', 'Spanish', 'French', 'German'],
              value: 'English',
            ),
          ],
        ),
        actions: [
          VSDialogAction(
            label: 'Cancel',
            onPressed: () {},
            variant: VSButtonVariant.outlined,
          ),
          VSDialogAction(
            label: 'Save Changes',
            onPressed: () => _showActionDialog(context, 'Profile updated successfully!'),
          ),
        ],
      ),
    );
  }

  void _showPrivacySettingsForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'Privacy Settings',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSDropdown(
              label: 'Profile Visibility',
              items: ['Public', 'Friends Only', 'Private'],
              value: 'Friends Only',
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Activity Status',
              items: ['Show when online', 'Show last seen', 'Hide status'],
              value: 'Show when online',
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Data Sharing',
              items: ['Share with everyone', 'Share with friends', 'Don\'t share'],
              value: 'Share with friends',
            ),
          ],
        ),
        actions: [
          VSDialogAction(
            label: 'Cancel',
            onPressed: () {},
            variant: VSButtonVariant.outlined,
          ),
          VSDialogAction(
            label: 'Update Privacy',
            onPressed: () => _showActionDialog(context, 'Privacy settings updated!'),
          ),
        ],
      ),
    );
  }

  void _showNotificationSettingsForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'Notification Settings',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSDropdown(
              label: 'Email Notifications',
              items: ['All emails', 'Important only', 'No emails'],
              value: 'Important only',
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Push Notifications',
              items: ['All notifications', 'Important only', 'No notifications'],
              value: 'All notifications',
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Quiet Hours',
              items: ['8 PM - 8 AM', '10 PM - 7 AM', '11 PM - 6 AM', 'Disabled'],
              value: '10 PM - 7 AM',
            ),
          ],
        ),
        actions: [
          VSDialogAction(
            label: 'Cancel',
            onPressed: () {},
            variant: VSButtonVariant.outlined,
          ),
          VSDialogAction(
            label: 'Save Settings',
            onPressed: () => _showActionDialog(context, 'Notification settings saved!'),
          ),
        ],
      ),
    );
  }

  void _showProjectSettingsForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'Project Settings',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSDropdown(
              label: 'Project Type',
              items: ['Web Application', 'Mobile App', 'Desktop App', 'API'],
              value: 'Web Application',
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Visibility',
              items: ['Public', 'Private', 'Team Only'],
              value: 'Private',
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Default Branch',
              items: ['main', 'master', 'develop'],
              value: 'main',
            ),
          ],
        ),
        actions: [
          VSDialogAction(
            label: 'Cancel',
            onPressed: () {},
            variant: VSButtonVariant.outlined,
          ),
          VSDialogAction(
            label: 'Save Settings',
            onPressed: () => _showActionDialog(context, 'Project settings updated!'),
          ),
        ],
      ),
    );
  }

  void _showTeamManagementForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'Add Team Member',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSAutocompleteDropdown(
              label: 'Select User',
              hint: 'Search for team members...',
              onLoadMore: (page) async {
                await Future.delayed(const Duration(milliseconds: 300));
                return _allUsers.sublist(0, 10);
              },
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Role',
              items: ['Owner', 'Admin', 'Developer', 'Viewer'],
              value: 'Developer',
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Permissions',
              items: ['Full Access', 'Edit Only', 'Read Only'],
              value: 'Edit Only',
            ),
          ],
        ),
        actions: [
          VSDialogAction(
            label: 'Cancel',
            onPressed: () {},
            variant: VSButtonVariant.outlined,
          ),
          VSDialogAction(
            label: 'Add Member',
            onPressed: () => _showActionDialog(context, 'Team member added successfully!'),
          ),
        ],
      ),
    );
  }

  void _showWorkflowConfigForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'Workflow Configuration',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSDropdown(
              label: 'Trigger Event',
              items: ['Push to main', 'Pull request', 'Issue created', 'Manual trigger'],
              value: 'Push to main',
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Action Type',
              items: ['Run tests', 'Deploy', 'Send notification', 'Create issue'],
              value: 'Run tests',
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Environment',
              items: ['Development', 'Staging', 'Production'],
              value: 'Development',
            ),
          ],
        ),
        actions: [
          VSDialogAction(
            label: 'Cancel',
            onPressed: () {},
            variant: VSButtonVariant.outlined,
          ),
          VSDialogAction(
            label: 'Save Workflow',
            onPressed: () => _showActionDialog(context, 'Workflow configured successfully!'),
          ),
        ],
      ),
    );
  }

  void _showAdvancedFiltersForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'Advanced Filters',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSDropdown(
              label: 'Category',
              items: ['Electronics', 'Clothing', 'Books', 'Home & Garden', 'Sports'],
              value: 'Electronics',
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Price Range',
              items: ['\$0 - \$50', '\$50 - \$100', '\$100 - \$500', '\$500+'],
              value: '\$50 - \$100',
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Rating',
              items: ['Any', '4+ stars', '3+ stars', '2+ stars'],
              value: '4+ stars',
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Availability',
              items: ['Any', 'In stock', 'Out of stock'],
              value: 'In stock',
            ),
          ],
        ),
        actions: [
          VSDialogAction(
            label: 'Clear All',
            onPressed: () => _showActionDialog(context, 'All filters cleared!'),
            variant: VSButtonVariant.outlined,
          ),
          VSDialogAction(
            label: 'Apply Filters',
            onPressed: () => _showActionDialog(context, 'Filters applied successfully!'),
          ),
        ],
      ),
    );
  }

  void _showTaskCreationForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'Create New Task',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSDropdown(
              label: 'Task Type',
              items: ['Bug', 'Feature', 'Improvement', 'Documentation'],
              value: 'Feature',
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Priority',
              items: ['Low', 'Medium', 'High', 'Critical'],
              value: 'Medium',
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Assignee',
              items: ['Unassigned', 'Alice Johnson', 'Bob Smith', 'Charlie Brown'],
              value: 'Unassigned',
            ),
          ],
        ),
        actions: [
          VSDialogAction(
            label: 'Cancel',
            onPressed: () {},
            variant: VSButtonVariant.outlined,
          ),
          VSDialogAction(
            label: 'Create Task',
            onPressed: () => _showActionDialog(context, 'Task created successfully!'),
          ),
        ],
      ),
    );
  }

  void _showBulkActionsForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'Bulk Actions',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSDropdown(
              label: 'Action Type',
              items: ['Change Status', 'Assign To', 'Change Priority', 'Delete'],
              value: 'Change Status',
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'New Status',
              items: ['Open', 'In Progress', 'Review', 'Closed'],
              value: 'In Progress',
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Apply To',
              items: ['Selected items (3)', 'All items on page', 'All matching items'],
              value: 'Selected items (3)',
            ),
          ],
        ),
        actions: [
          VSDialogAction(
            label: 'Cancel',
            onPressed: () {},
            variant: VSButtonVariant.outlined,
          ),
          VSDialogAction(
            label: 'Apply Changes',
            onPressed: () => _showActionDialog(context, 'Bulk action applied to 3 items!'),
          ),
        ],
      ),
    );
  }

  void _showTaskExportForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'Export Tasks',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSDropdown(
              label: 'Export Format',
              items: ['CSV', 'Excel', 'JSON', 'PDF'],
              value: 'CSV',
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Date Range',
              items: ['Last 7 days', 'Last 30 days', 'Last 3 months', 'All time'],
              value: 'Last 30 days',
            ),
            SizedBox(height: AppSpacing.md),
            VSDropdown(
              label: 'Include Fields',
              items: ['All fields', 'Basic info only', 'Custom selection'],
              value: 'All fields',
            ),
          ],
        ),
        actions: [
          VSDialogAction(
            label: 'Cancel',
            onPressed: () {},
            variant: VSButtonVariant.outlined,
          ),
          VSDialogAction(
            label: 'Start Export',
            onPressed: () => _showActionDialog(context, 'Export started! You will receive an email when ready.'),
          ),
        ],
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

}