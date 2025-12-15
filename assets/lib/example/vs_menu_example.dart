import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSMenuExample extends StatefulWidget {
  const VSMenuExample({super.key});

  @override
  State<VSMenuExample> createState() => _VSMenuExampleState();
}

class _VSMenuExampleState extends State<VSMenuExample> {
  int _selectedNavigationIndex = 0;
  int? _selectedSubItemIndex;
  bool _showSettings = true;
  bool _showHelp = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Menu Examples',
      //   actions: [
      //     VSButton(
      //       label: 'Info',
      //       onPressed: () => _showMenuInfo(context),
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
              title: 'VS Menu Variants & Types',
              description:
                  'Comprehensive demonstration of menu configurations and real-world usage patterns',
              child: _buildMenuShowcase(),
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
        Text(title, style: AppTypography.h3),
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

  Widget _buildMenuShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Menu Configuration
        _buildMenuGroup(
          title: 'Menu Configuration',
          description: 'Customize menu appearance and behavior',
          children: [
            Row(
              children: [
                VSToggle(
                  value: _showSettings,
                  onChanged: (value) => setState(() => _showSettings = value),
                  label: 'Show Settings',
                ),
                SizedBox(width: AppSpacing.md),
                VSToggle(
                  value: _showHelp,
                  onChanged: (value) => setState(() => _showHelp = value),
                  label: 'Show Help',
                ),
              ],
            ),
            SizedBox(height: AppSpacing.md),
            Container(
              height: 800,
              width: 250, // Accommodate menu width + expanded panel
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: VSMenu(
                logo: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primaryDefault,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      'VS',
                      style: AppTypography.bodySmallSemibold.copyWith(
                        color: AppColors.neutral0,
                      ),
                    ),
                  ),
                ),
                navigationItems: [
                  VSMenuItem(
                    icon: Icons.dashboard,
                    tooltip: 'Dashboard',
                    isSelected: _selectedNavigationIndex == 0,
                    onTap: () => _handleNavigationTap(0),
                  ),
                  VSMenuItem(
                    icon: Icons.inventory,
                    tooltip: 'Products',
                    isSelected: _selectedNavigationIndex == 1,
                    onTap: () => _handleNavigationTap(1),
                    children: [
                      VSMenuSubItem(
                        label: 'All Products',
                        icon: Icons.list,
                        isSelected: _selectedSubItemIndex == 0,
                        onTap: () => _handleSubItemTap(0),
                      ),
                      VSMenuSubItem(
                        label: 'Categories',
                        icon: Icons.category,
                        isSelected: _selectedSubItemIndex == 1,
                        onTap: () => _handleSubItemTap(1),
                      ),
                      VSMenuSubItem(
                        label: 'Inventory',
                        icon: Icons.inventory_2,
                        isSelected: _selectedSubItemIndex == 2,
                        onTap: () => _handleSubItemTap(2),
                      ),
                    ],
                  ),
                  VSMenuItem(
                    icon: Icons.shopping_cart,
                    tooltip: 'Orders',
                    isSelected: _selectedNavigationIndex == 2,
                    onTap: () => _handleNavigationTap(2),
                  ),
                  VSMenuItem(
                    icon: Icons.people,
                    tooltip: 'Customers',
                    isSelected: _selectedNavigationIndex == 3,
                    onTap: () => _handleNavigationTap(3),
                  ),
                  VSMenuItem(
                    icon: Icons.analytics,
                    tooltip: 'Analytics',
                    isSelected: _selectedNavigationIndex == 4,
                    onTap: () => _handleNavigationTap(4),
                  ),
                  if (_showHelp)
                    VSMenuItem(
                      icon: Icons.help,
                      tooltip: 'Help',
                      isSelected: _selectedNavigationIndex == 6,
                      onTap: () => _handleNavigationTap(6),
                    ),
                ],
                settingsItem: _showSettings
                    ? VSMenuItem(
                        icon: Icons.settings,
                        tooltip: 'Settings',
                        isSelected: _selectedNavigationIndex == 5,
                        onTap: () => _handleNavigationTap(5),
                      )
                    : null,
              ),
            ),
            SizedBox(height: AppSpacing.sm),
            Container(
              padding: EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Selected: Navigation $_selectedNavigationIndex${_selectedSubItemIndex != null ? ', Sub-item $_selectedSubItemIndex' : ''}',
                style: AppTypography.bodySmallRegular,
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Menu Variants
        _buildMenuGroup(
          title: 'Menu Variants',
          description: 'Different menu configurations for various use cases',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                VSButton(
                  label: 'Basic Menu',
                  onPressed: () => _showBasicMenuDemo(context),
                  variant: VSButtonVariant.primary,
                ),
                VSButton(
                  label: 'Expanded Menu',
                  onPressed: () => _showExpandedMenuDemo(context),
                  variant: VSButtonVariant.secondary,
                ),
                VSButton(
                  label: 'Minimal Menu',
                  onPressed: () => _showMinimalMenuDemo(context),
                  variant: VSButtonVariant.outlined,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Real-world Usage Examples
        _buildMenuGroup(
          title: 'Real-world Usage Examples',
          description: 'Common menu patterns in application interfaces',
          children: [
            // Admin Dashboard
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
                    'Admin Dashboard Menu',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Container(
                    height: 700,
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.neutral300),
                    ),
                    child: VSMenu(
                      logo: Icon(
                        Icons.admin_panel_settings,
                        color: AppColors.primaryDefault,
                      ),
                      navigationItems: [
                        VSMenuItem(icon: Icons.dashboard, tooltip: 'Overview'),
                        VSMenuItem(
                          icon: Icons.people,
                          tooltip: 'User Management',
                          children: [
                            VSMenuSubItem(
                              label: 'All Users',
                              icon: Icons.group,
                            ),
                            VSMenuSubItem(
                              label: 'Roles & Permissions',
                              icon: Icons.security,
                            ),
                            VSMenuSubItem(
                              label: 'User Activity',
                              icon: Icons.timeline,
                            ),
                          ],
                        ),
                        VSMenuItem(
                          icon: Icons.inventory,
                          tooltip: 'Content Management',
                        ),
                        VSMenuItem(icon: Icons.analytics, tooltip: 'Reports'),
                        VSMenuItem(
                          icon: Icons.settings,
                          tooltip: 'System Settings',
                        ),
                      ],
                      settingsItem: VSMenuItem(
                        icon: Icons.logout,
                        tooltip: 'Logout',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // E-commerce Platform
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
                    'E-commerce Management Menu',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Container(
                    height: 700,
                    width: 250, // Accommodate menu width + expanded panel
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.neutral300),
                    ),
                    child: VSMenu(
                      logo: Icon(
                        Icons.shopping_bag,
                        color: AppColors.secondaryDefault,
                      ),
                      navigationItems: [
                        VSMenuItem(icon: Icons.store, tooltip: 'Store'),
                        VSMenuItem(
                          icon: Icons.inventory,
                          tooltip: 'Products',
                          children: [
                            VSMenuSubItem(
                              label: 'Product List',
                              icon: Icons.list,
                            ),
                            VSMenuSubItem(
                              label: 'Categories',
                              icon: Icons.category,
                            ),
                            VSMenuSubItem(
                              label: 'Brands',
                              icon: Icons.business,
                            ),
                            VSMenuSubItem(label: 'Reviews', icon: Icons.star),
                          ],
                        ),
                        VSMenuItem(
                          icon: Icons.shopping_cart,
                          tooltip: 'Orders',
                        ),
                        VSMenuItem(icon: Icons.people, tooltip: 'Customers'),
                        VSMenuItem(
                          icon: Icons.local_shipping,
                          tooltip: 'Shipping',
                        ),
                        VSMenuItem(icon: Icons.analytics, tooltip: 'Analytics'),
                      ],
                      settingsItem: VSMenuItem(
                        icon: Icons.settings,
                        tooltip: 'Store Settings',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Project Management
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
                    'Project Management Menu',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Container(
                    height: 700,
                    width: 250, // Accommodate menu width + expanded panel
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.neutral300),
                    ),
                    child: VSMenu(
                      logo: Icon(Icons.work, color: AppColors.warningDefault),
                      navigationItems: [
                        VSMenuItem(icon: Icons.dashboard, tooltip: 'Dashboard'),
                        VSMenuItem(
                          icon: Icons.folder,
                          tooltip: 'Projects',
                          children: [
                            VSMenuSubItem(
                              label: 'All Projects',
                              icon: Icons.folder_open,
                            ),
                            VSMenuSubItem(
                              label: 'Active',
                              icon: Icons.play_arrow,
                            ),
                            VSMenuSubItem(
                              label: 'Completed',
                              icon: Icons.check_circle,
                            ),
                            VSMenuSubItem(
                              label: 'Archived',
                              icon: Icons.archive,
                            ),
                          ],
                        ),
                        VSMenuItem(icon: Icons.task, tooltip: 'Tasks'),
                        VSMenuItem(icon: Icons.people, tooltip: 'Team'),
                        VSMenuItem(
                          icon: Icons.calendar_today,
                          tooltip: 'Calendar',
                        ),
                        VSMenuItem(icon: Icons.bar_chart, tooltip: 'Reports'),
                      ],
                      settingsItem: VSMenuItem(
                        icon: Icons.settings,
                        tooltip: 'Project Settings',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Learning Management System
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
                    'Learning Management Menu',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Container(
                    height: 700,
                    width: 250, // Accommodate menu width + expanded panel
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.neutral300),
                    ),
                    child: VSMenu(
                      logo: Icon(Icons.school, color: AppColors.successDefault),
                      navigationItems: [
                        VSMenuItem(icon: Icons.home, tooltip: 'Home'),
                        VSMenuItem(
                          icon: Icons.book,
                          tooltip: 'Courses',
                          children: [
                            VSMenuSubItem(
                              label: 'My Courses',
                              icon: Icons.library_books,
                            ),
                            VSMenuSubItem(
                              label: 'Browse Courses',
                              icon: Icons.search,
                            ),
                            VSMenuSubItem(
                              label: 'Completed',
                              icon: Icons.check_circle,
                            ),
                            VSMenuSubItem(
                              label: 'Certificates',
                              icon: Icons.badge,
                            ),
                          ],
                        ),
                        VSMenuItem(
                          icon: Icons.assignment,
                          tooltip: 'Assignments',
                        ),
                        VSMenuItem(icon: Icons.forum, tooltip: 'Discussions'),
                        VSMenuItem(icon: Icons.grade, tooltip: 'Grades'),
                        VSMenuItem(
                          icon: Icons.calendar_today,
                          tooltip: 'Schedule',
                        ),
                      ],
                      settingsItem: VSMenuItem(
                        icon: Icons.account_circle,
                        tooltip: 'Profile',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Content Management System
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
                    'Content Management Menu',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Container(
                    height: 700,
                    width: 250, // Accommodate menu width + expanded panel
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.neutral300),
                    ),
                    child: VSMenu(
                      logo: Icon(
                        Icons.article,
                        color: AppColors.primaryDefault,
                      ),
                      navigationItems: [
                        VSMenuItem(icon: Icons.dashboard, tooltip: 'Dashboard'),
                        VSMenuItem(
                          icon: Icons.article,
                          tooltip: 'Content',
                          children: [
                            VSMenuSubItem(label: 'All Posts', icon: Icons.list),
                            VSMenuSubItem(label: 'Pages', icon: Icons.web),
                            VSMenuSubItem(
                              label: 'Categories',
                              icon: Icons.category,
                            ),
                            VSMenuSubItem(label: 'Tags', icon: Icons.tag),
                          ],
                        ),
                        VSMenuItem(icon: Icons.image, tooltip: 'Media'),
                        VSMenuItem(icon: Icons.comment, tooltip: 'Comments'),
                        VSMenuItem(icon: Icons.analytics, tooltip: 'Analytics'),
                        VSMenuItem(icon: Icons.extension, tooltip: 'Plugins'),
                      ],
                      settingsItem: VSMenuItem(
                        icon: Icons.settings,
                        tooltip: 'Settings',
                      ),
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

  Widget _buildMenuGroup({
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

  void _handleNavigationTap(int index) {
    setState(() {
      _selectedNavigationIndex = index;
      _selectedSubItemIndex = null;
    });
    _showActionDialog(context, 'Navigation item $index selected');
  }

  void _handleSubItemTap(int index) {
    setState(() => _selectedSubItemIndex = index);
    _showActionDialog(context, 'Sub-item $index selected');
  }

  void _showBasicMenuDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: SizedBox(
          width: 280,
          height: 700,
          child: VSMenu(
            logo: Icon(Icons.menu, color: AppColors.primaryDefault),
            navigationItems: [
              VSMenuItem(icon: Icons.home, tooltip: 'Home'),
              VSMenuItem(icon: Icons.search, tooltip: 'Search'),
              VSMenuItem(icon: Icons.favorite, tooltip: 'Favorites'),
              VSMenuItem(icon: Icons.settings, tooltip: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }

  void _showExpandedMenuDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: SizedBox(
          width: 280,
          height: 800,
          child: VSMenu(
            logo: Icon(Icons.expand_more, color: AppColors.primaryDefault),
            navigationItems: [
              VSMenuItem(
                icon: Icons.folder,
                tooltip: 'Files',
                children: [
                  VSMenuSubItem(label: 'Documents'),
                  VSMenuSubItem(label: 'Images'),
                  VSMenuSubItem(label: 'Videos'),
                  VSMenuSubItem(label: 'Music'),
                ],
              ),
              VSMenuItem(
                icon: Icons.people,
                tooltip: 'Team',
                children: [
                  VSMenuSubItem(label: 'Members'),
                  VSMenuSubItem(label: 'Roles'),
                  VSMenuSubItem(label: 'Permissions'),
                ],
              ),
              VSMenuItem(icon: Icons.analytics, tooltip: 'Analytics'),
              VSMenuItem(icon: Icons.settings, tooltip: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }

  void _showMinimalMenuDemo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: SizedBox(
          width: 280,
          height: 350,
          child: VSMenu(
            logo: Icon(Icons.apps, color: AppColors.primaryDefault),
            navigationItems: [
              VSMenuItem(icon: Icons.dashboard),
              VSMenuItem(icon: Icons.list),
              VSMenuItem(icon: Icons.add),
              VSMenuItem(icon: Icons.person),
            ],
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
        actions: [VSDialogAction(label: 'OK', onPressed: () {})],
      ),
    );
  }

}
