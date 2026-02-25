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

  @override
  Widget build(BuildContext context) {
    return PerfectBackground(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.25),

              /// ===== SMART SCHOOL LOGO BOX =====
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("assets/icons/orbit_logo.jpeg", height: 40),
                    const SizedBox(width: 8),
                    const Text(
                      "SMART SCHOOL",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              /// USERNAME
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: _textField(icon: Icons.person_outline, hint: "Username"),
              ),

              const SizedBox(height: 20),

              /// PASSWORD
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: _textField(
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
                        _showChildListPopup(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 35,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xffFF7A18), Color(0xffFF9A44)],
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
                          colors: [Color(0xffF6A623), Color(0xffF57C00)],
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
    );
  }

  /// ================= CHILD LIST POPUP =================
  void _showChildListPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Child List",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              /// CHILD 1
              _childTile(
                image: "assets/icons/student.webp",
                name: "Edward Thomas",
                className: "Class 5 - A",
              ),

              const SizedBox(height: 20),

              /// CHILD 2
              _childTile(
                image: "assets/icons/student.webp",
                name: "Ashwani Kumar",
                className: "Class 1 - A",
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _childTile({
    required String image,
    required String name,
    required String className,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(image),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                className,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _textField({
    required IconData icon,
    required String hint,
    bool obscure = false,
    bool isPassword = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          icon: Icon(icon),
          hintText: hint,
          border: InputBorder.none,
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
      ),
    );
  }
}