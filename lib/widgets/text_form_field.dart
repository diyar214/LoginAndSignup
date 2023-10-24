import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/constants.dart';
// ignore: must_be_immutable
class MyTextFormField extends StatefulWidget {
  final Text label;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final double? index;
  final String? Function(String?)? validator;
  bool obscureText;
  
  MyTextFormField({
    super.key,
    required this.label,
    required this.keyboardType,
    required this.obscureText,
    required this.textInputAction,
    this.index,
    this.validator,
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
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        validator: widget.validator,      
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              widget.obscureText = !widget.obscureText;
              setState(() {});
            },
            icon: Icon(
              widget.index == 1
                  ? widget.obscureText
                      ? Icons.visibility
                      : Icons.visibility_off
                  : null,
              color: primaryColor,
            ),
          ),
          label: widget.label,
          labelStyle: GoogleFonts.cairo(
                fontSize: 22,
                color: labalAndTextButtonColor,
                fontWeight: FontWeight.w600,
              ),
          border: border(labalAndTextButtonColor!),
          enabledBorder: border(labalAndTextButtonColor!),
          focusedBorder: border(primaryColor),
          errorBorder: border(errorBorderColor),
        ),
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
