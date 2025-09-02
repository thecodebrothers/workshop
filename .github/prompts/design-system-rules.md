---
mode: 'agent'
model: Claude Sonnet 3.5
description: 'Generate a new React form component'
---
# Design System Rules for Figma MCP Integration

This document outlines the design system structure and rules for the Flutter workshop application to help integrate Figma designs using the Model Context Protocol.

## Design System Structure

### 1. Token Definitions

**Color Theme** (`lib/ui/theme/background_theme_data.dart`):
- IMPORTANT: Use BackgroundThemeData from the AppThemeData object for theming.

**Spacing** (`lib/ui/foundation/spacing.dart`):
```dart
class DesignSystemSpacing {
  static const double zero = 0;
  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double m = 16;
  static const double l = 24;
  static const double xl = 32;
  static const double xxl = 48;
  static const double xxxl = 64;
}
```
- T-shirt sizing convention (xxs to xxxl)
- 4px base unit with progressive scaling

**Border Radius** (`lib/ui/foundation/radius.dart`):
```dart
class DesignSystemRadius {
  static const double none = 0;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 28;
  static const double xxl = 32;
  static const double full = 999;
}
```

**Typography** (`lib/ui/foundation/text_styles.dart`):
```dart
class DesignSystemTextStyles {
  final display = GoogleFonts.lora(fontSize: 40, fontWeight: FontWeight.w500);
  final headingExtraLarge = GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w500);
  final bodyRegular = GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400);
}
```
- Uses Google Fonts (Lora for display, Poppins for body text)
- Semantic naming convention
- Calculated line heights using Figma specifications

**ThemeData** (`lib/ui/theme/app_theme_data.dart`)
```dart
class AppThemeData {
  AppThemeData({
    required this.typography,
    required this.background,
    required this.border,
    required this.text,
    this.radius = const RadiusThemeData(),
    this.spacing = const SpacingThemeData(),
  });

  final SpacingThemeData spacing;
  final TypographyThemeData typography;
  final RadiusThemeData radius;
  final BackgroundThemeData background;
  final BorderThemeData border;
  final TextThemeData text;

  static AppThemeData light = AppThemeData(
    typography: TypographyThemeData.fromColor(DesignSystemColor.grey.shade800),
    background: BackgroundThemeData(
      primary: DesignSystemColor.primary.shade100,
      primaryInactive: DesignSystemColor.primary.shade600,
      secondary: DesignSystemColor.primary.shade200,
      brand: DesignSystemColor.brand.shade600,
      page: DesignSystemColor.primary.shade200,
    ),
    border: BorderThemeData(
      color: DesignSystemColor.primary.shade200,
    ),
    text: TextThemeData(
      primary: DesignSystemColor.grey.shade800,
      secondary: DesignSystemColor.primary.shade800,
      tertiary: DesignSystemColor.primary.shade600,
      inactive: DesignSystemColor.grey.shade400,
      inverse: DesignSystemColor.grey.shade200,
    ),
  );

  static AppThemeData dark = AppThemeData(
    typography: TypographyThemeData.fromColor(DesignSystemColor.grey.shade200),
    background: BackgroundThemeData(
      primary: DesignSystemColor.primary.shade900,
      primaryInactive: DesignSystemColor.primary.shade600,
      secondary: DesignSystemColor.primary.shade800,
      brand: DesignSystemColor.brand.shade100,
      page: DesignSystemColor.primary.shade800,
    ),
    border: BorderThemeData(
      color: DesignSystemColor.primary.shade700,
    ),
    text: TextThemeData(
      primary: DesignSystemColor.grey.shade200,
      secondary: DesignSystemColor.primary.shade400,
      tertiary: DesignSystemColor.primary.shade500,
      inactive: DesignSystemColor.grey.shade400,
      inverse: DesignSystemColor.grey.shade800,
    ),
  );
}

```
- Provides access to `SpacingThemeData`, `RadiusThemeData`, `TypographyThemeData`, `BackgroundThemeData`, `BorderThemeData`. 
- For all design-system components use the `ThemeData` object to implement theming 
- Do not use `DesignSystemSpacing` directly and instead use `AppTheam.of(context).spacing.xs`.

**Theme** (`lib/ui/theme/app_theme.dart`)
- provides access to `AppThemeData`

### 2. Component Library

Components are organized in `lib/ui/widgets/` with a barrel export pattern:

**Structure**:
- `lib/ui/widgets/widgets.dart` - Main export file
- Individual component files (card.dart, app_bar.dart, etc.)
- Each component follows Flutter StatelessWidget pattern

**Component Architecture Example**:
```dart
class Card extends StatelessWidget {
  const Card({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(AppTheme.of(context).radius.sm),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.of(context).background.primary,
          border: Border.all(color: AppTheme.of(context).border.color),
        ),
        child: child,
      ),
    );
  }
}
```

### 3. Frameworks & Libraries

**UI Framework**: Flutter 3.35.0+
**State Management**: Riverpod (flutter_riverpod ^2.6.1)
**Navigation**: go_router ^12.1.0
**Typography**: google_fonts ^6.3.0
**Icons**: font_awesome_flutter ^10.9.0
**Build System**: Standard Flutter build system with Dart SDK ^3.9.0

### 4. Asset Management

Assets are organized in:
- `assets/` - Main assets folder with separate pubspec.yaml
- `web/` - Web-specific assets (icons, favicon)
- `web/icons/` - PWA icons in multiple sizes

Asset reference pattern:
```yaml
flutter:
  uses-material-design: true
  generate: true
```

### 5. Icon System

Icons are handled through font_awesome_flutter package:
- FontAwesome icons used throughout the application
- Icon button component in `lib/ui/widgets/icon_button.dart`

### 6. Styling Approach

**Theme System**: 
- Centralized theme in `lib/ui/theme/`
- Context-aware theming using `AppTheme.of(context)`
- Separate theme data classes for different aspects:
  - `app_theme_data.dart`
  - `background_theme_data.dart`
  - `border_theme_data.dart`
  - `radius_theme_data.dart`
  - `spacing_theme_data.dart`
  - `text_theme_data.dart`
  - `typography_theme_data.dart`

**Responsive Design**: Flutter's built-in responsive capabilities with MediaQuery

### 7. Project Structure

```
lib/
├── main.dart                 # Application entry point
├── data/                     # Data layer (repositories, models)
│   ├── fruit/
│   └── user/
├── features/                 # Feature-based organization
│   ├── about/
│   ├── account/
│   ├── basket/
│   └── shop/
├── l10n/                     # Internationalization
├── root/                     # App root, routing, shell
├── ui/                       # Design system
│   ├── foundation/           # Design tokens
│   ├── theme/               # Theme configuration
│   └── widgets/             # Reusable components
```

**Feature Organization Pattern**:
Each feature follows a consistent structure:
- `feature_screen.dart` - Main screen widget
- `feature.dart` - Barrel export
- `state/` - State management (Riverpod providers)
- `views/` - Sub-views or page variants
- `widgets/` - Feature-specific widgets

### 8. Widgetbook Integration

The project includes a separate Widgetbook setup in `widgetbook/`:
- Separate Flutter app for component documentation
- Mirrors the main app's component structure
- Used for component development and testing

## Integration Guidelines for Figma MCP

1. **Token Mapping**: Map Figma design tokens to existing Dart classes in `lib/ui/foundation/`
2. **Component Generation**: Generate components following the StatelessWidget pattern with theme context access
3. **Asset Import**: Place assets in appropriate directories following the existing structure
4. **Naming Conventions**: Use semantic naming for components and descriptive naming for design tokens
5. **Theme Integration**: Ensure all generated components use `AppTheme.of(context)` for accessing design tokens
6. **Responsive Behavior**: Leverage Flutter's built-in responsive capabilities and MediaQuery
7. **Internationalization**: Use the existing l10n setup for text content

## Code Generation Patterns

When generating code from Figma:

1. **Colors**: Add new colors to `DesignSystemColor` class with appropriate swatch variations
2. **Typography**: Add new text styles to `DesignSystemTextStyles` using Google Fonts
3. **Components**: Create new widgets in `lib/ui/widgets/` and export in `widgets.dart`
4. **Spacing/Sizing**: Use existing spacing tokens or add new ones following the T-shirt sizing convention
5. **Assets**: Place in `assets/` folder and reference through the asset system

## Dependencies to Consider

When integrating Figma designs:
- Stick to Google Fonts for typography consistency
- Use FontAwesome for icons when possible
- Leverage flutter_riverpod for state management
- Follow go_router patterns for navigation
- Maintain compatibility with the existing localization system