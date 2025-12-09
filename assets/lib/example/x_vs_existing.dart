import 'package:flutter/material.dart';
import 'package:testing_vs_ds/shared/layout/layout.dart';
import 'package:vs_design_system/tokens/colors.dart';
import 'package:vs_design_system/tokens/spacing.dart';
import 'package:vs_design_system/tokens/typography.dart';
import 'package:vs_design_system/vs_design_system.dart';

class ExistingComponentsExample extends StatefulWidget {
  const ExistingComponentsExample({super.key});

  @override
  State<ExistingComponentsExample> createState() =>
      _ExistingComponentsExampleState();
}

class _ExistingComponentsExampleState extends State<ExistingComponentsExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildSection(
        title: 'Existing Widgets',
        children: [
          buildSubsection(
            title: 'VSCustomTextField - Custom Text Field',
            children: [
              
              VSCustomTextField(
                title: 'Full Name',
                require: true,
                isEmpty: false,
                saveCallBack: (value) {
                  VSToastService.showToast(
                    context,
                    title: 'Input Saved',
                    description: 'Value: $value',
                    type: VSToastType.success,
                  );
                },
                placeHolder: 'Enter your full name',
              ),
            ],
          ),
          const SizedBox(height: 16),
          buildSubsection(
            title: 'VSDateTimePickerFieldWidget - Date Picker',
            children: [
              VSDateTimePickerFieldWidget(
                hint: 'Select Date',
                title: 'Birth Date',
                require: true,
                controller: TextEditingController(),
                dateShowFormat: 'dd MMM yyyy',
                startDate: DateTime(1900),
                endDate: DateTime.now(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          buildSubsection(
            title: 'VSSearchWidget - Search Input',
            children: [
              VSSearchWidget(
                searchBarTitle: 'Search items...',
                onSearch: (value) {
                  VSToastService.showToast(
                    context,
                    title: 'Search',
                    description: 'Searching for: $value',
                    type: VSToastType.info,
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          buildSubsection(
            title: 'VSCustomTabbar - Custom Tabs',
            children: [
              Row(
                children: [
                  VSCustomTabbar(
                    title: 'Tab 1',
                    isSelected: true,
                    onTap: () {},
                  ),
                  VSCustomTabbar(
                    title: 'Tab 2',
                    isSelected: false,
                    onTap: () {},
                  ),
                  VSCustomTabbar(
                    title: 'Tab 3',
                    isSelected: false,
                    onTap: () {},
                    isRemovable: true,
                    onRemove: () {
                      VSToastService.showToast(
                        context,
                        title: 'Tab Removed',
                        description: 'Tab 3 has been removed',
                        type: VSToastType.info,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          buildSubsection(
            title: 'vsLoadingCustom - Loading Indicators',
            children: [
              vsLoadingCustom(),
              vsLoadingCustom(isSmaller: true),
              vsLoadingCustom(color: AppColors.dangerDefault),
            ],
          ),
          const SizedBox(height: 16),
          buildSubsection(
            title: 'VSCopyToClipboard - Copy Text',
            children: [
              VSCopyToClipboard(
                text: 'This text can be copied to clipboard',
                style: AppTypography.bodyMediumRegular,
                successTitle: 'Copied!',
                successMessage: 'Text copied successfully',
              ),
            ],
          ),
          const SizedBox(height: 16),
          buildSubsection(
            title: 'VSDialog - Loading Dialog',
            children: [
              VSButton(
                label: 'Show Loading Dialog',
                variant: VSButtonVariant.primary,
                size: VSButtonSize.medium,
                onPressed: () async {
                  final key = GlobalKey();
                  VSDialog.showLoadingDialog(context, key);
                  await Future.delayed(const Duration(seconds: 1));
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          buildSubsection(
            title: 'vsFormDialog - Form Dialog',
            children: [
              VSButton(
                label: 'Open Form Dialog',
                variant: VSButtonVariant.primary,
                size: VSButtonSize.medium,
                onPressed: () async {
                  await vsFormDialog(
                    context,
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.xl),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Form Dialog Example', style: AppTypography.h4),
                          const SizedBox(height: AppSpacing.lg),
                          const Text('This is a custom form dialog'),
                          const SizedBox(height: AppSpacing.lg),
                          VSButton(
                            label: 'Close',
                            variant: VSButtonVariant.primary,
                            size: VSButtonSize.medium,
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                    size: const Size(400, 300),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          buildSubsection(
            title: 'VSDottedBorder - Dotted Borders',
            children: [
              VSDottedBorder(
                color: AppColors.primaryDefault,
                borderType: VSBorderType.rRect,
                radius: const Radius.circular(12),
                dashPattern: const [6, 3],
                strokeWidth: 2,
                child: Container(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  child: const Text('Content with dotted border'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          buildSubsection(
            title: 'VSDottedBorder - Animated',
            children: [
              VSDottedBorder(
                color: AppColors.secondaryDefault,
                borderType: VSBorderType.rRect,
                radius: const Radius.circular(8),
                dashPattern: const [8, 4],
                strokeWidth: 2,
                animated: true,
                animationDuration: const Duration(seconds: 3),
                child: Container(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  child: const Text('Animated dotted border'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
