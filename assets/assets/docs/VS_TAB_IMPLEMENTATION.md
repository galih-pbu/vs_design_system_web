# VS Tab Implementation

**Version 1.0.1 - December 14, 2025**

## Overview

The VS Tab component provides organized navigation between different content sections with VS Design System styling. It offers flexible tab configurations including filled and underlined styles, multiple sizes, and support for custom actions.

## Features

- **Multiple Styles**: Filled tabs with background color and underlined tabs with bottom border
- **Flexible Sizing**: Full and half size variants for different layout needs
- **Custom Actions**: Optional action buttons in the tab bar
- **State Management**: Built-in selection state with callback support
- **VS Design System Integration**: Consistent colors, typography, and spacing
- **Accessibility**: Proper keyboard navigation and screen reader support
- **Customizable**: Background colors, padding, and styling options

## Basic Usage

```dart
import 'package:vs_design_system/vs_design_system.dart';

class TabbedInterface extends StatefulWidget {
  @override
  State<TabbedInterface> createState() => _TabbedInterfaceState();
}

class _TabbedInterfaceState extends State<TabbedInterface> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSTabBar(
          tabs: ['Overview', 'Details', 'Settings'],
          initialIndex: _selectedTab,
          onTabChanged: (index) => setState(() => _selectedTab = index),
        ),
        Expanded(
          child: _buildTabContent(_selectedTab),
        ),
      ],
    );
  }

  Widget _buildTabContent(int index) {
    switch (index) {
      case 0:
        return Center(child: Text('Overview Content'));
      case 1:
        return Center(child: Text('Details Content'));
      case 2:
        return Center(child: Text('Settings Content'));
      default:
        return Container();
    }
  }
}
```

## Styles

### Filled Style (Default)

```dart
VSTabBar(
  tabs: ['Dashboard', 'Analytics', 'Reports'],
  style: VSTabStyle.filled,
  onTabChanged: (index) => print('Selected tab: $index'),
)
```

### Underlined Style

```dart
VSTabBar(
  tabs: ['Home', 'Profile', 'Settings'],
  style: VSTabStyle.underlined,
  onTabChanged: (index) => print('Selected tab: $index'),
)
```

## Sizes

### Full Size (Default)

```dart
VSTabBar(
  tabs: ['Tab 1', 'Tab 2', 'Tab 3'],
  size: VSTabSize.full,
  onTabChanged: (index) => print('Selected tab: $index'),
)
```

### Half Size

```dart
VSTabBar(
  tabs: ['Tab 1', 'Tab 2', 'Tab 3'],
  size: VSTabSize.half,
  onTabChanged: (index) => print('Selected tab: $index'),
)
```

## Advanced Examples

### Tab Bar with Action Button

```dart
class TabbedViewWithActions extends StatefulWidget {
  @override
  State<TabbedViewWithActions> createState() => _TabbedViewWithActionsState();
}

class _TabbedViewWithActionsState extends State<TabbedViewWithActions> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSTabBar(
          tabs: ['Articles', 'Media', 'Comments'],
          initialIndex: _selectedTab,
          onTabChanged: (index) => setState(() => _selectedTab = index),
          action: VSButton(
            label: 'New',
            onPressed: () => _createNewItem(),
            size: VSButtonSize.small,
            variant: VSButtonVariant.primary,
          ),
        ),
        Expanded(
          child: _buildContent(_selectedTab),
        ),
      ],
    );
  }

  Widget _buildContent(int index) {
    switch (index) {
      case 0:
        return _buildArticlesContent();
      case 1:
        return _buildMediaContent();
      case 2:
        return _buildCommentsContent();
      default:
        return Container();
    }
  }

  Widget _buildArticlesContent() {
    return ListView(
      padding: EdgeInsets.all(AppSpacing.md),
      children: [
        Text('Articles', style: AppTypography.h4),
        // Article list items
      ],
    );
  }

  Widget _buildMediaContent() {
    return GridView.builder(
      padding: EdgeInsets.all(AppSpacing.md),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: AppSpacing.sm,
        mainAxisSpacing: AppSpacing.sm,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.neutral200,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(child: Icon(Icons.image)),
        );
      },
    );
  }

  Widget _buildCommentsContent() {
    return ListView(
      padding: EdgeInsets.all(AppSpacing.md),
      children: [
        Text('Comments', style: AppTypography.h4),
        // Comment list items
      ],
    );
  }

  void _createNewItem() {
    // Handle creating new item based on selected tab
    switch (_selectedTab) {
      case 0:
        // Create new article
        break;
      case 1:
        // Upload new media
        break;
      case 2:
        // Add new comment
        break;
    }
  }
}
```

### Custom Background and Padding

```dart
class CustomStyledTabs extends StatefulWidget {
  @override
  State<CustomStyledTabs> createState() => _CustomStyledTabsState();
}

class _CustomStyledTabsState extends State<CustomStyledTabs> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.neutral50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          VSTabBar(
            tabs: ['Overview', 'Analytics', 'Reports'],
            initialIndex: _selectedTab,
            onTabChanged: (index) => setState(() => _selectedTab = index),
            style: VSTabStyle.underlined,
            backgroundColor: AppColors.neutral50,
            padding: EdgeInsets.all(AppSpacing.md),
            action: IconButton(
              icon: Icon(Icons.more_vert, color: AppColors.textSecondary),
              onPressed: () => _showMoreOptions(context),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(AppSpacing.md),
              child: _buildTabContent(_selectedTab),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(int index) {
    final contents = [
      _buildOverviewContent(),
      _buildAnalyticsContent(),
      _buildReportsContent(),
    ];
    return contents[index];
  }

  Widget _buildOverviewContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Dashboard Overview', style: AppTypography.h4),
        SizedBox(height: AppSpacing.md),
        Row(
          children: [
            _buildMetricCard('Total Users', '12,847'),
            SizedBox(width: AppSpacing.md),
            _buildMetricCard('Revenue', '\$45,231'),
          ],
        ),
      ],
    );
  }

  Widget _buildAnalyticsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Analytics Dashboard', style: AppTypography.h4),
        SizedBox(height: AppSpacing.md),
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: AppColors.neutral100,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text('Chart Placeholder', style: AppTypography.bodyMediumRegular),
          ),
        ),
      ],
    );
  }

  Widget _buildReportsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Reports & Exports', style: AppTypography.h4),
        SizedBox(height: AppSpacing.md),
        VSButton(
          label: 'Generate Report',
          onPressed: () => print('Generating report...'),
          variant: VSButtonVariant.primary,
        ),
      ],
    );
  }

  Widget _buildMetricCard(String label, String value) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.neutral0,
          border: Border.all(color: AppColors.neutral300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(value, style: AppTypography.h3),
            Text(label, style: AppTypography.bodySmallRegular.copyWith(
              color: AppColors.textSecondary,
            )),
          ],
        ),
      ),
    );
  }

  void _showMoreOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'More Options',
        message: 'Additional actions for this section',
        actions: [
          VSDialogAction(
            label: 'Refresh',
            onPressed: () => print('Refreshing...'),
          ),
          VSDialogAction(
            label: 'Export',
            onPressed: () => print('Exporting...'),
          ),
          VSDialogAction(
            label: 'Settings',
            onPressed: () => print('Opening settings...'),
          ),
        ],
      ),
    );
  }
}
```

### Dynamic Tabs

```dart
class DynamicTabs extends StatefulWidget {
  final List<String> tabLabels;

  const DynamicTabs({super.key, required this.tabLabels});

  @override
  State<DynamicTabs> createState() => _DynamicTabsState();
}

class _DynamicTabsState extends State<DynamicTabs> {
  int _selectedTab = 0;

  @override
  void didUpdateWidget(DynamicTabs oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reset selection if current tab no longer exists
    if (_selectedTab >= widget.tabLabels.length) {
      _selectedTab = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSTabBar(
          tabs: widget.tabLabels,
          initialIndex: _selectedTab,
          onTabChanged: (index) => setState(() => _selectedTab = index),
          action: widget.tabLabels.length < 5 ? VSButton(
            label: 'Add Tab',
            onPressed: () => _addNewTab(),
            size: VSButtonSize.small,
            variant: VSButtonVariant.outlined,
          ) : null,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(AppSpacing.md),
            child: Column(
              children: [
                Text(
                  'Content for ${widget.tabLabels[_selectedTab]}',
                  style: AppTypography.h4,
                ),
                SizedBox(height: AppSpacing.md),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(AppSpacing.sm),
                        margin: EdgeInsets.only(bottom: AppSpacing.sm),
                        decoration: BoxDecoration(
                          color: AppColors.neutral100,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text('Item ${index + 1}'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _addNewTab() {
    // This would typically be handled by a parent widget
    // that manages the list of tab labels
    print('Add new tab requested');
  }
}
```

## Real-World Usage Patterns

### E-commerce Product Page

```dart
class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VSAppBar(
        title: widget.product.name,
        actions: [
          VSButton(
            label: 'Add to Cart',
            onPressed: () => _addToCart(),
            size: VSButtonSize.small,
            variant: VSButtonVariant.primary,
          ),
        ],
      ),
      body: Column(
        children: [
          // Product Image
          Container(
            height: 200,
            color: AppColors.neutral100,
            child: Center(
              child: Icon(Icons.image, size: 64, color: AppColors.neutral400),
            ),
          ),

          // Product Info
          Container(
            padding: EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.product.name, style: AppTypography.h4),
                Text('\$${widget.product.price}', style: AppTypography.h3.copyWith(
                  color: AppColors.primaryDefault,
                )),
                Row(
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          color: index < widget.product.rating.floor()
                              ? AppColors.warningDefault
                              : AppColors.neutral300,
                          size: 16,
                        );
                      }),
                    ),
                    SizedBox(width: AppSpacing.sm),
                    Text(
                      '${widget.product.rating} (${widget.product.reviewCount} reviews)',
                      style: AppTypography.bodySmallRegular,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Tabs
          VSTabBar(
            tabs: ['Description', 'Specifications', 'Reviews', 'Shipping', 'Support'],
            initialIndex: _selectedTab,
            onTabChanged: (index) => setState(() => _selectedTab = index),
            style: VSTabStyle.underlined,
          ),

          // Tab Content
          Expanded(
            child: _buildTabContent(_selectedTab),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(int index) {
    switch (index) {
      case 0:
        return _buildDescriptionTab();
      case 1:
        return _buildSpecificationsTab();
      case 2:
        return _buildReviewsTab();
      case 3:
        return _buildShippingTab();
      case 4:
        return _buildSupportTab();
      default:
        return Container();
    }
  }

  Widget _buildDescriptionTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Description', style: AppTypography.h5),
          SizedBox(height: AppSpacing.md),
          Text(widget.product.description),
          SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: widget.product.features.map((feature) {
              return VSBadge(
                label: feature,
                variant: VSBadgeVariant.secondary,
                size: VSBadgeSize.small,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecificationsTab() {
    return ListView(
      padding: EdgeInsets.all(AppSpacing.md),
      children: widget.product.specifications.entries.map((spec) {
        return Container(
          padding: EdgeInsets.all(AppSpacing.sm),
          margin: EdgeInsets.only(bottom: AppSpacing.sm),
          decoration: BoxDecoration(
            color: AppColors.neutral50,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(spec.key, style: AppTypography.bodySmallSemibold),
              Text(spec.value, style: AppTypography.bodySmallRegular),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildReviewsTab() {
    return ListView.builder(
      padding: EdgeInsets.all(AppSpacing.md),
      itemCount: widget.product.reviews.length,
      itemBuilder: (context, index) {
        final review = widget.product.reviews[index];
        return Container(
          padding: EdgeInsets.all(AppSpacing.md),
          margin: EdgeInsets.only(bottom: AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.neutral50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  VSAvatar(
                    initials: review.authorInitials,
                    size: VSAvatarSize.xsmall,
                  ),
                  SizedBox(width: AppSpacing.sm),
                  Text(review.author, style: AppTypography.bodySmallSemibold),
                  Spacer(),
                  Row(
                    children: List.generate(5, (starIndex) {
                      return Icon(
                        Icons.star,
                        color: starIndex < review.rating
                            ? AppColors.warningDefault
                            : AppColors.neutral300,
                        size: 12,
                      );
                    }),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.sm),
              Text(review.comment, style: AppTypography.bodySmallRegular),
              SizedBox(height: AppSpacing.sm),
              Text(
                review.date,
                style: AppTypography.bodyXSmallRegular.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildShippingTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Shipping Information', style: AppTypography.h5),
          SizedBox(height: AppSpacing.md),
          _buildShippingOption('Standard Shipping', '3-5 business days', '\$0.00'),
          _buildShippingOption('Express Shipping', '1-2 business days', '\$9.99'),
          _buildShippingOption('Overnight', 'Next business day', '\$19.99'),
          SizedBox(height: AppSpacing.lg),
          Container(
            padding: EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.infoBg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.info, color: AppColors.infoDefault),
                SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    'Free shipping on orders over \$50. All orders are insured and tracked.',
                    style: AppTypography.bodySmallRegular,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShippingOption(String method, String time, String cost) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md),
      margin: EdgeInsets.only(bottom: AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.neutral50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(method, style: AppTypography.bodySmallSemibold),
                Text(time, style: AppTypography.bodySmallRegular.copyWith(
                  color: AppColors.textSecondary,
                )),
              ],
            ),
          ),
          Text(cost, style: AppTypography.bodySmallSemibold.copyWith(
            color: AppColors.successDefault,
          )),
        ],
      ),
    );
  }

  Widget _buildSupportTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Support & Warranty', style: AppTypography.h5),
          SizedBox(height: AppSpacing.md),
          Container(
            padding: EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.neutral50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.verified, color: AppColors.successDefault),
                    SizedBox(width: AppSpacing.sm),
                    Text('2-Year Warranty Included', style: AppTypography.bodyMediumSemibold),
                  ],
                ),
                SizedBox(height: AppSpacing.sm),
                Text(
                  'Comprehensive warranty covering manufacturing defects and normal wear.',
                  style: AppTypography.bodySmallRegular,
                ),
              ],
            ),
          ),
          SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: VSButton(
                  label: 'Contact Support',
                  onPressed: () => _contactSupport(),
                  variant: VSButtonVariant.outlined,
                ),
              ),
              SizedBox(width: AppSpacing.sm),
              Expanded(
                child: VSButton(
                  label: 'FAQ',
                  onPressed: () => _showFAQ(),
                  variant: VSButtonVariant.outlined,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _addToCart() {
    // Add product to cart
  }

  void _contactSupport() {
    // Open support chat or contact form
  }

  void _showFAQ() {
    // Navigate to FAQ page
  }
}
```

### Admin Dashboard

```dart
class AdminDashboard extends StatefulWidget {
  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VSAppBar(
        title: 'Admin Dashboard',
        actions: [
          VSBadge(
            label: '3',
            variant: VSBadgeVariant.danger,
            size: VSBadgeSize.small,
          ),
          SizedBox(width: AppSpacing.sm),
          VSButton(
            label: 'Settings',
            onPressed: () => _openSettings(),
            size: VSButtonSize.small,
            variant: VSButtonVariant.outlined,
          ),
        ],
      ),
      body: Column(
        children: [
          VSTabBar(
            tabs: ['Users', 'Analytics', 'Reports', 'Settings'],
            initialIndex: _selectedTab,
            onTabChanged: (index) => setState(() => _selectedTab = index),
            style: VSTabStyle.underlined,
            action: Row(
              children: [
                VSButton(
                  label: 'Export',
                  onPressed: () => _exportCurrentTab(),
                  size: VSButtonSize.small,
                  variant: VSButtonVariant.outlined,
                ),
                SizedBox(width: AppSpacing.sm),
                VSButton(
                  label: 'Refresh',
                  onPressed: () => _refreshCurrentTab(),
                  size: VSButtonSize.small,
                  variant: VSButtonVariant.secondary,
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildTabContent(_selectedTab),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(int index) {
    switch (index) {
      case 0:
        return _buildUsersTab();
      case 1:
        return _buildAnalyticsTab();
      case 2:
        return _buildReportsTab();
      case 3:
        return _buildSettingsTab();
      default:
        return Container();
    }
  }

  Widget _buildUsersTab() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          color: AppColors.neutral50,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search users...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: AppSpacing.sm),
              VSButton(
                label: 'Add User',
                onPressed: () => _addUser(),
                variant: VSButtonVariant.primary,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(AppSpacing.md),
                margin: EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColors.neutral0,
                  border: Border.all(color: AppColors.neutral300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    VSAvatar(
                      initials: 'JD',
                      size: VSAvatarSize.medium,
                    ),
                    SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('John Doe', style: AppTypography.bodyMediumSemibold),
                          Text('john.doe@example.com', style: AppTypography.bodySmallRegular.copyWith(
                            color: AppColors.textSecondary,
                          )),
                        ],
                      ),
                    ),
                    VSBadge(
                      label: 'Active',
                      variant: VSBadgeVariant.success,
                      size: VSBadgeSize.small,
                    ),
                    SizedBox(width: AppSpacing.sm),
                    IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () => _showUserActions(index),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAnalyticsTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Analytics Overview', style: AppTypography.h4),
          SizedBox(height: AppSpacing.md),
          Row(
            children: [
              _buildMetricCard('Total Users', '12,847', Icons.people),
              SizedBox(width: AppSpacing.md),
              _buildMetricCard('Active Sessions', '3,421', Icons.timeline),
              SizedBox(width: AppSpacing.md),
              _buildMetricCard('Page Views', '45,231', Icons.visibility),
            ],
          ),
          SizedBox(height: AppSpacing.lg),
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: AppColors.neutral100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text('Chart Component Placeholder', style: AppTypography.bodyMediumRegular),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReportsTab() {
    return ListView(
      padding: EdgeInsets.all(AppSpacing.md),
      children: [
        Text('Available Reports', style: AppTypography.h4),
        SizedBox(height: AppSpacing.md),
        _buildReportCard('User Activity Report', 'Last generated: 2 hours ago', () => _generateUserReport()),
        _buildReportCard('Revenue Report', 'Last generated: 1 day ago', () => _generateRevenueReport()),
        _buildReportCard('System Performance', 'Last generated: 3 days ago', () => _generatePerformanceReport()),
      ],
    );
  }

  Widget _buildSettingsTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('System Settings', style: AppTypography.h4),
          SizedBox(height: AppSpacing.lg),
          _buildSettingSection('General', [
            _buildSettingItem('Site Name', 'My Application'),
            _buildSettingItem('Default Language', 'English'),
            _buildSettingItem('Timezone', 'UTC-5'),
          ]),
          SizedBox(height: AppSpacing.lg),
          _buildSettingSection('Security', [
            _buildSettingItem('Two-Factor Auth', 'Enabled'),
            _buildSettingItem('Session Timeout', '30 minutes'),
            _buildSettingItem('Password Policy', 'Strong'),
          ]),
          SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              Expanded(
                child: VSButton(
                  label: 'Save Changes',
                  onPressed: () => _saveSettings(),
                  variant: VSButtonVariant.primary,
                ),
              ),
              SizedBox(width: AppSpacing.sm),
              Expanded(
                child: VSButton(
                  label: 'Reset to Defaults',
                  onPressed: () => _resetSettings(),
                  variant: VSButtonVariant.outlined,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.neutral0,
          border: Border.all(color: AppColors.neutral300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primaryDefault, size: 24),
            SizedBox(height: AppSpacing.sm),
            Text(value, style: AppTypography.h4),
            Text(title, style: AppTypography.bodySmallRegular.copyWith(
              color: AppColors.textSecondary,
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildReportCard(String title, String subtitle, VoidCallback onGenerate) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md),
      margin: EdgeInsets.only(bottom: AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.neutral0,
        border: Border.all(color: AppColors.neutral300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.description, color: AppColors.primaryDefault),
          SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.bodyMediumSemibold),
                Text(subtitle, style: AppTypography.bodySmallRegular.copyWith(
                  color: AppColors.textSecondary,
                )),
              ],
            ),
          ),
          VSButton(
            label: 'Generate',
            onPressed: onGenerate,
            size: VSButtonSize.small,
            variant: VSButtonVariant.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildSettingSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.h5),
        SizedBox(height: AppSpacing.md),
        ...items,
      ],
    );
  }

  Widget _buildSettingItem(String label, String value) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md),
      margin: EdgeInsets.only(bottom: AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.neutral50,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTypography.bodySmallSemibold),
          Text(value, style: AppTypography.bodySmallRegular),
        ],
      ),
    );
  }

  void _openSettings() {
    // Open settings dialog
  }

  void _exportCurrentTab() {
    // Export current tab data
  }

  void _refreshCurrentTab() {
    // Refresh current tab data
  }

  void _addUser() {
    // Add new user
  }

  void _showUserActions(int index) {
    // Show user action menu
  }

  void _generateUserReport() {
    // Generate user activity report
  }

  void _generateRevenueReport() {
    // Generate revenue report
  }

  void _generatePerformanceReport() {
    // Generate performance report
  }

  void _saveSettings() {
    // Save settings
  }

  void _resetSettings() {
    // Reset settings to defaults
  }
}
```

### Content Management System

```dart
class ContentManagementSystem extends StatefulWidget {
  @override
  State<ContentManagementSystem> createState() => _ContentManagementSystemState();
}

class _ContentManagementSystemState extends State<ContentManagementSystem> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VSAppBar(
        title: 'Content Management',
        actions: [
          VSBadge(
            label: '12',
            variant: VSBadgeVariant.warning,
            size: VSBadgeSize.small,
          ),
          SizedBox(width: AppSpacing.sm),
          VSButton(
            label: 'Publish All',
            onPressed: () => _publishAll(),
            size: VSButtonSize.small,
            variant: VSButtonVariant.primary,
          ),
        ],
      ),
      body: Column(
        children: [
          VSTabBar(
            tabs: ['Articles', 'Media', 'Comments', 'SEO'],
            initialIndex: _selectedTab,
            onTabChanged: (index) => setState(() => _selectedTab = index),
            style: VSTabStyle.underlined,
            action: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () => _showFilters(),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => _showSearch(),
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildTabContent(_selectedTab),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(int index) {
    switch (index) {
      case 0:
        return _buildArticlesTab();
      case 1:
        return _buildMediaTab();
      case 2:
        return _buildCommentsTab();
      case 3:
        return _buildSEOTab();
      default:
        return Container();
    }
  }

  Widget _buildArticlesTab() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          color: AppColors.neutral50,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search articles...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: AppSpacing.sm),
              VSDropdown(
                label: 'Status',
                value: 'all',
                items: [
                  VSDropdownItem(value: 'all', label: 'All Status'),
                  VSDropdownItem(value: 'draft', label: 'Draft'),
                  VSDropdownItem(value: 'published', label: 'Published'),
                  VSDropdownItem(value: 'archived', label: 'Archived'),
                ],
                onChanged: (value) => print('Filter by status: $value'),
              ),
              SizedBox(width: AppSpacing.sm),
              VSButton(
                label: 'New Article',
                onPressed: () => _createArticle(),
                variant: VSButtonVariant.primary,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(AppSpacing.md),
                margin: EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColors.neutral0,
                  border: Border.all(color: AppColors.neutral300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColors.neutral200,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(Icons.article),
                    ),
                    SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Article Title ${index + 1}',
                            style: AppTypography.bodyMediumSemibold,
                          ),
                          Text(
                            'Published 2 days ago • By John Doe',
                            style: AppTypography.bodySmallRegular.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    VSBadge(
                      label: index % 3 == 0 ? 'Draft' : 'Published',
                      variant: index % 3 == 0 ? VSBadgeVariant.warning : VSBadgeVariant.success,
                      size: VSBadgeSize.small,
                    ),
                    SizedBox(width: AppSpacing.sm),
                    IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () => _showArticleActions(index),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMediaTab() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          color: AppColors.neutral50,
          child: Row(
            children: [
              VSButton(
                label: 'Upload Media',
                onPressed: () => _uploadMedia(),
                variant: VSButtonVariant.primary,
              ),
              Spacer(),
              Text('Grid View', style: AppTypography.bodySmallRegular),
              Switch(value: true, onChanged: (value) {}),
              SizedBox(width: AppSpacing.sm),
              Text('List View', style: AppTypography.bodySmallRegular),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(AppSpacing.md),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: AppSpacing.sm,
              mainAxisSpacing: AppSpacing.sm,
            ),
            itemCount: 24,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.neutral200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        index % 3 == 0 ? Icons.image : index % 3 == 1 ? Icons.video_file : Icons.audio_file,
                        size: 32,
                        color: AppColors.neutral400,
                      ),
                    ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: IconButton(
                        icon: Icon(Icons.more_vert, size: 16),
                        onPressed: () => _showMediaActions(index),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCommentsTab() {
    return ListView(
      padding: EdgeInsets.all(AppSpacing.md),
      children: [
        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          color: AppColors.neutral50,
          child: Row(
            children: [
              VSBadge(
                label: '24',
                variant: VSBadgeVariant.warning,
                size: VSBadgeSize.small,
              ),
              SizedBox(width: AppSpacing.sm),
              Text('Pending Comments', style: AppTypography.bodyMediumSemibold),
              Spacer(),
              VSButton(
                label: 'Moderate All',
                onPressed: () => _moderateAllComments(),
                size: VSButtonSize.small,
                variant: VSButtonVariant.primary,
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.md),
        ...List.generate(10, (index) {
          return Container(
            padding: EdgeInsets.all(AppSpacing.md),
            margin: EdgeInsets.only(bottom: AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.neutral0,
              border: Border.all(color: AppColors.neutral300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    VSAvatar(
                      initials: 'JD',
                      size: VSAvatarSize.small,
                    ),
                    SizedBox(width: AppSpacing.sm),
                    Text('John Doe', style: AppTypography.bodySmallSemibold),
                    Spacer(),
                    Text('2 hours ago', style: AppTypography.bodyXSmallRegular.copyWith(
                      color: AppColors.textSecondary,
                    )),
                  ],
                ),
                SizedBox(height: AppSpacing.sm),
                Text(
                  'This is a sample comment that needs moderation. It contains some text that might be relevant to the article content.',
                  style: AppTypography.bodySmallRegular,
                ),
                SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    VSButton(
                      label: 'Approve',
                      onPressed: () => _approveComment(index),
                      size: VSButtonSize.xsmall,
                      variant: VSButtonVariant.success,
                    ),
                    SizedBox(width: AppSpacing.sm),
                    VSButton(
                      label: 'Reject',
                      onPressed: () => _rejectComment(index),
                      size: VSButtonSize.xsmall,
                      variant: VSButtonVariant.danger,
                    ),
                    SizedBox(width: AppSpacing.sm),
                    VSButton(
                      label: 'Edit',
                      onPressed: () => _editComment(index),
                      size: VSButtonSize.xsmall,
                      variant: VSButtonVariant.outlined,
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildSEOTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('SEO Settings', style: AppTypography.h4),
          SizedBox(height: AppSpacing.md),
          Container(
            padding: EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.neutral50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Global SEO Settings', style: AppTypography.bodyLargeSemibold),
                SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    Expanded(
                      child: VSInputField(
                        label: 'Site Title',
                        initialValue: 'My Content Site',
                      ),
                    ),
                    SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: VSInputField(
                        label: 'Site Description',
                        initialValue: 'A comprehensive content management platform',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.md),
                VSInputField(
                  label: 'Default Meta Keywords',
                  initialValue: 'content, management, cms, articles',
                ),
              ],
            ),
          ),
          SizedBox(height: AppSpacing.lg),
          Text('SEO Analysis', style: AppTypography.h5),
          SizedBox(height: AppSpacing.md),
          Row(
            children: [
              _buildSEOStat('Pages Optimized', '87%', VSBadgeVariant.success),
              SizedBox(width: AppSpacing.md),
              _buildSEOStat('Missing Alt Tags', '23', VSBadgeVariant.warning),
              SizedBox(width: AppSpacing.md),
              _buildSEOStat('Broken Links', '5', VSBadgeVariant.danger),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSEOStat(String label, String value, VSBadgeVariant variant) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.neutral0,
          border: Border.all(color: AppColors.neutral300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            VSBadge(
              label: value,
              variant: variant,
              size: VSBadgeSize.medium,
            ),
            SizedBox(height: AppSpacing.sm),
            Text(label, style: AppTypography.bodySmallRegular.copyWith(
              color: AppColors.textSecondary,
            )),
          ],
        ),
      ),
    );
  }

  void _publishAll() {
    // Publish all pending content
  }

  void _showFilters() {
    // Show filter dialog
  }

  void _showSearch() {
    // Show search dialog
  }

  void _createArticle() {
    // Create new article
  }

  void _showArticleActions(int index) {
    // Show article actions menu
  }

  void _uploadMedia() {
    // Upload media files
  }

  void _showMediaActions(int index) {
    // Show media actions menu
  }

  void _moderateAllComments() {
    // Moderate all pending comments
  }

  void _approveComment(int index) {
    // Approve comment
  }

  void _rejectComment(int index) {
    // Reject comment
  }

  void _editComment(int index) {
    // Edit comment
  }
}
```

## Configuration Options

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `tabs` | `List<String>` | Required | List of tab labels to display |
| `initialIndex` | `int` | `0` | Initial selected tab index |
| `onTabChanged` | `ValueChanged<int>?` | `null` | Callback when tab selection changes |
| `size` | `VSTabSize` | `VSTabSize.full` | Size variant for tabs |
| `style` | `VSTabStyle` | `VSTabStyle.filled` | Visual style variant |
| `action` | `Widget?` | `null` | Optional widget displayed on the right side |
| `backgroundColor` | `Color?` | `null` | Custom background color for the tab bar |
| `padding` | `EdgeInsetsGeometry?` | `null` | Custom padding for the tab bar |

## Best Practices

### When to Use Tabs

- **Content Organization**: When you have related content sections that users need to switch between
- **Space Efficiency**: When you want to show different views without navigation
- **Progressive Disclosure**: When you want to avoid overwhelming users with too much information at once
- **Frequent Switching**: When users need to compare or reference multiple content sections

### Design Guidelines

- **Clear Labels**: Use concise, descriptive tab labels that clearly indicate content
- **Logical Order**: Arrange tabs in a logical sequence (most important first)
- **Consistent Styling**: Maintain consistent tab styling across your application
- **Visual Hierarchy**: Use appropriate tab styles (filled for primary content, underlined for secondary)
- **Limited Tabs**: Avoid too many tabs; consider alternative navigation for 5+ sections

### Implementation Tips

- **State Management**: Use stateful widgets to manage tab selection and content
- **Lazy Loading**: Load tab content only when needed to improve performance
- **Persistence**: Consider persisting tab selection across app sessions for better UX
- **Accessibility**: Ensure proper keyboard navigation and screen reader support
- **Responsive Design**: Consider how tabs behave on different screen sizes

## Accessibility

- **Keyboard Navigation**: Full keyboard support with Tab and arrow keys
- **Screen Reader**: Proper labeling and role announcements for tabs
- **Focus Management**: Clear focus indicators and logical tab order
- **Semantic HTML**: Proper tab and tabpanel semantics
- **Color Contrast**: Sufficient contrast for all interactive states

## Integration with VS Design System

The VS Tab component integrates seamlessly with other VS Design System components:

- **VSButton**: For actions within tab content or tab bar actions
- **VSDropdown**: For filtering or additional options in tab content
- **VSBadge**: For status indicators and counts in tab content
- **VSAvatar**: For user information displays in tab content
- **VSInputField**: For search and filter inputs in tab content
- **AppColors**: Consistent color scheme across tab states
- **AppTypography**: Standardized text styling for tab labels and content
- **AppSpacing**: Consistent spacing and layout within tabs

## Migration Guide

### From Flutter TabBar

```dart
// Before: Flutter TabBar
DefaultTabController(
  length: 3,
  child: Column(
    children: [
      TabBar(
        tabs: [
          Tab(text: 'Tab 1'),
          Tab(text: 'Tab 2'),
          Tab(text: 'Tab 3'),
        ],
      ),
      Expanded(
        child: TabBarView(
          children: [
            Container(child: Text('Content 1')),
            Container(child: Text('Content 2')),
            Container(child: Text('Content 3')),
          ],
        ),
      ),
    ],
  ),
)

// After: VS Tab
class MyTabbedWidget extends StatefulWidget {
  @override
  State<MyTabbedWidget> createState() => _MyTabbedWidgetState();
}

class _MyTabbedWidgetState extends State<MyTabbedWidget> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSTabBar(
          tabs: ['Tab 1', 'Tab 2', 'Tab 3'],
          initialIndex: _selectedTab,
          onTabChanged: (index) => setState(() => _selectedTab = index),
        ),
        Expanded(
          child: _buildTabContent(_selectedTab),
        ),
      ],
    );
  }

  Widget _buildTabContent(int index) {
    final contents = [
      Container(child: Text('Content 1')),
      Container(child: Text('Content 2')),
      Container(child: Text('Content 3')),
    ];
    return contents[index];
  }
}
```

### From Custom Tab Implementation

```dart
// Before: Custom tab implementation
class CustomTabs extends StatefulWidget {
  final List<String> tabLabels;
  final List<Widget> tabContents;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: List.generate(tabLabels.length, (index) {
            return GestureDetector(
              onTap: () => setState(() => _selectedIndex = index),
              child: Container(
                padding: EdgeInsets.all(16),
                color: _selectedIndex == index ? Colors.blue : Colors.grey,
                child: Text(tabLabels[index]),
              ),
            );
          }),
        ),
        Expanded(child: tabContents[_selectedIndex]),
      ],
    );
  }
}

// After: VS Tab
VSTabBar(
  tabs: tabLabels,
  initialIndex: _selectedIndex,
  onTabChanged: (index) => setState(() => _selectedIndex = index),
)
// Tab content remains the same
```

### From BottomNavigationBar

```dart
// Before: BottomNavigationBar
Scaffold(
  bottomNavigationBar: BottomNavigationBar(
    currentIndex: _selectedIndex,
    onTap: (index) => setState(() => _selectedIndex = index),
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      BottomNavigationBarItem(icon: Icon(Icons.profile), label: 'Profile'),
    ],
  ),
  body: _buildContent(_selectedIndex),
)

// After: VS Tab (for top navigation)
Scaffold(
  appBar: AppBar(
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(48),
      child: VSTabBar(
        tabs: ['Home', 'Search', 'Profile'],
        initialIndex: _selectedIndex,
        onTabChanged: (index) => setState(() => _selectedIndex = index),
        style: VSTabStyle.underlined,
      ),
    ),
  ),
  body: _buildContent(_selectedIndex),
)
```