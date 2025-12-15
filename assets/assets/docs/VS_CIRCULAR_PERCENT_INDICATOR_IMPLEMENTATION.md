# VS Circular Percent Indicator

**Version 1.0.1 - December 14, 2025**

The VS Circular Percent Indicator component provides animated circular progress indicators with customizable styling and content.

## Overview

The `VSCircularPercentIndicator` widget displays progress in a circular format with support for animations, custom content, and various visual configurations.

## Features

- **Circular Progress**: Visual progress indication in a circle
- **Animation Support**: Smooth progress animations with customizable curves
- **Custom Content**: Display text, icons, or widgets in the center
- **Multiple Arcs**: Support for background and progress arcs
- **Gradient Support**: Linear gradients for progress indication
- **Size Control**: Customizable radius and line widths
- **Start Angle**: Configurable starting position
- **Reverse Animation**: Clockwise or counterclockwise progress
- **Widget Indicators**: Custom widgets at the end of progress

## Basic Usage

```dart
VSCircularPercentIndicator(
  percent: 0.75,  // 75% progress
  radius: 60.0,
  lineWidth: 8.0,
  center: Text('75%', style: TextStyle(fontSize: 20)),
)
```

## Configuration Options

### Basic Progress Indicator
Simple circular progress with percentage text.

```dart
VSCircularPercentIndicator(
  percent: 0.65,
  radius: 50.0,
  lineWidth: 6.0,
  center: Text(
    '65%',
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
  ),
)
```

### With Custom Colors
Progress indicator with custom colors.

```dart
VSCircularPercentIndicator(
  percent: 0.85,
  radius: 60.0,
  lineWidth: 10.0,
  progressColor: AppColors.successDefault,
  backgroundColor: AppColors.neutral200,
  center: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.check_circle, color: AppColors.successDefault, size: 24),
      SizedBox(height: 4),
      Text('85%', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    ],
  ),
)
```

### With Gradient
Progress indicator with gradient colors.

```dart
VSCircularPercentIndicator(
  percent: 0.7,
  radius: 55.0,
  lineWidth: 8.0,
  linearGradient: LinearGradient(
    colors: [AppColors.primaryDefault, AppColors.secondaryDefault],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  center: Text(
    '70%',
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryDefault,
    ),
  ),
)
```

## Animation

### Animated Progress
Progress that animates to the target value.

```dart
class AnimatedProgressIndicator extends StatefulWidget {
  @override
  _AnimatedProgressIndicatorState createState() => _AnimatedProgressIndicatorState();
}

class _AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 0.85).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return VSCircularPercentIndicator(
          percent: _animation.value,
          radius: 60.0,
          lineWidth: 8.0,
          animation: true,
          center: Text(
            '${(_animation.value * 100).round()}%',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
```

### Controlled Animation
Manually control the animation.

```dart
class ControlledProgressIndicator extends StatefulWidget {
  @override
  _ControlledProgressIndicatorState createState() => _ControlledProgressIndicatorState();
}

class _ControlledProgressIndicatorState extends State<ControlledProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
  }

  void _incrementProgress() {
    setState(() {
      _progress = (_progress + 0.1).clamp(0.0, 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSCircularPercentIndicator(
          percent: _progress,
          radius: 60.0,
          lineWidth: 8.0,
          center: Text(
            '${(_progress * 100).round()}%',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20),
        VSButton(
          label: 'Increment Progress',
          onPressed: _incrementProgress,
        ),
      ],
    );
  }
}
```

## Advanced Features

### Multiple Progress Rings
Display multiple concentric progress rings.

```dart
SizedBox(
  width: 120,
  height: 120,
  child: Stack(
    alignment: Alignment.center,
    children: [
      VSCircularPercentIndicator(
        percent: 0.9,
        radius: 50.0,
        lineWidth: 8.0,
        progressColor: AppColors.successDefault,
        backgroundColor: Colors.transparent,
      ),
      VSCircularPercentIndicator(
        percent: 0.6,
        radius: 35.0,
        lineWidth: 8.0,
        progressColor: AppColors.warningDefault,
        backgroundColor: Colors.transparent,
      ),
      VSCircularPercentIndicator(
        percent: 0.3,
        radius: 20.0,
        lineWidth: 8.0,
        progressColor: AppColors.dangerDefault,
        backgroundColor: Colors.transparent,
      ),
      Text(
        'Multi\nLayer',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    ],
  ),
)
```

### With Widget Indicator
Display a custom widget at the end of the progress arc.

```dart
VSCircularPercentIndicator(
  percent: 0.75,
  radius: 60.0,
  lineWidth: 8.0,
  widgetIndicator: Container(
    width: 20,
    height: 20,
    decoration: BoxDecoration(
      color: AppColors.primaryDefault,
      shape: BoxShape.circle,
    ),
    child: Icon(Icons.star, color: Colors.white, size: 12),
  ),
  center: Text('75%', style: TextStyle(fontSize: 18)),
)
```

### Custom Start Angle
Start progress from a different angle.

```dart
VSCircularPercentIndicator(
  percent: 0.8,
  radius: 50.0,
  lineWidth: 6.0,
  startAngle: 90.0,  // Start from top
  center: Text('80%', style: TextStyle(fontSize: 16)),
)
```

### Reverse Direction
Progress in counterclockwise direction.

```dart
VSCircularPercentIndicator(
  percent: 0.65,
  radius: 50.0,
  lineWidth: 6.0,
  reverse: true,
  center: Text('65%', style: TextStyle(fontSize: 16)),
)
```

## Use Cases

### File Upload Progress
```dart
class FileUploadProgress extends StatelessWidget {
  final double progress;
  final String fileName;

  const FileUploadProgress({
    required this.progress,
    required this.fileName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSCircularPercentIndicator(
          percent: progress,
          radius: 40.0,
          lineWidth: 6.0,
          progressColor: progress == 1.0 ? AppColors.successDefault : AppColors.primaryDefault,
          center: progress == 1.0
              ? Icon(Icons.check, color: AppColors.successDefault, size: 24)
              : Text(
                  '${(progress * 100).round()}%',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
        ),
        SizedBox(height: 8),
        Text(
          fileName,
          style: AppTypography.bodySmallRegular,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
```

### Task Completion Status
```dart
class TaskProgressCard extends StatelessWidget {
  final String taskName;
  final double completionPercent;
  final int completedTasks;
  final int totalTasks;

  const TaskProgressCard({
    required this.taskName,
    required this.completionPercent,
    required this.completedTasks,
    required this.totalTasks,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            VSCircularPercentIndicator(
              percent: completionPercent,
              radius: 30.0,
              lineWidth: 5.0,
              center: Text(
                '${(completionPercent * 100).round()}%',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(taskName, style: AppTypography.bodyMediumMedium),
                  SizedBox(height: 4),
                  Text(
                    '$completedTasks of $totalTasks tasks completed',
                    style: AppTypography.bodySmallRegular.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Loading States
```dart
class LoadingIndicator extends StatelessWidget {
  final String message;

  const LoadingIndicator({required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        VSCircularPercentIndicator(
          percent: 0.0,  // No progress, just spinning
          radius: 40.0,
          lineWidth: 4.0,
          progressColor: AppColors.primaryDefault,
          backgroundColor: AppColors.neutral200,
          // Add animation for spinning effect
        ),
        SizedBox(height: AppSpacing.sm),
        Text(
          message,
          style: AppTypography.bodyMediumRegular,
        ),
      ],
    );
  }
}
```

## Performance Considerations

- Use animations judiciously to avoid performance issues
- Consider using `addAutomaticKeepAlive` for list views
- Reuse animation controllers when possible
- Avoid frequent rebuilds of complex center content

## Accessibility

The VS Circular Percent Indicator includes accessibility features:
- Screen reader support for progress values
- Proper semantic markup
- Focus management for interactive elements

## Related Components

- **VS Linear Progress**: Horizontal progress bars
- **VS Badge**: Status indicators with text
- **VS Info Bar**: Progress information displays</content>
<parameter name="filePath">c:\vs_design_system\lib\markdown2\VS_CIRCULAR_PERCENT_INDICATOR_IMPLEMENTATION.md