import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school360/core/constant/app_route.constant.dart';
import 'package:school360/core/theme/color.theme.dart';
import 'package:school360/shared/app_button.shared.dart';
import 'package:school360/shared/app_checkbox.shared.dart';
import 'package:school360/shared/app_logo.shared.dart';
import 'package:school360/shared/app_textfiled.shared.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _isChecked = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    if (!_loginFormKey.currentState!.validate()) {
      return;
    }

    final email = emailController.text.trim();
    final password = passwordController.text;

    debugPrint('Email: $email');
    debugPrint('Password: $password');

    // context.push(AppRoutes.student);
    context.go(AppRoutes.parent);

    // Call your login API here.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: Form(
            key: _loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                School360Logo(),
                const SizedBox(height: 8),
                Text(
                  'Sign in to your Account',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Login to Dashboard',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                const SizedBox(height: 32),

                AppTextFormField(
                  controller: emailController,
                  hintText: 'Enter your email ',
                  labelText: 'Email',
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }

                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                AppTextFormField(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  prefixIcon: Icons.lock,
                  obscureText: _obscurePassword,
                  textInputAction: TextInputAction.done,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.student,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }

                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppCheckbox(
                      value: _isChecked,
                      color: AppColors.textPrimary,
                      activeColor: AppColors.textPrimary,

                      onChanged: (value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        // Forgot password
                      },
                      child: const Text('Forgot Password?'),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                AppElevatedButton(
                  text: Text(
                    "Login",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: _login,
                  backgroundColor: AppColors.student,
                  foregroundColor: AppColors.background,
                ),

                SizedBox(height: 20),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(color: AppColors.textPrimary),
                    children: [
                      const TextSpan(
                        text: "Accounts are created by the school.",
                      ),
                      TextSpan(
                        text: "Need help? ",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 13,
                        ),
                      ),
                      TextSpan(
                        text: "Contact school office",
                        style: TextStyle(
                          color: AppColors.studentDark,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
