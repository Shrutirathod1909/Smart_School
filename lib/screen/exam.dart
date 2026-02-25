import 'package:flutter/material.dart';
import 'mock_test_screen.dart';

class ClassSelectionScreen extends StatelessWidget {
  const ClassSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    int crossAxisCount = width < 600 ? 2 : 4;

    final List<List<Color>> gradientColors = [
      [Color(0xff4e73df), Color(0xff224abe)],
      [Color(0xff1cc88a), Color(0xff13855c)],
      [Color(0xff36b9cc), Color(0xff258391)],
      [Color(0xfff6c23e), Color(0xffdda20a)],
      [Color(0xffe74a3b), Color(0xffbe2617)],
      [Color(0xff6f42c1), Color(0xff4e2a84)],
      [Color(0xfffd7e14), Color(0xffc05600)],
      [Color(0xff20c997), Color(0xff0f9d7a)],
      [Color(0xff17a2b8), Color(0xff117a8b)],
      [Color(0xff343a40), Color(0xff1d2124)],
    ];

    return Scaffold(
      backgroundColor: const Color(0xfff1f3f6),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 48, 47, 47),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Select Class",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            int classNumber = index + 1;
            return InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MockTestScreen(classNumber: classNumber),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradientColors[index],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.menu_book_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Class $classNumber",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}