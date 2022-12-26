// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

import '../contants.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: NeumorphicButton(
        style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.all(Radius.circular(20))),
            shadowLightColor: background,
            shape: NeumorphicShape.convex,
            depth: 8,
            lightSource: LightSource.topLeft,
            color: color),
        onPressed: onPressed,
        padding: const EdgeInsets.all(8),
        child: Visibility(
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.merriweather(fontWeight: FontWeight.w500, fontSize: 14, color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
