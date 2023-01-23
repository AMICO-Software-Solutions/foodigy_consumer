import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBlur extends StatefulWidget {
  final Widget child;
  const GlassBlur({super.key, required this.child});

  @override
  State<GlassBlur> createState() => _GlassBlurState();
}

class _GlassBlurState extends State<GlassBlur> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
        child: widget.child,
      ),
    );
  }
}
