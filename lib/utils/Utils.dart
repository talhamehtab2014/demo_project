import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

/// Custom Button Widget
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double width;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.borderRadius = 8.0,
    this.width = double.infinity,
    this.height = 50,
    this.fontSize = 16,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
        ),
      ),
    );
  }
}

/// Custom TextView (Text Widget)
class CustomTextView extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const CustomTextView({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}


class CustomEditText extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Color backgroundColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final double borderRadius;
  final TextInputType keyboardType;
  final bool showBorder;
  final bool showBorderOnFocus;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const CustomEditText({
    super.key,
    required this.controller,
    this.hintText = "Enter text",
    this.obscureText = false,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = Colors.blue,
    this.borderRadius = 8.0,
    this.keyboardType = TextInputType.text,
    this.showBorder = true,
    this.showBorderOnFocus = false,
    this.hintStyle,
    this.validator,
    this.onChanged,
  });

  @override
  State<CustomEditText> createState() => CustomEditTextState();
}

class CustomEditTextState extends State<CustomEditText> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder? getBorder({required bool isFocused}) {
      if (!widget.showBorder) return null;

      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        borderSide: BorderSide(
          color: (widget.showBorderOnFocus && isFocused)
              ? widget.focusedBorderColor
              : widget.borderColor,
          width: (widget.showBorderOnFocus && isFocused) ? 2.0 : 1.0,
        ),
      );
    }

    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      focusNode: _focusNode,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ?? const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: widget.backgroundColor,
        enabledBorder: getBorder(isFocused: false),
        focusedBorder: getBorder(isFocused: true),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}




