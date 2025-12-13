import 'package:flutter/material.dart';

typedef OnIdChanged = void Function(String value);

class BagIdField extends StatefulWidget {
  final String initial;
  final OnIdChanged onChanged;
  final FocusNode? focusNode;
  final String? error;

  const BagIdField({
    super.key,
    this.initial = '',
    required this.onChanged,
    this.focusNode,
    this.error,
  });

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

    // Only update if value is different
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
    final hasError = widget.error != null && widget.error!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Bag QR ID",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        /// INPUT FIELD
        TextField(
          controller: controller,
          focusNode: widget.focusNode,
          decoration: InputDecoration(
            hintText: 'Enter Bag QR',
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: hasError ? Colors.red : Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: hasError ? Colors.red : Colors.green,
                width: 2,
              ),
            ),
            errorText: null, // we handle error manually
          ),
          onChanged: (value) {
            final upper = value.toUpperCase();
            controller.value = controller.value.copyWith(
              text: upper,
              selection: TextSelection.collapsed(offset: upper.length),
            );
            widget.onChanged(upper);
          },
        ),

        /// INLINE ERROR
        if (hasError)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              widget.error!,
              style: const TextStyle(color: Colors.red, fontSize: 13),
            ),
          ),
      ],
    );
  }
}
