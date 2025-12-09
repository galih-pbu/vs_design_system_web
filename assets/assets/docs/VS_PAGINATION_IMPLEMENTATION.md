# VS Pagination Implementation

## Overview

The VS Pagination component provides navigation controls for paged content with item count display and customizable items per page options. It displays page navigation buttons, current page indicators, and allows users to change the number of items shown per page.

## Features

- **Page Navigation**: Previous/next buttons with first/last page skip options
- **Page Numbers**: Clickable page number buttons with smart ellipsis for large page counts
- **Item Count Display**: Shows current range and total items (e.g., "Item 1 to 15 of 1,250 items")
- **Items Per Page Selector**: Dropdown to change items per page with customizable options
- **Responsive Design**: Adapts to different screen sizes with proper spacing
- **VS Design System Integration**: Consistent colors, typography, and spacing
- **Accessibility**: Keyboard navigation support and proper semantic structure
- **Smart Page Display**: Automatically handles ellipsis for large numbers of pages

## Basic Usage

```dart
import 'package:vs_design_system/vs_design_system.dart';

class ProductListPage extends StatefulWidget {
  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  int _currentPage = 1;
  int _totalItems = 1250;
  int _itemsPerPage = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Your content list here
          Expanded(
            child: ListView.builder(
              itemCount: _itemsPerPage,
              itemBuilder: (context, index) {
                final itemIndex = (_currentPage - 1) * _itemsPerPage + index;
                return ListTile(
                  title: Text('Item ${itemIndex + 1}'),
                );
              },
            ),
          ),

          // Pagination controls
          VSPagination(
            currentPage: _currentPage,
            totalItems: _totalItems,
            itemsPerPage: _itemsPerPage,
            onPageChanged: (page) {
              setState(() => _currentPage = page);
            },
            onItemsPerPageChanged: (itemsPerPage) {
              setState(() {
                _itemsPerPage = itemsPerPage;
                _currentPage = 1; // Reset to first page
              });
            },
          ),
        ],
      ),
    );
  }
}
```

## Variants

### Basic Pagination

```dart
VSPagination(
  currentPage: 1,
  totalItems: 150,
  itemsPerPage: 10,
  onPageChanged: (page) => print('Page changed to: $page'),
)
```

### Custom Items Per Page Options

```dart
VSPagination(
  currentPage: _currentPage,
  totalItems: _totalItems,
  itemsPerPage: _itemsPerPage,
  itemsPerPageOptions: [5, 10, 25, 50, 100],
  onPageChanged: (page) => setState(() => _currentPage = page),
  onItemsPerPageChanged: (itemsPerPage) => setState(() {
    _itemsPerPage = itemsPerPage;
    _currentPage = 1;
  }),
)
```

### Large Dataset Pagination

```dart
VSPagination(
  currentPage: 42,
  totalItems: 15420,
  itemsPerPage: 50,
  itemsPerPageOptions: [25, 50, 100, 200],
  onPageChanged: (page) => loadPageData(page),
  onItemsPerPageChanged: (itemsPerPage) => loadPageData(1, itemsPerPage),
)
```

## Advanced Examples

### Data Table with Pagination

```dart
class DataTableWithPagination extends StatefulWidget {
  @override
  State<DataTableWithPagination> createState() => _DataTableWithPaginationState();
}

class _DataTableWithPaginationState extends State<DataTableWithPagination> {
  int _currentPage = 1;
  int _itemsPerPage = 15;
  final int _totalItems = 1250;

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
    return Container(
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
                Expanded(flex: 1, child: Text('ID', style: AppTypography.bodySmallSemibold)),
                Expanded(flex: 3, child: Text('Name', style: AppTypography.bodySmallSemibold)),
                Expanded(flex: 2, child: Text('Category', style: AppTypography.bodySmallSemibold)),
                Expanded(flex: 2, child: Text('Price', style: AppTypography.bodySmallSemibold)),
                Expanded(flex: 2, child: Text('Status', style: AppTypography.bodySmallSemibold)),
              ],
            ),
          ),

          // Table Rows
          ..._currentPageData.map((item) => Container(
            padding: EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.neutral200)),
            ),
            child: Row(
              children: [
                Expanded(flex: 1, child: Text(item['id'].toString(), style: AppTypography.bodySmallRegular)),
                Expanded(flex: 3, child: Text(item['name'], style: AppTypography.bodySmallRegular)),
                Expanded(flex: 2, child: VSChip(label: item['category'], type: VSChipType.color, variant: VSChipVariant.primary)),
                Expanded(flex: 2, child: Text('\$${item['price'].toStringAsFixed(2)}', style: AppTypography.bodySmallRegular)),
                Expanded(flex: 2, child: VSChip(
                  label: item['status'],
                  type: VSChipType.color,
                  variant: item['status'] == 'Active' ? VSChipVariant.success :
                           item['status'] == 'Pending' ? VSChipVariant.warning : VSChipVariant.neutral,
                )),
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
              itemsPerPageOptions: [15, 50, 100],
            ),
          ),
        ],
      ),
    );
  }
}
```

### API Integration with Pagination

```dart
class PaginatedApiList extends StatefulWidget {
  @override
  State<PaginatedApiList> createState() => _PaginatedApiListState();
}

class _PaginatedApiListState extends State<PaginatedApiList> {
  int _currentPage = 1;
  int _itemsPerPage = 20;
  int _totalItems = 0;
  bool _isLoading = false;
  List<dynamic> _items = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);

    try {
      final response = await http.get(
        Uri.parse('https://api.example.com/items?page=$_currentPage&limit=$_itemsPerPage'),
      );

      final data = json.decode(response.body);
      setState(() {
        _items = data['items'];
        _totalItems = data['total'];
        _isLoading = false;
      });
    } catch (error) {
      setState(() => _isLoading = false);
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_isLoading)
          CircularProgressIndicator()
        else
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text(item['description']),
                );
              },
            ),
          ),

        VSPagination(
          currentPage: _currentPage,
          totalItems: _totalItems,
          itemsPerPage: _itemsPerPage,
          onPageChanged: (page) {
            setState(() => _currentPage = page);
            _loadData();
          },
          onItemsPerPageChanged: (itemsPerPage) {
            setState(() {
              _itemsPerPage = itemsPerPage;
              _currentPage = 1;
            });
            _loadData();
          },
          itemsPerPageOptions: [10, 20, 50, 100],
        ),
      ],
    );
  }
}
```

### Infinite Scroll Alternative

```dart
class InfiniteScrollList extends StatefulWidget {
  @override
  State<InfiniteScrollList> createState() => _InfiniteScrollListState();
}

class _InfiniteScrollListState extends State<InfiniteScrollList> {
  final ScrollController _scrollController = ScrollController();
  List<String> _items = [];
  bool _isLoading = false;
  bool _hasMoreData = true;

  @override
  void initState() {
    super.initState();
    _loadMoreItems();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _loadMoreItems();
    }
  }

  Future<void> _loadMoreItems() async {
    if (_isLoading || !_hasMoreData) return;

    setState(() => _isLoading = true);

    // Simulate API call
    await Future.delayed(Duration(seconds: 1));

    final newItems = List.generate(20, (index) => 'Item ${_items.length + index + 1}');

    setState(() {
      _items.addAll(newItems);
      _isLoading = false;
      _hasMoreData = _items.length < 1000; // Stop at 1000 items
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Show pagination info
        Container(
          padding: EdgeInsets.all(AppSpacing.sm),
          color: AppColors.neutral100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Showing ${_items.length} items',
                style: AppTypography.bodySmallRegular,
              ),
              TextButton(
                onPressed: () => setState(() => _items.clear()),
                child: Text('Clear All'),
              ),
            ],
          ),
        ),

        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _items.length + (_isLoading ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == _items.length) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(AppSpacing.md),
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              return ListTile(
                title: Text(_items[index]),
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
```

## Real-World Usage Patterns

### E-commerce Product Catalog

```dart
class ProductCatalog extends StatefulWidget {
  @override
  State<ProductCatalog> createState() => _ProductCatalogState();
}

class _ProductCatalogState extends State<ProductCatalog> {
  int _currentPage = 3;
  final int _totalProducts = 1247;
  int _productsPerPage = 15;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header with product count
        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          color: AppColors.neutral100,
          child: Row(
            children: [
              Icon(Icons.shopping_bag, color: AppColors.secondaryDefault),
              SizedBox(width: AppSpacing.sm),
              Text('$_totalProducts Products Found', style: AppTypography.bodyMediumRegular),
              Spacer(),
              VSBadge(
                label: 'PAGE $_currentPage OF ${(1247 / 15).ceil()}',
                variant: VSBadgeVariant.secondary,
              ),
            ],
          ),
        ),

        // Product grid (simplified)
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(AppSpacing.md),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: AppSpacing.md,
              mainAxisSpacing: AppSpacing.md,
            ),
            itemCount: _productsPerPage,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.neutral0,
                  border: Border.all(color: AppColors.neutral300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text('Product ${(index + 1) + ((_currentPage - 1) * _productsPerPage)}'),
                ),
              );
            },
          ),
        ),

        // Pagination
        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          child: VSPagination(
            currentPage: _currentPage,
            totalItems: _totalProducts,
            itemsPerPage: _productsPerPage,
            itemsPerPageOptions: [12, 24, 36, 48],
            onPageChanged: (page) => setState(() => _currentPage = page),
            onItemsPerPageChanged: (itemsPerPage) => setState(() {
              _productsPerPage = itemsPerPage;
              _currentPage = 1;
            }),
          ),
        ),
      ],
    );
  }
}
```

### User Management Dashboard

```dart
class UserManagementPage extends StatefulWidget {
  @override
  State<UserManagementPage> createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  int _currentPage = 2;
  final int _totalUsers = 487;
  int _usersPerPage = 15;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          color: AppColors.neutral100,
          child: Row(
            children: [
              Icon(Icons.people, color: AppColors.primaryDefault),
              SizedBox(width: AppSpacing.sm),
              Text('User Directory', style: AppTypography.bodyMediumRegular),
              Spacer(),
              VSBadge(
                label: '${_usersPerPage} PER PAGE',
                variant: VSBadgeVariant.primary,
              ),
            ],
          ),
        ),

        // User list
        Expanded(
          child: ListView.builder(
            itemCount: _usersPerPage,
            itemBuilder: (context, index) {
              final userIndex = (index + 1) + ((_currentPage - 1) * _usersPerPage);
              return Container(
                padding: EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: AppColors.neutral200)),
                ),
                child: Row(
                  children: [
                    VSAvatar(
                      size: VSAvatarSize.medium,
                      initials: 'U$userIndex',
                    ),
                    SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User $userIndex',
                            style: AppTypography.bodySmallSemibold,
                          ),
                          Text(
                            'user$userIndex@example.com',
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
                      variant: index % 3 == 0 ? VSChipVariant.success :
                               index % 3 == 1 ? VSChipVariant.neutral : VSChipVariant.warning,
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        // Pagination
        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          child: VSPagination(
            currentPage: _currentPage,
            totalItems: _totalUsers,
            itemsPerPage: _usersPerPage,
            itemsPerPageOptions: [10, 15, 25, 50],
            onPageChanged: (page) => setState(() => _currentPage = page),
            onItemsPerPageChanged: (itemsPerPage) => setState(() {
              _usersPerPage = itemsPerPage;
              _currentPage = 1;
            }),
          ),
        ),
      ],
    );
  }
}
```

### Content Management System

```dart
class ContentManagementPage extends StatefulWidget {
  @override
  State<ContentManagementPage> createState() => _ContentManagementPageState();
}

class _ContentManagementPageState extends State<ContentManagementPage> {
  int _currentPage = 1;
  final int _totalPosts = 89;
  int _postsPerPage = 10;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          color: AppColors.neutral100,
          child: Row(
            children: [
              Icon(Icons.article, color: AppColors.successDefault),
              SizedBox(width: AppSpacing.sm),
              Text('Blog Posts', style: AppTypography.bodyMediumRegular),
              Spacer(),
              VSBadge(
                label: 'SORTED BY DATE',
                variant: VSBadgeVariant.success,
              ),
            ],
          ),
        ),

        // Posts list
        Expanded(
          child: ListView.builder(
            itemCount: _postsPerPage,
            itemBuilder: (context, index) {
              final postIndex = (index + 1) + ((_currentPage - 1) * _postsPerPage);
              return Container(
                padding: EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: AppColors.neutral200)),
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
                            'Blog Post Title $postIndex',
                            style: AppTypography.bodySmallSemibold,
                          ),
                          Text(
                            'Published ${postIndex} day${postIndex == 1 ? '' : 's'} ago',
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
                      variant: index % 3 == 0 ? VSChipVariant.success :
                               index % 3 == 1 ? VSChipVariant.neutral : VSChipVariant.warning,
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        // Pagination
        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          child: VSPagination(
            currentPage: _currentPage,
            totalItems: _totalPosts,
            itemsPerPage: _postsPerPage,
            itemsPerPageOptions: [5, 10, 20, 50],
            onPageChanged: (page) => setState(() => _currentPage = page),
            onItemsPerPageChanged: (itemsPerPage) => setState(() {
              _postsPerPage = itemsPerPage;
              _currentPage = 1;
            }),
          ),
        ),
      ],
    );
  }
}
```

### Analytics Dashboard

```dart
class AnalyticsDashboard extends StatefulWidget {
  @override
  State<AnalyticsDashboard> createState() => _AnalyticsDashboardState();
}

class _AnalyticsDashboardState extends State<AnalyticsDashboard> {
  int _currentPage = 5;
  final int _totalReports = 573;
  int _reportsPerPage = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          color: AppColors.neutral100,
          child: Row(
            children: [
              Icon(Icons.analytics, color: AppColors.warningDefault),
              SizedBox(width: AppSpacing.sm),
              Text('Performance Reports', style: AppTypography.bodyMediumRegular),
              Spacer(),
              VSBadge(
                label: 'LAST 30 DAYS',
                variant: VSBadgeVariant.warning,
              ),
            ],
          ),
        ),

        // Analytics content area
        Expanded(
          child: Container(
            padding: EdgeInsets.all(AppSpacing.md),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.bar_chart, color: AppColors.warningDefault, size: 48),
                SizedBox(height: AppSpacing.sm),
                Text(
                  'Analytics Charts',
                  style: AppTypography.bodyMediumSemibold,
                ),
                Text(
                  'Page $_currentPage of ${(573 / 50).ceil()} • $_reportsPerPage reports per page',
                  style: AppTypography.bodySmallRegular.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Pagination
        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          child: VSPagination(
            currentPage: _currentPage,
            totalItems: _totalReports,
            itemsPerPage: _reportsPerPage,
            itemsPerPageOptions: [25, 50, 100],
            onPageChanged: (page) => setState(() => _currentPage = page),
            onItemsPerPageChanged: (itemsPerPage) => setState(() {
              _reportsPerPage = itemsPerPage;
              _currentPage = 1;
            }),
          ),
        ),
      ],
    );
  }
}
```

### Search Results

```dart
class SearchResultsPage extends StatefulWidget {
  final String query;

  const SearchResultsPage({super.key, required this.query});

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  int _currentPage = 7;
  final int _totalResults = 1203;
  int _resultsPerPage = 20;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search header
        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          color: AppColors.neutral100,
          child: Row(
            children: [
              Icon(Icons.search, color: AppColors.primaryDefault),
              SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  'Search Results for "${widget.query}"',
                  style: AppTypography.bodyMediumRegular,
                ),
              ),
              Spacer(),
              VSBadge(
                label: '$_totalResults RESULTS',
                variant: VSBadgeVariant.primary,
              ),
            ],
          ),
        ),

        // Results list
        Expanded(
          child: ListView.builder(
            itemCount: _resultsPerPage,
            itemBuilder: (context, index) {
              final resultIndex = (index + 1) + ((_currentPage - 1) * _resultsPerPage);
              return Container(
                padding: EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: AppColors.neutral200)),
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
                            'Result $resultIndex: Search Result Title',
                            style: AppTypography.bodySmallSemibold,
                          ),
                          Text(
                            'Comprehensive guide to search results and pagination...',
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
              );
            },
          ),
        ),

        // Pagination
        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          child: VSPagination(
            currentPage: _currentPage,
            totalItems: _totalResults,
            itemsPerPage: _resultsPerPage,
            itemsPerPageOptions: [10, 20, 50, 100],
            onPageChanged: (page) => setState(() => _currentPage = page),
            onItemsPerPageChanged: (itemsPerPage) => setState(() {
              _resultsPerPage = itemsPerPage;
              _currentPage = 1;
            }),
          ),
        ),
      ],
    );
  }
}
```

## Configuration Options

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `currentPage` | `int` | Required | The currently selected page number (1-based) |
| `totalItems` | `int` | Required | The total number of items across all pages |
| `itemsPerPage` | `int` | `15` | The number of items displayed per page |
| `onPageChanged` | `ValueChanged<int>?` | `null` | Callback invoked when a new page is selected |
| `onItemsPerPageChanged` | `ValueChanged<int>?` | `null` | Callback invoked when items per page is changed |
| `itemsPerPageOptions` | `List<int>` | `[15, 50, 100]` | Available options for items per page selector |
| `height` | `double` | `32` | Height of the pagination widget |
| `key` | `Key?` | `null` | Widget key for identification |

## Best Practices

### When to Use Pagination

- **Large Datasets**: When displaying more than 50-100 items
- **Performance**: To avoid loading/rendering too many items at once
- **User Experience**: When users need to browse through ordered content
- **API Limits**: When working with paginated API responses
- **Memory Management**: To prevent memory issues with large lists

### Design Guidelines

- **Consistent Positioning**: Place pagination at the bottom of content areas
- **Clear Feedback**: Always show current page and total items
- **Logical Order**: Use left-to-right navigation (previous to next)
- **Smart Defaults**: Choose appropriate default items per page for your use case
- **Responsive Behavior**: Ensure pagination works on mobile devices

### Implementation Tips

- **State Management**: Reset to page 1 when changing items per page
- **Loading States**: Show loading indicators during data fetching
- **Error Handling**: Handle cases where data loading fails
- **URL Synchronization**: Update URL parameters for bookmarkable pages
- **Keyboard Navigation**: Ensure pagination is keyboard accessible

## Accessibility

- **Semantic Navigation**: Proper button roles and labels
- **Keyboard Support**: Arrow key navigation between pages
- **Screen Reader**: Descriptive labels for current page and total items
- **Focus Management**: Clear focus indicators on interactive elements
- **Color Contrast**: Sufficient contrast for all text and interactive elements

## Integration with VS Design System

The VS Pagination component integrates seamlessly with other VS Design System components:

- **VSButton**: For custom action buttons alongside pagination
- **VSDropdown**: Alternative to built-in items per page selector
- **VSTable**: For data table pagination (see VSTableDynamic)
- **VSChip**: For status indicators in paginated content
- **AppColors**: Consistent color scheme throughout
- **AppTypography**: Standardized text styling
- **AppSpacing**: Consistent spacing and layout

## Migration Guide

### From Custom Pagination

```dart
// Before: Custom pagination
class CustomPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(icon: Icon(Icons.chevron_left), onPressed: currentPage > 1 ? () => onPageChanged(currentPage - 1) : null),
        Text('$currentPage of $totalPages'),
        IconButton(icon: Icon(Icons.chevron_right), onPressed: currentPage < totalPages ? () => onPageChanged(currentPage + 1) : null),
      ],
    );
  }
}

// After: VS Design System
VSPagination(
  currentPage: currentPage,
  totalItems: totalItems,
  itemsPerPage: itemsPerPage,
  onPageChanged: onPageChanged,
  onItemsPerPageChanged: onItemsPerPageChanged,
)
```

### From Third-Party Libraries

```dart
// Before: Third-party pagination
NumberPaginator(
  numberPages: totalPages,
  onPageChange: (page) => setState(() => currentPage = page),
)

// After: VS Design System
VSPagination(
  currentPage: currentPage,
  totalItems: totalItems,
  itemsPerPage: itemsPerPage,
  onPageChanged: (page) => setState(() => currentPage = page),
)
```

### API Integration Patterns

```dart
// Pagination with API calls
class ApiPaginatedList extends StatefulWidget {
  @override
  State<ApiPaginatedList> createState() => _ApiPaginatedListState();
}

class _ApiPaginatedListState extends State<ApiPaginatedList> {
  int _currentPage = 1;
  int _itemsPerPage = 20;
  int _totalItems = 0;
  List<Item> _items = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    setState(() => _isLoading = true);

    try {
      final response = await http.get(
        Uri.parse('https://api.example.com/items?page=$_currentPage&limit=$_itemsPerPage'),
      );

      final data = json.decode(response.body);
      setState(() {
        _items = (data['items'] as List).map((item) => Item.fromJson(item)).toList();
        _totalItems = data['total'];
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(_items[index].name),
                    subtitle: Text(_items[index].description),
                  ),
                ),
        ),
        VSPagination(
          currentPage: _currentPage,
          totalItems: _totalItems,
          itemsPerPage: _itemsPerPage,
          onPageChanged: (page) {
            setState(() => _currentPage = page);
            _fetchItems();
          },
          onItemsPerPageChanged: (itemsPerPage) {
            setState(() {
              _itemsPerPage = itemsPerPage;
              _currentPage = 1;
            });
            _fetchItems();
          },
        ),
      ],
    );
  }
}
```</content>
<parameter name="filePath">c:\vs_design_system\lib\markdown2\VS_PAGINATION_IMPLEMENTATION.md