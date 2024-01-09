
import 'package:flutter_core_kit/design_system/design_tokens/colors/brands/default_brand.dart';
import 'package:flutter_core_kit/design_system/design_tokens/colors/molecules/color.tokens.dart';

abstract class Brand {
  ColorTokens getColorTokens(bool isDarkMode);
}

class DefaultBrand extends Brand {
  @override
  ColorTokens getColorTokens(bool isDarkMode) {
    return isDarkMode
        ? BrandColorsTokenInDarkMode()
        : BrandColorsTokenInLightMode();
  }
}