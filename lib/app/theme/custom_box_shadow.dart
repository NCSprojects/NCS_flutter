import 'package:flutter/material.dart';

class NCSshadow {
  static BoxDecoration custom({
    required Color color,
    required double borderRadius,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(4, 4),
        ),
      ],
    );
  }
}