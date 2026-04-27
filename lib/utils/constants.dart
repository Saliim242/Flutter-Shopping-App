import 'package:flutter/material.dart';

TextStyle style({
  required double fontSize,
  String? fontFamily,
  required Color color,
  FontWeight? fontWeight,
  TextDecoration? decoration,
  double? height,
  TextOverflow? overflow,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: fontWeight,
    decoration: decoration,
    height: height,
    overflow: overflow,
  );
}

String formatCurrency(String? value) {
  final amount = double.tryParse(value ?? '');
  if (amount == null) return value ?? '-';
  return '\$${amount.toStringAsFixed(2)}';
}
