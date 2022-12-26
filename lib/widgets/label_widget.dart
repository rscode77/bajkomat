import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelWidget extends StatelessWidget {
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final String text;
  const LabelWidget({
    Key? key,
    required this.fontWeight,
    required this.fontSize,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.cormorant(fontWeight: fontWeight, fontSize: fontSize, color: color),
    );
  }
}
