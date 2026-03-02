import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  // Email launcher
  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'support@example.com',
      query: 'subject=Help Request',
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      debugPrint('Could not launch $emailUri');
    }
  }

  // Phone launcher
  void _launchPhone() async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: '+1234567890',
    );

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      debugPrint('Could not launch $phoneUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF1976D2);
    const Color textBlack87 = Colors.black87;
    const Color textBlack54 = Colors.black54;
    const Color white = Colors.white;

    return Scaffold(
      backgroundColor: Colors.white, // ✅ White background

      appBar: AppBar(
        backgroundColor: primaryBlue, // ✅ Blue AppBar
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Help & Support',
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Text(
              'Need Assistance?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: textBlack87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'We are here to help! Please check the FAQ below or contact us directly via email or phone.',
              style: TextStyle(fontSize: 16, color: textBlack54),
            ),
            const SizedBox(height: 25),

            // Contact Section
            const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textBlack87,
              ),
            ),
            const SizedBox(height: 10),

            Card(
              color: white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.email, color: primaryBlue),
                    title: const Text('support@example.com'),
                    onTap: _launchEmail,
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.phone, color: primaryBlue),
                    title: const Text('+1 234 567 890'),
                    onTap: _launchPhone,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // FAQ Section
            const Text(
              'Frequently Asked Questions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textBlack87,
              ),
            ),
            const SizedBox(height: 10),

            // FAQ 1
            _buildFaqCard(
              question: 'How do I reset my password?',
              answer:
                  'Go to the login page, click on "Forgot Password", and follow the instructions.',
            ),

            const SizedBox(height: 10),

            // FAQ 2
            _buildFaqCard(
              question: 'How can I contact support?',
              answer:
                  'You can contact us via email or phone using the contact section above.',
            ),

            const SizedBox(height: 10),

            // FAQ 3
            _buildFaqCard(
              question: 'Where can I find the user manual?',
              answer:
                  'The user manual can be found in the "Resources" section of the app.',
            ),
          ],
        ),
      ),
    );
  }

  // Reusable FAQ Card Widget
  Widget _buildFaqCard({
    required String question,
    required String answer,
  }) {
    const Color primaryBlue = Color(0xFF1976D2);
    const Color textBlack87 = Colors.black87;
    const Color textBlack54 = Colors.black54;

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        iconColor: primaryBlue,
        collapsedIconColor: primaryBlue,
        title: Text(
          question,
          style: const TextStyle(color: textBlack87),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              answer,
              style: const TextStyle(color: textBlack54),
            ),
          ),
        ],
      ),
    );
  }
}