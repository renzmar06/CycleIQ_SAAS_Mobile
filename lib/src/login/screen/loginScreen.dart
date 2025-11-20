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
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          Navigator.pushReplacementNamed(context, "/home");
        } else if (state.status == LoginStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorModel?.message ?? "Error")),
          );
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
                      onPressed: () {
                        AppNav.to(context, '/entryPoint');
                        // context.read<LoginBloc>().add(
                        //   LoginSubmitted(
                        //     email: emailCtrl.text.trim(),
                        //     password: passwordCtrl.text.trim(),
                        //   ),
                        // );
                      },
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
                      onTap: () => AppNav.to(context, '/register'),
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
