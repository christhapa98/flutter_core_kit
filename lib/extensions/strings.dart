extension StringExtensions on String {
  /// Checks if the string is a valid email.
  bool isEmail() {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(this);
  }

  /// Capitalizes the first letter of the string.
  String capitalize() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  /// Returns true if the string contains only numeric characters.
  bool isNumeric() {
    final numericRegex = RegExp(r'^\d+$');
    return numericRegex.hasMatch(this);
  }

  /// Checks if the string is a valid URL.
  bool isUrl() {
    final urlRegex =
        RegExp(r'^(https?:\/\/)?([\w\-]+(\.[\w\-]+)+)([\/\w\.\-]*)*\/?$');
    return urlRegex.hasMatch(this);
  }

  /// Removes all whitespace from the string.
  String removeWhitespace() {
    return replaceAll(RegExp(r'\s+'), '');
  }

  /// Returns a reversed version of the string.
  String reverse() {
    return split('').reversed.join();
  }

  /// Returns true if the string is null, empty, or contains only whitespace.
  bool isNullOrWhiteSpace() {
    return trim().isEmpty;
  }

  /// Shortens the string to a specified length with an optional ellipsis.
  String truncate(int maxLength, {String ellipsis = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}$ellipsis';
  }

  /// Converts the string to Title Case.
  String toTitleCase() {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize()).join(' ');
  }

  /// Checks if the string contains only alphabetic characters.
  bool isAlphabetic() {
    final alphabeticRegex = RegExp(r'^[a-zA-Z]+$');
    return alphabeticRegex.hasMatch(this);
  }

  /// Checks if the string contains at least one uppercase letter.
  bool containsUppercase() {
    return contains(RegExp(r'[A-Z]'));
  }

  /// Checks if the string contains at least one lowercase letter.
  bool containsLowercase() {
    return contains(RegExp(r'[a-z]'));
  }

  /// Checks if the string contains at least one digit.
  bool containsDigit() {
    return contains(RegExp(r'\d'));
  }

  /// Checks if the string is a valid phone number (basic check).
  bool isPhoneNumber() {
    final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
    return phoneRegex.hasMatch(this);
  }
}
