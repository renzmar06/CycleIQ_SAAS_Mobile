import 'package:flutter/material.dart';

class LcCheckboxRow extends StatelessWidget {
  final bool checked;
  final Function(bool) onChanged;

  const LcCheckboxRow({
    super.key,
    required this.checked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          value: checked,
          onChanged: (val) => onChanged(val ?? false),
        ),
        const SizedBox(width: 8),
        const Expanded(
          child: Text.rich(
            TextSpan(
              text: "I agree ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text:
                      "to the above certification and understand the legal implications...",
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
