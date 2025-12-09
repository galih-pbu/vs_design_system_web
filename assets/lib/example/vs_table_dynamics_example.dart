import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class TableDynamicsExample extends StatefulWidget {
  const TableDynamicsExample({super.key});

  @override
  State<TableDynamicsExample> createState() => _TableDynamicsExampleState();
}

class _TableDynamicsExampleState extends State<TableDynamicsExample> {
  dynamic tableData;
  int currentPage = 1;

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

  Widget buildSubsection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.bodyMediumSemibold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(spacing: 12, runSpacing: 12, children: children),
      ],
    );
  }

  Widget _buildSubsection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.h4.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(spacing: 12, runSpacing: 12, children: children),
      ],
    );
  }

  Widget buildTableShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // VsTableDynamic Subsection
        _buildSubsection(
          title: 'VsTableDynamic - Basic Data Preview',
          children: [
            // 1. Basic Table
            Text(
              '1. Basic Table (No Pagination)',
              style: AppTypography.bodySmallMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: VsTableDynamic(
                tableData: _createSimpleTableData(),
                currentPage: 1,
                pageSize: 10,
                showPagination: false,
              ),
            ),
            const SizedBox(height: 16),

            // 2. Table with Sticky Header
            Text(
              '2. Table with Sticky Header',
              style: AppTypography.bodySmallMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 350,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: VsTableDynamic(
                  tableData: _createSimpleTableData(),
                  currentPage: 1,
                  pageSize: 10,
                  showPagination: false,
                  stickyHeader: true,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 3. Table with Checkboxes
            Text(
              '3. Table with Checkbox Selection (Floating Info Bar)',
              style: AppTypography.bodySmallMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Select rows to see the floating info bar with bulk actions. The bar automatically disappears when navigating away.',
              style: AppTypography.bodySmallRegular.copyWith(
                color: AppColors.textSecondary,
                fontSize: 11,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                VSButton(
                  label: 'Test Stacking Prevention',
                  onPressed: () => _testFloatingBarStacking(context),
                  variant: VSButtonVariant.outlined,
                  size: VSButtonSize.small,
                ),
                const SizedBox(width: 8),
                Text(
                  'Click to test that only one floating bar can exist at a time',
                  style: AppTypography.bodySmallRegular.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 350,
              child: VsTableDynamic(
                tableData: _createSimpleTableData(),
                currentPage: 1,
                pageSize: 10,
                showPagination: false,
                showCheckboxColumn: true,
                checkboxCallback: (selectedIndices) {
                  if (selectedIndices.isEmpty) {
                    VSInfoBar.hideFloating();
                  } else {
                    VSInfoBar.showFloating(
                      context,
                      selectedCount: selectedIndices.length,
                      itemLabel: 'rows',
                      actions: [
                        VSFloatingInfoBarAction(
                          label: 'Export',
                          icon: Icons.download,
                          onPressed: () {
                            VSToastService.showToast(
                              context,
                              title: 'Export Started',
                              description: 'Exporting ${selectedIndices.length} selected rows',
                              type: VSToastType.info,
                              duration: const Duration(seconds: 2),
                            );
                          },
                        ),
                        VSFloatingInfoBarAction(
                          label: 'Delete',
                          icon: Icons.delete,
                          onPressed: () {
                            VSToastService.showToast(
                              context,
                              title: 'Delete Action',
                              description: '${selectedIndices.length} rows will be deleted',
                              type: VSToastType.warning,
                              duration: const Duration(seconds: 2),
                            );
                          },
                          isPrimary: true,
                        ),
                      ],
                      onClose: () {
                        // Handle close action if needed
                      },
                      duration: const Duration(seconds: 10),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 16),

            // 4. Table with Pagination
            Text(
              '4. Table with Pagination',
              style: AppTypography.bodySmallMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 400,
              child: VsTableDynamic(
                tableData: _createPaginatedTableData(),
                currentPage: 1,
                pageSize: 5,
                totalCount: 25,
                showPagination: true,
                onPageChange: (page) {
                  VSToastService.showToast(
                    context,
                    title: 'Page Changed',
                    description: 'Navigated to page $page',
                    type: VSToastType.info,
                    duration: const Duration(seconds: 2),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // 5. Compact Table
            Text(
              '5. Compact Table (Smaller Spacing)',
              style: AppTypography.bodySmallMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 280,
              child: VsTableDynamic(
                tableData: _createProductTableData(),
                currentPage: 1,
                pageSize: 10,
                showPagination: false,
                compact: true,
              ),
            ),
            const SizedBox(height: 16),

            // 6. Wide Table with Horizontal Scroll
            Text(
              '6. Wide Table with Horizontal Scroll',
              style: AppTypography.bodySmallMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300, // Fixed width to show horizontal scroll
                  height: 300,
                  child: VsTableDynamic(
                    tableData: _createWideTableData(),
                    currentPage: 1,
                    pageSize: 10,
                    showPagination: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 7. Table with Row Expansion
            Text(
              '7. Table with Expandable Rows',
              style: AppTypography.bodySmallMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 350,
              child: VsTableDynamic(
                tableData: _createSimpleTableData(),
                currentPage: 1,
                pageSize: 10,
                showPagination: false,
                showExpandColumn: true,
                expandedRowBuilder: (index, rowData) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expanded Details for Row $index',
                          style: AppTypography.bodyMediumBold,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Additional information can be displayed here.',
                          style: AppTypography.bodySmallRegular,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // 8. Table with Auto Width
            Text(
              '8. Table with Auto Width Columns',
              style: AppTypography.bodySmallMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: VsTableDynamic(
                tableData: _createProductTableData(),
                currentPage: 1,
                pageSize: 10,
                showPagination: false,
                useAutoWidth: true,
              ),
            ),

            // 9. Table with Widget Callbacks
            Text(
              '9. Table with Widget Callbacks',
              style: AppTypography.bodySmallMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: VsTableDynamic(
                tableData: _createWidgetCallbackTableData(context),
                currentPage: 1,
                pageSize: 10,
                showPagination: false,
              ),
            ),
            const SizedBox(height: 16),

            // 11. Table with Disabled Rows
            Text(
              '11. Table with Disabled Rows (Floating Info Bar)',
              style: AppTypography.bodySmallMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Rows 1 and 2 are disabled. Select other rows to see floating info bar with Edit, Duplicate, and Delete actions.',
              style: AppTypography.bodySmallRegular.copyWith(
                color: AppColors.textSecondary,
                fontSize: 11,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: VsTableDynamic(
                tableData: _createSimpleTableData(),
                currentPage: 1,
                pageSize: 10,
                showPagination: false,
                showCheckboxColumn: true,
                initialDisableList: [1, 2], // Rows 1 and 2 are disabled
                checkboxCallback: (selectedIndices) {
                  if (selectedIndices.isEmpty) {
                    VSInfoBar.hideFloating();
                  } else {
                    VSInfoBar.showFloating(
                      context,
                      selectedCount: selectedIndices.length,
                      itemLabel: 'rows',
                      actions: [
                        VSFloatingInfoBarAction(
                          label: 'Edit',
                          icon: Icons.edit,
                          onPressed: () {
                            VSToastService.showToast(
                              context,
                              title: 'Edit Action',
                              description: 'Editing ${selectedIndices.length} selected rows',
                              type: VSToastType.info,
                              duration: const Duration(seconds: 2),
                            );
                          },
                        ),
                        VSFloatingInfoBarAction(
                          label: 'Duplicate',
                          icon: Icons.content_copy,
                          onPressed: () {
                            VSToastService.showToast(
                              context,
                              title: 'Duplicate Action',
                              description: 'Duplicating ${selectedIndices.length} selected rows',
                              type: VSToastType.success,
                              duration: const Duration(seconds: 2),
                            );
                          },
                        ),
                        VSFloatingInfoBarAction(
                          label: 'Delete',
                          icon: Icons.delete,
                          onPressed: () {
                            VSToastService.showToast(
                              context,
                              title: 'Delete Action',
                              description: '${selectedIndices.length} rows will be deleted',
                              type: VSToastType.warning,
                              duration: const Duration(seconds: 2),
                            );
                          },
                          isPrimary: true,
                        ),
                      ],
                      onClose: () {
                        // Handle close action if needed
                      },
                      duration: const Duration(seconds: 10),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 16),

            // 12. Table with Button Callbacks
            Text(
              '12. Table with Button Callbacks',
              style: AppTypography.bodySmallMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: VsTableDynamic(
                tableData: _createButtonCallbackTableData(context),
                currentPage: 1,
                pageSize: 10,
                showPagination: false,
                editCallBack: (rowIndex) {
                  VSToastService.showToast(
                    context,
                    title: 'Edit Action',
                    description: 'Edit row $rowIndex',
                    type: VSToastType.info,
                    duration: const Duration(seconds: 2),
                  );
                },
                viewCallBack: (rowIndex) {
                  VSToastService.showToast(
                    context,
                    title: 'View Action',
                    description: 'View row $rowIndex',
                    type: VSToastType.info,
                    duration: const Duration(seconds: 2),
                  );
                },
                deleteCallback: (rowIndex) {
                  VSToastService.showToast(
                    context,
                    title: 'Delete Action',
                    description: 'Delete row $rowIndex',
                    type: VSToastType.warning,
                    duration: const Duration(seconds: 2),
                  );
                },
                sendCallback: (rowIndex) {
                  VSToastService.showToast(
                    context,
                    title: 'Send Action',
                    description: 'Send row $rowIndex',
                    type: VSToastType.success,
                    duration: const Duration(seconds: 2),
                  );
                },
                switchCallBack: (newValue, rowIndex) {
                  VSToastService.showToast(
                    context,
                    title: 'Switch Toggled',
                    description:
                        'Row $rowIndex switched to ${newValue ? 'ON' : 'OFF'}',
                    type: VSToastType.info,
                    duration: const Duration(seconds: 2),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // 13. Table with Text Field Inputs
            Text(
              '13. Table with Text Field Inputs',
              style: AppTypography.bodySmallMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: VsTableDynamic(
                tableData: _createTextFieldTableData(),
                currentPage: 1,
                pageSize: 10,
                showPagination: false,
              ),
            ),
          ],
        ),

        // VsTableDynamic2 Subsection
        _buildSubsection(
          title: 'VsTableDynamic2 - Advanced Tables with Sticky Features',
          children: [
            // 1. Simple Table with VsTableDynamic2
            Text(
              '1. Basic Table (VsTableDynamic2)',
              style: AppTypography.bodySmallMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: VsTableDynamic2(
                tableData: _createSimpleTableData(),
                currentPage: 1,
                pageSize: 10,
                showPagination: false,
              ),
            ),
            const SizedBox(height: 16),

            // 2. Table with Sticky Columns
            Text(
              '2. Table with Sticky Columns (2 columns sticky)',
              style: AppTypography.bodySmallMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 350,
              child: VsTableDynamic2(
                tableData: _createStickyColumnTableData(),
                currentPage: 1,
                pageSize: 10,
                showPagination: false,
                stickyColumns: 2,
              ),
            ),
            const SizedBox(height: 16),

            // 3. Table with Sticky Header
            Text(
              '3. Table with Sticky Header',
              style: AppTypography.bodySmallMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 500, // Increased height to show sticky header
              child: VsTableDynamic(
                tableData: _createSimpleTableData(),
                currentPage: 1,
                pageSize: 20,
                showPagination: false,
                stickyHeader: true,
              ),
            ),
            const SizedBox(height: 16),

            // 4. Table with Sticky Columns + Sticky Header
            Text(
              '4. Table with Both Sticky Columns & Header',
              style: AppTypography.bodySmallMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 300, // Increased height to better show sticky header
              child: VsTableDynamic2(
                tableData: _createStickyColumnTableData(),
                currentPage: 1,
                pageSize: 15,
                showPagination: false,
                stickyColumns: 1,
                stickyHeader: true,
              ),
            ),
            const SizedBox(height: 16),

            // 5. Table with Pagination
            Text(
              '5. Table with Pagination (VsTableDynamic2)',
              style: AppTypography.bodySmallMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 400,
              child: VsTableDynamic2(
                tableData: _createPaginatedTableData(),
                currentPage: 1,
                pageSize: 5,
                totalCount: 25,
                showPagination: true,
                onPageChange: (page) {
                  VSToastService.showToast(
                    context,
                    title: 'Page Changed',
                    description: 'Navigated to page $page',
                    type: VSToastType.info,
                    duration: const Duration(seconds: 2),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // 7. Table with Disabled Rows (VsTableDynamic2)
            Text(
              '7. Table with Disabled Rows (VsTableDynamic2 - Floating Info Bar)',
              style: AppTypography.bodySmallMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Rows 1 and 2 are disabled. Select other rows to see floating info bar with Archive, Export, and Delete actions.',
              style: AppTypography.bodySmallRegular.copyWith(
                color: AppColors.textSecondary,
                fontSize: 11,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: VsTableDynamic2(
                tableData: _createSimpleTableData(),
                currentPage: 1,
                pageSize: 10,
                showPagination: false,
                showCheckboxColumn: true,
                initialDisableList: [1, 2], // Rows 1 and 2 are disabled
                checkboxCallback: (selectedIndices) {
                  if (selectedIndices.isEmpty) {
                    VSInfoBar.hideFloating();
                  } else {
                    VSInfoBar.showFloating(
                      context,
                      selectedCount: selectedIndices.length,
                      itemLabel: 'rows',
                      actions: [
                        VSFloatingInfoBarAction(
                          label: 'Archive',
                          icon: Icons.archive,
                          onPressed: () {
                            VSToastService.showToast(
                              context,
                              title: 'Archive Action',
                              description: 'Archiving ${selectedIndices.length} selected rows',
                              type: VSToastType.info,
                              duration: const Duration(seconds: 2),
                            );
                          },
                        ),
                        VSFloatingInfoBarAction(
                          label: 'Export',
                          icon: Icons.download,
                          onPressed: () {
                            VSToastService.showToast(
                              context,
                              title: 'Export Started',
                              description: 'Exporting ${selectedIndices.length} selected rows',
                              type: VSToastType.success,
                              duration: const Duration(seconds: 2),
                            );
                          },
                        ),
                        VSFloatingInfoBarAction(
                          label: 'Delete',
                          icon: Icons.delete,
                          onPressed: () {
                            VSToastService.showToast(
                              context,
                              title: 'Delete Action',
                              description: '${selectedIndices.length} rows will be deleted',
                              type: VSToastType.warning,
                              duration: const Duration(seconds: 2),
                            );
                          },
                          isPrimary: true,
                        ),
                      ],
                      onClose: () {
                        // Handle close action if needed
                      },
                      duration: const Duration(seconds: 10),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 16),

            // 8. Table with Button Callbacks (VsTableDynamic2)
            Text(
              '8. Table with Button Callbacks (VsTableDynamic2)',
              style: AppTypography.bodySmallMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 350,
              child: VsTableDynamic2(
                tableData: _createButtonCallbackTableData(context),
                currentPage: 1,
                pageSize: 10,
                showPagination: false,
                editCallBack: (rowIndex) {
                  VSToastService.showToast(
                    context,
                    title: 'Edit Action',
                    description: 'Edit row $rowIndex',
                    type: VSToastType.info,
                    duration: const Duration(seconds: 2),
                  );
                },
                viewCallBack: (rowIndex) {
                  VSToastService.showToast(
                    context,
                    title: 'View Action',
                    description: 'View row $rowIndex',
                    type: VSToastType.info,
                    duration: const Duration(seconds: 2),
                  );
                },
                deleteCallback: (rowIndex) {
                  VSToastService.showToast(
                    context,
                    title: 'Delete Action',
                    description: 'Delete row $rowIndex',
                    type: VSToastType.warning,
                    duration: const Duration(seconds: 2),
                  );
                },
                sendCallback: (rowIndex) {
                  VSToastService.showToast(
                    context,
                    title: 'Send Action',
                    description: 'Send row $rowIndex',
                    type: VSToastType.success,
                    duration: const Duration(seconds: 2),
                  );
                },
                switchCallBack: (newValue, rowIndex) {
                  VSToastService.showToast(
                    context,
                    title: 'Switch Toggled',
                    description:
                        'Row $rowIndex switched to ${newValue ? 'ON' : 'OFF'}',
                    type: VSToastType.info,
                    duration: const Duration(seconds: 2),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // 9. Table with Text Field Inputs (VsTableDynamic2)
            Text(
              '9. Table with Text Field Inputs (VsTableDynamic2)',
              style: AppTypography.bodySmallMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: VsTableDynamic2(
                tableData: _createTextFieldTableData(),
                currentPage: 1,
                pageSize: 10,
                showPagination: false,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: _buildSection(
          title: 'Table Components',
          description: 'Comprehensive collection of table components with various features and configurations',
          child: buildTableShowcase(),
        ),
      ),
    );
  }
} // Helper methods to create table data using TableData model

TableData _createSimpleTableData() {
  return TableData(
    header: [
      TableHeader(
        fieldName: 'name',
        label: 'Name',
        toolTip: 'Name',
        typeData: TypeData.string,
        width: 150,
      ),
      TableHeader(
        fieldName: 'role',
        label: 'Role',
        toolTip: 'Role',
        typeData: TypeData.string,
        width: 150,
      ),
      TableHeader(
        fieldName: 'status',
        label: 'Status',
        toolTip: 'Status',
        typeData: TypeData.widget,
        width: 113,
      ),
    ],
    detail: [
      RowData(
        rowData: [
          ColumnData(data: 'John Doe', typeData: TypeData.string),
          ColumnData(data: 'Developer', typeData: TypeData.string),
          ColumnData(data: 'Active', typeData: TypeData.string),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: 'Jane Smith', typeData: TypeData.string),
          ColumnData(data: 'Designer', typeData: TypeData.string),
          ColumnData(data: 'Active', typeData: TypeData.string),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: 'Peter Jones', typeData: TypeData.string),
          ColumnData(data: 'Manager', typeData: TypeData.string),
          ColumnData(data: 'Inactive', typeData: TypeData.string),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: 'Alice Brown', typeData: TypeData.string),
          ColumnData(data: 'Analyst', typeData: TypeData.string),
          ColumnData(data: 'Active', typeData: TypeData.string),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: 'Bob Wilson', typeData: TypeData.string),
          ColumnData(data: 'Tester', typeData: TypeData.string),
          ColumnData(data: 'Active', typeData: TypeData.string),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: 'Carol Davis', typeData: TypeData.string),
          ColumnData(data: 'Architect', typeData: TypeData.string),
          ColumnData(data: 'Inactive', typeData: TypeData.string),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: 'David Miller', typeData: TypeData.string),
          ColumnData(data: 'DevOps', typeData: TypeData.string),
          ColumnData(data: 'Active', typeData: TypeData.string),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: 'Eva Garcia', typeData: TypeData.string),
          ColumnData(data: 'QA', typeData: TypeData.string),
          ColumnData(data: 'Active', typeData: TypeData.string),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: 'Frank Thompson', typeData: TypeData.string),
          ColumnData(data: 'Support', typeData: TypeData.string),
          ColumnData(data: 'Active', typeData: TypeData.string),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: 'Grace Lee', typeData: TypeData.string),
          ColumnData(data: 'Marketing', typeData: TypeData.string),
          ColumnData(data: 'Inactive', typeData: TypeData.string),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: 'Henry Wilson', typeData: TypeData.string),
          ColumnData(data: 'Sales', typeData: TypeData.string),
          ColumnData(data: 'Active', typeData: TypeData.string),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: 'Ivy Chen', typeData: TypeData.string),
          ColumnData(data: 'HR', typeData: TypeData.string),
          ColumnData(data: 'Active', typeData: TypeData.string),
        ],
      ),
    ],
  );
}

TableData _createProductTableData() {
  return TableData(
    header: [
      TableHeader(
        fieldName: 'product',
        label: 'Product',
        toolTip: 'Product',
        typeData: TypeData.string,
      ),
      TableHeader(
        fieldName: 'sku',
        label: 'SKU',
        toolTip: 'SKU',
        typeData: TypeData.string,
      ),
      TableHeader(
        fieldName: 'price',
        label: 'Price',
        toolTip: 'Price',
        typeData: TypeData.string,
      ),
    ],
    detail: [
      RowData(
        rowData: [
          ColumnData(data: 'Laptop', typeData: TypeData.string),
          ColumnData(data: 'LP-001', typeData: TypeData.string),
          ColumnData(data: '\$1,200', typeData: TypeData.string),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: 'Mouse', typeData: TypeData.string),
          ColumnData(data: 'MS-002', typeData: TypeData.string),
          ColumnData(data: '\$25', typeData: TypeData.string),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: 'Keyboard', typeData: TypeData.string),
          ColumnData(data: 'KB-003', typeData: TypeData.string),
          ColumnData(data: '\$75', typeData: TypeData.string),
        ],
      ),
    ],
  );
}

TableData _createPaginatedTableData() {
  return TableData(
    header: [
      TableHeader(
        fieldName: 'id',
        label: 'ID',
        toolTip: 'ID',
        typeData: TypeData.string,
        width: 80,
      ),
      TableHeader(
        fieldName: 'customer',
        label: 'Customer Name',
        toolTip: 'Customer Name',
        typeData: TypeData.string,
        width: 200,
      ),
      TableHeader(
        fieldName: 'email',
        label: 'Email',
        toolTip: 'Email',
        typeData: TypeData.string,
        width: 220,
      ),
      TableHeader(
        fieldName: 'status',
        label: 'Status',
        toolTip: 'Status',
        typeData: TypeData.widget,
        width: 100,
      ),
    ],
    detail: [
      RowData(
        rowData: [
          ColumnData(data: '001', typeData: TypeData.string),
          ColumnData(data: 'John Doe', typeData: TypeData.string),
          ColumnData(data: 'john.doe@example.com', typeData: TypeData.string),
          ColumnData(
            data: VSBadge(
              label: 'Active',
              variant: VSBadgeVariant.success,
              size: VSBadgeSize.small,
            ),
            typeData: TypeData.widget,
          ),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: '002', typeData: TypeData.string),
          ColumnData(data: 'Jane Smith', typeData: TypeData.string),
          ColumnData(data: 'jane.smith@example.com', typeData: TypeData.string),
          ColumnData(
            data: VSBadge(
              label: 'Active',
              variant: VSBadgeVariant.success,
              size: VSBadgeSize.small,
            ),
            typeData: TypeData.widget,
          ),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: '003', typeData: TypeData.string),
          ColumnData(data: 'Bob Johnson', typeData: TypeData.string),
          ColumnData(data: 'bob.j@example.com', typeData: TypeData.string),
          ColumnData(
            data: VSBadge(
              label: 'Pending',
              variant: VSBadgeVariant.warning,
              size: VSBadgeSize.small,
            ),
            typeData: TypeData.widget,
          ),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: '004', typeData: TypeData.string),
          ColumnData(data: 'Alice Williams', typeData: TypeData.string),
          ColumnData(data: 'alice.w@example.com', typeData: TypeData.string),
          ColumnData(
            data: VSBadge(
              label: 'Inactive',
              variant: VSBadgeVariant.neutral,
              size: VSBadgeSize.small,
            ),
            typeData: TypeData.widget,
          ),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: '005', typeData: TypeData.string),
          ColumnData(data: 'Charlie Brown', typeData: TypeData.string),
          ColumnData(data: 'charlie.b@example.com', typeData: TypeData.string),
          ColumnData(
            data: VSBadge(
              label: 'Active',
              variant: VSBadgeVariant.success,
              size: VSBadgeSize.small,
            ),
            typeData: TypeData.widget,
          ),
        ],
      ),
    ],
  );
}

TableData _createWideTableData() {
  return TableData(
    header: [
      TableHeader(
        fieldName: 'id',
        label: 'ID',
        toolTip: 'ID',
        typeData: TypeData.string,
        width: 60,
      ),
      TableHeader(
        fieldName: 'product',
        label: 'Product Name',
        toolTip: 'Product',
        typeData: TypeData.string,
        width: 180,
      ),
      TableHeader(
        fieldName: 'category',
        label: 'Category',
        toolTip: 'Category',
        typeData: TypeData.string,
        width: 120,
      ),
      TableHeader(
        fieldName: 'price',
        label: 'Price',
        toolTip: 'Price',
        typeData: TypeData.string,
        width: 100,
      ),
      TableHeader(
        fieldName: 'stock',
        label: 'Stock',
        toolTip: 'Stock',
        typeData: TypeData.string,
        width: 80,
      ),
      TableHeader(
        fieldName: 'supplier',
        label: 'Supplier',
        toolTip: 'Supplier',
        typeData: TypeData.string,
        width: 150,
      ),
      TableHeader(
        fieldName: 'location',
        label: 'Location',
        toolTip: 'Location',
        typeData: TypeData.string,
        width: 150,
      ),
      TableHeader(
        fieldName: 'status',
        label: 'Status',
        toolTip: 'Status',
        typeData: TypeData.string,
        width: 100,
      ),
    ],
    detail: [
      RowData(
        rowData: [
          ColumnData(data: '1', typeData: TypeData.string),
          ColumnData(data: 'Wireless Mouse Pro', typeData: TypeData.string),
          ColumnData(data: 'Electronics', typeData: TypeData.string),
          ColumnData(data: '\$45.00', typeData: TypeData.string),
          ColumnData(data: '150', typeData: TypeData.string),
          ColumnData(data: 'Tech Supplies Inc', typeData: TypeData.string),
          ColumnData(data: 'Warehouse A', typeData: TypeData.string),
          ColumnData(data: 'In Stock', typeData: TypeData.string),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: '2', typeData: TypeData.string),
          ColumnData(data: 'Mechanical Keyboard', typeData: TypeData.string),
          ColumnData(data: 'Electronics', typeData: TypeData.string),
          ColumnData(data: '\$120.00', typeData: TypeData.string),
          ColumnData(data: '75', typeData: TypeData.string),
          ColumnData(data: 'Global Tech Ltd', typeData: TypeData.string),
          ColumnData(data: 'Warehouse B', typeData: TypeData.string),
          ColumnData(data: 'In Stock', typeData: TypeData.string),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: '3', typeData: TypeData.string),
          ColumnData(data: 'USB-C Hub Adapter', typeData: TypeData.string),
          ColumnData(data: 'Accessories', typeData: TypeData.string),
          ColumnData(data: '\$35.00', typeData: TypeData.string),
          ColumnData(data: '200', typeData: TypeData.string),
          ColumnData(data: 'Connector Co', typeData: TypeData.string),
          ColumnData(data: 'Warehouse A', typeData: TypeData.string),
          ColumnData(data: 'In Stock', typeData: TypeData.string),
        ],
      ),
    ],
  );
}

TableData _createStickyColumnTableData() {
  return TableData(
    header: [
      TableHeader(
        fieldName: 'id',
        label: 'ID',
        toolTip: 'ID',
        typeData: TypeData.string,
        width: 60,
      ),
      TableHeader(
        fieldName: 'customer',
        label: 'Customer Name',
        toolTip: 'Customer',
        typeData: TypeData.string,
        width: 150,
      ),
      TableHeader(
        fieldName: 'phone',
        label: 'Phone',
        toolTip: 'Phone',
        typeData: TypeData.string,
        width: 130,
      ),
      TableHeader(
        fieldName: 'email',
        label: 'Email',
        toolTip: 'Email',
        typeData: TypeData.string,
        width: 200,
      ),
      TableHeader(
        fieldName: 'address',
        label: 'Address',
        toolTip: 'Address',
        typeData: TypeData.string,
        width: 250,
      ),
      TableHeader(
        fieldName: 'city',
        label: 'City',
        toolTip: 'City',
        typeData: TypeData.string,
        width: 120,
      ),
      TableHeader(
        fieldName: 'state',
        label: 'State/Province',
        toolTip: 'State',
        typeData: TypeData.string,
        width: 120,
      ),
      TableHeader(
        fieldName: 'country',
        label: 'Country',
        toolTip: 'Country',
        typeData: TypeData.string,
        width: 120,
      ),
      TableHeader(
        fieldName: 'postal',
        label: 'Postal Code',
        toolTip: 'Postal',
        typeData: TypeData.string,
        width: 100,
      ),
      TableHeader(
        fieldName: 'company',
        label: 'Company',
        toolTip: 'Company',
        typeData: TypeData.string,
        width: 180,
      ),
      TableHeader(
        fieldName: 'department',
        label: 'Department',
        toolTip: 'Department',
        typeData: TypeData.string,
        width: 130,
      ),
      TableHeader(
        fieldName: 'position',
        label: 'Position',
        toolTip: 'Position',
        typeData: TypeData.string,
        width: 150,
      ),
      TableHeader(
        fieldName: 'joinDate',
        label: 'Join Date',
        toolTip: 'Join Date',
        typeData: TypeData.string,
        width: 110,
      ),
      TableHeader(
        fieldName: 'salary',
        label: 'Salary',
        toolTip: 'Salary',
        typeData: TypeData.string,
        width: 100,
      ),
      TableHeader(
        fieldName: 'manager',
        label: 'Manager',
        toolTip: 'Manager',
        typeData: TypeData.string,
        width: 150,
      ),
      TableHeader(
        fieldName: 'status',
        label: 'Status',
        toolTip: 'Status',
        typeData: TypeData.widget,
        width: 100,
      ),
    ],
    detail: [
      RowData(
        rowData: [
          ColumnData(data: '001', typeData: TypeData.string),
          ColumnData(data: 'John Anderson', typeData: TypeData.string),
          ColumnData(data: '+1-234-567-8901', typeData: TypeData.string),
          ColumnData(
            data: 'john.anderson@email.com',
            typeData: TypeData.string,
          ),
          ColumnData(
            data: '123 Main Street, Apt 4B',
            typeData: TypeData.string,
          ),
          ColumnData(data: 'New York', typeData: TypeData.string),
          ColumnData(data: 'New York', typeData: TypeData.string),
          ColumnData(data: 'USA', typeData: TypeData.string),
          ColumnData(data: '10001', typeData: TypeData.string),
          ColumnData(data: 'Tech Solutions Inc', typeData: TypeData.string),
          ColumnData(data: 'Engineering', typeData: TypeData.string),
          ColumnData(data: 'Senior Developer', typeData: TypeData.string),
          ColumnData(data: '01/15/2020', typeData: TypeData.string),
          ColumnData(data: '\$95,000', typeData: TypeData.string),
          ColumnData(data: 'Robert Smith', typeData: TypeData.string),
          ColumnData(
            data: VSBadge(
              label: 'Active',
              variant: VSBadgeVariant.success,
              size: VSBadgeSize.small,
            ),
            typeData: TypeData.widget,
          ),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: '002', typeData: TypeData.string),
          ColumnData(data: 'Sarah Thompson', typeData: TypeData.string),
          ColumnData(data: '+44-20-1234-5678', typeData: TypeData.string),
          ColumnData(data: 'sarah.t@example.co.uk', typeData: TypeData.string),
          ColumnData(
            data: '456 Oxford Road, Suite 12',
            typeData: TypeData.string,
          ),
          ColumnData(data: 'London', typeData: TypeData.string),
          ColumnData(data: 'England', typeData: TypeData.string),
          ColumnData(data: 'UK', typeData: TypeData.string),
          ColumnData(data: 'SW1A 1AA', typeData: TypeData.string),
          ColumnData(data: 'Design Studios Ltd', typeData: TypeData.string),
          ColumnData(data: 'Creative', typeData: TypeData.string),
          ColumnData(data: 'Lead Designer', typeData: TypeData.string),
          ColumnData(data: '03/22/2019', typeData: TypeData.string),
          ColumnData(data: '£75,000', typeData: TypeData.string),
          ColumnData(data: 'Jennifer Brown', typeData: TypeData.string),
          ColumnData(
            data: VSBadge(
              label: 'Active',
              variant: VSBadgeVariant.success,
              size: VSBadgeSize.small,
            ),
            typeData: TypeData.widget,
          ),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: '003', typeData: TypeData.string),
          ColumnData(data: 'Michael Chen', typeData: TypeData.string),
          ColumnData(data: '+65-1234-5678', typeData: TypeData.string),
          ColumnData(
            data: 'michael.chen@example.sg',
            typeData: TypeData.string,
          ),
          ColumnData(data: '789 Marina Bay Avenue', typeData: TypeData.string),
          ColumnData(data: 'Singapore', typeData: TypeData.string),
          ColumnData(data: 'Singapore', typeData: TypeData.string),
          ColumnData(data: 'Singapore', typeData: TypeData.string),
          ColumnData(data: '018956', typeData: TypeData.string),
          ColumnData(data: 'Finance Corp Asia', typeData: TypeData.string),
          ColumnData(data: 'Finance', typeData: TypeData.string),
          ColumnData(data: 'Financial Analyst', typeData: TypeData.string),
          ColumnData(data: '06/10/2021', typeData: TypeData.string),
          ColumnData(data: 'S\$85,000', typeData: TypeData.string),
          ColumnData(data: 'David Lee', typeData: TypeData.string),
          ColumnData(
            data: VSBadge(
              label: 'Pending',
              variant: VSBadgeVariant.warning,
              size: VSBadgeSize.small,
            ),
            typeData: TypeData.widget,
          ),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: '004', typeData: TypeData.string),
          ColumnData(data: 'Emma Williams', typeData: TypeData.string),
          ColumnData(data: '+61-2-9876-5432', typeData: TypeData.string),
          ColumnData(data: 'emma.w@example.com.au', typeData: TypeData.string),
          ColumnData(
            data: '321 Sydney Harbor Street',
            typeData: TypeData.string,
          ),
          ColumnData(data: 'Sydney', typeData: TypeData.string),
          ColumnData(data: 'New South Wales', typeData: TypeData.string),
          ColumnData(data: 'Australia', typeData: TypeData.string),
          ColumnData(data: '2000', typeData: TypeData.string),
          ColumnData(data: 'Marketing Experts Pty', typeData: TypeData.string),
          ColumnData(data: 'Marketing', typeData: TypeData.string),
          ColumnData(data: 'Marketing Manager', typeData: TypeData.string),
          ColumnData(data: '09/05/2018', typeData: TypeData.string),
          ColumnData(data: 'A\$88,000', typeData: TypeData.string),
          ColumnData(data: 'Peter Davis', typeData: TypeData.string),
          ColumnData(
            data: VSBadge(
              label: 'Inactive',
              variant: VSBadgeVariant.neutral,
              size: VSBadgeSize.small,
            ),
            typeData: TypeData.widget,
          ),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: '006', typeData: TypeData.string),
          ColumnData(data: 'Maria Garcia', typeData: TypeData.string),
          ColumnData(data: '+34-91-123-4567', typeData: TypeData.string),
          ColumnData(data: 'maria.garcia@example.es', typeData: TypeData.string),
          ColumnData(
            data: 'Calle Gran Via 123, Piso 5',
            typeData: TypeData.string,
          ),
          ColumnData(data: 'Madrid', typeData: TypeData.string),
          ColumnData(data: 'Madrid', typeData: TypeData.string),
          ColumnData(data: 'Spain', typeData: TypeData.string),
          ColumnData(data: '28013', typeData: TypeData.string),
          ColumnData(data: 'Global Services SA', typeData: TypeData.string),
          ColumnData(data: 'Operations', typeData: TypeData.string),
          ColumnData(data: 'Operations Manager', typeData: TypeData.string),
          ColumnData(data: '07/14/2017', typeData: TypeData.string),
          ColumnData(data: '€82,000', typeData: TypeData.string),
          ColumnData(data: 'Carlos Rodriguez', typeData: TypeData.string),
          ColumnData(
            data: VSBadge(
              label: 'Active',
              variant: VSBadgeVariant.success,
              size: VSBadgeSize.small,
            ),
            typeData: TypeData.widget,
          ),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: '007', typeData: TypeData.string),
          ColumnData(data: 'Ahmed Hassan', typeData: TypeData.string),
          ColumnData(data: '+971-2-345-6789', typeData: TypeData.string),
          ColumnData(data: 'ahmed.h@example.ae', typeData: TypeData.string),
          ColumnData(
            data: 'Dubai Marina, Building 45',
            typeData: TypeData.string,
          ),
          ColumnData(data: 'Dubai', typeData: TypeData.string),
          ColumnData(data: 'Dubai', typeData: TypeData.string),
          ColumnData(data: 'UAE', typeData: TypeData.string),
          ColumnData(data: '12345', typeData: TypeData.string),
          ColumnData(data: 'Tech Innovations LLC', typeData: TypeData.string),
          ColumnData(data: 'IT', typeData: TypeData.string),
          ColumnData(data: 'IT Specialist', typeData: TypeData.string),
          ColumnData(data: '02/28/2022', typeData: TypeData.string),
          ColumnData(data: 'AED 180,000', typeData: TypeData.string),
          ColumnData(data: 'Fatima Al-Mansoori', typeData: TypeData.string),
          ColumnData(
            data: VSBadge(
              label: 'Active',
              variant: VSBadgeVariant.success,
              size: VSBadgeSize.small,
            ),
            typeData: TypeData.widget,
          ),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: '008', typeData: TypeData.string),
          ColumnData(data: 'Lisa Johnson', typeData: TypeData.string),
          ColumnData(data: '+1-416-987-6543', typeData: TypeData.string),
          ColumnData(data: 'lisa.j@example.ca', typeData: TypeData.string),
          ColumnData(
            data: '789 King Street West, Unit 12',
            typeData: TypeData.string,
          ),
          ColumnData(data: 'Toronto', typeData: TypeData.string),
          ColumnData(data: 'Ontario', typeData: TypeData.string),
          ColumnData(data: 'Canada', typeData: TypeData.string),
          ColumnData(data: 'M5V 1J9', typeData: TypeData.string),
          ColumnData(data: 'Northern Technologies Inc', typeData: TypeData.string),
          ColumnData(data: 'Sales', typeData: TypeData.string),
          ColumnData(data: 'Sales Representative', typeData: TypeData.string),
          ColumnData(data: '05/20/2021', typeData: TypeData.string),
          ColumnData(data: 'C\$78,000', typeData: TypeData.string),
          ColumnData(data: 'Mark Thompson', typeData: TypeData.string),
          ColumnData(
            data: VSBadge(
              label: 'Pending',
              variant: VSBadgeVariant.warning,
              size: VSBadgeSize.small,
            ),
            typeData: TypeData.widget,
          ),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: '009', typeData: TypeData.string),
          ColumnData(data: 'Pierre Dubois', typeData: TypeData.string),
          ColumnData(data: '+33-1-2345-6789', typeData: TypeData.string),
          ColumnData(data: 'pierre.dubois@example.fr', typeData: TypeData.string),
          ColumnData(
            data: '15 Rue de la Paix, Appartement 8',
            typeData: TypeData.string,
          ),
          ColumnData(data: 'Paris', typeData: TypeData.string),
          ColumnData(data: 'Île-de-France', typeData: TypeData.string),
          ColumnData(data: 'France', typeData: TypeData.string),
          ColumnData(data: '75002', typeData: TypeData.string),
          ColumnData(data: 'European Solutions SAS', typeData: TypeData.string),
          ColumnData(data: 'Legal', typeData: TypeData.string),
          ColumnData(data: 'Legal Counsel', typeData: TypeData.string),
          ColumnData(data: '12/03/2016', typeData: TypeData.string),
          ColumnData(data: '€95,000', typeData: TypeData.string),
          ColumnData(data: 'Sophie Martin', typeData: TypeData.string),
          ColumnData(
            data: VSBadge(
              label: 'Active',
              variant: VSBadgeVariant.success,
              size: VSBadgeSize.small,
            ),
            typeData: TypeData.widget,
          ),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: '010', typeData: TypeData.string),
          ColumnData(data: 'Anna Schmidt', typeData: TypeData.string),
          ColumnData(data: '+49-30-1234-5678', typeData: TypeData.string),
          ColumnData(data: 'anna.schmidt@example.de', typeData: TypeData.string),
          ColumnData(
            data: 'Alexanderplatz 7, Wohnung 23',
            typeData: TypeData.string,
          ),
          ColumnData(data: 'Berlin', typeData: TypeData.string),
          ColumnData(data: 'Berlin', typeData: TypeData.string),
          ColumnData(data: 'Germany', typeData: TypeData.string),
          ColumnData(data: '10178', typeData: TypeData.string),
          ColumnData(data: 'Deutsche Consulting GmbH', typeData: TypeData.string),
          ColumnData(data: 'HR', typeData: TypeData.string),
          ColumnData(data: 'HR Manager', typeData: TypeData.string),
          ColumnData(data: '08/16/2019', typeData: TypeData.string),
          ColumnData(data: '€88,000', typeData: TypeData.string),
          ColumnData(data: 'Hans Mueller', typeData: TypeData.string),
          ColumnData(
            data: VSBadge(
              label: 'Inactive',
              variant: VSBadgeVariant.neutral,
              size: VSBadgeSize.small,
            ),
            typeData: TypeData.widget,
          ),
        ],
      ),
    ],
  );
}

TableData _createWidgetCallbackTableData(BuildContext context) {
  return TableData(
    header: [
      TableHeader(
        fieldName: 'id',
        label: 'ID',
        toolTip: 'ID',
        typeData: TypeData.string,
        width: 60,
      ),
      TableHeader(
        fieldName: 'name',
        label: 'Name',
        toolTip: 'Name',
        typeData: TypeData.string,
        width: 150,
      ),
      TableHeader(
        fieldName: 'role',
        label: 'Role',
        toolTip: 'Role',
        typeData: TypeData.string,
        width: 120,
      ),
      TableHeader(
        fieldName: 'actions',
        label: 'Actions',
        toolTip: 'Actions',
        typeData: TypeData.widget,
        width: 200,
      ),
    ],
    detail: [
      RowData(
        rowData: [
          ColumnData(data: '1', typeData: TypeData.string),
          ColumnData(data: 'John Doe', typeData: TypeData.string),
          ColumnData(data: 'Developer', typeData: TypeData.string),
          ColumnData(
            data: (int rowIndex, {int? widgetIndex}) => [
              VSButton(
                label: 'Edit',
                size: VSButtonSize.small,
                variant: VSButtonVariant.secondary,
                onPressed: () {
                  VSToastService.showToast(
                    context,
                    title: 'Edit Action',
                    description: 'Edit user at row $rowIndex',
                    type: VSToastType.info,
                    duration: const Duration(seconds: 2),
                  );
                },
              ),
              const SizedBox(width: 8),
              VSButton(
                label: 'Delete',
                size: VSButtonSize.small,
                variant: VSButtonVariant.danger,
                onPressed: () {
                  VSToastService.showToast(
                    context,
                    title: 'Delete Action',
                    description: 'Delete user at row $rowIndex',
                    type: VSToastType.error,
                    duration: const Duration(seconds: 2),
                  );
                },
              ),
            ],
            typeData: TypeData.widget,
          ),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: '2', typeData: TypeData.string),
          ColumnData(data: 'Jane Smith', typeData: TypeData.string),
          ColumnData(data: 'Designer', typeData: TypeData.string),
          ColumnData(
            data: (int rowIndex, {int? widgetIndex}) => [
              VSButton(
                label: 'View',
                size: VSButtonSize.small,
                variant: VSButtonVariant.primary,
                onPressed: () {
                  VSToastService.showToast(
                    context,
                    title: 'View Action',
                    description: 'View user at row $rowIndex',
                    type: VSToastType.info,
                    duration: const Duration(seconds: 2),
                  );
                },
              ),
              const SizedBox(width: 8),
              VSButton(
                label: 'Edit',
                size: VSButtonSize.small,
                variant: VSButtonVariant.secondary,
                onPressed: () {
                  VSToastService.showToast(
                    context,
                    title: 'Edit Action',
                    description: 'Edit user at row $rowIndex',
                    type: VSToastType.info,
                    duration: const Duration(seconds: 2),
                  );
                },
              ),
            ],
            typeData: TypeData.widget,
          ),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: '3', typeData: TypeData.string),
          ColumnData(data: 'Bob Johnson', typeData: TypeData.string),
          ColumnData(data: 'Manager', typeData: TypeData.string),
          ColumnData(
            data: (int rowIndex, {int? widgetIndex}) => [
              VSButton(
                label: 'Approve',
                size: VSButtonSize.small,
                variant: VSButtonVariant.primary,
                onPressed: () {
                  VSToastService.showToast(
                    context,
                    title: 'Approve Action',
                    description: 'Approve user at row $rowIndex',
                    type: VSToastType.success,
                    duration: const Duration(seconds: 2),
                  );
                },
              ),
              const SizedBox(width: 8),
              VSButton(
                label: 'Reject',
                size: VSButtonSize.small,
                variant: VSButtonVariant.danger,
                onPressed: () {
                  VSToastService.showToast(
                    context,
                    title: 'Reject Action',
                    description: 'Reject user at row $rowIndex',
                    type: VSToastType.error,
                    duration: const Duration(seconds: 2),
                  );
                },
              ),
            ],
            typeData: TypeData.widget,
          ),
        ],
      ),
    ],
  );
}

TableData _createButtonCallbackTableData(BuildContext context) {
  return TableData(
    header: [
      TableHeader(
        fieldName: 'name',
        label: 'Name',
        toolTip: 'Name',
        typeData: TypeData.string,
        width: 150,
      ),
      TableHeader(
        fieldName: 'actions',
        label: 'Actions',
        toolTip: 'Actions',
        typeData: TypeData.string,
        width: 300,
      ),
    ],
    detail: [
      RowData(
        rowData: [
          ColumnData(data: 'John Doe', typeData: TypeData.string),
          ColumnData(
            data: [
              {
                'type': 'viewButton',
                'callback': (int rowIndex) => VSToastService.showToast(
                  context,
                  title: 'View Action',
                  description: 'Viewing item $rowIndex',
                  type: VSToastType.info,
                  duration: const Duration(seconds: 2),
                ),
              },
              {
                'type': 'editButton',
                'callback': (int rowIndex) => VSToastService.showToast(
                  context,
                  title: 'Edit Action',
                  description: 'Editing item $rowIndex',
                  type: VSToastType.info,
                  duration: const Duration(seconds: 2),
                ),
              },
              {
                'type': 'deleteButton',
                'callback': (int rowIndex) => VSToastService.showToast(
                  context,
                  title: 'Delete Action',
                  description: 'Deleting item $rowIndex',
                  type: VSToastType.warning,
                  duration: const Duration(seconds: 2),
                ),
              },
            ],
            typeData: TypeData.widget,
          ),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: 'Jane Smith', typeData: TypeData.string),
          ColumnData(
            data: [
              {
                'type': 'emailButton',
                'callback': (int rowIndex) => VSToastService.showToast(
                  context,
                  title: 'Email Action',
                  description: 'Sending email for item $rowIndex',
                  type: VSToastType.info,
                  duration: const Duration(seconds: 2),
                ),
              },
              {
                'type': 'send',
                'callback': (int rowIndex) => VSToastService.showToast(
                  context,
                  title: 'Send Action',
                  description: 'Sending item $rowIndex',
                  type: VSToastType.success,
                  duration: const Duration(seconds: 2),
                ),
              },
              {
                'type': 'switchButton',
                'callback': (bool value, int rowIndex) => VSToastService.showToast(
                  context,
                  title: 'Switch Toggled',
                  description: 'Item $rowIndex switched to ${value ? 'ON' : 'OFF'}',
                  type: VSToastType.info,
                  duration: const Duration(seconds: 2),
                ),
              },
            ],
            typeData: TypeData.widget,
          ),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: 'Peter Jones', typeData: TypeData.string),
          ColumnData(
            data: [
              {
                'type': 'syncButton',
                'callback': (int rowIndex) => VSToastService.showToast(
                  context,
                  title: 'Sync Action',
                  description: 'Syncing item $rowIndex',
                  type: VSToastType.info,
                  duration: const Duration(seconds: 2),
                ),
              },
            ],
            typeData: TypeData.widget,
          ),
        ],
      ),
    ],
  );
}

TableData _createTextFieldTableData() {
  return TableData(
    header: [
      TableHeader(
        fieldName: 'item',
        label: 'Item',
        toolTip: 'Item',
        typeData: TypeData.string,
        width: 150,
      ),
      TableHeader(
        fieldName: 'quantity',
        label: 'Quantity',
        toolTip: 'Quantity',
        typeData: TypeData.textFieldNumber,
        width: 120,
      ),
      TableHeader(
        fieldName: 'price',
        label: 'Price',
        toolTip: 'Price',
        typeData: TypeData.textFieldPrice,
        width: 120,
      ),
    ],
    detail: [
      RowData(
        rowData: [
          ColumnData(data: 'Laptop', typeData: TypeData.string),
          ColumnData(data: '2', typeData: TypeData.textFieldNumber),
          ColumnData(data: '1200.00', typeData: TypeData.textFieldPrice),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: 'Mouse', typeData: TypeData.string),
          ColumnData(data: '5', typeData: TypeData.textFieldNumber),
          ColumnData(data: '25.50', typeData: TypeData.textFieldPrice),
        ],
      ),
      RowData(
        rowData: [
          ColumnData(data: 'Keyboard', typeData: TypeData.string),
          ColumnData(data: '1', typeData: TypeData.textFieldNumber),
          ColumnData(data: '75.00', typeData: TypeData.textFieldPrice),
        ],
      ),
    ],
  );
}

void _testFloatingBarStacking(BuildContext context) {
  // Show first floating bar
  VSInfoBar.showFloating(
    context,
    selectedCount: 2,
    itemLabel: 'test items',
    actions: [
      VSFloatingInfoBarAction(
        label: 'Action 1',
        icon: Icons.star,
        onPressed: () {
          VSToastService.showToast(
            context,
            title: 'Action 1',
            description: 'First floating bar action executed',
            type: VSToastType.info,
            duration: const Duration(seconds: 2),
          );
        },
      ),
    ],
    onClose: () {
      VSToastService.showToast(
        context,
        title: 'Closed',
        description: 'First floating bar closed',
        type: VSToastType.info,
        duration: const Duration(seconds: 2),
      );
    },
    duration: const Duration(seconds: 8),
  );

  // After 2 seconds, try to show another one (should replace the first)
  Future.delayed(const Duration(seconds: 2), () {
    if (!context.mounted) return;
    VSInfoBar.showFloating(
      context,
      selectedCount: 5,
      itemLabel: 'different items',
      actions: [
        VSFloatingInfoBarAction(
          label: 'Action 2',
          icon: Icons.favorite,
          onPressed: () {
            VSToastService.showToast(
              context,
              title: 'Action 2',
              description: 'Second floating bar action executed',
              type: VSToastType.success,
              duration: const Duration(seconds: 2),
            );
          },
        ),
      ],
      onClose: () {
        VSToastService.showToast(
          context,
          title: 'Closed',
          description: 'Second floating bar closed',
          type: VSToastType.success,
          duration: const Duration(seconds: 2),
        );
      },
      duration: const Duration(seconds: 10),
    );

    // Show info about stacking prevention
    VSToastService.showToast(
      context,
      title: 'Stacking Prevention Test',
      description: 'Notice how the second bar replaced the first one automatically',
      type: VSToastType.warning,
      duration: const Duration(seconds: 3),
    );
  });
}
