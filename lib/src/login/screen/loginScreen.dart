import 'package:cycleiq_saas_mobile/core/services/navigation.dart';
import 'package:cycleiq_saas_mobile/core/utils/constants/image_strings.dart';
import 'package:cycleiq_saas_mobile/core/utils/widgets/common_textfield.dart';
import 'package:cycleiq_saas_mobile/core/utils/widgets/link_button.dart';
import 'package:cycleiq_saas_mobile/core/utils/widgets/primary_button.dart';
import 'package:cycleiq_saas_mobile/src/login/bloc/login_bloc.dart';
import 'package:cycleiq_saas_mobile/src/login/bloc/login_event.dart';
import 'package:cycleiq_saas_mobile/src/login/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  // ---------------- VALIDATIONS ----------------

  bool _isValidEmail(String email) {
    final regex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    return regex.hasMatch(email);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _validateAndLogin(BuildContext context) {
    final email = emailCtrl.text.trim();
    final password = passwordCtrl.text.trim();

    // REQUIRED FIELDS
    if (email.isEmpty || password.isEmpty) {
      _showError("Please fill out all fields");
      return;
    }

    // EMAIL FORMAT
    if (!_isValidEmail(email)) {
      _showError("Please enter a valid email address");
      return;
    }

    // PASSWORD LENGTH
    // if (password.length < 6) {
    //   _showError("Password must be at least 6 characters");
    //   return;
    // }

    // TRIGGER BLoC
    context.read<LoginBloc>().add(
      LoginSubmitted(email: email, password: password),
    );
  }

  // ---------------- UI ----------------

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          AppNav.push(context, '/entryPoint');
        } else if (state.status == LoginStatus.failure) {
          _showError(state.errorModel?.message ?? "Login failed");
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                // Logo
                Center(
                  child: Image.asset(ImageStrings.logoTransparent, height: 85),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Welcome Back 👋",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),
                const Text("Login to continue your waste pickup orders"),

                const SizedBox(height: 32),

                // Email
                AppTextField(
                  label: "Email",
                  controller: emailCtrl,
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 16),

                AppTextField(
                  label: "Password",
                  controller: passwordCtrl,
                  prefixIcon: Icons.lock_outline,
                  isPassword: true,
                ),

                const SizedBox(height: 12),

                Align(
                  alignment: Alignment.centerRight,
                  child: AppLinkButton(
                    text: "Forgot Password?",
                    onTap: () =>
                        Navigator.pushNamed(context, "/forgotPassword"),
                  ),
                ),

                const SizedBox(height: 16),

                // Login Button
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return AppButton(
                      height: 58,
                      text: "Login",
                      loading: state.status == LoginStatus.loading,
                      onPressed: () => _validateAndLogin(context),
                    );
                  },
                ),

                const SizedBox(height: 20),

                // Create account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    AppLinkButton(
                      text: "Create Account",
                      onTap: () => AppNav.push(context, '/register'),
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
