import 'package:flutter/material.dart';

extension SnackBarExtension on BuildContext {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(String message) {
    return ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }
}