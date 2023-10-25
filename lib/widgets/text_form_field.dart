import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/constants.dart';

// ignore: must_be_immutable
class MyTextFormField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const MyTextFormField({
    super.key,
    required this.label,
    this.keyboardType,
    this.obscureText,
    this.textInputAction,
    this.validator,
    this.controller,
    this.focusNode,
    this.onSaved,
    this.suffixIcon,
  });

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText!,
        validator: widget.validator,
        decoration: InputDecoration(
          border: border(labalAndTextButtonColor!),
          enabledBorder: border(labalAndTextButtonColor!),
          focusedBorder: border(primaryColor),
          errorBorder: border(errorBorderColor),
          suffixIcon: widget.suffixIcon,
          label: Text(widget.label),
          labelStyle: GoogleFonts.cairo(
            fontSize: 18,
            color: labalAndTextButtonColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        onSaved: widget.onSaved,
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
