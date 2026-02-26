import 'package:flutter/material.dart';
import 'package:market/screen/home_screen.dart';
import 'background.dart';

class SmartSchoolLogin extends StatefulWidget {
  const SmartSchoolLogin({super.key});

  @override
  State<SmartSchoolLogin> createState() => _SmartSchoolLoginState();
}

class _SmartSchoolLoginState extends State<SmartSchoolLogin> {
  bool isPasswordHidden = true;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PerfectBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.25),

                /// LOGO
                Image.asset(
                  "assets/icons/orbit_logo.png",
                  height: 60,
                ),

                const SizedBox(height: 40),

                /// USERNAME
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: _textField(
                    controller: usernameController,
                    icon: Icons.person_outline,
                    hint: "Username",
                  ),
                ),

                const SizedBox(height: 20),

                /// PASSWORD
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: _textField(
                    controller: passwordController,
                    icon: Icons.lock_outline,
                    hint: "Password",
                    obscure: isPasswordHidden,
                    isPassword: true,
                  ),
                ),

                const SizedBox(height: 25),

                /// FORGOT + LOGIN
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Forgot Password?",
                        style: TextStyle(fontSize: 15),
                      ),

                      /// LOGIN BUTTON
                      GestureDetector(
                        onTap: () {
                          if (usernameController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please enter all fields"),
                              ),
                            );
                            return;
                          }

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomeScreen()),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 35,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xffFF7A18),
                                Color(0xffFF9A44)
                              ],
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Row(
                            children: [
                              Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.24),

                /// FOOTER
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Privacy Policy",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xffF6A623),
                              Color(0xffF57C00)
                            ],
                          ),
                        ),
                        child: const Icon(
                          Icons.language,
                          color: Colors.white,
                          size: 28,
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

  /// TEXT FIELD WIDGET
  Widget _textField({
    required TextEditingController controller,
    required IconData icon,
    required String hint,
    bool obscure = false,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscure
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    isPasswordHidden = !isPasswordHidden;
                  });
                },
              )
            : null,
      ),
    );
  }
}