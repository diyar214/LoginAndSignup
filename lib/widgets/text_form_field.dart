import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/constants.dart';

// ignore: must_be_immutable
class MyTextFormField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final Widget? suffixIcon;
  final IconData? icon;
  final String? Function(String?)? validator;
  final void Function(String?) onSaved;

  const MyTextFormField({
    super.key,
    required this.label,
    this.keyboardType,
    this.obscureText,
    this.textInputAction,
    this.validator,
    this.controller,
    this.focusNode,
    required this.onSaved,
    this.suffixIcon,
    this.icon,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        obscureText: obscureText!,
        validator: validator,
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          isDense: true,
          hintStyle: GoogleFonts.cairo(
            fontSize: 14,
            color: Colors.grey.shade500,
          ),
          border: border(labalAndTextButtonColor!),
          enabledBorder: border(labalAndTextButtonColor!),
          focusedBorder: border(primaryColor),
          errorBorder: border(errorBorderColor),
          prefixIcon: Icon(
            icon,
            size: 25,
            color: primaryColor,
          ),
          suffixIcon: suffixIcon,
          label: Text(label),
          labelStyle: GoogleFonts.cairo(
            fontSize: 22,
            color: labalAndTextButtonColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        onSaved: onSaved,
      ),
    );
  }
}

InputBorder border(Color color) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color,
        width: 1.2,
      ),
    );
