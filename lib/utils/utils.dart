import 'package:flutter/material.dart';

bool hasTextOverflow(String text, TextStyle style,
    {double minWidth = 0,
    double maxWidth = double.infinity,
    int maxLines = 1}) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: maxLines,
    textDirection: TextDirection.ltr,
  )..layout(minWidth: minWidth, maxWidth: maxWidth);
  // debugPrint('overflow : ${textPainter.didExceedMaxLines}');
  return textPainter.didExceedMaxLines;
}
