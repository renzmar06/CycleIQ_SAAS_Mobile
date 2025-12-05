import 'package:flutter/material.dart';

typedef OnIdChanged = void Function(String value);

class BagIdField extends StatefulWidget {
  final String initial;
  final OnIdChanged onChanged;

  const BagIdField({super.key, this.initial = '', required this.onChanged});

  @override
  State<BagIdField> createState() => _BagIdFieldState();
}

class _BagIdFieldState extends State<BagIdField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initial);
  }

  @override
  void didUpdateWidget(covariant BagIdField oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update only if value actually changed
    if (oldWidget.initial != widget.initial &&
        controller.text != widget.initial) {
      controller.text = widget.initial;
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Bag QR ID",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Enter Bag QR',
            border: OutlineInputBorder(),
          ),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
