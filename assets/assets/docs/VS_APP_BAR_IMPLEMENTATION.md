# VS App Bar

The VS App Bar component provides consistent top navigation bars with customizable content, actions, and styling for different screen contexts.

## Overview

The `VSAppBar` widget creates application bars for top navigation with support for titles, actions, back buttons, and various configurations for different use cases.

## Features

- **Multiple Types**: Main app bar, detail page bar, and custom configurations
- **Back Navigation**: Automatic back button with custom actions
- **Action Buttons**: Flexible action button placement
- **Custom Content**: Support for custom leading/trailing widgets
- **Elevation Control**: Configurable shadow and elevation
- **Responsive Design**: Adapts to different screen sizes
- **Accessibility**: Screen reader support and keyboard navigation

## Basic Usage

```dart
Scaffold(
  appBar: VSAppBar(
    title: 'Page Title',
  ),
  body: // Your content
)
```

## App Bar Types

### Main App Bar
Primary navigation bar for main screens.

```dart
VSAppBar.main(
  title: 'Dashboard',
  actions: [
    VSButton(
      label: 'Settings',
      onPressed: () => navigateToSettings(),
      variant: VSButtonVariant.secondary,
      size: VSButtonSize.small,
    ),
  ],
)
```

### Detail App Bar
Navigation bar for detail/sub-pages with back button.

```dart
VSAppBar.detail(
  title: 'User Profile',
  onBack: () => Navigator.of(context).pop(),
  actions: [
    VSButton(
      label: 'Edit',
      onPressed: () => openEditMode(),
      variant: VSButtonVariant.secondary,
      size: VSButtonSize.small,
    ),
  ],
)
```

### Custom App Bar
Fully customizable app bar with custom content.

```dart
VSAppBar(
  title: 'Custom App Bar',
  leading: IconButton(
    icon: Icon(Icons.menu),
    onPressed: () => scaffoldKey.currentState?.openDrawer(),
  ),
  actions: [
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () => showSearch(),
    ),
    IconButton(
      icon: Icon(Icons.more_vert),
      onPressed: () => showMenu(),
    ),
  ],
)
```

## Configuration Options

### With Search
App bar with integrated search functionality.

```dart
VSAppBar(
  title: 'Products',
  actions: [
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () => showSearchDialog(),
    ),
  ],
)
```

### With Profile Menu
App bar with user profile and menu options.

```dart
VSAppBar(
  title: 'My App',
  actions: [
    PopupMenuButton<String>(
      onSelected: (value) {
        switch (value) {
          case 'profile':
            navigateToProfile();
            break;
          case 'settings':
            navigateToSettings();
            break;
          case 'logout':
            handleLogout();
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'profile',
          child: Row(
            children: [
              Icon(Icons.person),
              SizedBox(width: 8),
              Text('Profile'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'settings',
          child: Row(
            children: [
              Icon(Icons.settings),
              SizedBox(width: 8),
              Text('Settings'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'logout',
          child: Row(
            children: [
              Icon(Icons.logout),
              SizedBox(width: 8),
              Text('Logout'),
            ],
          ),
        ),
      ],
      child: VSAvatar(
        name: 'John Doe',
        size: VSAvatarSize.small,
      ),
    ),
  ],
)
```

### With Notifications
App bar with notification badge.

```dart
VSAppBar(
  title: 'Messages',
  actions: [
    Stack(
      children: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () => openNotifications(),
        ),
        Positioned(
          right: 8,
          top: 8,
          child: VSBadge(
            label: '3',
            variant: VSBadgeVariant.danger,
            size: VSBadgeSize.small,
          ),
        ),
      ],
    ),
  ],
)
```

## Advanced Usage

### Tabbed App Bar
App bar with integrated tabs.

```dart
class TabbedScreen extends StatefulWidget {
  @override
  _TabbedScreenState createState() => _TabbedScreenState();
}

class _TabbedScreenState extends State<TabbedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VSAppBar(
        title: 'Tabbed Content',
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
            Tab(text: 'Tab 3'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text('Content 1')),
          Center(child: Text('Content 2')),
          Center(child: Text('Content 3')),
        ],
      ),
    );
  }
}
```

### Search App Bar
Expandable search interface.

```dart
class SearchableAppBar extends StatefulWidget {
  @override
  _SearchableAppBarState createState() => _SearchableAppBarState();
}

class _SearchableAppBarState extends State<SearchableAppBar> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isSearching
          ? VSAppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => setState(() => _isSearching = false),
              ),
              title: VSInputField(
                controller: _searchController,
                hintText: 'Search...',
                type: VSInputFieldType.search,
                onChanged: (value) => performSearch(value),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    performSearch('');
                  },
                ),
              ],
            )
          : VSAppBar(
              title: 'Products',
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => setState(() => _isSearching = true),
                ),
              ],
            ),
      body: // Search results or product list
    );
  }

  void performSearch(String query) {
    // Implement search logic
  }
}
```

### Multi-level Navigation
App bar with breadcrumb navigation.

```dart
class BreadcrumbAppBar extends StatelessWidget {
  final List<String> breadcrumbs;
  final Function(int) onBreadcrumbTap;

  const BreadcrumbAppBar({
    required this.breadcrumbs,
    required this.onBreadcrumbTap,
  });

  @override
  Widget build(BuildContext context) {
    return VSAppBar(
      title: Row(
        children: [
          for (int i = 0; i < breadcrumbs.length; i++) ...[
            if (i > 0) Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.chevron_right, size: 16),
            ),
            InkWell(
              onTap: () => onBreadcrumbTap(i),
              child: Text(
                breadcrumbs[i],
                style: i == breadcrumbs.length - 1
                    ? AppTypography.bodyMediumMedium
                    : AppTypography.bodyMediumRegular.copyWith(
                        color: AppColors.primaryDefault,
                      ),
              ),
            ),
          ],
        ],
      ),
      leading: IconButton(
        icon: Icon(Icons.home),
        onPressed: () => onBreadcrumbTap(0),
      ),
    );
  }
}
```

## Theming and Styling

### Custom Colors
Override default app bar colors.

```dart
VSAppBar(
  title: 'Custom Styled',
  backgroundColor: AppColors.secondaryDefault,
  foregroundColor: Colors.white,
  elevation: 4,
)
```

### Transparent App Bar
App bar that blends with content.

```dart
Scaffold(
  extendBodyBehindAppBar: true,
  appBar: VSAppBar(
    title: 'Transparent',
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: Colors.white,
  ),
  body: // Content with background image
)
```

## Responsive Design

### Mobile App Bar
Simplified app bar for mobile screens.

```dart
VSAppBar(
  title: 'Mobile App',
  leading: IconButton(
    icon: Icon(Icons.menu),
    onPressed: () => scaffoldKey.currentState?.openDrawer(),
  ),
  actions: [
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () => showSearch(),
    ),
  ],
)
```

### Desktop App Bar
More complex app bar for desktop layouts.

```dart
VSAppBar(
  title: 'Desktop Application',
  leading: Row(
    children: [
      IconButton(
        icon: Icon(Icons.menu),
        onPressed: () => toggleSidebar(),
      ),
      VerticalDivider(),
    ],
  ),
  actions: [
    IconButton(
      icon: Icon(Icons.notifications),
      onPressed: () => showNotifications(),
    ),
    IconButton(
      icon: Icon(Icons.settings),
      onPressed: () => openSettings(),
    ),
    SizedBox(width: 16),
    VSAvatar(
      name: 'John Doe',
      size: VSAvatarSize.small,
    ),
  ],
)
```

## Accessibility

The VS App Bar component includes comprehensive accessibility features:
- Proper heading hierarchy for screen readers
- Keyboard navigation support
- Focus management for interactive elements
- ARIA labels and descriptions

## Design Guidelines

- Keep titles concise and descriptive
- Use consistent action button patterns
- Provide clear navigation cues
- Consider content hierarchy
- Test on different screen sizes
- Maintain adequate touch targets

## Related Components

- **VS Drawer**: Side navigation panel
- **VS Menu**: Vertical navigation menu
- **VS Tabs**: Horizontal tab navigation
- **VS Breadcrumbs**: Navigation path indicators</content>
<parameter name="filePath">c:\vs_design_system\lib\markdown2\VS_APP_BAR_IMPLEMENTATION.md