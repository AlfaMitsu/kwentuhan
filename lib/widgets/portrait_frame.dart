import 'dart:math' as math;

import 'package:flutter/material.dart';

class PortraitFrame extends StatelessWidget {
  const PortraitFrame({required this.child, this.background = Colors.white, super.key});

  final Widget child;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFEAF1F4),
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = math.min(430.0, constraints.maxWidth);
            final maxHeight = math.min(900.0, constraints.maxHeight);
            final width = math.min(maxWidth, maxHeight * 9 / 16);
            final height = width * 16 / 9;
            return SizedBox(
              width: width,
              height: height,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(width < constraints.maxWidth ? 28 : 0),
                child: ColoredBox(color: background, child: child),
              ),
            );
          },
        ),
      ),
    );
  }
}
