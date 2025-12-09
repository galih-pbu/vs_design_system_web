import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

class VSCircularPercentIndicatorExample extends StatefulWidget {
  const VSCircularPercentIndicatorExample({super.key});

  @override
  State<VSCircularPercentIndicatorExample> createState() =>
      _VSCircularPercentIndicatorExampleState();
}

class _VSCircularPercentIndicatorExampleState
    extends State<VSCircularPercentIndicatorExample>
    with TickerProviderStateMixin {
  // Animation controllers
  late AnimationController _progressController;
  late AnimationController _multiController;

  // Progress values
  double _animatedProgress = 0.0;
  double _multiProgress1 = 0.3;
  double _multiProgress2 = 0.7;
  double _multiProgress3 = 0.9;

  // Animation settings
  bool _isAnimating = false;
  double _animationSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    _progressController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..addListener(() {
            setState(() {
              _animatedProgress = _progressController.value;
            });
          });

    _multiController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this)
          ..addListener(() {
            setState(() {
              _multiProgress1 = (_multiController.value * 0.8) + 0.1;
              _multiProgress2 = (_multiController.value * 0.6) + 0.2;
              _multiProgress3 = (_multiController.value * 0.4) + 0.5;
            });
          });
  }

  @override
  void dispose() {
    _progressController.dispose();
    _multiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VSAppBar(
      //   title: 'VS Circular Percent Indicator Examples',
      //   actions: [
      //     VSButton(
      //       label: 'Info',
      //       onPressed: () => _showIndicatorInfoDialog(context),
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
              title: 'VS Circular Percent Indicator Variants',
              description:
                  'Comprehensive demonstration of circular progress indicators with various configurations and animations',
              child: _buildIndicatorShowcase(),
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
        Text(title, style: AppTypography.h3),
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

  Widget _buildIndicatorShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic Indicators
        _buildIndicatorGroup(
          title: 'Basic Indicators',
          description:
              'Simple circular progress indicators with different sizes and colors',
          children: [
            Wrap(
              spacing: AppSpacing.lg,
              runSpacing: AppSpacing.lg,
              alignment: WrapAlignment.center,
              children: [
                VSCircularPercentIndicator(
                  radius: 40.0,
                  percent: 0.7,
                  progressColor: AppColors.primaryDefault,
                  backgroundColor: AppColors.neutral200,
                  lineWidth: 8.0,
                  center: Text(
                    '70%',
                    style: AppTypography.bodySmallSemibold.copyWith(
                      color: AppColors.primaryDefault,
                    ),
                  ),
                ),
                VSCircularPercentIndicator(
                  radius: 50.0,
                  percent: 0.85,
                  progressColor: AppColors.successDefault,
                  backgroundColor: AppColors.neutral200,
                  lineWidth: 10.0,
                  center: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '85%',
                        style: AppTypography.bodyMediumSemibold.copyWith(
                          color: AppColors.successDefault,
                        ),
                      ),
                      Text(
                        'Complete',
                        style: AppTypography.bodyXSmallRegular.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                VSCircularPercentIndicator(
                  radius: 35.0,
                  percent: 0.45,
                  progressColor: AppColors.warningDefault,
                  backgroundColor: AppColors.neutral200,
                  lineWidth: 6.0,
                  center: Text(
                    '45%',
                    style: AppTypography.bodyXSmallSemibold.copyWith(
                      color: AppColors.warningDefault,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Arc Types
        _buildIndicatorGroup(
          title: 'Arc Types',
          description: 'Different arc configurations: full, half, and reversed',
          children: [
            Wrap(
              spacing: AppSpacing.lg,
              runSpacing: AppSpacing.lg,
              alignment: WrapAlignment.center,
              children: [
                VSCircularPercentIndicator(
                  radius: 45.0,
                  percent: 0.6,
                  arcType: VSArcType.full,
                  progressColor: AppColors.primaryDefault,
                  arcBackgroundColor: AppColors.neutral100,
                  lineWidth: 8.0,
                  center: Text(
                    'Full\nArc',
                    textAlign: TextAlign.center,
                    style: AppTypography.bodyXSmallSemibold.copyWith(
                      color: AppColors.primaryDefault,
                    ),
                  ),
                ),
                VSCircularPercentIndicator(
                  radius: 45.0,
                  percent: 0.75,
                  arcType: VSArcType.half,
                  progressColor: AppColors.successDefault,
                  arcBackgroundColor: AppColors.neutral100,
                  lineWidth: 8.0,
                  center: Text(
                    'Half\nArc',
                    textAlign: TextAlign.center,
                    style: AppTypography.bodyXSmallSemibold.copyWith(
                      color: AppColors.successDefault,
                    ),
                  ),
                ),
                VSCircularPercentIndicator(
                  radius: 45.0,
                  percent: 0.8,
                  arcType: VSArcType.fullReversed,
                  progressColor: AppColors.secondaryDefault,
                  arcBackgroundColor: AppColors.neutral100,
                  lineWidth: 8.0,
                  center: Text(
                    'Reversed\nArc',
                    textAlign: TextAlign.center,
                    style: AppTypography.bodyXSmallSemibold.copyWith(
                      color: AppColors.secondaryDefault,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Stroke Caps
        _buildIndicatorGroup(
          title: 'Stroke Caps',
          description: 'Different line endings: butt, round, and square',
          children: [
            Wrap(
              spacing: AppSpacing.lg,
              runSpacing: AppSpacing.lg,
              alignment: WrapAlignment.center,
              children: [
                VSCircularPercentIndicator(
                  radius: 40.0,
                  percent: 0.65,
                  progressColor: AppColors.primaryDefault,
                  backgroundColor: AppColors.neutral200,
                  lineWidth: 12.0,
                  circularStrokeCap: VSCircularStrokeCap.butt,
                  center: Text(
                    'Butt',
                    style: AppTypography.bodyXSmallSemibold.copyWith(
                      color: AppColors.primaryDefault,
                    ),
                  ),
                ),
                VSCircularPercentIndicator(
                  radius: 40.0,
                  percent: 0.65,
                  progressColor: AppColors.successDefault,
                  backgroundColor: AppColors.neutral200,
                  lineWidth: 12.0,
                  circularStrokeCap: VSCircularStrokeCap.round,
                  center: Text(
                    'Round',
                    style: AppTypography.bodyXSmallSemibold.copyWith(
                      color: AppColors.successDefault,
                    ),
                  ),
                ),
                VSCircularPercentIndicator(
                  radius: 40.0,
                  percent: 0.65,
                  progressColor: AppColors.warningDefault,
                  backgroundColor: AppColors.neutral200,
                  lineWidth: 12.0,
                  circularStrokeCap: VSCircularStrokeCap.square,
                  center: Text(
                    'Square',
                    style: AppTypography.bodyXSmallSemibold.copyWith(
                      color: AppColors.warningDefault,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // With Headers and Footers
        _buildIndicatorGroup(
          title: 'With Headers and Footers',
          description:
              'Indicators with additional context widgets above and below',
          children: [
            VSCircularPercentIndicator(
              radius: 50.0,
              percent: 0.72,
              progressColor: AppColors.primaryDefault,
              backgroundColor: AppColors.neutral200,
              lineWidth: 8.0,
              header: Text('Progress', style: AppTypography.bodySmallSemibold),
              center: Text(
                '72%',
                style: AppTypography.bodyMediumSemibold.copyWith(
                  color: AppColors.primaryDefault,
                ),
              ),
              footer: Text(
                'Complete',
                style: AppTypography.bodyXSmallRegular.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Animated Indicators
        _buildIndicatorGroup(
          title: 'Animated Indicators',
          description:
              'Progress indicators with smooth animations and controls',
          children: [
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  VSCircularPercentIndicator(
                    radius: 60.0,
                    percent: _animatedProgress,
                    animation: true,
                    animationDuration: (2000 / _animationSpeed).round(),
                    progressColor: AppColors.primaryDefault,
                    backgroundColor: AppColors.neutral200,
                    lineWidth: 10.0,
                    center: Text(
                      '${(_animatedProgress * 100).round()}%',
                      style: AppTypography.bodyLargeSemibold.copyWith(
                        color: AppColors.primaryDefault,
                      ),
                    ),
                    onAnimationEnd: () => setState(() => _isAnimating = false),
                  ),
                  SizedBox(height: AppSpacing.md),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    alignment: WrapAlignment.center,
                    children: [
                      VSButton(
                        label: _isAnimating ? 'Stop' : 'Start',
                        onPressed: _toggleAnimation,
                        size: VSButtonSize.small,
                      ),
                      VSButton(
                        label: 'Reset',
                        onPressed: _resetAnimation,
                        size: VSButtonSize.small,
                        variant: VSButtonVariant.outlined,
                      ),
                      VSButton(
                        label: '2x Speed',
                        onPressed: () => setState(() => _animationSpeed = 2.0),
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

        // Gradient Indicators
        _buildIndicatorGroup(
          title: 'Gradient Indicators',
          description: 'Progress indicators with linear gradients',
          children: [
            Wrap(
              spacing: AppSpacing.lg,
              runSpacing: AppSpacing.lg,
              alignment: WrapAlignment.center,
              children: [
                VSCircularPercentIndicator(
                  radius: 45.0,
                  percent: 0.8,
                  linearGradient: LinearGradient(
                    colors: [AppColors.primaryDefault, AppColors.primaryBg],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  backgroundColor: AppColors.neutral200,
                  lineWidth: 8.0,
                  center: Text(
                    '80%',
                    style: AppTypography.bodySmallSemibold.copyWith(
                      color: AppColors.primaryDefault,
                    ),
                  ),
                ),
                VSCircularPercentIndicator(
                  radius: 45.0,
                  percent: 0.6,
                  linearGradient: LinearGradient(
                    colors: [AppColors.successDefault, AppColors.successBg],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  backgroundColor: AppColors.neutral200,
                  lineWidth: 8.0,
                  center: Text(
                    '60%',
                    style: AppTypography.bodySmallSemibold.copyWith(
                      color: AppColors.successDefault,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.lg),

        // Real-world Usage Examples
        _buildIndicatorGroup(
          title: 'Real-world Usage Examples',
          description:
              'Common patterns for using circular progress indicators in applications',
          children: [
            // File Upload Progress
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  VSCircularPercentIndicator(
                    radius: 30.0,
                    percent: 0.75,
                    progressColor: AppColors.primaryDefault,
                    backgroundColor: AppColors.neutral200,
                    lineWidth: 6.0,
                    center: Icon(
                      Icons.upload_file,
                      color: AppColors.primaryDefault,
                      size: 16,
                    ),
                  ),
                  SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Uploading document.pdf',
                          style: AppTypography.bodyMediumSemibold,
                        ),
                        SizedBox(height: AppSpacing.xs),
                        Text(
                          '75% complete • 2.3 MB of 3.1 MB',
                          style: AppTypography.bodySmallRegular.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        SizedBox(height: AppSpacing.sm),
                        LinearProgressIndicator(
                          value: 0.75,
                          backgroundColor: AppColors.neutral200,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.primaryDefault,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Project Completion
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Project Completion',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.md),
                  VSCircularPercentIndicator(
                    radius: 70.0,
                    percent: 0.68,
                    progressColor: AppColors.successDefault,
                    backgroundColor: AppColors.neutral200,
                    lineWidth: 12.0,
                    center: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '68%',
                          style: AppTypography.h4.copyWith(
                            color: AppColors.successDefault,
                          ),
                        ),
                        Text(
                          'Complete',
                          style: AppTypography.bodyXSmallRegular.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpacing.md),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const VSBadge(
                        label: 'ON TRACK',
                        variant: VSBadgeVariant.success,
                      ),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        'Due in 5 days',
                        style: AppTypography.bodySmallRegular.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Multi-Metric Dashboard
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
                    'System Metrics',
                    style: AppTypography.bodyMediumSemibold,
                  ),
                  SizedBox(height: AppSpacing.md),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildMetricIndicator(
                        'CPU',
                        _multiProgress1,
                        AppColors.primaryDefault,
                        Icons.memory,
                      ),
                      _buildMetricIndicator(
                        'RAM',
                        _multiProgress2,
                        AppColors.warningDefault,
                        Icons.storage,
                      ),
                      _buildMetricIndicator(
                        'Disk',
                        _multiProgress3,
                        AppColors.successDefault,
                        Icons.disc_full,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.md),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      VSButton(
                        label: 'Refresh',
                        onPressed: _startMultiAnimation,
                        size: VSButtonSize.small,
                        leftIcon: Icons.refresh,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md),

            // Goal Achievement
            Container(
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  VSCircularPercentIndicator(
                    radius: 40.0,
                    percent: 0.92,
                    progressColor: AppColors.secondaryDefault,
                    backgroundColor: AppColors.neutral200,
                    lineWidth: 8.0,
                    center: Icon(
                      Icons.emoji_events,
                      color: AppColors.secondaryDefault,
                      size: 20,
                    ),
                  ),
                  SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Monthly Goal',
                          style: AppTypography.bodyMediumSemibold,
                        ),
                        SizedBox(height: AppSpacing.xs),
                        Text(
                          '92% achieved • \$9,200 of \$10,000',
                          style: AppTypography.bodySmallRegular.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        SizedBox(height: AppSpacing.sm),
                        Row(
                          children: [
                            const VSBadge(
                              label: 'EXCELLENT',
                              variant: VSBadgeVariant.success,
                            ),
                            SizedBox(width: AppSpacing.sm),
                            Text(
                              '8% above target',
                              style: AppTypography.bodyXSmallRegular.copyWith(
                                color: AppColors.successDefault,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIndicatorGroup({
    required String title,
    required String description,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.bodyLargeSemibold),
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

  Widget _buildMetricIndicator(
    String label,
    double percent,
    Color color,
    IconData icon,
  ) {
    return Column(
      children: [
        VSCircularPercentIndicator(
          radius: 25.0,
          percent: percent,
          progressColor: color,
          backgroundColor: AppColors.neutral200,
          lineWidth: 5.0,
          center: Icon(icon, color: color, size: 12),
        ),
        SizedBox(height: AppSpacing.xs),
        Text(label, style: AppTypography.bodyXSmallSemibold),
        Text(
          '${(percent * 100).round()}%',
          style: AppTypography.bodyXSmallRegular.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  void _toggleAnimation() {
    setState(() {
      if (_isAnimating) {
        _progressController.stop();
        _isAnimating = false;
      } else {
        _progressController.forward(from: _animatedProgress);
        _isAnimating = true;
      }
    });
  }

  void _resetAnimation() {
    setState(() {
      _progressController.reset();
      _animatedProgress = 0.0;
      _isAnimating = false;
      _animationSpeed = 1.0;
    });
  }

  void _startMultiAnimation() {
    _multiController.reset();
    _multiController.forward();
  }

  void _showIndicatorInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => VSDialog(
        type: VSDialogType.summary,
        message:
            'The VS Circular Percent Indicator provides animated circular progress indicators with extensive customization options.',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSpacing.md),
            Text('Key Features:', style: AppTypography.bodyMediumSemibold),
            SizedBox(height: AppSpacing.sm),
            Text(
              '• Configurable radius, line width, and colors\n'
              '• Multiple arc types: full, half, reversed\n'
              '• Different stroke caps: butt, round, square\n'
              '• Smooth animations with customizable duration and curves\n'
              '• Support for headers, footers, and center widgets\n'
              '• Linear gradient support\n'
              '• Callback functions for animation events\n'
              '• Widget indicators at progress end',
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
