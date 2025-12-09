import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSTabExample extends StatefulWidget {
  const VSTabExample({super.key});

  @override
  State<VSTabExample> createState() => _VSTabExampleState();
}

class _VSTabExampleState extends State<VSTabExample> {
  // Tab selections
  int _selectedBasicTab = 0;
  int _selectedIconTab = 0;
  int _selectedScrollableTab = 0;
  int _selectedDashboardTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Tab Examples',
      //   actions: [
      //     VSButton(
      //       label: 'Info',
      //       onPressed: () => _showTabInfo(context),
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
              title: 'VS Tab Variants & Configurations',
              description: 'Comprehensive demonstration of tab configurations and navigation patterns',
              child: _buildTabShowcase(),
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

  Widget _buildTabContentForIndex(int index) {
    switch (index) {
      case 0:
        return _buildTabContent(
          'Overview',
          'This is the overview tab content. It displays general information and key metrics.',
          [
            _buildMetricCard('Total Users', '12,847'),
            _buildMetricCard('Active Sessions', '3,421'),
            _buildMetricCard('Revenue', '\$45,231'),
          ],
        );
      case 1:
        return _buildTabContent(
          'Details',
          'Detailed information and comprehensive data analysis.',
          [
            _buildDetailCard('Performance', '98.5% uptime'),
            _buildDetailCard('Response Time', '245ms avg'),
            _buildDetailCard('Error Rate', '0.02%'),
          ],
        );
      case 2:
        return _buildTabContent(
          'Settings',
          'Configuration options and system preferences.',
          [
            VSButton(
              label: 'General Settings',
              onPressed: () => _showActionDialog(context, 'General Settings opened'),
              size: VSButtonSize.small,
            ),
            SizedBox(width: AppSpacing.sm),
            VSButton(
              label: 'Advanced Options',
              onPressed: () => _showActionDialog(context, 'Advanced Options opened'),
              size: VSButtonSize.small,
              variant: VSButtonVariant.outlined,
            ),
          ],
        );
      default:
        return Container();
    }
  }

  Widget _buildIconTabContentForIndex(int index) {
    switch (index) {
      case 0:
        return _buildTabContent(
          'Dashboard',
          'Main dashboard with key performance indicators.',
          [
            Icon(Icons.dashboard, color: AppColors.primaryDefault, size: 48),
            SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(
                'Welcome to your dashboard! Here you can see all your important metrics and recent activity.',
                style: AppTypography.bodyMediumRegular,
              ),
            ),
          ],
        );
      case 1:
        return _buildTabContent(
          'Analytics',
          'Detailed analytics and data visualization.',
          [
            Icon(Icons.analytics, color: AppColors.successDefault, size: 48),
            SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(
                'Analytics dashboard showing trends, user behavior, and performance metrics over time.',
                style: AppTypography.bodyMediumRegular,
              ),
            ),
          ],
        );
      case 2:
        return _buildTabContent(
          'Reports',
          'Generated reports and data exports.',
          [
            Icon(Icons.description, color: AppColors.warningDefault, size: 48),
            SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(
                'Access detailed reports, export data, and schedule automated report generation.',
                style: AppTypography.bodyMediumRegular,
              ),
            ),
          ],
        );
      case 3:
        return _buildTabContent(
          'Settings',
          'Application and user preferences.',
          [
            Icon(Icons.settings, color: AppColors.neutral600, size: 48),
            SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(
                'Configure your application settings, user preferences, and system options.',
                style: AppTypography.bodyMediumRegular,
              ),
            ),
          ],
        );
      default:
        return Container();
    }
  }

  Widget _buildScrollableTabContentForIndex(int index) {
    final months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August'];
    return _buildTabContent(
      months[index],
      'Monthly data and statistics for ${months[index]}.',
      [
        _buildMetricCard(
          'Revenue',
          '\$${(index + 1) * 15420}',
        ),
        _buildMetricCard(
          'Users',
          '${(index + 1) * 2847}',
        ),
        _buildMetricCard(
          'Growth',
          '${(index + 1) * 12.5}%',
        ),
      ],
    );
  }

  Widget _buildDashboardTabContentForIndex(int index) {
    switch (index) {
      case 0:
        return _buildTabContent(
          'Product Description',
          'Premium wireless headphones with active noise cancellation, 30-hour battery life, and premium sound quality.',
          [
            VSButton(
              label: 'Add to Cart',
              onPressed: () => _showActionDialog(context, 'Added to cart!'),
              size: VSButtonSize.small,
            ),
            SizedBox(width: AppSpacing.sm),
            VSButton(
              label: 'Buy Now',
              onPressed: () => _showActionDialog(context, 'Proceeding to checkout...'),
              size: VSButtonSize.small,
              variant: VSButtonVariant.primary,
            ),
          ],
        );
      case 1:
        return _buildTabContent(
          'Technical Specifications',
          'Bluetooth 5.0, Active Noise Cancellation, 30-hour battery, Quick charge (15 min = 3 hours), Touch controls.',
          [
            _buildSpecCard('Battery Life', '30 hours'),
            _buildSpecCard('Charging', 'USB-C, 15min=3hrs'),
            _buildSpecCard('Connectivity', 'Bluetooth 5.0'),
          ],
        );
      case 2:
        return _buildTabContent(
          'Customer Reviews',
          '4.8 out of 5 stars from 1,247 reviews. "Excellent sound quality and comfort!"',
          [
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: index < 4 ? AppColors.warningDefault : AppColors.neutral300,
                  size: 16,
                ),
              ),
            ),
            SizedBox(width: AppSpacing.sm),
            Text(
              '4.8 (1,247 reviews)',
              style: AppTypography.bodySmallRegular,
            ),
          ],
        );
      case 3:
        return _buildTabContent(
          'Shipping Information',
          'Free shipping on orders over \$50. Standard delivery: 3-5 business days. Express: 1-2 business days.',
          [
            _buildShippingCard('Standard', '3-5 days', 'Free'),
            _buildShippingCard('Express', '1-2 days', '\$9.99'),
            _buildShippingCard('Overnight', 'Next day', '\$19.99'),
          ],
        );
      case 4:
        return _buildTabContent(
          'Support & Warranty',
          '2-year warranty included. 24/7 customer support available. Easy returns within 30 days.',
          [
            VSButton(
              label: 'Contact Support',
              onPressed: () => _showActionDialog(context, 'Opening support chat...'),
              size: VSButtonSize.small,
            ),
            SizedBox(width: AppSpacing.sm),
            VSButton(
              label: 'Warranty Info',
              onPressed: () => _showActionDialog(context, 'Showing warranty details...'),
              size: VSButtonSize.small,
              variant: VSButtonVariant.outlined,
            ),
          ],
        );
      default:
        return Container();
    }
  }

  Widget _buildTabShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic Tabs
        _buildTabGroup(
          title: 'Basic Tabs',
          description: 'Standard tab implementation with text labels',
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              color: AppColors.neutral100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                VSTabBar(
                  tabs: const [
                    'Overview',
                    'Details', 
                    'Settings',
                  ],
                  onTabChanged: (index) => setState(() => _selectedBasicTab = index),
                  initialIndex: _selectedBasicTab,
                ),
                Expanded(
                  child: _buildTabContentForIndex(_selectedBasicTab),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: AppSpacing.lg),

        // Tabs with Icons
        _buildTabGroup(
          title: 'Tabs with Icons',
          description: 'Tabs featuring icons alongside text for better visual hierarchy',
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              color: AppColors.neutral100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                VSTabBar(
                  tabs: const [
                    'Dashboard',
                    'Analytics',
                    'Reports',
                    'Settings',
                  ],
                  onTabChanged: (index) => setState(() => _selectedIconTab = index),
                  initialIndex: _selectedIconTab,
                ),
                Expanded(
                  child: _buildIconTabContentForIndex(_selectedIconTab),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: AppSpacing.lg),

        // Scrollable Tabs
        _buildTabGroup(
          title: 'Scrollable Tabs',
          description: 'Tabs with horizontal scrolling for many navigation options',
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              color: AppColors.neutral100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                VSTabBar(
                  tabs: const [
                    'January',
                    'February',
                    'March',
                    'April',
                    'May',
                    'June',
                    'July',
                    'August',
                  ],
                  onTabChanged: (index) => setState(() => _selectedScrollableTab = index),
                  initialIndex: _selectedScrollableTab,
                ),
                Expanded(
                  child: _buildScrollableTabContentForIndex(_selectedScrollableTab),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: AppSpacing.lg),

        // Real-world Application Examples
        _buildTabGroup(
          title: 'Real-world Usage Examples',
          description: 'Common tab patterns in actual applications and interfaces',
          child: Column(
            children: [
              // E-commerce Product Page
              Container(
                height: 350,
                decoration: BoxDecoration(
                  color: AppColors.neutral100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        color: AppColors.neutral0,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.shopping_bag, color: AppColors.primaryDefault),
                          SizedBox(width: AppSpacing.sm),
                          Text(
                            'Product Details - Wireless Headphones',
                            style: AppTypography.bodyMediumSemibold,
                          ),
                        ],
                      ),
                    ),
                    VSTabBar(
                      tabs: const [
                        'Description',
                        'Specifications',
                        'Reviews',
                        'Shipping',
                        'Support',
                      ],
                      onTabChanged: (index) => setState(() => _selectedDashboardTab = index),
                      initialIndex: _selectedDashboardTab,
                    ),
                    Expanded(
                      child: _buildDashboardTabContentForIndex(_selectedDashboardTab),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSpacing.md),

              // Admin Dashboard
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: AppColors.neutral100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        color: AppColors.neutral0,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.admin_panel_settings, color: AppColors.primaryDefault),
                          SizedBox(width: AppSpacing.sm),
                          Text(
                            'Admin Dashboard',
                            style: AppTypography.bodyMediumSemibold,
                          ),
                        ],
                      ),
                    ),
                    VSTabBar(
                      tabs: const [
                        'Users',
                        'Analytics',
                        'Settings',
                      ],
                      onTabChanged: (index) => setState(() => _selectedBasicTab = index),
                      initialIndex: _selectedBasicTab,
                    ),
                    Expanded(
                      child: _buildTabContentForIndex(_selectedBasicTab),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSpacing.md),

              // Content Management System
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: AppColors.neutral100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        color: AppColors.neutral0,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.article, color: AppColors.successDefault),
                          SizedBox(width: AppSpacing.sm),
                          Text(
                            'Content Management',
                            style: AppTypography.bodyMediumSemibold,
                          ),
                        ],
                      ),
                    ),
                    VSTabBar(
                      tabs: const [
                        'Articles',
                        'Media',
                        'Comments',
                        'SEO',
                      ],
                      onTabChanged: (index) => setState(() => _selectedIconTab = index),
                      initialIndex: _selectedIconTab,
                    ),
                    Expanded(
                      child: _buildIconTabContentForIndex(_selectedIconTab),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: AppSpacing.lg),

        // Interactive Demo
        _buildTabGroup(
          title: 'Interactive Demo',
          description: 'Experiment with different tab configurations and see live updates',
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              color: AppColors.neutral100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(AppSpacing.md),
                  child: Row(
                    children: [
                      Text(
                        'Demo Controls',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                      const Spacer(),
                      VSButton(
                        label: 'Reset',
                        onPressed: () {
                          setState(() {
                            _selectedBasicTab = 0;
                            _selectedIconTab = 0;
                          });
                        },
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.outlined,
                      ),
                    ],
                  ),
                ),
                VSTabBar(
                  tabs: const [
                    'Tab 1',
                    'Tab 2',
                    'Tab 3',
                  ],
                  onTabChanged: (index) => setState(() => _selectedBasicTab = index),
                  initialIndex: _selectedBasicTab,
                ),
                Expanded(
                  child: _buildTabContentForIndex(_selectedBasicTab),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabGroup({
    required String title,
    required String description,
    required Widget child,
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
        child,
      ],
    );
  }

  Widget _buildTabContent(String title, String description, List<Widget> actions) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTypography.bodyLargeSemibold,
          ),
          SizedBox(height: AppSpacing.sm),
          Text(
            description,
            style: AppTypography.bodyMediumRegular,
          ),
          SizedBox(height: AppSpacing.md),
          Row(
            children: actions,
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String label, String value) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(AppSpacing.sm),
        margin: EdgeInsets.only(right: AppSpacing.sm),
        decoration: BoxDecoration(
          color: AppColors.neutral0,
          border: Border.all(color: AppColors.neutral300),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: AppTypography.bodyLargeSemibold,
            ),
            Text(
              label,
              style: AppTypography.bodySmallRegular.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard(String label, String value) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.sm),
      margin: EdgeInsets.only(bottom: AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.neutral0,
        border: Border.all(color: AppColors.neutral300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTypography.bodySmallRegular,
          ),
          Text(
            value,
            style: AppTypography.bodySmallSemibold,
          ),
        ],
      ),
    );
  }

  Widget _buildSpecCard(String label, String value) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.sm),
      margin: EdgeInsets.only(right: AppSpacing.sm, bottom: AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.neutral0,
        border: Border.all(color: AppColors.neutral300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: AppTypography.bodySmallSemibold,
          ),
          Text(
            value,
            style: AppTypography.bodySmallRegular.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShippingCard(String method, String time, String cost) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.sm),
      margin: EdgeInsets.only(right: AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.neutral0,
        border: Border.all(color: AppColors.neutral300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Text(
            method,
            style: AppTypography.bodySmallSemibold,
          ),
          Text(
            time,
            style: AppTypography.bodySmallRegular,
          ),
          Text(
            cost,
            style: AppTypography.bodySmallRegular.copyWith(
              color: AppColors.successDefault,
            ),
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

  void _showTabInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'VS Tab Information',
        message: '',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The VS Tab component provides organized navigation between different content sections with VS Design System styling.',
              style: AppTypography.bodyMediumRegular,
            ),
            SizedBox(height: AppSpacing.md),
            Text(
              'Key Features:',
              style: AppTypography.bodyMediumSemibold,
            ),
            SizedBox(height: AppSpacing.sm),
            Text(
              '• Text-only and icon + text tab variants\n'
              '• Scrollable tabs for many navigation options\n'
              '• VS Design System styling integration\n'
              '• Smooth animations and transitions\n'
              '• Proper accessibility and keyboard navigation\n'
              '• Consistent spacing and typography\n'
              '• Support for custom tab content\n'
              '• Responsive layout design\n'
              '• Theme-aware color schemes\n'
              '• Integration with TabController for state management\n'
              '• Customizable tab indicators and styling',
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