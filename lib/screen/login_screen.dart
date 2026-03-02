import 'package:flutter/material.dart';
import 'package:market/screen/forgot_password.dart';
import 'package:market/screen/home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SmartSchoolLogin extends StatefulWidget {
  const SmartSchoolLogin({super.key});

  @override
  State<SmartSchoolLogin> createState() => _SmartSchoolLoginState();
}

class _SmartSchoolLoginState extends State<SmartSchoolLogin> {
  bool isPasswordHidden = true;
  bool isLoading = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginUser() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please enter all fields")));
      return;
    }

    setState(() => isLoading = true);

    final url = Uri.parse("http://192.168.1.39/orbit/login.php");

    try {
      final response = await http.post(
        url,
        body: {
          "email": emailController.text.trim(),
          "password": passwordController.text.trim(),
        },
      );

      final data = jsonDecode(response.body);

      if (data["status"] == "success") {
        String name = data["name"] ?? "";
String userId = data["user_id"].toString();
String classId = data["class_id"] ?? "";
String sectionId = data["section_id"] ?? "";
String role = data["role"] ?? "";
String profileImage = data["profile_image"] ?? "";

String standard = data["standard"] ?? "";
String section = data["section"] ?? "";

// ✅ Combine here
String studentClass =
    (standard.isNotEmpty && section.isNotEmpty)
        ? "$standard - $section"
        : "";

        Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (_) => HomeScreen(
      name: name,
      studentClass: studentClass,
      userId: userId,
      classId: classId,
      sectionId: sectionId,
      role: role,
      profile_image: profileImage,
      standard: standard,
      sectionName: section,
    ),
  ),
);
      } else if (data["status"] == "invalid") {
        showSnack("Invalid Email or Password");
      } else {
        showSnack("Login Failed");
      }
    } catch (e) {
      showSnack("Server Error");
    }

    setState(() => isLoading = false);
  }

  void showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      body: Stack(
        children: [
          /// TOP BLUE HEADER
          Container(
            height: 260,
            decoration: const BoxDecoration(
              color: Color(0xff2563EB),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),

          /// LOGIN CARD
          Center(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 25,
                      spreadRadius: 2,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// LOGO
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: const Color(0xffEFF6FF),
                      child: Image.asset("assets/icons/orbit_logo.png", height: 45),
                    ),

                    const SizedBox(height: 15),
                    const Text("Welcome Back", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    const Text("Login to continue", style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 30),

                    /// EMAIL FIELD
                    _textField(
                      controller: emailController,
                      icon: Icons.email_outlined,
                      hint: "Email",
                    ),
                    const SizedBox(height: 20),

                    /// PASSWORD FIELD
                    _textField(
                      controller: passwordController,
                      icon: Icons.lock_outline,
                      hint: "Password",
                      obscure: isPasswordHidden,
                      isPassword: true,
                    ),

                    const SizedBox(height: 15),

                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ForgotPasswordScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Color(0xff2563EB),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: const Color(0xff2563EB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                        ),
                        onPressed: isLoading ? null : loginUser,
                        child: isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text(
                                "Login",
                                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

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
        prefixIcon: Icon(icon, color: Colors.grey.shade700),
        hintText: hint,
        filled: true,
        fillColor: const Color(0xffF1F5F9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xff2563EB), width: 1.5),
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
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