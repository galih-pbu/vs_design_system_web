import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSPaginationExample extends StatefulWidget {
  const VSPaginationExample({super.key});

  @override
  State<VSPaginationExample> createState() => _VSPaginationExampleState();
}

class _VSPaginationExampleState extends State<VSPaginationExample> {
  int _currentPage = 1;
  int _totalItems = 1250;
  int _itemsPerPage = 15;
  List<int> _itemsPerPageOptions = [15, 50, 100];

  // Sample data for demonstration
  late List<Map<String, dynamic>> _sampleData;

  @override
  void initState() {
    super.initState();
    _generateSampleData();
  }

  void _generateSampleData() {
    _sampleData = List.generate(
      _totalItems,
      (index) => {
        'id': index + 1,
        'name': 'Item ${index + 1}',
        'category': ['Electronics', 'Clothing', 'Books', 'Home', 'Sports'][index % 5],
        'price': (index + 1) * 10.99,
        'status': ['Active', 'Inactive', 'Pending'][index % 3],
      },
    );
  }

  List<Map<String, dynamic>> get _currentPageData {
    final startIndex = (_currentPage - 1) * _itemsPerPage;
    final endIndex = startIndex + _itemsPerPage;
    return _sampleData.sublist(
      startIndex,
      endIndex > _sampleData.length ? _sampleData.length : endIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Pagination Examples',
      //   actions: [
      //     VSButton(
      //       label: 'Info',
      //       onPressed: () => _showPaginationInfo(context),
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
              title: 'VS Pagination Variants & Types',
              description: 'Comprehensive demonstration of pagination configurations and real-world usage patterns',
              child: _buildPaginationShowcase(),
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

  Widget _buildPaginationShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic Pagination
        _buildPaginationGroup(
          title: 'Basic Pagination',
          description: 'Standard pagination with navigation and item count',
          children: [
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  VSPagination(
                    currentPage: _currentPage,
                    totalItems: _totalItems,
                    itemsPerPage: _itemsPerPage,
                    onPageChanged: (page) => setState(() => _currentPage = page),
                    onItemsPerPageChanged: (itemsPerPage) => setState(() {
                      _itemsPerPage = itemsPerPage;
                      _currentPage = 1; // Reset to first page
                    }),
                    itemsPerPageOptions: _itemsPerPageOptions,
                  ),
                  SizedBox(height: AppSpacing.md),
                  Container(
                    padding: EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Page $_currentPage of ${(totalPages).ceil()} • '
                      'Showing ${startItem}-${endItem} of $_totalItems items',
                      style: AppTypography.bodySmallRegular,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Configuration Controls
        _buildPaginationGroup(
          title: 'Configuration Controls',
          description: 'Adjust pagination settings and see live updates',
          children: [
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Items',
                      style: AppTypography.bodySmallSemibold,
                    ),
                    SizedBox(height: AppSpacing.xs),
                    Row(
                      children: [
                        VSButton(
                          label: '-100',
                          onPressed: () => setState(() {
                            _totalItems = (_totalItems - 100).clamp(10, 10000);
                            _currentPage = 1;
                            _generateSampleData();
                          }),
                          size: VSButtonSize.small,
                          variant: VSButtonVariant.outlined,
                        ),
                        SizedBox(width: AppSpacing.xs),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
                          decoration: BoxDecoration(
                            color: AppColors.neutral0,
                            border: Border.all(color: AppColors.neutral300),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            _totalItems.toString(),
                            style: AppTypography.bodySmallRegular,
                          ),
                        ),
                        SizedBox(width: AppSpacing.xs),
                        VSButton(
                          label: '+100',
                          onPressed: () => setState(() {
                            _totalItems = (_totalItems + 100).clamp(10, 10000);
                            _currentPage = 1;
                            _generateSampleData();
                          }),
                          size: VSButtonSize.small,
                          variant: VSButtonVariant.outlined,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Items Per Page',
                      style: AppTypography.bodySmallSemibold,
                    ),
                    SizedBox(height: AppSpacing.xs),
                    Wrap(
                      spacing: AppSpacing.xs,
                      children: [10, 25, 50, 100].map((option) => VSButton(
                        label: option.toString(),
                        onPressed: () => setState(() {
                          _itemsPerPage = option;
                          _currentPage = 1;
                        }),
                        size: VSButtonSize.small,
                        variant: _itemsPerPage == option ? VSButtonVariant.primary : VSButtonVariant.outlined,
                      )).toList(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Data Table with Pagination
        _buildPaginationGroup(
          title: 'Data Table with Pagination',
          description: 'Complete data table implementation with pagination controls',
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.neutral0,
                border: Border.all(color: AppColors.neutral300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  // Table Header
                  Container(
                    padding: EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.neutral100,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'ID',
                            style: AppTypography.bodySmallSemibold,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            'Name',
                            style: AppTypography.bodySmallSemibold,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Category',
                            style: AppTypography.bodySmallSemibold,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Price',
                            style: AppTypography.bodySmallSemibold,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Status',
                            style: AppTypography.bodySmallSemibold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Table Rows
                  ..._currentPageData.map((item) => Container(
                    padding: EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppColors.neutral200),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            item['id'].toString(),
                            style: AppTypography.bodySmallRegular,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            item['name'],
                            style: AppTypography.bodySmallRegular,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: VSChip(
                              label: item['category'],
                              type: VSChipType.color,
                              variant: VSChipVariant.primary,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '\$${item['price'].toStringAsFixed(2)}',
                            style: AppTypography.bodySmallRegular,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: VSChip(
                              label: item['status'],
                              type: VSChipType.color,
                              variant: item['status'] == 'Active'
                                  ? VSChipVariant.success
                                  : item['status'] == 'Pending'
                                      ? VSChipVariant.warning
                                      : VSChipVariant.neutral,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),

                  // Pagination
                  Container(
                    padding: EdgeInsets.all(AppSpacing.md),
                    child: VSPagination(
                      currentPage: _currentPage,
                      totalItems: _totalItems,
                      itemsPerPage: _itemsPerPage,
                      onPageChanged: (page) => setState(() => _currentPage = page),
                      onItemsPerPageChanged: (itemsPerPage) => setState(() {
                        _itemsPerPage = itemsPerPage;
                        _currentPage = 1;
                      }),
                      itemsPerPageOptions: _itemsPerPageOptions,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Real-world Usage Examples
        _buildPaginationGroup(
          title: 'Real-world Usage Examples',
          description: 'Common pagination patterns in application interfaces',
          children: [
            // E-commerce Product Listing
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
                    'E-commerce Product Catalog',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Icon(Icons.shopping_bag, color: AppColors.secondaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text('1,247 Products Found', style: AppTypography.bodyMediumRegular),
                      const Spacer(),
                      const VSBadge(
                        label: 'PAGE 3 OF 83',
                        variant: VSBadgeVariant.secondary,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      border: Border.all(color: AppColors.neutral300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.inventory, color: AppColors.secondaryDefault, size: 48),
                          SizedBox(height: AppSpacing.sm),
                          Text(
                            'Product Grid View',
                            style: AppTypography.bodyMediumSemibold,
                          ),
                          Text(
                            'Showing products 31-45 of 1,247',
                            style: AppTypography.bodySmallRegular.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSPagination(
                    currentPage: 3,
                    totalItems: 1247,
                    itemsPerPage: 15,
                    itemsPerPageOptions: [12, 24, 36, 48],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // User Management Dashboard
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
                    'User Management System',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Icon(Icons.people, color: AppColors.primaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text('User Directory', style: AppTypography.bodyMediumRegular),
                      const Spacer(),
                      const VSBadge(
                        label: '15 PER PAGE',
                        variant: VSBadgeVariant.primary,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      border: Border.all(color: AppColors.neutral300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.all(AppSpacing.sm),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: AppColors.neutral200),
                          ),
                        ),
                        child: Row(
                          children: [
                            VSAvatar(
                              size: VSAvatarSize.medium,
                              initials: 'U${index + 1}',
                            ),
                            SizedBox(width: AppSpacing.sm),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'User ${index + 1}',
                                    style: AppTypography.bodySmallSemibold,
                                  ),
                                  Text(
                                    'user${index + 1}@example.com',
                                    style: AppTypography.bodySmallRegular.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            VSChip(
                              label: ['Active', 'Inactive', 'Pending'][index % 3],
                              type: VSChipType.color,
                              variant: index % 3 == 0
                                  ? VSChipVariant.success
                                  : index % 3 == 1
                                      ? VSChipVariant.neutral
                                      : VSChipVariant.warning,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSPagination(
                    currentPage: 2,
                    totalItems: 487,
                    itemsPerPage: 15,
                    itemsPerPageOptions: [10, 15, 25, 50],
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
                    'Content Management System',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Icon(Icons.article, color: AppColors.successDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text('Blog Posts', style: AppTypography.bodyMediumRegular),
                      const Spacer(),
                      const VSBadge(
                        label: 'SORTED BY DATE',
                        variant: VSBadgeVariant.success,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      border: Border.all(color: AppColors.neutral300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.all(AppSpacing.sm),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: AppColors.neutral200),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: AppColors.primaryBg,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Icon(
                                Icons.article,
                                color: AppColors.primaryDefault,
                                size: 20,
                              ),
                            ),
                            SizedBox(width: AppSpacing.sm),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Blog Post Title ${index + 1}',
                                    style: AppTypography.bodySmallSemibold,
                                  ),
                                  Text(
                                    'Published ${index + 1} day${index == 0 ? '' : 's'} ago',
                                    style: AppTypography.bodySmallRegular.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            VSChip(
                              label: ['Published', 'Draft', 'Scheduled'][index % 3],
                              type: VSChipType.color,
                              variant: index % 3 == 0
                                  ? VSChipVariant.success
                                  : index % 3 == 1
                                      ? VSChipVariant.neutral
                                      : VSChipVariant.warning,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSPagination(
                    currentPage: 1,
                    totalItems: 89,
                    itemsPerPage: 10,
                    itemsPerPageOptions: [5, 10, 20, 50],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Analytics Dashboard
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
                    'Analytics Dashboard',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Icon(Icons.analytics, color: AppColors.warningDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text('Performance Reports', style: AppTypography.bodyMediumRegular),
                      const Spacer(),
                      const VSBadge(
                        label: 'LAST 30 DAYS',
                        variant: VSBadgeVariant.warning,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      border: Border.all(color: AppColors.neutral300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.bar_chart, color: AppColors.warningDefault, size: 32),
                          SizedBox(height: AppSpacing.xs),
                          Text(
                            'Analytics Charts',
                            style: AppTypography.bodySmallSemibold,
                          ),
                          Text(
                            'Page 5 of 12 • 50 reports per page',
                            style: AppTypography.bodySmallRegular.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSPagination(
                    currentPage: 5,
                    totalItems: 573,
                    itemsPerPage: 50,
                    itemsPerPageOptions: [25, 50, 100],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Search Results
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
                    'Search Results',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Icon(Icons.search, color: AppColors.primaryDefault),
                      SizedBox(width: AppSpacing.sm),
                      Text('Search Results for "design system"', style: AppTypography.bodyMediumRegular),
                      const Spacer(),
                      const VSBadge(
                        label: '1,203 RESULTS',
                        variant: VSBadgeVariant.primary,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Container(
                    height: 160,
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      border: Border.all(color: AppColors.neutral300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.all(AppSpacing.sm),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: AppColors.neutral200),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: AppColors.primaryBg,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Icon(
                                Icons.description,
                                color: AppColors.primaryDefault,
                                size: 16,
                              ),
                            ),
                            SizedBox(width: AppSpacing.sm),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Result ${index + 1}: Design System Documentation',
                                    style: AppTypography.bodySmallSemibold,
                                  ),
                                  Text(
                                    'Comprehensive guide to design systems and component libraries...',
                                    style: AppTypography.bodySmallRegular.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSPagination(
                    currentPage: 7,
                    totalItems: 1203,
                    itemsPerPage: 20,
                    itemsPerPageOptions: [10, 20, 50, 100],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPaginationGroup({
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

  int get totalPages => (_totalItems / _itemsPerPage).ceil();
  int get startItem => _totalItems == 0 ? 0 : ((_currentPage - 1) * _itemsPerPage) + 1;
  int get endItem {
    final end = _currentPage * _itemsPerPage;
    return end > _totalItems ? _totalItems : end;
  }

}
