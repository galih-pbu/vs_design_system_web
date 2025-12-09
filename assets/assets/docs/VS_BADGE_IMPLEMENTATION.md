# VS Badge

The VS Badge component provides flexible status indicators and labels with multiple variants and types for different use cases.

## Overview

The `VSBadge` widget is used to display status information, labels, or notifications in a compact, visually distinct format.

## Features

- **Multiple Variants**: Success, Warning, Danger, Info, Neutral, and custom variants
- **Badge Types**: Status badges and ID badges
- **Size Options**: Small and medium sizes
- **Icon Support**: Optional icons for enhanced visual communication
- **Custom Colors**: Support for custom background and text colors
- **Approval Status**: Special support for approval workflow states

## Basic Usage

```dart
VSBadge(
  label: 'Active',
  variant: VSBadgeVariant.success,
)
```

## Variants

### Status Badges
Used to indicate different states or conditions.

```dart
// Success status
VSBadge(
  label: 'Completed',
  variant: VSBadgeVariant.success,
  type: VSBadgeType.status,
)

// Warning status
VSBadge(
  label: 'Pending',
  variant: VSBadgeVariant.warning,
  type: VSBadgeType.status,
)

// Danger/Error status
VSBadge(
  label: 'Failed',
  variant: VSBadgeVariant.danger,
  type: VSBadgeType.status,
)

// Info status
VSBadge(
  label: 'Info',
  variant: VSBadgeVariant.info,
  type: VSBadgeType.status,
)

// Neutral status
VSBadge(
  label: 'Draft',
  variant: VSBadgeVariant.neutral,
  type: VSBadgeType.status,
)
```

### ID Badges
Used for identification, categorization, or labeling.

```dart
VSBadge(
  label: 'VIP',
  variant: VSBadgeVariant.primary,
  type: VSBadgeType.id,
)
```

## Approval Status Badges

Special badges for approval workflows with appropriate icons.

```dart
// Approved status
VSBadge(
  label: 'APPROVED',
  variant: VSBadgeVariant.success,
  type: VSBadgeType.status,
  // Shows check icon automatically
)

// Pending status
VSBadge(
  label: 'PENDING',
  variant: VSBadgeVariant.warning,
  type: VSBadgeType.status,
  // Shows schedule icon automatically
)

// Rejected status
VSBadge(
  label: 'REJECTED',
  variant: VSBadgeVariant.danger,
  type: VSBadgeType.status,
  // Shows close icon automatically
)
```

## Sizes

### Small (Default)
Compact badge for inline use.

```dart
VSBadge(
  label: 'Small',
  variant: VSBadgeVariant.primary,
  size: VSBadgeSize.small,
)
```

### Medium
Larger badge for more prominent display.

```dart
VSBadge(
  label: 'Medium',
  variant: VSBadgeVariant.primary,
  size: VSBadgeSize.medium,
)
```

## With Icons

### Custom Icons
Add custom icons to badges for enhanced meaning.

```dart
VSBadge(
  label: 'Verified',
  variant: VSBadgeVariant.success,
  icon: Icon(Icons.verified, size: 16),
)
```

### Icon Only
Badge with only an icon (no text).

```dart
VSBadge(
  variant: VSBadgeVariant.primary,
  icon: Icon(Icons.star, size: 16),
)
```

## Custom Styling

### Custom Colors
Override default colors for specific use cases.

```dart
VSBadge(
  label: 'Custom',
  backgroundColor: Colors.purple,
  textColor: Colors.white,
)
```

## Usage Examples

### Status Indicators
```dart
Row(
  children: [
    VSBadge(
      label: 'Active',
      variant: VSBadgeVariant.success,
      type: VSBadgeType.status,
    ),
    SizedBox(width: 8),
    VSBadge(
      label: 'Inactive',
      variant: VSBadgeVariant.neutral,
      type: VSBadgeType.status,
    ),
  ],
)
```

### User Roles
```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      children: [
        VSBadge(
          label: 'Admin',
          variant: VSBadgeVariant.primary,
          type: VSBadgeType.id,
        ),
        SizedBox(width: 8),
        VSBadge(
          label: 'Verified',
          variant: VSBadgeVariant.success,
          type: VSBadgeType.id,
          icon: Icon(Icons.verified, size: 14),
        ),
      ],
    ),
  ],
)
```

### Approval Workflow
```dart
ListView(
  children: [
    ListTile(
      title: Text('Document Review'),
      trailing: VSBadge(
        label: 'APPROVED',
        variant: VSBadgeVariant.success,
        type: VSBadgeType.status,
      ),
    ),
    ListTile(
      title: Text('Budget Approval'),
      trailing: VSBadge(
        label: 'PENDING',
        variant: VSBadgeVariant.warning,
        type: VSBadgeType.status,
      ),
    ),
    ListTile(
      title: Text('Policy Update'),
      trailing: VSBadge(
        label: 'REJECTED',
        variant: VSBadgeVariant.danger,
        type: VSBadgeType.status,
      ),
    ),
  ],
)
```

## Accessibility

The VS Badge component includes proper accessibility features:
- Screen reader support for badge content
- Semantic color contrast ratios
- Clear visual indicators for different states

## Design Guidelines

- Use status badges for temporary states (active, pending, etc.)
- Use ID badges for permanent labels (roles, categories, etc.)
- Choose appropriate variants based on semantic meaning
- Keep badge text concise and clear
- Consider color blindness when using color-only indicators

## Related Components

- **VS Chip**: Interactive badges that can be selected/deselected
- **VS Info Bar**: Larger notification banners
- **VS Toast**: Temporary notification messages</content>
<parameter name="filePath">c:\vs_design_system\lib\markdown2\VS_BADGE_IMPLEMENTATION.md