import 'dart:ui';

import 'package:flutter/material.dart';

class FrostGlassEffect extends StatelessWidget {
  const FrostGlassEffect({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: child,
      ),
    );
  }
}
