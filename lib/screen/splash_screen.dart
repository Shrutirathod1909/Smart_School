import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:market/screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _waveController;
  late AnimationController _glowController;
  late AnimationController _particleController;

  @override
  void initState() {
    super.initState();

    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();

    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SmartSchoolLogin()),
      );
    });
  }

  @override
  void dispose() {
    _waveController.dispose();
    _glowController.dispose();
    _particleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// 🌤 Soft School Blue Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF4A90E2),
                  Color(0xFF6FB1FC),
                  Color(0xFFA7D3FF),
                ],
              ),
            ),
          ),

          /// 🌌 Subtle Floating Particles
          AnimatedBuilder(
            animation: _particleController,
            builder: (_, __) {
              return CustomPaint(
                size: Size.infinite,
                painter: ParticlePainter(_particleController.value),
              );
            },
          ),

          /// 🌊 Animated Bottom Wave
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedBuilder(
              animation: _waveController,
              builder: (_, __) {
                return ClipPath(
                  clipper: AnimatedWaveClipper(_waveController.value),
                  child: Container(height: 220, color: const Color(0xFF3C8DD9)),
                );
              },
            ),
          ),

          /// 💫 Glowing Logo + Text
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _glowController,
                  builder: (_, __) {
                    double glow = 8 + (_glowController.value * 12);

                    return Container(
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFB3E5FF).withOpacity(0.6),
                            blurRadius: glow,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "assets/icons/orbit_logo.png",
                        width: 95,
                        height: 95,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//// 🌊 Animated Wave Clipper
class AnimatedWaveClipper extends CustomClipper<Path> {
  final double waveValue;
  AnimatedWaveClipper(this.waveValue);

  @override
  Path getClip(Size size) {
    Path path = Path();

    double waveHeight = 15 * sin(waveValue * 2 * pi);

    path.lineTo(0, size.height - 80 + waveHeight);

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height + waveHeight,
      size.width * 0.5,
      size.height - 60 + waveHeight,
    );

    path.quadraticBezierTo(
      size.width * 0.75,
      size.height - 110 + waveHeight,
      size.width,
      size.height - 80 + waveHeight,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

//// 🌌 Particle Painter
class ParticlePainter extends CustomPainter {
  final double progress;
  ParticlePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.15);

    final random = Random(1);

    for (int i = 0; i < 35; i++) {
      double x = random.nextDouble() * size.width;
      double y =
          (random.nextDouble() * size.height + progress * size.height) %
          size.height;

      canvas.drawCircle(Offset(x, y), 2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
