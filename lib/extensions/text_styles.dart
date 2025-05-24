import 'package:flutter/material.dart';

/// Extensions for TextStyle to simplify and enhance text styling.
extension TextStyleExtensions on TextStyle {
  /// Sets the font size.
  TextStyle size(double value) => copyWith(fontSize: value);

  /// Scales the font size by a factor.
  TextStyle scaleSize(double factor) =>
      copyWith(fontSize: (fontSize ?? 14) * factor);

  /// Sets the font weight.
  TextStyle weight(FontWeight value) => copyWith(fontWeight: value);

  /// Applies bold weight.
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  /// Applies semi-bold weight.
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  /// Applies light weight.
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  /// Applies medium weight.
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  /// Sets the font color.
  TextStyle color(Color value) => copyWith(color: value);

  /// Sets the letter spacing.
  TextStyle letterSpacing(double value) => copyWith(letterSpacing: value);

  /// Sets the word spacing.
  TextStyle wordSpacing(double value) => copyWith(wordSpacing: value);

  /// Applies italic style.
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  /// Sets the line height (height factor).
  TextStyle lineHeight(double value) => copyWith(height: value);

  /// Sets the background color.
  TextStyle backgroundColor(Color value) => copyWith(backgroundColor: value);

  /// Applies underline decoration.
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  /// Applies line-through decoration.
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);

  /// Applies overline decoration.
  TextStyle get overline => copyWith(decoration: TextDecoration.overline);

  /// Removes all text decorations.
  TextStyle get noDecoration => copyWith(decoration: TextDecoration.none);

  /// Combines two styles.
  TextStyle mergeWith(TextStyle? other) => merge(other);

  /// Sets a custom font family.
  TextStyle fontFamily(String family) => copyWith(fontFamily: family);

  /// Sets text shadows.
  TextStyle withShadow({
    Color color = Colors.black38,
    double blurRadius = 2.0,
    Offset offset = const Offset(1, 1),
  }) {
    return copyWith(shadows: [
      Shadow(color: color, blurRadius: blurRadius, offset: offset),
    ]);
  }

  /// Applies multiple shadows.
  TextStyle withShadows(List<Shadow> shadows) => copyWith(shadows: shadows);

  /// Adjusts text decoration thickness.
  TextStyle decorationThickness(double thickness) =>
      copyWith(decorationThickness: thickness);

  /// Sets text alignment using `TextAlign`.
  TextAlign align() {
    return TextAlign.left; // Example for a separate use
  }

  /// Adds multiple text shadows for a glow effect.
  TextStyle glow({
    Color color = Colors.blueAccent,
    double blurRadius = 5.0,
    int spread = 3,
  }) {
    return copyWith(
      shadows: List.generate(
        spread,
        (index) => Shadow(
          color: color,
          blurRadius: blurRadius + (index * 2),
        ),
      ),
    );
  }

  /// Makes the font responsive based on screen width.
  TextStyle responsiveSize(BuildContext context, double factor) {
    double screenWidth = MediaQuery.of(context).size.width;
    return copyWith(fontSize: screenWidth * factor);
  }

  /// Applies an outlined text style.
  TextStyle outlined({
    Color strokeColor = Colors.black,
    double strokeWidth = 1.0,
  }) {
    return copyWith(
      foreground: Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..color = strokeColor,
    );
  }
}
