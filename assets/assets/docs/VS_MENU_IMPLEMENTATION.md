# VS Menu

**Version 1.0.1 - December 14, 2025**

The VS Menu component provides vertical navigation with collapsible sections, icons, and customizable styling for sidebar navigation.

## Overview

The `VSMenu` widget creates vertical navigation menus with support for nested items, icons, badges, and collapsible sections.

## Features

- **Nested Navigation**: Support for submenus and nested items
- **Icons**: Left and right icons for menu items
- **Badges**: Notification badges and status indicators
- **Collapsible Sections**: Expandable/collapsible menu groups
- **Active States**: Visual indication of selected items
- **Custom Styling**: Customizable colors and spacing
- **Accessibility**: Keyboard navigation and screen reader support
- **Responsive**: Adapts to different screen sizes

## Basic Usage

```dart
VSMenu(
  logo: Icon(Icons.business, color: AppColors.primaryDefault),
  navigationItems: [
    VSMenuItem(
      icon: Icons.dashboard,
      tooltip: 'Dashboard',
      onTap: () => navigateToDashboard(),
    ),
    VSMenuItem(
      icon: Icons.people,
      tooltip: 'Users',
      onTap: () => navigateToUsers(),
    ),
    VSMenuItem(
      icon: Icons.settings,
      tooltip: 'Settings',
      onTap: () => navigateToSettings(),
    ),
  ],
)
```

## Menu Items

### Basic Menu Item
Simple menu item with icon and tooltip.

```dart
VSMenuItem(
  icon: Icons.dashboard,
  tooltip: 'Dashboard',
  onTap: () => navigateToDashboard(),
)
```

### Menu Item with Children
Menu item with expandable submenu.

```dart
VSMenuItem(
  icon: Icons.inventory,
  tooltip: 'Products',
  onTap: () => navigateToProducts(),
  children: [
    VSMenuSubItem(
      label: 'All Products',
      icon: Icons.list,
      onTap: () => navigateToAllProducts(),
    ),
    VSMenuSubItem(
      label: 'Categories',
      icon: Icons.category,
      onTap: () => navigateToCategories(),
    ),
    VSMenuSubItem(
      label: 'Inventory',
      icon: Icons.inventory_2,
      onTap: () => navigateToInventory(),
    ),
  ],
)
```

### Selected States
Menu items with selection indicators.

```dart
VSMenuItem(
  icon: Icons.dashboard,
  tooltip: 'Dashboard',
  isSelected: _selectedIndex == 0,
  onTap: () => setState(() => _selectedIndex = 0),
)
```

## Menu Configuration

### Basic Menu
Simple vertical menu.

```dart
VSMenu(
  logo: Icon(Icons.business, color: AppColors.primaryDefault),
  navigationItems: [
    VSMenuItem(icon: Icons.home, tooltip: 'Home', onTap: () {}),
    VSMenuItem(icon: Icons.person, tooltip: 'Profile', onTap: () {}),
    VSMenuItem(icon: Icons.settings, tooltip: 'Settings', onTap: () {}),
  ],
)
```

### Menu with Selection
Menu with active item tracking.

```dart
class MyNavigation extends StatefulWidget {
  @override
  _MyNavigationState createState() => _MyNavigationState();
}

class _MyNavigationState extends State<MyNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return VSMenu(
      logo: Icon(Icons.business, color: AppColors.primaryDefault),
      navigationItems: [
        VSMenuItem(
          icon: Icons.dashboard,
          tooltip: 'Dashboard',
          isSelected: _selectedIndex == 0,
          onTap: () => setState(() => _selectedIndex = 0),
        ),
        VSMenuItem(
          icon: Icons.analytics,
          tooltip: 'Analytics',
          isSelected: _selectedIndex == 1,
          onTap: () => setState(() => _selectedIndex = 1),
        ),
        VSMenuItem(
          icon: Icons.description,
          tooltip: 'Reports',
          isSelected: _selectedIndex == 2,
          onTap: () => setState(() => _selectedIndex = 2),
        ),
      ],
    );
  }
}
```

### Collapsible Menu Sections
Menu with expandable sections.

```dart
VSMenu(
  logo: Icon(Icons.business, color: AppColors.primaryDefault),
  navigationItems: [
    VSMenuItem(
      icon: Icons.dashboard,
      tooltip: 'Dashboard',
      onTap: () {},
    ),
    VSMenuItem(
      icon: Icons.business,
      tooltip: 'Management',
      subItems: [
        VSMenuSubItem(
          title: 'Users',
          onTap: () {},
        ),
        VSMenuSubItem(
          title: 'Roles',
          onTap: () {},
        ),
      ],
    ),
    VSMenuItem(
      icon: Icons.article,
      tooltip: 'Content',
      subItems: [
        VSMenuSubItem(
          title: 'Posts',
          onTap: () {},
        ),
        VSMenuSubItem(
          title: 'Media',
          onTap: () {},
        ),
      ],
    ),
  ],
)
```
```

## Advanced Features

### Menu with Header
Menu with custom header.

```dart
VSMenu(
  logo: Icon(Icons.business, color: AppColors.primaryDefault),
  header: Container(
    padding: EdgeInsets.all(AppSpacing.md),
    child: Column(
      children: [
        VSAvatar(
          name: 'John Doe',
          size: VSAvatarSize.medium,
        ),
        SizedBox(height: AppSpacing.sm),
        Text(
          'John Doe',
          style: AppTypography.bodyMediumMedium,
        ),
        Text(
          'Administrator',
          style: AppTypography.bodySmallRegular.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    ),
  ),
  navigationItems: [
    // Menu items...
  ],
)
```

### Menu with Footer
Menu with custom footer.

```dart
VSMenu(
  logo: Icon(Icons.business, color: AppColors.primaryDefault),
  navigationItems: [
    // Menu items...
  ],
  footer: Container(
    padding: EdgeInsets.all(AppSpacing.md),
    child: VSButton(
      label: 'Logout',
      variant: VSButtonVariant.outlined,
      size: VSButtonSize.small,
      onPressed: () => handleLogout(),
    ),
  ),
)
```

### Custom Styling
Menu with custom colors and styling.

```dart
VSMenu(
  logo: Icon(Icons.business, color: AppColors.primaryDefault),
  backgroundColor: AppColors.neutral50,
  activeColor: AppColors.primary100,
  hoverColor: AppColors.primary50,
  textColor: AppColors.textPrimary,
  activeTextColor: AppColors.primaryDefault,
  navigationItems: [
    // Menu items...
  ],
)
```

## Real-World Examples

### Admin Dashboard Navigation
```dart
class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _selectedIndex = 0;

  final List<VSMenuItem> _menuItems = [
    VSMenuItem(
      icon: Icons.dashboard,
      tooltip: 'Dashboard',
      isSelected: _selectedIndex == 0,
      onTap: () => _navigateToPage(0),
    ),
    VSMenuItem(
      icon: Icons.people,
      tooltip: 'User Management',
      subItems: [
        VSMenuSubItem(
          title: 'All Users',
          badge: VSBadge(label: '12', variant: VSBadgeVariant.primary),
          onTap: () => _navigateToPage(1),
        ),
        VSMenuSubItem(
          title: 'Roles & Permissions',
          onTap: () => _navigateToPage(2),
        ),
        VSMenuSubItem(
          title: 'User Activity',
          onTap: () => _navigateToPage(3),
        ),
      ],
    ),
    VSMenuItem(
      icon: Icons.article,
      tooltip: 'Content',
      subItems: [
        VSMenuSubItem(
          title: 'Articles',
          onTap: () => _navigateToPage(4),
        ),
        VSMenuSubItem(
          title: 'Media Library',
          onTap: () => _navigateToPage(5),
        ),
        VSMenuSubItem(
          title: 'Comments',
          badge: VSBadge(label: '5', variant: VSBadgeVariant.warning),
          onTap: () => _navigateToPage(6),
        ),
      ],
    ),
    VSMenuItem(
      icon: Icons.analytics,
      tooltip: 'Analytics',
      isSelected: _selectedIndex == 7,
      onTap: () => _navigateToPage(7),
    ),
    VSMenuItem(
      icon: Icons.settings,
      tooltip: 'Settings',
      isSelected: _selectedIndex == 8,
      onTap: () => _navigateToPage(8),
    ),
  ];

  void _navigateToPage(int index) {
    setState(() => _selectedIndex = index);
    // Navigate to corresponding page
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 280,
          child: VSMenu(
            logo: Icon(Icons.business, color: AppColors.primaryDefault),
            navigationItems: _menuItems,
            header: Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.neutralBorder),
                ),
              ),
              child: Row(
                children: [
                  VSAvatar(
                    name: 'Admin User',
                    size: VSAvatarSize.small,
                  ),
                  SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Admin User',
                          style: AppTypography.bodySmallMedium,
                        ),
                        Text(
                          'Administrator',
                          style: AppTypography.bodySmallRegular.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            // Main content area
            child: Center(
              child: Text('Selected menu index: $_selectedIndex'),
            ),
          ),
        ),
      ],
    );
  }
}
```

### Mobile Navigation Drawer
```dart
class MobileNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: VSMenu(
        logo: Icon(Icons.business, color: AppColors.primaryDefault),
        navigationItems: [
          VSMenuItem(
            icon: Icons.home,
            tooltip: 'Home',
            onTap: () => Navigator.of(context).pushNamed('/home'),
          ),
          VSMenuItem(
            icon: Icons.person,
            tooltip: 'Profile',
            onTap: () => Navigator.of(context).pushNamed('/profile'),
          ),
          VSMenuItem(
            icon: Icons.settings,
            tooltip: 'Settings',
            onTap: () => Navigator.of(context).pushNamed('/settings'),
          ),
          VSMenuItem(
            icon: Icons.help,
            tooltip: 'Help',
            onTap: () => Navigator.of(context).pushNamed('/help'),
          ),
        ],
      ),
    );
  }
}
```

## Accessibility

The VS Menu component includes comprehensive accessibility features:
- Keyboard navigation (arrow keys, Enter, Space)
- Screen reader support for menu items and sections
- Focus management and visual indicators
- ARIA labels and roles for web platforms
- High contrast support

## Design Guidelines

- Keep menu items concise and clear
- Use icons consistently across menu items
- Group related items into sections
- Limit nesting to avoid complexity
- Provide visual feedback for interactions
- Consider mobile navigation patterns

## Related Components

- **VS Tabs**: Horizontal navigation tabs
- **VS Breadcrumbs**: Navigation path indicators
- **VS Drawer**: Slide-out navigation panels
- **VS App Bar**: Top navigation bar</content>
<parameter name="filePath">c:\vs_design_system\lib\markdown2\VS_MENU_IMPLEMENTATION.md