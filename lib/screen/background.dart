import 'dart:ui';
import 'package:flutter/material.dart';

class PerfectBackground extends StatelessWidget {
  final Widget child;
  const PerfectBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F8FF), // very soft background
      body: Stack(
        children: [

          /// ===== TOP CENTER CIRCLES (Soft Pastel) =====
          Positioned(
            top: 50,
            left: size.width / 2 - 80,
            child: _circle(160, const Color(0xFFD9ECFF)),
          ),
          Positioned(
            top: 70,
            left: size.width / 2 - 65,
            child: _circle(130, const Color(0xFFCBE4FF)),
          ),
          Positioned(
            top: 90,
            left: size.width / 2 - 50,
            child: _circle(100, const Color(0xFFBBD9FF)),
          ),

          /// ===== LEFT HALF =====
          Positioned(
            left: -170,
            top: size.height * 0.40,
            child: _circle(320, const Color(0xFFD9ECFF)),
          ),
          Positioned(
            left: -150,
            top: size.height * 0.43,
            child: _circle(280, const Color(0xFFCBE4FF)),
          ),
          Positioned(
            left: -130,
            top: size.height * 0.46,
            child: _circle(240, const Color(0xFFBBD9FF)),
          ),

          /// ===== RIGHT HALF =====
          Positioned(
            right: -170,
            top: size.height * 0.40,
            child: _circle(320, const Color(0xFFD9ECFF)),
          ),
          Positioned(
            right: -150,
            top: size.height * 0.43,
            child: _circle(280, const Color(0xFFCBE4FF)),
          ),
          Positioned(
            right: -130,
            top: size.height * 0.46,
            child: _circle(240, const Color(0xFFBBD9FF)),
          ),

          /// ===== BOTTOM RIPPLE =====
          Positioned(
            bottom: -60,
            left: size.width / 2 - 90,
            child: _circle(180, const Color(0xFFD9ECFF)),
          ),
          Positioned(
            bottom: -45,
            left: size.width / 2 - 75,
            child: _circle(150, const Color(0xFFCBE4FF)),
          ),
          Positioned(
            bottom: -30,
            left: size.width / 2 - 60,
            child: _circle(120, const Color(0xFFBBD9FF)),
          ),

          /// ===== BOTTOM IMAGE =====
          Positioned(
            bottom: 25,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                "assets/icons/1.png",
                height: 180,
              ),
            ),
          ),

          /// ===== SOFT BLUR PROFILE ICON =====
          Positioned(
            top: 105,
            left: size.width / 2 - 30,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.40),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.7),
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    Icons.person,
                    size: 26,
                    color: Colors.blue.shade600, // softer blue
                  ),
                ),
              ),
            ),
          ),

          /// ===== CHILD CONTENT =====
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  Widget _circle(double size, Color color) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}