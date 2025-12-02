import 'package:cycleiq_saas_mobile/src/profile/model/user.dart';
import 'package:flutter/material.dart';

class EPPersonalInfoForm extends StatefulWidget {
  final ProfileUser user;
  final GlobalKey<EPPersonalInfoFormState> formKey;

  const EPPersonalInfoForm({required this.user, required this.formKey})
    : super(key: formKey);

  @override
  EPPersonalInfoFormState createState() => EPPersonalInfoFormState();
}

class EPPersonalInfoFormState extends State<EPPersonalInfoForm> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController bioController;
  late TextEditingController addressController;
  late TextEditingController cityController;
  late TextEditingController zipController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
    emailController = TextEditingController(text: widget.user.email);
    phoneController = TextEditingController(text: widget.user.phone);
    bioController = TextEditingController(text: widget.user.notes);
    addressController = TextEditingController(text: widget.user.address);
    cityController = TextEditingController(text: widget.user.city);
    zipController = TextEditingController(text: widget.user.zipCode);
  }

  // EXPOSE VALUES TO PARENT
  Map<String, dynamic> get formValues => {
    "name": nameController.text.trim(),
    "email": emailController.text.trim(),
    "phone": phoneController.text.trim().toString(),
    "notes": bioController.text.trim(),
    "address": addressController.text.trim(),
    "city": cityController.text.trim(),
    "zipCode": zipController.text.trim(),
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _textField("Full Name", nameController, "Enter your name"),
        const SizedBox(height: 16),

        _textField("Email", emailController, "Enter email"),
        const SizedBox(height: 16),

        _textField(
          "Phone Number",
          phoneController,
          "Enter phone",
          readOnly: true,
        ),
        const SizedBox(height: 4),
        const Text(
          "Phone number cannot be changed",
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        const SizedBox(height: 16),

        _textField(
          "Bio",
          bioController,
          "Tell us about yourself...",
          maxLines: 4,
        ),
        const SizedBox(height: 16),

        _textField("Address", addressController, "Street address"),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(child: _textField("City", cityController, "City")),
            const SizedBox(width: 16),
            Expanded(child: _textField("Zip Code", zipController, "Zip")),
          ],
        ),
      ],
    );
  }

  Widget _textField(
    String label,
    TextEditingController ctrl,
    String hint, {
    bool readOnly = false,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 6),
        readOnly
            ? Container(
                margin: const EdgeInsets.only(top: 6),
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: TextFormField(
                  controller: ctrl,
                  enabled: !readOnly,
                  maxLines: maxLines,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "",
                  ),
                ),
              )
            : TextFormField(
                controller: ctrl,
                enabled: !readOnly,
                maxLines: maxLines,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "",
                ),
              ),
      ],
    );
  }
}
