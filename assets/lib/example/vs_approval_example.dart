import 'package:flutter/material.dart';
import 'package:vs_design_system/shared/models/drop_down_obj_model.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSApprovalExample extends StatefulWidget {
  const VSApprovalExample({super.key});

  @override
  State<VSApprovalExample> createState() => _VSApprovalExampleState();
}

class _VSApprovalExampleState extends State<VSApprovalExample> {
  final ValueNotifier<int> selectedTab = ValueNotifier(0);
  final TextEditingController searchController = TextEditingController();
  int currentPage = 1;
  int itemsPerPage = 15;
  String searchQuery = '';

  // Filter states
  bool _isStatusFilterActive = false;
  bool _isAmountFilterActive = false;
  bool _isDateFilterActive = false;

  // Sample approval data
  final List<Map<String, dynamic>> approvalData = [
    {
      'id': 'AP-001',
      'title': 'Admin Fee Approval - John Doe',
      'description': 'Biaya admin untuk transaksi pembayaran John Doe',
      'amount': 50000.0,
      'status': 'SUBMITTED',
      'approval_status': 'WAITING_APPROVAL MANAGER',
      'date': '2025-12-14',
      'type': 'admin_fee',
      'customer_name': 'John Doe',
      'doc_number': 'ASG/BAT/1225/00001',
      'contract_no': 'KML0/RSV/1225/00129',
      'unit_code': 'VPIN-660',
      'unit_descs': 'VPINEWOOD BLOK A NO. 660 TYPE BADAN',
      'submitted_by': 'john.doe',
      'total_admin_amount': 100000.0,
      'total_admin_final_amount': 50000.0,
    },
    {
      'id': 'AP-002',
      'title': 'Fine Payment - Jane Smith',
      'description': 'Denda keterlambatan pembayaran Jane Smith',
      'amount': 250000.0,
      'status': 'SUBMITTED',
      'approval_status': 'WAITING_APPROVAL MANAGER',
      'date': '2025-12-13',
      'type': 'fine',
      'customer_name': 'Jane Smith',
      'doc_number': 'ASG/BAT/1225/00002',
      'contract_no': 'KML0/RSV/1225/00309',
      'unit_code': 'VPIN-1027',
      'unit_descs': 'VPINEWOOD BLOK A NO. 1027',
      'submitted_by': 'jane.smith',
      'total_admin_amount': 250000.0,
      'total_admin_final_amount': 0.0,
    },
    {
      'id': 'AP-003',
      'title': 'Discount Approval - Bob Johnson',
      'description': 'Diskon khusus untuk pelanggan loyal Bob Johnson',
      'amount': 100000.0,
      'status': 'APPROVED',
      'approval_status': 'APPROVED',
      'date': '2025-12-12',
      'type': 'admin_fee',
      'customer_name': 'Bob Johnson',
      'doc_number': 'ASG/BAT/1225/00003',
      'contract_no': 'KML0/RSV/1225/00187',
      'unit_code': 'VCPT-ARC40',
      'unit_descs': 'VARCADIA 5 CPT NO.40 TYPE MARIGOLD BADAN',
      'submitted_by': 'bob.johnson',
      'total_admin_amount': 200000.0,
      'total_admin_final_amount': 100000.0,
    },
    {
      'id': 'AP-004',
      'title': 'Refund Request - Alice Brown',
      'description': 'Pengembalian dana untuk transaksi gagal Alice Brown',
      'amount': 75000.0,
      'status': 'REJECTED',
      'approval_status': 'REJECTED',
      'date': '2025-12-11',
      'type': 'fine',
      'customer_name': 'Alice Brown',
      'doc_number': 'ASG/BAT/1225/00004',
      'contract_no': 'KML0/RSV/1225/00058',
      'unit_code': 'VARC5-048',
      'unit_descs': 'VARCADIA 5 NO. ARC5-048 TYPE MARIGOLD BADAN',
      'submitted_by': 'alice.brown',
      'total_admin_amount': 75000.0,
      'total_admin_final_amount': 0.0,
    },
    {
      'id': 'AP-005',
      'title': 'Admin Fee Approval - Charlie Wilson',
      'description': 'Biaya admin untuk transaksi pembayaran Charlie Wilson',
      'amount': 150000.0,
      'status': 'SUBMITTED',
      'approval_status': 'WAITING_APPROVAL MANAGER',
      'date': '2025-12-10',
      'type': 'admin_fee',
      'customer_name': 'Charlie Wilson',
      'doc_number': 'ASG/BAT/1225/00005',
      'contract_no': 'KML0/RSV/1225/00242',
      'unit_code': 'VARC1-010A',
      'unit_descs': 'VARCADIA 1 NO. 010 Type MARIGOLD',
      'submitted_by': 'charlie.wilson',
      'total_admin_amount': 300000.0,
      'total_admin_final_amount': 150000.0,
    },
    {
      'id': 'AP-006',
      'title': 'Fine Payment - Diana Davis',
      'description': 'Denda keterlambatan pembayaran Diana Davis',
      'amount': 200000.0,
      'status': 'SUBMITTED',
      'approval_status': 'WAITING_APPROVAL SENIOR MANAGER',
      'date': '2025-12-09',
      'type': 'fine',
      'customer_name': 'Diana Davis',
      'doc_number': 'ASG/BAT/1225/00006',
      'contract_no': 'KML0/RSV/1225/00316',
      'unit_code': 'VARC5-049',
      'unit_descs': 'VARCADIA 5 NO. ARC5-049 TYPE MARIGOLD BADAN',
      'submitted_by': 'diana.davis',
      'total_admin_amount': 200000.0,
      'total_admin_final_amount': 0.0,
    },
    {
      'id': 'AP-007',
      'title': 'Admin Fee Approval - Edward Miller',
      'description': 'Biaya admin untuk transaksi pembayaran Edward Miller',
      'amount': 80000.0,
      'status': 'APPROVED',
      'approval_status': 'APPROVED',
      'date': '2025-12-08',
      'type': 'admin_fee',
      'customer_name': 'Edward Miller',
      'doc_number': 'ASG/BAT/1225/00007',
      'contract_no': 'KML0/RSV/1225/00052',
      'unit_code': 'VARC5-080A',
      'unit_descs': 'VARCADIA 5 NO. ARC5-080A TYPE MARIGOLD BADAN',
      'submitted_by': 'edward.miller',
      'total_admin_amount': 160000.0,
      'total_admin_final_amount': 80000.0,
    },
    {
      'id': 'AP-008',
      'title': 'Discount Approval - Fiona Garcia',
      'description': 'Diskon khusus untuk pelanggan loyal Fiona Garcia',
      'amount': 120000.0,
      'status': 'SUBMITTED',
      'approval_status': 'WAITING_APPROVAL MANAGER',
      'date': '2025-12-07',
      'type': 'admin_fee',
      'customer_name': 'Fiona Garcia',
      'doc_number': 'ASG/BAT/1225/00008',
      'contract_no': 'KML0/RSV/1225/00318',
      'unit_code': 'VSAN1-038A',
      'unit_descs': 'VSan Antonio 1 No. 038 Type EUGENIA HOEK SPESIAL',
      'submitted_by': 'fiona.garcia',
      'total_admin_amount': 240000.0,
      'total_admin_final_amount': 120000.0,
    },
    {
      'id': 'AP-009',
      'title': 'Admin Fee Approval - George Thompson',
      'description': 'Biaya admin untuk transaksi pembayaran George Thompson',
      'amount': 95000.0,
      'status': 'SUBMITTED',
      'approval_status': 'WAITING_APPROVAL MANAGER',
      'date': '2025-12-06',
      'type': 'admin_fee',
      'customer_name': 'George Thompson',
      'doc_number': 'ASG/BAT/1225/00009',
      'contract_no': 'KML0/RSV/1225/00421',
      'unit_code': 'VPIN-780',
      'unit_descs': 'VPINEWOOD BLOK B NO. 780 TYPE STANDARD',
      'submitted_by': 'george.thompson',
      'total_admin_amount': 190000.0,
      'total_admin_final_amount': 95000.0,
    },
    {
      'id': 'AP-010',
      'title': 'Fine Payment - Helen Rodriguez',
      'description': 'Denda keterlambatan pembayaran Helen Rodriguez',
      'amount': 180000.0,
      'status': 'SUBMITTED',
      'approval_status': 'WAITING_APPROVAL MANAGER',
      'date': '2025-12-05',
      'type': 'fine',
      'customer_name': 'Helen Rodriguez',
      'doc_number': 'ASG/BAT/1225/00010',
      'contract_no': 'KML0/RSV/1225/00567',
      'unit_code': 'VPIN-1123',
      'unit_descs': 'VPINEWOOD BLOK C NO. 1123 TYPE DELUXE',
      'submitted_by': 'helen.rodriguez',
      'total_admin_amount': 180000.0,
      'total_admin_final_amount': 0.0,
    },
    {
      'id': 'AP-011',
      'title': 'Admin Fee Approval - Ian Martinez',
      'description': 'Biaya admin untuk transaksi pembayaran Ian Martinez',
      'amount': 110000.0,
      'status': 'APPROVED',
      'approval_status': 'APPROVED',
      'date': '2025-12-04',
      'type': 'admin_fee',
      'customer_name': 'Ian Martinez',
      'doc_number': 'ASG/BAT/1225/00011',
      'contract_no': 'KML0/RSV/1225/00678',
      'unit_code': 'VCPT-ARC67',
      'unit_descs': 'VARCADIA 5 CPT NO.67 TYPE ROSEMARY BADAN',
      'submitted_by': 'ian.martinez',
      'total_admin_amount': 220000.0,
      'total_admin_final_amount': 110000.0,
    },
    {
      'id': 'AP-012',
      'title': 'Fine Payment - Julia Anderson',
      'description': 'Denda keterlambatan pembayaran Julia Anderson',
      'amount': 220000.0,
      'status': 'SUBMITTED',
      'approval_status': 'WAITING_APPROVAL SENIOR MANAGER',
      'date': '2025-12-03',
      'type': 'fine',
      'customer_name': 'Julia Anderson',
      'doc_number': 'ASG/BAT/1225/00012',
      'contract_no': 'KML0/RSV/1225/00789',
      'unit_code': 'VSAN1-045B',
      'unit_descs': 'VSan Antonio 1 No. 045 Type DAHLIA SPECIAL',
      'submitted_by': 'julia.anderson',
      'total_admin_amount': 220000.0,
      'total_admin_final_amount': 0.0,
    },
    {
      'id': 'AP-013',
      'title': 'Admin Fee Approval - Kevin White',
      'description': 'Biaya admin untuk transaksi pembayaran Kevin White',
      'amount': 135000.0,
      'status': 'SUBMITTED',
      'approval_status': 'WAITING_APPROVAL MANAGER',
      'date': '2025-12-02',
      'type': 'admin_fee',
      'customer_name': 'Kevin White',
      'doc_number': 'ASG/BAT/1225/00013',
      'contract_no': 'KML0/RSV/1225/00890',
      'unit_code': 'VARC5-089',
      'unit_descs': 'VARCADIA 5 NO. ARC5-089 TYPE MARIGOLD BADAN',
      'submitted_by': 'kevin.white',
      'total_admin_amount': 270000.0,
      'total_admin_final_amount': 135000.0,
    },
    {
      'id': 'AP-014',
      'title': 'Fine Payment - Laura Taylor',
      'description': 'Denda keterlambatan pembayaran Laura Taylor',
      'amount': 160000.0,
      'status': 'REJECTED',
      'approval_status': 'REJECTED',
      'date': '2025-12-01',
      'type': 'fine',
      'customer_name': 'Laura Taylor',
      'doc_number': 'ASG/BAT/1225/00014',
      'contract_no': 'KML0/RSV/1225/00901',
      'unit_code': 'VKBD-412',
      'unit_descs': 'CENTRAL BUSINESS DISTRICT KAV. DEV NO.412',
      'submitted_by': 'laura.taylor',
      'total_admin_amount': 160000.0,
      'total_admin_final_amount': 0.0,
    },
    {
      'id': 'AP-015',
      'title': 'Admin Fee Approval - Michael Brown',
      'description': 'Biaya admin untuk transaksi pembayaran Michael Brown',
      'amount': 175000.0,
      'status': 'SUBMITTED',
      'approval_status': 'WAITING_APPROVAL MANAGER',
      'date': '2025-11-30',
      'type': 'admin_fee',
      'customer_name': 'Michael Brown',
      'doc_number': 'ASG/BAT/1125/00015',
      'contract_no': 'KML0/RSV/1125/01012',
      'unit_code': 'VPIN-945',
      'unit_descs': 'VPINEWOOD BLOK D NO. 945 TYPE PREMIUM',
      'submitted_by': 'michael.brown',
      'total_admin_amount': 350000.0,
      'total_admin_final_amount': 175000.0,
    },
    {
      'id': 'AP-016',
      'title': 'Fine Payment - Nancy Davis',
      'description': 'Denda keterlambatan pembayaran Nancy Davis',
      'amount': 195000.0,
      'status': 'APPROVED',
      'approval_status': 'APPROVED',
      'date': '2025-11-29',
      'type': 'fine',
      'customer_name': 'Nancy Davis',
      'doc_number': 'ASG/BAT/1125/00016',
      'contract_no': 'KML0/RSV/1125/01123',
      'unit_code': 'VARC1-078C',
      'unit_descs': 'VARCADIA 1 NO. 078 Type TULIP SPECIAL',
      'submitted_by': 'nancy.davis',
      'total_admin_amount': 195000.0,
      'total_admin_final_amount': 0.0,
    },
  ];

  final ValueNotifier<List<VSFilterItem>?> statusNotifier = ValueNotifier([
    VSFilterItem(name: 'Active', id: 'active'),
    VSFilterItem(name: 'Inactive', id: 'inactive'),
    VSFilterItem(name: 'Pending', id: 'pending'),
  ]);

  final ValueNotifier<List<VSFilterItem>?> categoryNotifier = ValueNotifier([
    VSFilterItem(name: 'Technology', id: 'technology'),
    VSFilterItem(name: 'Business', id: 'business'),
    VSFilterItem(name: 'Design', id: 'design'),
    VSFilterItem(name: 'Marketing', id: 'marketing'),
  ]);

  final List<VSFilterMenuItem> lsFilterMenuItem = [
    VSFilterMenuItem(
      icon: const Icon(Icons.person, size: 16),
      title: 'Status',
      lsItem: [
        DropDownObj(id: '1', descs: 'Active'),
        DropDownObj(id: '2', descs: 'Inactive'),
        DropDownObj(id: '3', descs: 'Pending'),
      ],
      isMultiSelect: false,
    ),
    VSFilterMenuItem(
      icon: const Icon(Icons.category, size: 16),
      title: 'Category',
      lsItem: [
        DropDownObj(id: '1', descs: 'Technology'),
        DropDownObj(id: '2', descs: 'Business'),
        DropDownObj(id: '3', descs: 'Design'),
        DropDownObj(id: '4', descs: 'Marketing'),
      ],
      isMultiSelect: true,
      withSearch: true,
      searchBarTitle: 'Search category...',
    ),
  ];

  List<Map<String, dynamic>> get filteredData {
    return approvalData.where((item) {
      final matchesSearch =
          searchQuery.isEmpty ||
          item['title'].toString().toLowerCase().contains(
            searchQuery.toLowerCase(),
          ) ||
          item['description'].toString().toLowerCase().contains(
            searchQuery.toLowerCase(),
          );

      final matchesTab =
          (selectedTab.value == 0 && item['type'] == 'admin_fee') ||
          (selectedTab.value == 1 && item['type'] == 'fine');

      return matchesSearch && matchesTab;
    }).toList();
  }

  List<Map<String, dynamic>> get paginatedData {
    final startIndex = (currentPage - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;
    return filteredData.sublist(
      startIndex,
      endIndex > filteredData.length ? filteredData.length : endIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return VSPageView(
      isMobile: false,
      title: 'Approval Management',
      searchCallback: (query) {
        setState(() {
          searchQuery = query;
          currentPage = 1; // Reset to first page when searching
        });
      },
      tabs: const ['Admin Fee', 'Fine'],
      tabbarOnTap: (index) {
        setState(() {
          selectedTab.value = index;
          currentPage = 1; // Reset to first page when changing tabs
        });
      },
      customWidgetRight: VSParentFilterGroup(
        applyCallback: () {
          VSToastService.showToast(
            context,
            title: 'Applied',
            description: 'Approval filter applied successfully',
            type: VSToastType.success,
          );
        },
        children: [
          VSFilterMenuItem2(
            icon: const Icon(Icons.flag, size: 16),
            title: 'Status',
            lsItemNotifier: statusNotifier,
            isMultiSelect: false,
          ),
          VSFilterMenuItem2(
            icon: const Icon(Icons.category, size: 16),
            title: 'Category',
            lsItemNotifier: categoryNotifier,
            isMultiSelect: true,
          ),          VSDateRangeFilterMenuItem(
            icon: VSIcon(name: VSIcons.calendar, size: 16),
            title: 'Created Date',
            initialDateRange: DateTimeRange(
              start: DateTime.now().subtract(const Duration(days: 30)),
              end: DateTime.now(),
            ),
            startDate: DateTime(2020),
            endDate: DateTime(2030),
          ),        ],
      ),
      tableContent: Column(
        children: [
          // Header Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: VSHeaderContent(
              total: filteredData.length,
              adminFeeCount: filteredData
                  .where((item) => item['type'] == 'admin_fee')
                  .length,
              fineCount: filteredData
                  .where((item) => item['type'] == 'fine')
                  .length,
              isLoadingTotal: false,
              isErrorTotal: false,
            ),
          ),

          // Approval Items List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: paginatedData.length,
              itemBuilder: (context, index) {
                final item = paginatedData[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFF5F8FD),
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: [
                          Text(
                            item['doc_number'] as String,
                            style: AppTypography.bodySmallBold,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.neutral300),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: ExpansionTile(
                                tilePadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                                maintainState: true,
                                title: Row(
                                  children: [
                                    const SizedBox(
                                        height: 40,
                                        child: VerticalDivider(
                                          color: Color(0xFF1177FF),
                                          thickness: 2,
                                        )),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['title'] as String,
                                          style: AppTypography.bodySmallBold.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          item['id'] as String,
                                          style: AppTypography.bodySmallRegular.copyWith(
                                            color: AppColors.neutral600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                backgroundColor: Colors.white,
                                collapsedBackgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                children: [
                                  Container(
                                    height: 1,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(alpha: 0.2),
                                          offset: const Offset(0, 2),
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['description'] as String,
                                          style: AppTypography.bodySmallRegular,
                                        ),
                                        SizedBox(height: AppSpacing.sm),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_today,
                                              size: 16,
                                              color: AppColors.neutral600,
                                            ),
                                            SizedBox(width: AppSpacing.xs),
                                            Text(
                                              'Date: ${item['date']}',
                                              style: AppTypography.bodySmallRegular.copyWith(
                                                color: AppColors.neutral600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: AppSpacing.sm),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.attach_money,
                                              size: 16,
                                              color: AppColors.neutral600,
                                            ),
                                            SizedBox(width: AppSpacing.xs),
                                            Text(
                                              'Amount: Rp ${item['amount'].toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                                              style: AppTypography.bodySmallRegular.copyWith(
                                                color: AppColors.neutral600,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: AppSpacing.md),
                                        Row(
                                          children: [
                                            if (item['status'] == 'SUBMITTED') ...[
                                              VSButton(
                                                label: 'Approve',
                                                onPressed: () =>
                                                    _handleApproval(item, 'APPROVED'),
                                                size: VSButtonSize.small,
                                                variant: VSButtonVariant.primary,
                                              ),
                                              SizedBox(width: AppSpacing.sm),
                                              VSButton(
                                                label: 'Reject',
                                                onPressed: () =>
                                                    _handleApproval(item, 'REJECTED'),
                                                size: VSButtonSize.small,
                                                variant: VSButtonVariant.danger,
                                              ),
                                            ],
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: InkWell(
                                            onTap: () => _showDetailDialog(context, item),
                                            child: Text(
                                              "Lihat detail",
                                              style: AppTypography.bodySmallBold.copyWith(
                                                  color: const Color(0xFF5B8BD6),
                                                  fontWeight: FontWeight.w500,
                                                  decoration: TextDecoration.underline,
                                                  decorationColor: const Color(0xFF5B8BD6),
                                                  decorationThickness: 2),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      footer: Padding(
        padding: const EdgeInsets.all(16),
        child: VSPagination(
          currentPage: currentPage,
          totalItems: filteredData.length,
          itemsPerPage: itemsPerPage,
          onPageChanged: (page) {
            setState(() {
              currentPage = page;
            });
          },
          onItemsPerPageChanged: (newItemsPerPage) {
            setState(() {
              itemsPerPage = newItemsPerPage;
              currentPage = 1; // Reset to first page
            });
          },
        ),
      ),
    );
  }

  Widget _getStatusIcon(String status) {
    switch (status) {
      case 'APPROVED':
        return Icon(Icons.check_circle, color: Colors.green, size: 20);
      case 'REJECTED':
        return Icon(Icons.cancel, color: Colors.red, size: 20);
      case 'SUBMITTED':
      default:
        return Icon(Icons.pending, color: Colors.orange, size: 20);
    }
  }

  Widget _getStatusChip(String status) {
    return VSChip(
      label: status,
      variant: status == 'APPROVED'
          ? VSChipVariant.success
          : status == 'REJECTED'
          ? VSChipVariant.danger
          : VSChipVariant.warning,
      type: VSChipType.color,
    );
  }

  void _handleApproval(Map<String, dynamic> item, String newStatus) {
    setState(() {
      final index = approvalData.indexWhere((data) => data['id'] == item['id']);
      if (index != -1) {
        approvalData[index]['status'] = newStatus;
        approvalData[index]['approval_status'] = newStatus;
      }
    });

    VSToastService.showToast(
      context,
      title: 'Approval Updated',
      description: 'Item ${item['id']} has been $newStatus',
      type: newStatus == 'APPROVED' ? VSToastType.success : VSToastType.error,
    );
  }

  void _showDetailDialog(BuildContext context, Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        title: 'Approval Details',
        message: '',
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('ID: ${item['id']}', style: AppTypography.bodySmallBold),
            SizedBox(height: AppSpacing.sm),
            Text(
              'Title: ${item['title']}',
              style: AppTypography.bodySmallBold,
            ),
            SizedBox(height: AppSpacing.sm),
            Text(
              'Description: ${item['description']}',
              style: AppTypography.bodySmallBold,
            ),
            SizedBox(height: AppSpacing.sm),
            Text(
              'Amount: Rp ${item['amount'].toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
              style: AppTypography.bodySmallBold,
            ),
            SizedBox(height: AppSpacing.sm),
            Text(
              'Status: ${item['status']}',
              style: AppTypography.bodySmallBold,
            ),
            SizedBox(height: AppSpacing.sm),
            Text(
              'Date: ${item['date']}',
              style: AppTypography.bodySmallBold,
            ),
          ],
        ),
        actions: [
          VSDialogAction(
            label: 'Close',
            onPressed: () => VSToastService.showToast(
              context,
              title: 'Dialog Closed',
              description: 'Approval details dialog has been closed',
              type: VSToastType.info,
            ),
            variant: VSButtonVariant.secondary,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
