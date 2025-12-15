# VS Avatar

**Version 1.0.1 - December 14, 2025**

The VS Avatar component provides circular user profile images with support for images, initials, status indicators, and online presence.

## Overview

The `VSAvatar` widget displays user profile pictures in a circular format with multiple customization options for different use cases.

## Features

- **Image Support**: Display profile images with fallback to initials
- **Size Variants**: 6 different sizes from xsmall to xxlarge
- **Status Indicators**: Online, offline, away, busy, and custom status
- **Initials Generation**: Automatic initials from names
- **Custom Colors**: Customizable background and text colors
- **Border Options**: Optional borders with custom colors
- **Interactive States**: Hover and press effects

## Basic Usage

```dart
VSAvatar(
  name: 'John Doe',
  size: VSAvatarSize.medium,
)
```

## Sizes

### XSmall (24px)
Tiny avatar for compact layouts.

```dart
VSAvatar(
  name: 'John Doe',
  size: VSAvatarSize.xsmall,
)
```

### Small (32px)
Small avatar for secondary displays.

```dart
VSAvatar(
  name: 'John Doe',
  size: VSAvatarSize.small,
)
```

### Medium (40px) - Default
Standard avatar size for most use cases.

```dart
VSAvatar(
  name: 'John Doe',
  size: VSAvatarSize.medium,
)
```

### Large (48px)
Prominent avatar for user profiles.

```dart
VSAvatar(
  name: 'John Doe',
  size: VSAvatarSize.large,
)
```

### XLarge (56px)
Large avatar for hero sections.

```dart
VSAvatar(
  name: 'John Doe',
  size: VSAvatarSize.xlarge,
)
```

### XXLarge (72px)
Extra large avatar for special emphasis.

```dart
VSAvatar(
  name: 'John Doe',
  size: VSAvatarSize.xxlarge,
)
```

## With Images

### Network Image
Load avatar from a URL.

```dart
VSAvatar(
  name: 'John Doe',
  imageUrl: 'https://example.com/avatar.jpg',
  size: VSAvatarSize.medium,
)
```

### Asset Image
Load avatar from app assets.

```dart
VSAvatar(
  name: 'John Doe',
  imageAsset: 'assets/images/avatar.png',
  size: VSAvatarSize.medium,
)
```

### Memory Image
Display avatar from memory.

```dart
VSAvatar(
  name: 'John Doe',
  imageBytes: imageBytes,
  size: VSAvatarSize.medium,
)
```

## Status Indicators

### Online Status
Green indicator for online users.

```dart
VSAvatar(
  name: 'John Doe',
  status: VSAvatarStatus.online,
)
```

### Offline Status
Gray indicator for offline users.

```dart
VSAvatar(
  name: 'John Doe',
  status: VSAvatarStatus.offline,
)
```

### Away Status
Yellow indicator for away users.

```dart
VSAvatar(
  name: 'John Doe',
  status: VSAvatarStatus.away,
)
```

### Busy Status
Red indicator for busy users.

```dart
VSAvatar(
  name: 'John Doe',
  status: VSAvatarStatus.busy,
)
```

### Custom Status
Custom status with specific color.

```dart
VSAvatar(
  name: 'John Doe',
  status: VSAvatarStatus.custom,
  statusColor: Colors.purple,
)
```

## Custom Styling

### Custom Colors
Override default colors.

```dart
VSAvatar(
  name: 'John Doe',
  backgroundColor: Colors.blue,
  textColor: Colors.white,
)
```

### With Border
Add a border around the avatar.

```dart
VSAvatar(
  name: 'John Doe',
  borderColor: Colors.blue,
  borderWidth: 2,
)
```

## Usage Examples

### User Profile Header
```dart
Row(
  children: [
    VSAvatar(
      name: 'Sarah Johnson',
      imageUrl: 'https://example.com/sarah.jpg',
      size: VSAvatarSize.large,
      status: VSAvatarStatus.online,
    ),
    SizedBox(width: 16),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sarah Johnson', style: AppTypography.h4),
        Text('Product Manager', style: AppTypography.bodyMediumRegular),
      ],
    ),
  ],
)
```

### Team Members List
```dart
ListView(
  children: [
    ListTile(
      leading: VSAvatar(
        name: 'Alice Cooper',
        size: VSAvatarSize.medium,
        status: VSAvatarStatus.online,
      ),
      title: Text('Alice Cooper'),
      subtitle: Text('Frontend Developer'),
    ),
    ListTile(
      leading: VSAvatar(
        name: 'Bob Wilson',
        size: VSAvatarSize.medium,
        status: VSAvatarStatus.away,
      ),
      title: Text('Bob Wilson'),
      subtitle: Text('Backend Developer'),
    ),
    ListTile(
      leading: VSAvatar(
        name: 'Carol Davis',
        size: VSAvatarSize.medium,
        status: VSAvatarStatus.offline,
      ),
      title: Text('Carol Davis'),
      subtitle: Text('Designer'),
    ),
  ],
)
```

### Chat Interface
```dart
Row(
  children: [
    VSAvatar(
      name: 'Mike Chen',
      size: VSAvatarSize.small,
      status: VSAvatarStatus.online,
    ),
    SizedBox(width: 8),
    Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.neutral100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text('Hey, how are you doing?'),
      ),
    ),
  ],
)
```

### Avatar Group
Display multiple avatars in a group.

```dart
Stack(
  children: [
    VSAvatar(
      name: 'Alice',
      size: VSAvatarSize.medium,
    ),
    Positioned(
      left: 24,
      child: VSAvatar(
        name: 'Bob',
        size: VSAvatarSize.medium,
      ),
    ),
    Positioned(
      left: 48,
      child: VSAvatar(
        name: 'Carol',
        size: VSAvatarSize.medium,
      ),
    ),
    Positioned(
      left: 72,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.neutral200,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            '+5',
            style: AppTypography.bodySmallMedium,
          ),
        ),
      ),
    ),
  ],
)
```

## Initials Generation

The avatar automatically generates initials from the name:

- "John Doe" → "JD"
- "Sarah Johnson Smith" → "SJ"
- "李小明" → "李小" (supports Unicode characters)

## Performance Considerations

- Images are cached automatically
- Initials are generated once and reused
- Status indicators are lightweight overlays

## Accessibility

The VS Avatar component includes proper accessibility features:
- Screen reader support for names and status
- Proper contrast ratios for text and backgrounds
- Keyboard navigation support where applicable

## Related Components

- **VS Badge**: Status indicators and labels
- **VS Chip**: Interactive user tags
- **VS Profile Card**: Detailed user information display</content>
<parameter name="filePath">c:\vs_design_system\lib\markdown2\VS_AVATAR_IMPLEMENTATION.md