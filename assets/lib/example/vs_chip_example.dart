import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSChipExample extends StatefulWidget {
  const VSChipExample({super.key});

  @override
  State<VSChipExample> createState() => _VSChipExampleState();
}

class _VSChipExampleState extends State<VSChipExample> {
  // Filter chips state
  final Set<String> _selectedFilters = {'React', 'TypeScript'};
  final List<String> _availableFilters = ['React', 'Vue', 'Angular', 'TypeScript', 'JavaScript', 'Python'];

  // Tag chips state
  final Set<String> _selectedTags = {'urgent', 'frontend'};
  final List<String> _availableTags = ['urgent', 'frontend', 'backend', 'design', 'testing', 'documentation'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Chip Examples',
      //   actions: [
      //     VSButton(
      //       label: 'Info',
      //       onPressed: () => _showChipInfoDialog(context),
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
              title: 'VS Chip Variants & Types',
              description: 'Comprehensive demonstration of chip variants, types, and interactive examples',
              child: _buildChipShowcase(),
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

  Widget _buildChipShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Color Chips - All Variants
        _buildChipGroup(
          title: 'Color Chips',
          description: 'Status and category indicators with semantic colors',
          children: [
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: VSChipVariant.values.map((variant) {
                return VSChip(
                  label: variant.name.toUpperCase(),
                  variant: variant,
                  type: VSChipType.color,
                );
              }).toList(),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Input Chips
        _buildChipGroup(
          title: 'Input Chips',
          description: 'Filter chips with delete functionality for user input',
          children: [
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                VSChip(
                  label: 'React',
                  type: VSChipType.input,
                  onDelete: () => _showActionDialog(context, 'React chip deleted'),
                ),
                VSChip(
                  label: 'TypeScript',
                  type: VSChipType.input,
                  onDelete: () => _showActionDialog(context, 'TypeScript chip deleted'),
                ),
                VSChip(
                  label: 'Flutter',
                  type: VSChipType.input,
                  onDelete: () => _showActionDialog(context, 'Flutter chip deleted'),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Approval Chips
        _buildChipGroup(
          title: 'Approval Chips',
          description: 'Workflow approval indicators with check marks',
          children: [
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                const VSChip(
                  label: 'APPROVED',
                  type: VSChipType.approval,
                  variant: VSChipVariant.success,
                  showCheckIndicator: true,
                ),
                const VSChip(
                  label: 'PENDING',
                  type: VSChipType.approval,
                  variant: VSChipVariant.warning,
                ),
                const VSChip(
                  label: 'REJECTED',
                  type: VSChipType.approval,
                  variant: VSChipVariant.danger,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Disabled Chips
        _buildChipGroup(
          title: 'Disabled State',
          description: 'Chips in disabled state with visual feedback',
          children: [
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                const VSChip(
                  label: 'DISABLED',
                  type: VSChipType.color,
                  variant: VSChipVariant.primary,
                  isEnabled: false,
                ),
                const VSChip(
                  label: 'DISABLED INPUT',
                  type: VSChipType.input,
                  isEnabled: false,
                ),
                const VSChip(
                  label: 'DISABLED APPROVAL',
                  type: VSChipType.approval,
                  variant: VSChipVariant.success,
                  showCheckIndicator: true,
                  isEnabled: false,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Interactive Filter Example
        _buildChipGroup(
          title: 'Interactive Filter Chips',
          description: 'Dynamic filter selection with add/remove functionality',
          children: [
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Technology Filters',
                        style: AppTypography.bodyMediumSemibold,
                      ),
                      const Spacer(),
                      VSBadge(
                        label: '${_selectedFilters.length} selected',
                        variant: VSBadgeVariant.primary,
                        size: VSBadgeSize.xsmall,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: _availableFilters.map((filter) {
                      final isSelected = _selectedFilters.contains(filter);
                      return VSChip(
                        label: filter,
                        type: VSChipType.input,
                        variant: isSelected ? VSChipVariant.primary : VSChipVariant.neutral,
                        onDelete: isSelected
                            ? () => setState(() => _selectedFilters.remove(filter))
                            : null,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    children: [
                      VSButton(
                        label: 'Add Filter',
                        onPressed: () => _showAddFilterDialog(context),
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.outlined,
                      ),
                      VSButton(
                        label: 'Clear All',
                        onPressed: () => setState(() => _selectedFilters.clear()),
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.text,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Tag Management Example
        _buildChipGroup(
          title: 'Tag Management',
          description: 'Tag chips for categorizing and organizing content',
          children: [
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
                    'Project Tags',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: _availableTags.map((tag) {
                      return VSChip(
                        label: tag,
                        type: VSChipType.color,
                        variant: _getTagVariant(tag),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Text(
                    'Selected tags: ${_selectedTags.join(", ")}',
                    style: AppTypography.bodySmallRegular.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Real-world Usage Examples
        _buildChipGroup(
          title: 'Real-world Usage Examples',
          description: 'Common chip patterns in application interfaces',
          children: [
            // User Profile with Skills
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const VSAvatar(
                        imageUrl: 'https://via.placeholder.com/40',
                        size: VSAvatarSize.medium,
                      ),
                      SizedBox(width: AppSpacing.sm),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sarah Johnson', style: AppTypography.bodyMediumSemibold),
                          Text('Senior Developer', style: AppTypography.bodySmallRegular),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Text(
                    'Skills & Technologies',
                    style: AppTypography.bodySmallSemibold,
                  ),
                  SizedBox(height: AppSpacing.xs),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      const VSChip(label: 'React', type: VSChipType.color, variant: VSChipVariant.primary),
                      const VSChip(label: 'TypeScript', type: VSChipType.color, variant: VSChipVariant.secondary),
                      const VSChip(label: 'Node.js', type: VSChipType.color, variant: VSChipVariant.success),
                      const VSChip(label: 'AWS', type: VSChipType.color, variant: VSChipVariant.warning),
                      const VSChip(label: 'Docker', type: VSChipType.color, variant: VSChipVariant.neutral),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Task Status Board
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Task Status Board', style: AppTypography.bodyMediumSemibold),
                      const Spacer(),
                      const VSBadge(
                        label: '5 tasks',
                        variant: VSBadgeVariant.primary,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  _buildTaskItem('Implement user authentication', ['backend', 'security'], VSChipVariant.warning),
                  _buildTaskItem('Design new dashboard', ['design', 'frontend'], VSChipVariant.primary),
                  _buildTaskItem('Write API documentation', ['documentation'], VSChipVariant.neutral),
                  _buildTaskItem('Setup CI/CD pipeline', ['devops'], VSChipVariant.success),
                  _buildTaskItem('Code review', ['testing'], VSChipVariant.secondary),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Approval Workflow
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
                    'Purchase Request #PR-2024-001',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Text('Status:', style: AppTypography.bodySmallRegular),
                      SizedBox(width: AppSpacing.sm),
                      const VSChip(
                        label: 'Manager',
                        type: VSChipType.approval,
                        variant: VSChipVariant.success,
                        showCheckIndicator: true,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Text(
                    'Approval History',
                    style: AppTypography.bodySmallSemibold,
                  ),
                  SizedBox(height: AppSpacing.xs),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      const VSChip(
                        label: 'Manager',
                        type: VSChipType.approval,
                        variant: VSChipVariant.success,
                        showCheckIndicator: true,
                      ),
                      const VSChip(
                        label: 'Senior Manager',
                        type: VSChipType.approval,
                        variant: VSChipVariant.warning,
                      ),
                      const VSChip(
                        label: 'Senior Manager',
                        type: VSChipType.approval,
                        variant: VSChipVariant.neutral,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Filter Panel
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
                    'Active Filters',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      VSChip(
                        label: 'Status: Active',
                        type: VSChipType.input,
                        onDelete: () => _showActionDialog(context, 'Status filter removed'),
                      ),
                      VSChip(
                        label: 'Priority: High',
                        type: VSChipType.input,
                        onDelete: () => _showActionDialog(context, 'Priority filter removed'),
                      ),
                      VSChip(
                        label: 'Date: This Week',
                        type: VSChipType.input,
                        onDelete: () => _showActionDialog(context, 'Date filter removed'),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.sm),
                  VSButton(
                    label: 'Add Filter',
                    onPressed: () => _showActionDialog(context, 'Filter dialog opened'),
                    size: VSButtonSize.small,
                    variant: VSButtonVariant.outlined,
                    leftIcon: Icons.add,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildChipGroup({
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

  Widget _buildTaskItem(String title, List<String> tags, VSChipVariant statusVariant) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTypography.bodySmallRegular,
            ),
          ),
          SizedBox(width: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.xs,
            children: tags.map((tag) => VSChip(
              label: tag,
              type: VSChipType.color,
              variant: _getTagVariant(tag),
            )).toList(),
          ),
          SizedBox(width: AppSpacing.sm),
          VSChip(
            label: 'IN PROGRESS',
            type: VSChipType.color,
            variant: statusVariant,
          ),
        ],
      ),
    );
  }

  VSChipVariant _getTagVariant(String tag) {
    switch (tag) {
      case 'urgent':
        return VSChipVariant.danger;
      case 'frontend':
        return VSChipVariant.primary;
      case 'backend':
        return VSChipVariant.secondary;
      case 'design':
        return VSChipVariant.success;
      case 'testing':
        return VSChipVariant.warning;
      case 'documentation':
        return VSChipVariant.neutral;
      default:
        return VSChipVariant.neutral;
    }
  }

  void _showAddFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.input,
        message: 'Select filters to add:',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: _availableFilters
                  .where((filter) => !_selectedFilters.contains(filter))
                  .map((filter) => VSButton(
                        label: filter,
                        onPressed: () {
                          setState(() => _selectedFilters.add(filter));
                          Navigator.of(context).pop();
                        },
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.outlined,
                      ))
                  .toList(),
            ),
          ],
        ),
        actions: [
          VSDialogAction(
            label: 'Cancel',
            onPressed: () {},
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

}