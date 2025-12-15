# VS Table Dynamic Implementation

**Version 1.0.1 - December 14, 2025**

## Overview

The VS Table Dynamic components provide powerful, flexible table implementations for displaying structured data with advanced features like pagination, sticky headers/columns, row selection, and expandable rows. The library includes two main components:

- **VsTableDynamic**: Basic table with standard features (from `vs_table_dynamic.dart`)
- **VsTableDynamic2**: Advanced table with sticky column support (from `vs_table_dynamic_sticky.dart`)

Both components use a unified `TableData` model for data binding and support extensive customization options for enterprise-grade data display.

## Features

### Core Features (Both Components)
- **Dynamic Data Binding**: Uses `TableData` model for type-safe data structure
- **Pagination Support**: Built-in pagination with customizable page sizes
- **Row Selection**: Checkbox-based row selection with callbacks
- **Expandable Rows**: Optional expandable row functionality
- **Auto Width**: Automatic column width calculation
- **Compact Mode**: Reduced spacing for dense data display
- **Horizontal Scrolling**: Handles wide tables gracefully
- **VS Design System Integration**: Consistent styling and theming

### VsTableDynamic Specific Features
- **Sticky Header**: Optional sticky header that remains visible during vertical scrolling
- **Standard Layout**: Traditional table layout without sticky columns

### VsTableDynamic2 Specific Features
- **Sticky Columns**: Configurable number of left-sticky columns
- **Sticky Header**: Independent sticky header control
- **Advanced Layout**: Complex table layouts with both sticky columns and headers

## Basic Usage

### Data Structure

Both components use the `TableData` model which consists of headers and detail rows:

```dart
// Define table headers
final headers = [
  TableHeader(
    fieldName: 'name',
    label: 'Name',
    toolTip: 'Full Name',
    typeData: TypeData.string,
    width: 200,
  ),
  TableHeader(
    fieldName: 'email',
    label: 'Email',
    toolTip: 'Email Address',
    typeData: TypeData.string,
    width: 250,
  ),
  TableHeader(
    fieldName: 'status',
    label: 'Status',
    toolTip: 'Account Status',
    typeData: TypeData.string,
    width: 120,
  ),
];

// Define table data
final tableData = TableData(
  header: headers,
  detail: [
    RowData(
      rowData: [
        ColumnData(data: 'John Doe', typeData: TypeData.string),
        ColumnData(data: 'john@example.com', typeData: TypeData.string),
        ColumnData(data: 'Active', typeData: TypeData.string),
      ],
    ),
    RowData(
      rowData: [
        ColumnData(data: 'Jane Smith', typeData: TypeData.string),
        ColumnData(data: 'jane@example.com', typeData: TypeData.string),
        ColumnData(data: 'Inactive', typeData: TypeData.string),
      ],
    ),
  ],
);
```

### Basic Table (VsTableDynamic)

```dart
class UserTable extends StatefulWidget {
  @override
  State<UserTable> createState() => _UserTableState();
}

class _UserTableState extends State<UserTable> {
  late TableData _tableData;

  @override
  void initState() {
    super.initState();
    _tableData = _createUserTableData();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: VsTableDynamic(
        tableData: _tableData,
        currentPage: 1,
        pageSize: 10,
        showPagination: false,
      ),
    );
  }

  TableData _createUserTableData() {
    return TableData(
      header: [
        TableHeader(
          fieldName: 'name',
          label: 'Name',
          typeData: TypeData.string,
          width: 200,
        ),
        TableHeader(
          fieldName: 'role',
          label: 'Role',
          typeData: TypeData.string,
          width: 150,
        ),
        TableHeader(
          fieldName: 'status',
          label: 'Status',
          typeData: TypeData.string,
          width: 120,
        ),
      ],
      detail: [
        RowData(rowData: [
          ColumnData(data: 'John Doe', typeData: TypeData.string),
          ColumnData(data: 'Developer', typeData: TypeData.string),
          ColumnData(data: 'Active', typeData: TypeData.string),
        ]),
        RowData(rowData: [
          ColumnData(data: 'Jane Smith', typeData: TypeData.string),
          ColumnData(data: 'Designer', typeData: TypeData.string),
          ColumnData(data: 'Active', typeData: TypeData.string),
        ]),
      ],
    );
  }
}
```

### Basic Table with Sticky Features (VsTableDynamic2)

```dart
class AdvancedUserTable extends StatefulWidget {
  @override
  State<AdvancedUserTable> createState() => _AdvancedUserTableState();
}

class _AdvancedUserTableState extends State<AdvancedUserTable> {
  late TableData _tableData;

  @override
  void initState() {
    super.initState();
    _tableData = _createAdvancedUserTableData();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: VsTableDynamic2(
        tableData: _tableData,
        currentPage: 1,
        pageSize: 10,
        showPagination: false,
        stickyColumns: 1, // First column stays sticky
        stickyHeader: true,
      ),
    );
  }

  TableData _createAdvancedUserTableData() {
    return TableData(
      header: [
        TableHeader(
          fieldName: 'id',
          label: 'ID',
          typeData: TypeData.string,
          width: 80,
        ),
        TableHeader(
          fieldName: 'name',
          label: 'Full Name',
          typeData: TypeData.string,
          width: 200,
        ),
        TableHeader(
          fieldName: 'email',
          label: 'Email Address',
          typeData: TypeData.string,
          width: 250,
        ),
        TableHeader(
          fieldName: 'department',
          label: 'Department',
          typeData: TypeData.string,
          width: 150,
        ),
        TableHeader(
          fieldName: 'status',
          label: 'Status',
          typeData: TypeData.string,
          width: 120,
        ),
      ],
      detail: [
        RowData(rowData: [
          ColumnData(data: '001', typeData: TypeData.string),
          ColumnData(data: 'John Doe', typeData: TypeData.string),
          ColumnData(data: 'john.doe@company.com', typeData: TypeData.string),
          ColumnData(data: 'Engineering', typeData: TypeData.string),
          ColumnData(data: 'Active', typeData: TypeData.string),
        ]),
        // Add more rows...
      ],
    );
  }
}
```

## Advanced Examples

### Table with Pagination

```dart
class PaginatedProductTable extends StatefulWidget {
  @override
  State<PaginatedProductTable> createState() => _PaginatedProductTableState();
}

class _PaginatedProductTableState extends State<PaginatedProductTable> {
  int _currentPage = 1;
  final int _pageSize = 10;
  late TableData _tableData;

  @override
  void initState() {
    super.initState();
    _tableData = _createProductTableData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: VsTableDynamic(
            tableData: _tableData,
            currentPage: _currentPage,
            pageSize: _pageSize,
            totalCount: 150, // Total records in database
            showPagination: true,
            onPageChange: (page) {
              setState(() => _currentPage = page);
              _loadPageData(page);
            },
            onRowsPerPageChange: (newPageSize) {
              setState(() {
                _currentPage = 1; // Reset to first page
              });
              _loadPageData(1, pageSize: newPageSize);
            },
          ),
        ),
      ],
    );
  }

  void _loadPageData(int page, {int? pageSize}) {
    // Implement API call to load paginated data
    // _tableData = await apiService.getProducts(page: page, pageSize: pageSize ?? _pageSize);
    setState(() {});
  }

  TableData _createProductTableData() {
    return TableData(
      header: [
        TableHeader(fieldName: 'sku', label: 'SKU', typeData: TypeData.string, width: 120),
        TableHeader(fieldName: 'name', label: 'Product Name', typeData: TypeData.string, width: 250),
        TableHeader(fieldName: 'category', label: 'Category', typeData: TypeData.string, width: 150),
        TableHeader(fieldName: 'price', label: 'Price', typeData: TypeData.string, width: 120),
        TableHeader(fieldName: 'stock', label: 'Stock', typeData: TypeData.string, width: 100),
      ],
      detail: [
        // Mock data - in real app, this would come from API
        RowData(rowData: [
          ColumnData(data: 'PRD-001', typeData: TypeData.string),
          ColumnData(data: 'Wireless Headphones', typeData: TypeData.string),
          ColumnData(data: 'Electronics', typeData: TypeData.string),
          ColumnData(data: '\$199.99', typeData: TypeData.string),
          ColumnData(data: '45', typeData: TypeData.string),
        ]),
        // Add more rows...
      ],
    );
  }
}
```

### Table with Search Functionality

```dart
class SearchableUserTable extends StatefulWidget {
  @override
  State<SearchableUserTable> createState() => _SearchableUserTableState();
}

class _SearchableUserTableState extends State<SearchableUserTable> {
  late TableData _tableData;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tableData = _createUserTableData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search input
        Padding(
          padding: EdgeInsets.only(bottom: AppSpacing.md),
          child: VSInputField(
            label: 'Search Users',
            placeholder: 'Search by name, email, or department...',
            prefixIcon: Icon(Icons.search),
            onChanged: (value) {
              setState(() => _searchQuery = value);
            },
          ),
        ),

        // Table
        Expanded(
          child: VsTableDynamic(
            tableData: _tableData,
            currentPage: 1,
            pageSize: 10,
            showPagination: false,
            searchQuery: _searchQuery,
            onSearchChanged: (query) {
              setState(() => _searchQuery = query);
              // Implement client-side filtering or trigger API search
              _filterUsers(query);
            },
            searchDebounceDuration: Duration(milliseconds: 300),
          ),
        ),
      ],
    );
  }

  void _filterUsers(String query) {
    // Implement filtering logic
    // This could filter the _tableData.detail list based on the query
  }

  TableData _createUserTableData() {
    return TableData(
      header: [
        TableHeader(fieldName: 'name', label: 'Name', typeData: TypeData.string, width: 200),
        TableHeader(fieldName: 'email', label: 'Email', typeData: TypeData.string, width: 250),
        TableHeader(fieldName: 'department', label: 'Department', typeData: TypeData.string, width: 150),
        TableHeader(fieldName: 'status', label: 'Status', typeData: TypeData.string, width: 120),
      ],
      detail: [
        RowData(rowData: [
          ColumnData(data: 'John Doe', typeData: TypeData.string),
          ColumnData(data: 'john.doe@company.com', typeData: TypeData.string),
          ColumnData(data: 'Engineering', typeData: TypeData.string),
          ColumnData(data: 'Active', typeData: TypeData.string),
        ]),
        RowData(rowData: [
          ColumnData(data: 'Jane Smith', typeData: TypeData.string),
          ColumnData(data: 'jane.smith@company.com', typeData: TypeData.string),
          ColumnData(data: 'Design', typeData: TypeData.string),
          ColumnData(data: 'Active', typeData: TypeData.string),
        ]),
        // Add more rows...
      ],
    );
  }
}
```

### Table with Row Selection and Actions

```dart
class SelectableUserTable extends StatefulWidget {
  @override
  State<SelectableUserTable> createState() => _SelectableUserTableState();
}

class _SelectableUserTableState extends State<SelectableUserTable> {
  late TableData _tableData;
  List<int> _selectedRows = [];

  @override
  void initState() {
    super.initState();
    _tableData = _createUserTableData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Action buttons for selected rows
        if (_selectedRows.isNotEmpty)
          Container(
            padding: EdgeInsets.all(AppSpacing.md),
            margin: EdgeInsets.only(bottom: AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.primaryBg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Text(
                  '${_selectedRows.length} user(s) selected',
                  style: AppTypography.bodyMediumSemibold,
                ),
                Spacer(),
                VSButton(
                  label: 'Delete Selected',
                  variant: VSButtonVariant.danger,
                  size: VSButtonSize.small,
                  onPressed: _deleteSelectedUsers,
                ),
                SizedBox(width: AppSpacing.sm),
                VSButton(
                  label: 'Export Selected',
                  variant: VSButtonVariant.secondary,
                  size: VSButtonSize.small,
                  onPressed: _exportSelectedUsers,
                ),
              ],
            ),
          ),

        // Table
        Expanded(
          child: VsTableDynamic(
            tableData: _tableData,
            currentPage: 1,
            pageSize: 10,
            showPagination: false,
            showCheckboxColumn: true,
            initialSelectedRows: _selectedRows,
            checkboxCallback: (selectedIndices) {
              setState(() => _selectedRows = selectedIndices);
            },
          ),
        ),
      ],
    );
  }

  void _deleteSelectedUsers() {
    // Implement delete logic
    VSToastService.showToast(
      context,
      title: 'Users Deleted',
      description: 'Selected users have been deleted successfully',
      type: VSToastType.success,
    );
    setState(() => _selectedRows.clear());
  }

  void _exportSelectedUsers() {
    // Implement export logic
    VSToastService.showToast(
      context,
      title: 'Export Started',
      description: 'Selected users are being exported',
      type: VSToastType.info,
    );
  }

  TableData _createUserTableData() {
    return TableData(
      header: [
        TableHeader(fieldName: 'name', label: 'Name', typeData: TypeData.string, width: 200),
        TableHeader(fieldName: 'email', label: 'Email', typeData: TypeData.string, width: 250),
        TableHeader(fieldName: 'role', label: 'Role', typeData: TypeData.string, width: 150),
        TableHeader(fieldName: 'status', label: 'Status', typeData: TypeData.string, width: 120),
      ],
      detail: [
        RowData(rowData: [
          ColumnData(data: 'John Doe', typeData: TypeData.string),
          ColumnData(data: 'john@example.com', typeData: TypeData.string),
          ColumnData(data: 'Admin', typeData: TypeData.string),
          ColumnData(data: 'Active', typeData: TypeData.string),
        ]),
        // Add more rows...
      ],
    );
  }
}
```

### Table with Expandable Rows

```dart
class ExpandableOrderTable extends StatefulWidget {
  @override
  State<ExpandableOrderTable> createState() => _ExpandableOrderTableState();
}

class _ExpandableOrderTableState extends State<ExpandableOrderTable> {
  late TableData _tableData;
  Set<int> _expandedRows = {};

  @override
  void initState() {
    super.initState();
    _tableData = _createOrderTableData();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: VsTableDynamic(
        tableData: _tableData,
        currentPage: 1,
        pageSize: 10,
        showPagination: false,
        showExpandColumn: true,
        expandedRowBuilder: (index, rowData) {
          return Container(
            padding: EdgeInsets.all(AppSpacing.lg),
            color: AppColors.neutral50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Details - ${rowData.rowData[0].data}',
                  style: AppTypography.bodyLargeSemibold,
                ),
                SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    Expanded(
                      child: _buildDetailItem('Customer', rowData.rowData[1].data),
                    ),
                    Expanded(
                      child: _buildDetailItem('Total Amount', '\$${rowData.rowData[3].data}'),
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.md),
                Text(
                  'Order Items:',
                  style: AppTypography.bodyMediumSemibold,
                ),
                SizedBox(height: AppSpacing.sm),
                // Mock order items - in real app, this would be nested data
                Container(
                  padding: EdgeInsets.all(AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: AppColors.neutral0,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Text('• Wireless Headphones - \$199.99'),
                      Spacer(),
                      Text('Qty: 1'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.bodySmallMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: AppTypography.bodyMediumRegular,
        ),
      ],
    );
  }

  TableData _createOrderTableData() {
    return TableData(
      header: [
        TableHeader(fieldName: 'orderId', label: 'Order ID', typeData: TypeData.string, width: 120),
        TableHeader(fieldName: 'customer', label: 'Customer', typeData: TypeData.string, width: 200),
        TableHeader(fieldName: 'date', label: 'Date', typeData: TypeData.string, width: 120),
        TableHeader(fieldName: 'total', label: 'Total', typeData: TypeData.string, width: 120),
        TableHeader(fieldName: 'status', label: 'Status', typeData: TypeData.string, width: 120),
      ],
      detail: [
        RowData(rowData: [
          ColumnData(data: 'ORD-001', typeData: TypeData.string),
          ColumnData(data: 'John Doe', typeData: TypeData.string),
          ColumnData(data: '2024-01-15', typeData: TypeData.string),
          ColumnData(data: '199.99', typeData: TypeData.string),
          ColumnData(data: 'Completed', typeData: TypeData.string),
        ]),
        RowData(rowData: [
          ColumnData(data: 'ORD-002', typeData: TypeData.string),
          ColumnData(data: 'Jane Smith', typeData: TypeData.string),
          ColumnData(data: '2024-01-14', typeData: TypeData.string),
          ColumnData(data: '89.50', typeData: TypeData.string),
          ColumnData(data: 'Processing', typeData: TypeData.string),
        ]),
      ],
    );
  }
}
```

### Wide Table with Sticky Columns (VsTableDynamic2)

```dart
class WideFinancialTable extends StatefulWidget {
  @override
  State<WideFinancialTable> createState() => _WideFinancialTableState();
}

class _WideFinancialTableState extends State<WideFinancialTable> {
  late TableData _tableData;

  @override
  void initState() {
    super.initState();
    _tableData = _createFinancialTableData();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: VsTableDynamic2(
        tableData: _tableData,
        currentPage: 1,
        pageSize: 15,
        showPagination: false,
        stickyColumns: 2, // Company name and symbol stay visible
        stickyHeader: true,
      ),
    );
  }

  TableData _createFinancialTableData() {
    return TableData(
      header: [
        TableHeader(fieldName: 'company', label: 'Company', typeData: TypeData.string, width: 200),
        TableHeader(fieldName: 'symbol', label: 'Symbol', typeData: TypeData.string, width: 100),
        TableHeader(fieldName: 'price', label: 'Price', typeData: TypeData.string, width: 100),
        TableHeader(fieldName: 'change', label: 'Change', typeData: TypeData.string, width: 100),
        TableHeader(fieldName: 'volume', label: 'Volume', typeData: TypeData.string, width: 120),
        TableHeader(fieldName: 'marketCap', label: 'Market Cap', typeData: TypeData.string, width: 140),
        TableHeader(fieldName: 'pe', label: 'P/E Ratio', typeData: TypeData.string, width: 100),
        TableHeader(fieldName: 'dividend', label: 'Dividend', typeData: TypeData.string, width: 100),
        TableHeader(fieldName: 'yield', label: 'Yield %', typeData: TypeData.string, width: 100),
        TableHeader(fieldName: '52week', label: '52W High/Low', typeData: TypeData.string, width: 140),
      ],
      detail: [
        RowData(rowData: [
          ColumnData(data: 'Apple Inc.', typeData: TypeData.string),
          ColumnData(data: 'AAPL', typeData: TypeData.string),
          ColumnData(data: '\$175.43', typeData: TypeData.string),
          ColumnData(data: '+2.34 (+1.35%)', typeData: TypeData.string),
          ColumnData(data: '45.2M', typeData: TypeData.string),
          ColumnData(data: '\$2.8T', typeData: TypeData.string),
          ColumnData(data: '28.5', typeData: TypeData.string),
          ColumnData(data: '\$0.96', typeData: TypeData.string),
          ColumnData(data: '0.55%', typeData: TypeData.string),
          ColumnData(data: '\$199.62 / \$124.17', typeData: TypeData.string),
        ]),
        RowData(rowData: [
          ColumnData(data: 'Microsoft Corporation', typeData: TypeData.string),
          ColumnData(data: 'MSFT', typeData: TypeData.string),
          ColumnData(data: '\$378.85', typeData: TypeData.string),
          ColumnData(data: '-1.23 (-0.32%)', typeData: TypeData.string),
          ColumnData(data: '23.1M', typeData: TypeData.string),
          ColumnData(data: '\$2.9T', typeData: TypeData.string),
          ColumnData(data: '32.1', typeData: TypeData.string),
          ColumnData(data: '\$3.00', typeData: TypeData.string),
          ColumnData(data: '0.79%', typeData: TypeData.string),
          ColumnData(data: '\$420.82 / \$309.45', typeData: TypeData.string),
        ]),
        // Add more rows...
      ],
    );
  }
}
```

### Table with Custom Widgets in Cells

```dart
class InteractiveStatusTable extends StatefulWidget {
  @override
  State<InteractiveStatusTable> createState() => _InteractiveStatusTableState();
}

class _InteractiveStatusTableState extends State<InteractiveStatusTable> {
  late TableData _tableData;

  @override
  void initState() {
    super.initState();
    _tableData = _createStatusTableData();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: VsTableDynamic(
        tableData: _tableData,
        currentPage: 1,
        pageSize: 10,
        showPagination: false,
      ),
    );
  }

  TableData _createStatusTableData() {
    return TableData(
      header: [
        TableHeader(fieldName: 'task', label: 'Task', typeData: TypeData.string, width: 250),
        TableHeader(fieldName: 'assignee', label: 'Assignee', typeData: TypeData.string, width: 150),
        TableHeader(fieldName: 'priority', label: 'Priority', typeData: TypeData.widget, width: 120),
        TableHeader(fieldName: 'status', label: 'Status', typeData: TypeData.widget, width: 140),
        TableHeader(fieldName: 'actions', label: 'Actions', typeData: TypeData.widget, width: 200),
      ],
      detail: [
        RowData(rowData: [
          ColumnData(data: 'Implement user authentication', typeData: TypeData.string),
          ColumnData(data: 'John Doe', typeData: TypeData.string),
          ColumnData(
            data: VSBadge(
              label: 'High',
              variant: VSBadgeVariant.danger,
              size: VSBadgeSize.small,
            ),
            typeData: TypeData.widget,
          ),
          ColumnData(
            data: VSBadge(
              label: 'In Progress',
              variant: VSBadgeVariant.warning,
              size: VSBadgeSize.small,
            ),
            typeData: TypeData.widget,
          ),
          ColumnData(
            data: Row(
              children: [
                VSButton(
                  label: 'Edit',
                  variant: VSButtonVariant.secondary,
                  size: VSButtonSize.xsmall,
                  onPressed: () => _editTask(0),
                ),
                SizedBox(width: AppSpacing.xs),
                VSButton(
                  label: 'Complete',
                  variant: VSButtonVariant.primary,
                  size: VSButtonSize.xsmall,
                  onPressed: () => _completeTask(0),
                ),
              ],
            ),
            typeData: TypeData.widget,
          ),
        ]),
        RowData(rowData: [
          ColumnData(data: 'Design new dashboard', typeData: TypeData.string),
          ColumnData(data: 'Jane Smith', typeData: TypeData.string),
          ColumnData(
            data: VSBadge(
              label: 'Medium',
              variant: VSBadgeVariant.warning,
              size: VSBadgeSize.small,
            ),
            typeData: TypeData.widget,
          ),
          ColumnData(
            data: VSBadge(
              label: 'Completed',
              variant: VSBadgeVariant.success,
              size: VSBadgeSize.small,
            ),
            typeData: TypeData.widget,
          ),
          ColumnData(
            data: VSButton(
              label: 'View Details',
              variant: VSButtonVariant.secondary,
              size: VSButtonSize.xsmall,
              onPressed: () => _viewTaskDetails(1),
            ),
            typeData: TypeData.widget,
          ),
        ]),
      ],
    );
  }

  void _editTask(int index) {
    VSToastService.showToast(
      context,
      title: 'Edit Task',
      description: 'Opening task editor for task $index',
      type: VSToastType.info,
    );
  }

  void _completeTask(int index) {
    VSToastService.showToast(
      context,
      title: 'Task Completed',
      description: 'Task $index marked as completed',
      type: VSToastType.success,
    );
  }

  void _viewTaskDetails(int index) {
    VSToastService.showToast(
      context,
      title: 'Task Details',
      description: 'Showing details for task $index',
      type: VSToastType.info,
    );
  }
}
```

## Real-World Usage Patterns

### Data Management Dashboard

```dart
class DataManagementDashboard extends StatefulWidget {
  @override
  State<DataManagementDashboard> createState() => _DataManagementDashboardState();
}

class _DataManagementDashboardState extends State<DataManagementDashboard> {
  late TableData _userTableData;
  late TableData _productTableData;
  int _activeTab = 0;

  @override
  void initState() {
    super.initState();
    _userTableData = _createUserManagementTableData();
    _productTableData = _createProductManagementTableData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tab selector
        Container(
          margin: EdgeInsets.only(bottom: AppSpacing.md),
          child: Row(
            children: [
              _buildTabButton('Users', 0),
              SizedBox(width: AppSpacing.sm),
              _buildTabButton('Products', 1),
              SizedBox(width: AppSpacing.sm),
              _buildTabButton('Orders', 2),
            ],
          ),
        ),

        // Table content
        Expanded(
          child: IndexedStack(
            index: _activeTab,
            children: [
              _buildUserManagementTable(),
              _buildProductManagementTable(),
              _buildOrderManagementTable(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabButton(String label, int index) {
    final isActive = _activeTab == index;
    return VSButton(
      label: label,
      variant: isActive ? VSButtonVariant.primary : VSButtonVariant.secondary,
      size: VSButtonSize.small,
      onPressed: () => setState(() => _activeTab = index),
    );
  }

  Widget _buildUserManagementTable() {
    return VsTableDynamic2(
      tableData: _userTableData,
      currentPage: 1,
      pageSize: 15,
      showPagination: false,
      stickyColumns: 1,
      stickyHeader: true,
      showCheckboxColumn: true,
      checkboxCallback: (selected) {
        // Handle bulk user operations
      },
    );
  }

  Widget _buildProductManagementTable() {
    return VsTableDynamic2(
      tableData: _productTableData,
      currentPage: 1,
      pageSize: 15,
      showPagination: false,
      stickyColumns: 2,
      stickyHeader: true,
      showCheckboxColumn: true,
      checkboxCallback: (selected) {
        // Handle bulk product operations
      },
    );
  }

  Widget _buildOrderManagementTable() {
    return VsTableDynamic(
      tableData: _createOrderManagementTableData(),
      currentPage: 1,
      pageSize: 10,
      showPagination: true,
      showExpandColumn: true,
      expandedRowBuilder: (index, rowData) {
        return Container(
          padding: EdgeInsets.all(AppSpacing.md),
          child: Text('Order details for ${rowData.rowData[0].data}'),
        );
      },
    );
  }

  TableData _createUserManagementTableData() {
    return TableData(
      header: [
        TableHeader(fieldName: 'id', label: 'ID', typeData: TypeData.string, width: 80),
        TableHeader(fieldName: 'name', label: 'Name', typeData: TypeData.string, width: 200),
        TableHeader(fieldName: 'email', label: 'Email', typeData: TypeData.string, width: 250),
        TableHeader(fieldName: 'role', label: 'Role', typeData: TypeData.string, width: 120),
        TableHeader(fieldName: 'status', label: 'Status', typeData: TypeData.widget, width: 120),
        TableHeader(fieldName: 'actions', label: 'Actions', typeData: TypeData.widget, width: 200),
      ],
      detail: [
        // User data rows...
      ],
    );
  }

  TableData _createProductManagementTableData() {
    return TableData(
      header: [
        TableHeader(fieldName: 'sku', label: 'SKU', typeData: TypeData.string, width: 120),
        TableHeader(fieldName: 'image', label: 'Image', typeData: TypeData.widget, width: 80),
        TableHeader(fieldName: 'name', label: 'Product Name', typeData: TypeData.string, width: 250),
        TableHeader(fieldName: 'category', label: 'Category', typeData: TypeData.string, width: 150),
        TableHeader(fieldName: 'price', label: 'Price', typeData: TypeData.string, width: 120),
        TableHeader(fieldName: 'stock', label: 'Stock', typeData: TypeData.string, width: 100),
        TableHeader(fieldName: 'status', label: 'Status', typeData: TypeData.widget, width: 120),
        TableHeader(fieldName: 'actions', label: 'Actions', typeData: TypeData.widget, width: 200),
      ],
      detail: [
        // Product data rows...
      ],
    );
  }

  TableData _createOrderManagementTableData() {
    return TableData(
      header: [
        TableHeader(fieldName: 'orderId', label: 'Order ID', typeData: TypeData.string, width: 120),
        TableHeader(fieldName: 'customer', label: 'Customer', typeData: TypeData.string, width: 200),
        TableHeader(fieldName: 'date', label: 'Date', typeData: TypeData.string, width: 120),
        TableHeader(fieldName: 'total', label: 'Total', typeData: TypeData.string, width: 120),
        TableHeader(fieldName: 'status', label: 'Status', typeData: TypeData.widget, width: 140),
        TableHeader(fieldName: 'actions', label: 'Actions', typeData: TypeData.widget, width: 200),
      ],
      detail: [
        // Order data rows...
      ],
    );
  }
}
```

### Financial Data Table

```dart
class FinancialReportsTable extends StatefulWidget {
  @override
  State<FinancialReportsTable> createState() => _FinancialReportsTableState();
}

class _FinancialReportsTableState extends State<FinancialReportsTable> {
  late TableData _financialData;
  bool _showCompact = false;

  @override
  void initState() {
    super.initState();
    _financialData = _createFinancialReportsData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Controls
        Container(
          padding: EdgeInsets.all(AppSpacing.md),
          margin: EdgeInsets.only(bottom: AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.neutral50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Text(
                'Financial Reports',
                style: AppTypography.h5,
              ),
              Spacer(),
              Row(
                children: [
                  Text('Compact View'),
                  SizedBox(width: AppSpacing.sm),
                  VSToggle(
                    value: _showCompact,
                    onChanged: (value) => setState(() => _showCompact = value),
                  ),
                ],
              ),
              SizedBox(width: AppSpacing.md),
              VSButton(
                label: 'Export to Excel',
                variant: VSButtonVariant.secondary,
                size: VSButtonSize.small,
                onPressed: _exportToExcel,
              ),
            ],
          ),
        ),

        // Table
        Expanded(
          child: VsTableDynamic2(
            tableData: _financialData,
            currentPage: 1,
            pageSize: 20,
            showPagination: false,
            stickyColumns: 2, // Account and Description stay visible
            stickyHeader: true,
            compact: _showCompact,
          ),
        ),
      ],
    );
  }

  void _exportToExcel() {
    VSToastService.showToast(
      context,
      title: 'Export Started',
      description: 'Financial report is being exported to Excel',
      type: VSToastType.info,
    );
  }

  TableData _createFinancialReportsData() {
    return TableData(
      header: [
        TableHeader(fieldName: 'account', label: 'Account', typeData: TypeData.string, width: 120),
        TableHeader(fieldName: 'description', label: 'Description', typeData: TypeData.string, width: 250),
        TableHeader(fieldName: 'jan', label: 'Jan', typeData: TypeData.string, width: 100),
        TableHeader(fieldName: 'feb', label: 'Feb', typeData: TypeData.string, width: 100),
        TableHeader(fieldName: 'mar', label: 'Mar', typeData: TypeData.string, width: 100),
        TableHeader(fieldName: 'q1', label: 'Q1 Total', typeData: TypeData.string, width: 120),
        TableHeader(fieldName: 'apr', label: 'Apr', typeData: TypeData.string, width: 100),
        TableHeader(fieldName: 'may', label: 'May', typeData: TypeData.string, width: 100),
        TableHeader(fieldName: 'jun', label: 'Jun', typeData: TypeData.string, width: 100),
        TableHeader(fieldName: 'q2', label: 'Q2 Total', typeData: TypeData.string, width: 120),
        TableHeader(fieldName: 'ytd', label: 'YTD Total', typeData: TypeData.string, width: 120),
      ],
      detail: [
        RowData(rowData: [
          ColumnData(data: '1000', typeData: TypeData.string),
          ColumnData(data: 'Cash and Cash Equivalents', typeData: TypeData.string),
          ColumnData(data: '\$150,000', typeData: TypeData.string),
          ColumnData(data: '\$145,000', typeData: TypeData.string),
          ColumnData(data: '\$160,000', typeData: TypeData.string),
          ColumnData(data: '\$455,000', typeData: TypeData.string),
          ColumnData(data: '\$155,000', typeData: TypeData.string),
          ColumnData(data: '\$170,000', typeData: TypeData.string),
          ColumnData(data: '\$165,000', typeData: TypeData.string),
          ColumnData(data: '\$490,000', typeData: TypeData.string),
          ColumnData(data: '\$945,000', typeData: TypeData.string),
        ]),
        // Add more financial rows...
      ],
    );
  }
}
```

## Configuration Options

### VsTableDynamic Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `tableData` | `dynamic` | Required | TableData object containing headers and rows |
| `totalCount` | `int?` | `null` | Total number of records (for pagination) |
| `currentPage` | `int` | Required | Current page number |
| `pageSize` | `int` | Required | Number of rows per page |
| `onRowTap` | `Function(int index)?` | `null` | Callback when a row is tapped |
| `onPageChange` | `Function(int page)?` | `null` | Callback when page changes |
| `onRowsPerPageChange` | `Function(int rowsPerPage)?` | `null` | Callback when page size changes |
| `defaultColumnWidth` | `double` | `150` | Default width for columns without explicit width |
| `useAutoWidth` | `bool` | `false` | Automatically calculate column widths |
| `rowHeight` | `double` | `52` | Height of each row |
| `headerHeight` | `double` | `50` | Height of header row |
| `showCheckboxColumn` | `bool` | `false` | Show checkbox column for row selection |
| `initialSelectedRows` | `List<int>?` | `null` | Initially selected row indices |
| `initialDisableList` | `List<int>?` | `null` | Initially disabled row indices |
| `checkboxCallback` | `Function(List<int> selectedIndices)?` | `null` | Callback for selection changes |
| `compact` | `bool` | `false` | Use compact spacing |
| `showPagination` | `bool` | `true` | Show pagination controls |
| `showExpandColumn` | `bool` | `false` | Show expand/collapse column |
| `expandedRowBuilder` | `Widget Function(int index, dynamic rowData)?` | `null` | Builder for expanded row content |
| `stickyHeader` | `bool` | `false` | Make header sticky during vertical scroll |
| `searchQuery` | `String?` | `null` | Initial search query |
| `onSearchChanged` | `Function(String)?` | `null` | Callback when search query changes |
| `searchDebounceDuration` | `Duration?` | `null` | Debounce duration for search |
| `searchTriggerOnEnter` | `bool` | `false` | Trigger search only on Enter key |
| `isMobile` | `bool` | `false` | Mobile-optimized layout |
| `isEdit` | `bool` | `false` | Enable edit mode |
| `isReport` | `bool` | `false` | Report mode styling |
| `edited` | `bool` | `false` | Mark as edited |
| `isCheckAll` | `bool` | `false` | Enable select all functionality |
| `sortAscending` | `bool?` | `null` | Sort direction |
| `sortColumnIndex` | `int?` | `null` | Column index for sorting |
| `horizontalMargin` | `double?` | `null` | Horizontal margin |
| `fixedColumnColor` | `Color?` | `null` | Color for fixed columns |
| `isTableFineForm` | `bool` | `false` | Fine form styling |
| `isSmallRange` | `bool` | `false` | Small range mode |
| `rowColorSetting` | `dynamic` | `null` | Row color configuration |
| `tableWidth` | `double?` | `null` | Table width |
| `tableBorder` | `dynamic` | `null` | Table border configuration |
| `scaffoldKey` | `GlobalKey?` | `null` | Scaffold key for navigation |
| `selectCallback` | `Function?` | `null` | General select callback |
| `editCallBack` | `Function(int index)?` | `null` | Edit button callback |
| `switchCallBack` | `Function(bool value, int index)?` | `null` | Switch toggle callback |
| `viewCallBack` | `Function(int index)?` | `null` | View button callback |
| `deleteCallback` | `Function(int index)?` | `null` | Delete button callback |
| `syncCallback` | `Function(int index)?` | `null` | Sync button callback |
| `emailCallback` | `Function(int index)?` | `null` | Email button callback |
| `sendCallback` | `Function(int index)?` | `null` | Send button callback |
| `typeDataWidgetCallback` | `Function(int index, int widgetIndex)?` | `null` | Type data widget callback |

### VsTableDynamic2 Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `tableData` | `dynamic` | Required | TableData object containing headers and rows |
| `totalCount` | `int?` | `null` | Total number of records (for pagination) |
| `currentPage` | `int` | Required | Current page number |
| `pageSize` | `int` | Required | Number of rows per page |
| `onRowTap` | `Function(int index)?` | `null` | Callback when a row is tapped |
| `onPageChange` | `Function(int page)?` | `null` | Callback when page changes |
| `onRowsPerPageChange` | `Function(int rowsPerPage)?` | `null` | Callback when page size changes |
| `defaultColumnWidth` | `double` | `150` | Default width for columns without explicit width |
| `useAutoWidth` | `bool` | `false` | Automatically calculate column widths |
| `rowHeight` | `double` | `52` | Height of each row |
| `headerHeight` | `double` | `50` | Height of header row |
| `showCheckboxColumn` | `bool` | `false` | Show checkbox column for row selection |
| `initialSelectedRows` | `List<int>?` | `null` | Initially selected row indices |
| `initialDisableList` | `List<int>?` | `null` | Initially disabled row indices |
| `checkboxCallback` | `Function(List<int> selectedIndices)?` | `null` | Callback for selection changes |
| `compact` | `bool` | `false` | Use compact spacing |
| `showPagination` | `bool` | `true` | Show pagination controls |
| `stickyColumns` | `int` | `0` | Number of columns to keep sticky on the left |
| `stickyHeader` | `bool` | `false` | Make header sticky during vertical scroll |
| `showExpandColumn` | `bool` | `false` | Show expand/collapse column |
| `expandedRowBuilder` | `Widget Function(int index, dynamic rowData)?` | `null` | Builder for expanded row content |
| `isMobile` | `bool` | `false` | Mobile-optimized layout |
| `isEdit` | `bool` | `false` | Enable edit mode |
| `isReport` | `bool` | `false` | Report mode styling |
| `edited` | `bool` | `false` | Mark as edited |
| `isCheckAll` | `bool` | `false` | Enable select all functionality |
| `sortAscending` | `bool?` | `null` | Sort direction |
| `sortColumnIndex` | `int?` | `null` | Column index for sorting |
| `horizontalMargin` | `double?` | `null` | Horizontal margin |
| `fixedColumnColor` | `Color?` | `null` | Color for fixed columns |
| `isTableFineForm` | `bool` | `false` | Fine form styling |
| `isSmallRange` | `bool` | `false` | Small range mode |
| `rowColorSetting` | `dynamic` | `null` | Row color configuration |
| `tableWidth` | `double?` | `null` | Table width |
| `tableBorder` | `dynamic` | `null` | Table border configuration |
| `scaffoldKey` | `GlobalKey?` | `null` | Scaffold key for navigation |
| `selectCallback` | `Function?` | `null` | General select callback |
| `editCallBack` | `Function(int index)?` | `null` | Edit button callback |
| `switchCallBack` | `Function(bool value, int index)?` | `null` | Switch toggle callback |
| `viewCallBack` | `Function(int index)?` | `null` | View button callback |
| `deleteCallback` | `Function(int index)?` | `null` | Delete button callback |
| `syncCallback` | `Function(int index)?` | `null` | Sync button callback |
| `emailCallback` | `Function(int index)?` | `null` | Email button callback |
| `sendCallback` | `Function(int index)?` | `null` | Send button callback |
| `typeDataWidgetCallback` | `Function(int index, int widgetIndex)?` | `null` | Type data widget callback |

## Best Practices

### When to Use Each Component

- **VsTableDynamic**: Use for simple tables, basic pagination, and standard layouts
- **VsTableDynamic2**: Use when you need sticky columns, complex layouts, or advanced table features

### Performance Considerations

- **Pagination**: Always use pagination for large datasets (>1000 rows)
- **Virtual Scrolling**: For very large datasets, consider implementing virtual scrolling
- **Column Limits**: Limit visible columns to essential data (max 10-15 columns)
- **Auto Width**: Use auto width sparingly as it can impact performance

### Data Management

- **Type Safety**: Use proper TypeData enums for consistent data handling
- **Error Handling**: Implement proper error states for failed data loading
- **Loading States**: Show loading indicators during data fetching
- **Empty States**: Provide meaningful empty state messages

### Accessibility

- **Keyboard Navigation**: Full keyboard support for row selection and actions
- **Screen Readers**: Proper ARIA labels and semantic markup
- **Focus Management**: Clear focus indicators and logical tab order
- **Color Contrast**: Ensure sufficient contrast for all text and interactive elements

## Integration with VS Design System

The table components integrate seamlessly with other VS Design System components:

- **VSBadge**: For status indicators and priority levels
- **VSButton**: For action buttons within table cells
- **VSToggle**: For boolean value display
- **VSDropdown**: For bulk actions and filters
- **VSPagination**: Built-in pagination component
- **VSToast**: For user feedback on table actions
- **AppColors**: Consistent color scheme
- **AppTypography**: Standardized text styling
- **AppSpacing**: Consistent spacing and layout

## Migration Guide

### From Flutter DataTable

```dart
// Before: Flutter DataTable
DataTable(
  columns: [
    DataColumn(label: Text('Name')),
    DataColumn(label: Text('Age')),
  ],
  rows: [
    DataRow(cells: [
      DataCell(Text('John')),
      DataCell(Text('25')),
    ]),
  ],
)

// After: VS Table Dynamic
TableData(
  header: [
    TableHeader(fieldName: 'name', label: 'Name', typeData: TypeData.string),
    TableHeader(fieldName: 'age', label: 'Age', typeData: TypeData.string),
  ],
  detail: [
    RowData(rowData: [
      ColumnData(data: 'John', typeData: TypeData.string),
      ColumnData(data: '25', typeData: TypeData.string),
    ]),
  ],
)

VsTableDynamic(
  tableData: tableData,
  currentPage: 1,
  pageSize: 10,
)
```

### From Third-Party Table Libraries

```dart
// Before: Third-party table library
SomeTableLibrary(
  data: myData,
  columns: myColumns,
  pagination: true,
)

// After: VS Table Dynamic
VsTableDynamic(
  tableData: _convertToTableData(myData),
  currentPage: currentPage,
  pageSize: pageSize,
  showPagination: true,
  onPageChange: (page) => setState(() => currentPage = page),
)
```

### Adding Sticky Features

```dart
// Before: Basic table
VsTableDynamic(
  tableData: data,
  // ... other properties
)

// After: With sticky features
VsTableDynamic2(
  tableData: data,
  stickyColumns: 2, // Keep first 2 columns visible
  stickyHeader: true, // Keep header visible
  // ... other properties
)
```