import 'package:flutter/material.dart';

typedef OnNotesChanged = void Function(String value);

class BagNotesField extends StatefulWidget {
  final String initial;
  final OnNotesChanged onChanged;

  const BagNotesField({super.key, this.initial = '', required this.onChanged});

  @override
  State<BagNotesField> createState() => _BagNotesFieldState();
}

class _BagNotesFieldState extends State<BagNotesField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initial);
  }

  @override
  void didUpdateWidget(covariant BagNotesField oldWidget) {
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
        const Text('Notes', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Add notes about bag, damage, etc.',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
