import 'package:cycleiq_saas_mobile/core/services/navigation.dart';
import 'package:cycleiq_saas_mobile/core/utils/constants/image_strings.dart';
import 'package:cycleiq_saas_mobile/core/utils/widgets/common_textfield.dart';
import 'package:cycleiq_saas_mobile/core/utils/widgets/link_button.dart';
import 'package:cycleiq_saas_mobile/core/utils/widgets/primary_button.dart';
import 'package:cycleiq_saas_mobile/src/register/bloc/register_bloc.dart';
import 'package:cycleiq_saas_mobile/src/register/bloc/register_event.dart';
import 'package:cycleiq_saas_mobile/src/register/bloc/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();

  /// EMAIL VALIDATION
  bool _isValidEmail(String email) {
    final regex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    return regex.hasMatch(email);
  }

  /// PHONE VALIDATION (10 digits)
  bool _isValidPhone(String phone) {
    final regex = RegExp(r'^\d{10}$');
    return regex.hasMatch(phone);
  }

  /// SHOW ERROR
  void _showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  /// VALIDATE AND SUBMIT
  void _validateAndSubmit(BuildContext context) {
    final name = nameCtrl.text.trim();
    final email = emailCtrl.text.trim();
    final phone = phoneCtrl.text.trim();
    final password = passwordCtrl.text.trim();
    final confirmPassword = confirmPasswordCtrl.text.trim();

    // REQUIRED CHECK
    if (name.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      _showError("Please fill out all fields");
      return;
    }

    // EMAIL CHECK
    if (!_isValidEmail(email)) {
      _showError("Please enter a valid email address");
      return;
    }

    // PHONE CHECK
    if (!_isValidPhone(phone)) {
      _showError("Phone number must be exactly 10 digits");
      return;
    }

    // PASSWORD MATCH
    if (password != confirmPassword) {
      _showError("Passwords do not match");
      return;
    }

    // IF ALL OK → TRIGGER BLOC
    context.read<RegisterBloc>().add(
      RegisterSubmitted(
        name: name,
        email: email,
        phone: phone,
        password: password,
        confirmPassword: confirmPassword,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.status == RegisterStatus.success) {
          context.pop(); // go back to login
        } else if (state.status == RegisterStatus.failure) {
          _showError(state.errorModel?.message ?? "Registration failed");
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                /// LOGO
                Center(
                  child: Image.asset(ImageStrings.logoTransparent, height: 85),
                ),

                const SizedBox(height: 30),
                const Text(
                  "Create Account",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),
                const Text(
                  "Fill your details to get started",
                  style: TextStyle(fontSize: 15),
                ),

                const SizedBox(height: 30),

                /// FULL NAME
                AppTextField(
                  label: "Full Name *",
                  controller: nameCtrl,
                  prefixIcon: Icons.person_outline,
                ),
                const SizedBox(height: 16),

                /// EMAIL
                AppTextField(
                  label: "Email *",
                  controller: emailCtrl,
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),

                /// PHONE
                AppTextField(
                  label: "Phone Number *",
                  controller: phoneCtrl,
                  prefixIcon: Icons.phone_android,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),

                /// PASSWORD
                AppTextField(
                  label: "Password *",
                  controller: passwordCtrl,
                  prefixIcon: Icons.lock_outline,
                  isPassword: true,
                ),
                const SizedBox(height: 16),

                /// CONFIRM PASSWORD
                AppTextField(
                  label: "Confirm Password *",
                  controller: confirmPasswordCtrl,
                  prefixIcon: Icons.lock_outline,
                  isPassword: true,
                ),

                const SizedBox(height: 28),

                /// REGISTER BUTTON
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    return AppButton(
                      text: "Create Account",
                      loading: state.status == RegisterStatus.loading,
                      onPressed: () => _validateAndSubmit(context),
                    );
                  },
                ),

                const SizedBox(height: 22),

                /// LOGIN LINK
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    AppLinkButton(
                      text: "Login",
                      onTap: () => AppNav.push(context, "/loginScreen"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
