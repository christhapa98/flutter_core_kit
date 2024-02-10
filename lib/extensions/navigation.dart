import 'package:flutter/material.dart';

PageRouteBuilder _fadeTransition(Widget screen) => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    });

extension NavigationExtension on BuildContext {
  navigateTo({required Widget screen, state, bool fade = false}) =>
      Navigator.push(
          this,
          fade
              ? _fadeTransition(screen)
              : MaterialPageRoute(builder: (_) => screen));

  navigateAndRestore({required Widget screen, onBack, bool fade = false}) =>
      Navigator.of(this)
          .push(fade
              ? _fadeTransition(screen)
              : MaterialPageRoute(builder: (_) => screen))
          .then((val) {});

  navigateToReplace({required Widget screen}) => Navigator.pushReplacement(
      this, MaterialPageRoute(builder: (_) => screen));

  navigateAndRemoveUntil({required Widget screen, bool fade = false}) =>
      Navigator.of(this).pushAndRemoveUntil(
          fade
              ? _fadeTransition(screen)
              : MaterialPageRoute(builder: (_) => screen),
          (Route<dynamic> route) => false);

  navigateBack() => Navigator.pop(this);
}
