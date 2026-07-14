import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/di/dependency_ingectiojn.dart';
import 'package:tasky/core/route/app-routs.dart';
import 'package:tasky/core/widgets/coustom_text_form_field.dart';
import 'package:tasky/features/auth/presintation/cubit/login/login_cubit.dart';
import 'package:tasky/features/auth/presintation/widgets/login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),

                // ── Title ──
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: .w700,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
                const SizedBox(height: 53),

                // ── Email ──
                const Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: .w700,
                    color: Color(0xFF24252C),
                  ),
                ),
                const SizedBox(height: 8),
                CoustomTextFormField(
                  hintText: 'enter username...',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  suffixIcon: Icons.person_outline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                // ── Password ──
                const Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: .w700,
                    color: Color(0xFF24252C),
                  ),
                ),
                const SizedBox(height: 8),
                CoustomTextFormField(
                  hintText: 'Password...',
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscurePassword,
                  suffixIcon: _obscurePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  onSuffixIconTap: () {
                    setState(() => _obscurePassword = !_obscurePassword);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 71),

                // ── Login Button ──
                LoginButton(
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),

                const SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Color(0xFF888888), fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRouts.registerScreen,
                        );
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Color(0xFF5C35E8),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
