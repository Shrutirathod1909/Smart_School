import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FeesScreen(),
    );
  }
}

class FeesScreen extends StatefulWidget {
  const FeesScreen({super.key});

  @override
  State<FeesScreen> createState() => _FeesScreenState();
}

class _FeesScreenState extends State<FeesScreen> {
  bool isSelected = true; // Select All checkbox
  int selectedOption = 0; // 0 = Fees, 1 = Processing, 2 = Offline Payment

  // 🎨 Colors
  final Color primaryRed = const Color(0xFFD32F2F);
  final Color primaryOrange = const Color(0xFFFB8C00);
  final Color primaryGreen = const Color(0xFF43A047);
  final Color bgGrey = const Color(0xFFF5F5F5);
  final Color cardGrey = const Color(0xFFF0F0F0);
  final Color headerGreen = const Color(0xFFE6F4EA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade700,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Back button functional
          },
        ),
        title: const Text("Fees", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Fees Management",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Manage your school fees and payments",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Icon(Icons.account_balance_wallet, size: 50, color: Colors.orange),
              ],
            ),
            const SizedBox(height: 20),

            // Buttons Row
            Row(
              children: [
                _selectableButton("Fees", primaryRed, 0),
                const SizedBox(width: 10),
                _selectableButton("Processing F...", primaryOrange, 1),
                const SizedBox(width: 10),
                _selectableButton("Offline Paym...", primaryGreen, 2),
              ],
            ),
            const SizedBox(height: 20),

            // Grand Total Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardGrey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Grand Total",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _amountColumn("Amount", "\$ 8750.00"),
                      _amountColumn("Discount", "\$ 210.00"),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Fine",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, color: Colors.black)),
                          SizedBox(height: 5),
                          Text("\$ 450.00", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("+\$ 45425.00",
                              style: TextStyle(
                                  color: Colors.red, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _amountColumn("Paid", "\$ 5320.00"),
                      _amountColumn("Balance", "\$ 3220.00"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Select All
            GestureDetector(
              onTap: () {
                setState(() {
                  isSelected = !isSelected; // toggle
                });
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: isSelected,
                      activeColor: Colors.black,
                      onChanged: (value) {
                        setState(() {
                          isSelected = value!;
                        });
                      },
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Select All",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? primaryGreen : Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Class 1 Lump Sum Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  // Top Green Header
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: headerGreen,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Class 1 Lump Sum",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                          decoration: BoxDecoration(
                            color: primaryGreen,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "Paid",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  // Details
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: const [
                        _detailRow("Fees Code", "lumpsum-fees"),
                        _detailRow("Due Date", "15/04/2025"),
                        _detailRow("Amount", "\$ 150.00"),
                        _detailRow("Fine", "\$ 0.00"),
                        _detailRow("Discount", "\$ 10.00"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Responsive selectable button
  Widget _selectableButton(String text, Color color, int index) {
    bool isSelectedOption = selectedOption == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedOption = index;
          });
        },
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: isSelectedOption ? color : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: color),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelectedOption ? Colors.white : color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _amountColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
        const SizedBox(height: 5),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _detailRow extends StatelessWidget {
  final String title;
  final String value;

  const _detailRow(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
          Text(value),
        ],
      ),
    );
  }
}