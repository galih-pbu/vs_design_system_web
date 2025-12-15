# 🚀 Getting Started with VS Design System

**Welcome to VS Design System!** This comprehensive guide will help you integrate and master the VS Design System in your Flutter projects. Whether you're building a new app or modernizing an existing one, this guide covers everything you need to know.

---

## ⚡ Quick Start (2 minutes)

### Step 1: Install
```yaml
dependencies:
  vs_design_system:
    path: ../vs_design_system
```

### Step 2: Import
```dart
import 'package:vs_design_system/vs_design_system.dart';
```

### Step 3: Use
```dart
VSButton(
  label: 'Get Started',
  onPressed: () => print('Hello VS Design System!'),
)
```

That's it! You're ready to build beautiful, consistent UIs. 🎉

---

## 📋 Prerequisites

Before getting started, ensure you have:

- **Flutter SDK**: `3.8.1` or higher
- **Dart**: `3.0` or higher
- **IDE**: VS Code, Android Studio, or IntelliJ IDEA
- **Flutter Project**: An existing Flutter app or package

### System Requirements
- **iOS**: 12.0+
- **Android**: API 21+ (Android 5.0+)
- **Web**: Modern browsers with WebAssembly support

---

## 📦 Installation

### Option 1: Local Path Dependency (Recommended for Development)

Perfect for development and testing changes locally.

```yaml
# pubspec.yaml
dependencies:
  flutter:
    sdk: flutter
  vs_design_system:
    path: ../vs_design_system  # Adjust path as needed
```

```bash
flutter pub get
```

### Option 2: Git Dependency

For team collaboration with version control.

```yaml
# pubspec.yaml
dependencies:
  flutter:
    sdk: flutter
  vs_design_system:
    git:
      url: https://sedayugroup@dev.azure.com/sedayugroup/Flutter/_git/vs_design_system
      ref: main  # or specific tag/commit
```

---

## 🛠️ Project Setup

### Step 1: Import the Package

Add this import to any file where you want to use VS Design System components:

```dart
import 'package:vs_design_system/vs_design_system.dart';
```

### Step 2: Apply the Theme (Optional but Recommended)

For the best experience, wrap your `MaterialApp` with VS Design System theming:

```dart
import 'package:flutter/material.dart';
import 'package:vs_design_system/vs_design_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        // VS Design System integration
        primaryColor: AppColors.primaryDefault,
        fontFamily: 'Manrope',
        // Add more theme customizations as needed
      ),
      home: const HomePage(),
    );
  }
}
```

### Step 3: Verify Installation

Create a simple test to ensure everything works:

```dart
class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('VS Design System Test')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VSAvatar(
              initials: 'VS',
              size: VSAvatarSize.large,
            ),
            SizedBox(height: AppSpacing.md),
            VSButton(
              label: 'Test Button',
              onPressed: () => VSToastService.showToast(
                context,
                title: 'Success!',
                description: 'VS Design System is working!',
                type: VSToastType.success,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## 🎨 Using Components

### Basic Component Usage

Each component follows consistent patterns:

```dart
// Buttons
VSButton(
  label: 'Click me',
  variant: VSButtonVariant.primary,
  onPressed: () => print('Button pressed'),
)

// Input Fields
VSInputField(
  label: 'Email',
  hintText: 'Enter your email',
  controller: _emailController,
  validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
)

// Tables
VsTableDynamic(
  tableData: myTableData,
  currentPage: 1,
  pageSize: 10,
  showPagination: true,
)
```

### Component Categories

| Category | Components | Use Case |
|----------|------------|----------|
| **Actions** | VSButton, VSSplitButton, VSLink | User interactions |
| **Navigation** | VSAppBar, VSDrawer, VSMenu, VSTab | App navigation |
| **Data Display** | VSTableDynamic, VSBadge, VSChip, VSAvatar | Showing information |
| **Forms** | VSInputField, VSDropdown, VSCheckbox, VSRadioButton, VSToggle | Data input |
| **Feedback** | VSToast, VSDialog, VSInfoBar, VSTooltip | User feedback |
| **Layout** | VSDottedBorder, VSCircularPercentIndicator | Visual organization |

### Advanced Component Features

```dart
// Table with selection and actions
VsTableDynamic(
  tableData: userData,
  showCheckboxColumn: true,
  checkboxCallback: (selectedRows) {
    // Handle bulk actions
    if (selectedRows.isNotEmpty) {
      showBulkActionDialog(selectedRows);
    }
  },
  onRowTap: (index) => navigateToUserDetail(index),
)

// Form with validation
VSInputField(
  label: 'Password',
  obscureText: true,
  validator: (value) {
    if (value?.isEmpty ?? true) return 'Password required';
    if (value!.length < 8) return 'Minimum 8 characters';
    return null;
  },
  suffixIcon: IconButton(
    icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
  ),
)
```

---

## 🎨 Design Tokens

VS Design System uses a centralized token system for consistency:

### Colors
```dart
// Primary colors
AppColors.primaryDefault    // Main brand color
AppColors.primaryBg         // Light background
AppColors.primaryBorder     // Subtle borders

// Semantic colors
AppColors.successDefault    // Green for success states
AppColors.dangerDefault     // Red for errors
AppColors.warningDefault    // Orange for warnings

// Neutral colors
AppColors.neutral0           // Pure white
AppColors.neutral50          // Light grey
AppColors.neutral900         // Dark grey
```

### Typography
```dart
// Headings
AppTypography.h1            // 32px, Bold
AppTypography.h2            // 28px, Bold
AppTypography.h3            // 24px, Bold

// Body text
AppTypography.bodyLargeRegular    // 16px, Regular
AppTypography.bodyMediumSemibold  // 14px, Semibold
AppTypography.bodySmallRegular    // 12px, Regular
```

### Spacing
```dart
AppSpacing.xs    // 4px
AppSpacing.sm    // 8px
AppSpacing.md    // 12px
AppSpacing.lg    // 16px
AppSpacing.xl    // 24px
```

### Usage Example
```dart
Container(
  padding: EdgeInsets.all(AppSpacing.md),
  decoration: BoxDecoration(
    color: AppColors.neutral0,
    border: Border.all(color: AppColors.neutral300),
    borderRadius: BorderRadius.circular(8),
  ),
  child: Text(
    'Styled with design tokens',
    style: AppTypography.bodyMediumRegular,
  ),
)
```

---

## 🚀 Advanced Usage

### State Management Integration

```dart
// With Provider
class UserListProvider extends ChangeNotifier {
  List<User> _users = [];
  List<int> _selectedUsers = [];

  void toggleUserSelection(int userId) {
    // Update selection logic
    notifyListeners();
  }
}

// In your widget
Consumer<UserListProvider>(
  builder: (context, provider, child) {
    return VsTableDynamic(
      tableData: _buildUserTableData(provider.users),
      showCheckboxColumn: true,
      initialSelectedRows: provider.selectedUsers,
      checkboxCallback: (selected) {
        // Update provider state
        provider.updateSelection(selected);
      },
    );
  },
)
```

### Custom Component Styling

```dart
// Custom button variant
class CustomActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomActionButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryDefault, AppColors.primary600],
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryDefault.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: VSButton(
        label: label,
        variant: VSButtonVariant.primary,
        onPressed: onPressed,
        // Button will inherit container styling
      ),
    );
  }
}
```

### Form Handling

```dart
class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          VSInputField(
            label: 'Email',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value?.isEmpty ?? true) return 'Email required';
              if (!value!.contains('@')) return 'Invalid email';
              return null;
            },
          ),
          SizedBox(height: AppSpacing.md),
          VSInputField(
            label: 'Password',
            controller: _passwordController,
            obscureText: true,
            validator: (value) {
              if (value?.isEmpty ?? true) return 'Password required';
              if (value!.length < 6) return 'Minimum 6 characters';
              return null;
            },
          ),
          SizedBox(height: AppSpacing.lg),
          VSButton(
            label: 'Login',
            variant: VSButtonVariant.primary,
            isFullWidth: true,
            onPressed: _handleLogin,
          ),
        ],
      ),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      // Perform login
      VSToastService.showToast(
        context,
        title: 'Login Successful',
        description: 'Welcome back!',
        type: VSToastType.success,
      );
    }
  }
}
```

---

## ✅ Best Practices

### Component Usage
- **Consistency**: Use VS components consistently throughout your app
- **Accessibility**: All components are accessibility-compliant by default
- **Performance**: Components are optimized for smooth performance
- **Responsiveness**: Components adapt to different screen sizes

### Code Organization
```dart
// ✅ Good: Organized imports
import 'package:vs_design_system/vs_design_system.dart';
// Other imports...

// ✅ Good: Consistent styling
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md),
      child: VSButton(
        label: 'Action',
        onPressed: () {},
      ),
    );
  }
}
```

### Error Handling
```dart
// ✅ Good: Proper error handling
try {
  await performAction();
  VSToastService.showToast(
    context,
    title: 'Success',
    type: VSToastType.success,
  );
} catch (e) {
  VSToastService.showToast(
    context,
    title: 'Error',
    description: e.toString(),
    type: VSToastType.error,
  );
}
```

---

## 🔧 Troubleshooting

### Common Issues

**Issue: Components not displaying correctly**
```dart
// Solution: Ensure proper import
import 'package:vs_design_system/vs_design_system.dart';
```

**Issue: Theme colors not applying**
```dart
// Solution: Check theme setup
MaterialApp(
  theme: ThemeData(
    primaryColor: AppColors.primaryDefault,
    fontFamily: 'Manrope',
  ),
)
```

**Issue: Table data not loading**
```dart
// Solution: Verify TableData structure
final tableData = TableData(
  header: [
    TableHeader(fieldName: 'name', label: 'Name', typeData: TypeData.string),
  ],
  detail: [
    RowData(rowData: [
      ColumnData(data: 'John Doe', typeData: TypeData.string),
    ]),
  ],
);
```

### Getting Help

1. **Check Documentation**: Visit component-specific guides
2. **Run Examples**: Test with `example_vs_components.dart`
3. **Check Console**: Look for Flutter/Dart errors
4. **Update Dependencies**: Run `flutter pub get`

### Performance Tips

- Use `const` constructors when possible
- Implement proper state management
- Use pagination for large datasets
- Optimize image loading in avatars

---

## 🎯 Next Steps

Now that you're set up with VS Design System:

1. **Explore Components**: Check out all available components in the documentation
2. **Run Examples**: Open `example_vs_components.dart` to see live examples
3. **Build Your UI**: Start implementing components in your app
4. **Customize**: Adapt the design tokens to match your brand
5. **Contribute**: Help improve the design system

Happy coding with VS Design System! 🚀

---

**Need Help?** Check the [component documentation](INDEX.md) or explore the [examples](example_vs_components.dart).

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: AppTheme.lightTheme,  // ✅ Use design system theme
      home: const HomePage(),
    );
  }
}
```

### Step 3: Use Components

```dart
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VSAppBar(
        title: 'Dashboard',
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            VSButton(
              label: 'Get Started',
              variant: VSButtonVariant.primary,
              onPressed: () {
                VSToastService.showToast(
                  context,
                  title: 'Welcome!',
                  type: VSToastType.success,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
```

That's it! 🎉 Your app now uses the VS Design System.

---

## Core Concepts

### 1. Design Tokens

Design tokens are the foundation of the system. They ensure consistency across all components.

#### Colors

```dart
// Primary colors
AppColors.primaryDefault     // #1eb386
AppColors.primaryHover       // #1c7e74
AppColors.primaryPressed     // #00665b
AppColors.primaryBg          // #edf6f2

// Semantic colors
AppColors.dangerDefault      // Errors
AppColors.successDefault     // Success states
AppColors.warningDefault     // Warnings
AppColors.neutral0           // White
AppColors.neutral900         // Dark
```

#### Typography

```dart
// Headings
AppTypography.h1             // 40px Bold
AppTypography.h2             // 32px Bold
AppTypography.h3             // 24px Bold
AppTypography.h4             // 20px Bold
AppTypography.h5             // 18px Bold
AppTypography.h6             // 16px SemiBold

// Body text
AppTypography.bodyLargeRegular   // 16px Regular
AppTypography.bodyMediumRegular  // 14px Regular
AppTypography.bodySmallRegular   // 12px Regular
```

#### Spacing

```dart
AppSpacing.xs   // 4px
AppSpacing.sm   // 8px
AppSpacing.md   // 12px
AppSpacing.lg   // 16px
AppSpacing.xl   // 24px
```

### 2. Component Architecture

All widgets follow consistent patterns:

```dart
VSComponentName(
  // Content
  label: 'Text',
  
  // Variants
  variant: VSComponentVariant.primary,
  
  // Sizes
  size: VSComponentSize.medium,
  
  // States
  enabled: true,
  
  // Callbacks
  onPressed: () {},
)
```

---

## Common Use Cases

### Forms

```dart
Column(
  children: [
    VSInputField(
      label: 'Email',
      placeholder: 'Enter your email',
      controller: emailController,
    ),
    const SizedBox(height: 16),
    
    VSInputField(
      label: 'Password',
      isPassword: true,
      controller: passwordController,
    ),
    const SizedBox(height: 24),
    
    VSButton(
      label: 'Sign In',
      variant: VSButtonVariant.primary,
      onPressed: _handleSignIn,
    ),
  ],
)
```

### Data Tables

```dart
VSTableDynamic(
  data: users,
  excludeFields: ['id', 'password'],
  sortableFields: ['name', 'email', 'createdAt'],
  showFloatingInfoBar: true,
  floatingInfoBarLabel: 'users',
  floatingInfoBarActions: [
    VSFloatingInfoBarAction(
      label: 'Export',
      icon: Icons.download,
      onPressed: (selectedIds) => _exportUsers(selectedIds),
    ),
    VSFloatingInfoBarAction(
      label: 'Delete',
      icon: Icons.delete,
      isPrimary: false,
      onPressed: (selectedIds) => _deleteUsers(selectedIds),
    ),
  ],
)
```

### Dialogs

```dart
showDialog(
  context: context,
  builder: (context) => VSDialog(
    title: 'Confirm Action',
    content: Text('Are you sure you want to proceed?'),
    actions: [
      VSButton(
        label: 'Cancel',
        variant: VSButtonVariant.secondary,
        onPressed: () => Navigator.pop(context),
      ),
      VSButton(
        label: 'Confirm',
        variant: VSButtonVariant.primary,
        onPressed: () {
          Navigator.pop(context);
          _handleConfirm();
        },
      ),
    ],
  ),
);
```

### Notifications

```dart
// Success
VSToastService.showToast(
  context,
  title: 'Success',
  description: 'Changes saved successfully',
  type: VSToastType.success,
);

// Error
VSToastService.showToast(
  context,
  title: 'Error',
  description: 'Failed to save changes',
  type: VSToastType.error,
);

// Warning
VSToastService.showToast(
  context,
  title: 'Warning',
  description: 'Some fields are missing',
  type: VSToastType.warning,
);
```

### Navigation

```dart
Scaffold(
  appBar: VSAppBar(
    title: 'Dashboard',
    leading: IconButton(
      icon: Icon(Icons.menu),
      onPressed: () => _openDrawer(),
    ),
    actions: [
      VSAvatar(
        initials: 'JD',
        size: VSAvatarSize.small,
        onTap: () => _showProfile(),
      ),
    ],
  ),
  drawer: VSDrawer(
    width: 300,
    child: VSMenu(
      logo: Image.asset('assets/logo.png'),
      navigationItems: [
        VSMenuItem(
          icon: Icons.dashboard,
          tooltip: 'Dashboard',
          onTap: () => _navigate('/dashboard'),
          isSelected: true,
        ),
        VSMenuItem(
          icon: Icons.people,
          tooltip: 'Users',
          onTap: () => _navigate('/users'),
        ),
      ],
    ),
  ),
  body: YourContent(),
)
```

---

## Tips & Best Practices

### ✅ Do's

- **Use design tokens** instead of hardcoding values:
  ```dart
  // ✅ Good
  color: AppColors.primaryDefault
  padding: EdgeInsets.all(AppSpacing.lg)
  
  // ❌ Bad
  color: Color(0xFF1eb386)
  padding: EdgeInsets.all(16)
  ```

- **Follow naming conventions**:
  ```dart
  // All widgets start with VS prefix
  VSButton, VSInputField, VSTableDynamic
  ```

- **Use enums for variants**:
  ```dart
  // Type-safe and autocomplete-friendly
  variant: VSButtonVariant.primary
  size: VSButtonSize.medium
  ```

### ⚠️ Don'ts

- Don't modify design tokens directly
- Don't create custom variants outside the system
- Don't mix custom colors with token colors
- Don't skip documentation when unsure

### 🎯 Pro Tips

1. **Use VSToastService** for all notifications (replaces SnackBar)
2. **Leverage VSTableDynamic** for rapid prototyping with JSON data
3. **Check existing components** before building custom ones
4. **Follow the `part of` pattern** when extending the system
5. **Reference example_vs_components.dart** for working code snippets

---

## Troubleshooting

### Issue: "Cannot find package"

**Solution**: Ensure the path in `pubspec.yaml` is correct:
```yaml
vs_design_system:
  path: ../vs_design_system  # Adjust this path
```

### Issue: "Theme not applying"

**Solution**: Make sure you're using `AppTheme.lightTheme`:
```dart
MaterialApp(
  theme: AppTheme.lightTheme,  // ✅ Required
  // ...
)
```

### Issue: "Fonts not loading"

**Solution**: Check that `pubspec.yaml` includes font assets or that the Manrope font is properly configured in the design system package.

### Issue: "Colors look wrong"

**Solution**: Always use `AppColors.*` tokens. Avoid hardcoded colors.

---

## Quick Reference Card

```dart
// Import
import 'package:vs_design_system/vs_design_system.dart';

// Theme
theme: AppTheme.lightTheme

// Colors
AppColors.primaryDefault
AppColors.dangerDefault
AppColors.successDefault

// Typography
AppTypography.h3
AppTypography.bodyMediumRegular

// Spacing
AppSpacing.lg  // 16px
AppSpacing.md  // 12px

// Components
VSButton(label: 'Text', onPressed: () {})
VSInputField(label: 'Field')
VSTableDynamic(data: [])
VSDialog(title: 'Title')
VSToastService.showToast(context, title: 'Message')
```

---
