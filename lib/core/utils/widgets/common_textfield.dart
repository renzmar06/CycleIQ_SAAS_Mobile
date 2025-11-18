import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final String label;
  final String? hint;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isPassword;
  final bool readOnly;
  final TextInputType keyboardType;
  final int? maxLength;
  final double borderRadius;
  final Color? fillColor;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;

  const AppTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.borderRadius = 12,
    this.fillColor,
    this.onChanged,
    this.onSubmit,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscure : false,
      readOnly: widget.readOnly,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmit,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        filled: widget.fillColor != null,
        fillColor: widget.fillColor,
        counterText: "",
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => _obscure = !_obscure),
              )
            : (widget.suffixIcon != null ? Icon(widget.suffixIcon) : null),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
      ),
    );
  }
}
