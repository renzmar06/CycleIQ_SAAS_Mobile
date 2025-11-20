import 'package:flutter/material.dart';

class EditProfileSheet extends StatelessWidget {
  final TextEditingController nameCtrl;
  final TextEditingController phoneCtrl;
  final VoidCallback onSave;

  const EditProfileSheet({
    super.key,
    required this.nameCtrl,
    required this.phoneCtrl,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 12,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// --- TOP DRAG HANDLE ---
          Container(
            width: 35,
            height: 5,
            margin: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          /// TITLE
          const Text(
            "Edit Profile",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),

          /// INPUT FIELD - NAME
          TextField(
            controller: nameCtrl,
            decoration: InputDecoration(
              labelText: "Name",
              labelStyle: TextStyle(color: Colors.grey.shade600),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.green, width: 1.4),
              ),
            ),
          ),
          const SizedBox(height: 14),

          /// INPUT FIELD - PHONE
          TextField(
            controller: phoneCtrl,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: "Phone",
              labelStyle: TextStyle(color: Colors.grey.shade600),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.green, width: 1.4),
              ),
            ),
          ),
          const SizedBox(height: 22),

          /// SAVE BUTTON
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onSave,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: const Text("Save"),
            ),
          ),
        ],
      ),
    );
  }
}
