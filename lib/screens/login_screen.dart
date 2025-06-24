import 'package:flutter/material.dart';
import './location_permission_screen.dart';
import '../utils/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Masuk Reetem')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Kata Sandi',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value!;
                    });
                  },
                ),
                const Text('Ingat saya'),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // Navigate to forgot password screen
                  },
                  child: const Text(
                    'Lupa kata sandi?',
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LocationPermissionScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'MASUK',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Center(child: Text('atau masuk dengan')),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset('lib/assets/images/google.png', width: 40),
                  onPressed: () {},
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: Image.asset(
                    'lib/assets/images/facebook.png',
                    width: 40,
                  ),
                  onPressed: () {},
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: Image.asset('lib/assets/images/apple.png', width: 40),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 32),
            Center(
              child: TextButton(
                onPressed: () {
                  // Navigate to sign up screen
                },
                child: RichText(
                  text: const TextSpan(
                    text: 'Belum punya akun? ',
                    style: TextStyle(color: AppColors.textLight),
                    children: [
                      TextSpan(
                        text: 'Daftar sekarang',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
