import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool loading;
  final Color backgroundColor;
  final Color textColor;
  final double radius;
  final double height;
  final bool fullWidth;
  final double fontSize;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.loading = false,
    this.backgroundColor = const Color(0xFF00A73E),
    this.textColor = Colors.white,
    this.radius = 12,
    this.height = 55,
    this.fullWidth = true,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: height,
      child: GestureDetector(
        onTap: loading ? null : onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius),
          ),
          alignment: Alignment.center,
          child: loading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.white,
                  ),
                )
              : Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
