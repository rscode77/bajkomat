import 'package:bajkomat/contants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  final String text;
  final bool obscureText;
  final TextEditingController controller;
  final Icon icon;
  const TextFieldWidget({
    Key? key,
    required this.text,
    required this.obscureText,
    required this.controller,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      style: GoogleFonts.cormorant(color: buttonColorLight, fontSize: 15, fontWeight: FontWeight.w500),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          isCollapsed: true,
          filled: true,
          fillColor: alertDialogBackgroudColor,
          hintText: text,
          hintStyle: GoogleFonts.cormorant(color: textHint, fontSize: 15, fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(style: BorderStyle.solid, color: buttonColorLight, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(style: BorderStyle.solid, color: textFieldBorder, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(style: BorderStyle.solid, color: buttonColorLight, width: 2.0),
          ),
          prefixIcon: icon),
    );
  }
}
