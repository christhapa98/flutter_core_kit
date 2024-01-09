// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:flutter_core_kit/design_system/design_tokens/colors/brands/brand_color_tokens.dart';
import 'package:flutter_core_kit/design_system/design_tokens/colors/molecules/color.tokens.dart';

@immutable
class DesignTokensThemeExtension
    extends ThemeExtension<DesignTokensThemeExtension> {
  late final TextDirection textDirection;
  late final ColorTokens colors;

  DesignTokensThemeExtension({
    required this.textDirection,
    required this.colors,
  }) {}

  /// Initializes the design tokens with default
  /// values based on [brand] and [textDirection].
  DesignTokensThemeExtension.initWithBrandAndTextDirection({
    required this.textDirection,
    required Brand brand,
    required bool isDarkMode,
  }) {
    // Init unmodifiable tokens
    colors = brand.getColorTokens(isDarkMode);
  }

  @override
  DesignTokensThemeExtension copyWith({
    TextDirection? textDirection,
    ColorTokens? colors,
  }) {
    final colorsUpdated = colors ?? this.colors;
    final textDirectionUpdated = textDirection ?? this.textDirection;

    return DesignTokensThemeExtension(
      textDirection: textDirectionUpdated,
      colors: colorsUpdated,
    );
  }

  @override
  DesignTokensThemeExtension lerp(
    ThemeExtension<DesignTokensThemeExtension>? other,
    double t,
  ) {
    if (other is! DesignTokensThemeExtension) {
      return this;
    }
    final ColorTokens colorsLerp = colors.lerp(other.colors, t) as ColorTokens;
    return DesignTokensThemeExtension(
      textDirection: textDirection,
      colors: colorsLerp,
    );
  }
}
