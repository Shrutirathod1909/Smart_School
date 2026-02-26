import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // For email/phone links

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  // Example function to open email
  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'support@example.com',
      query: 'subject=Help%20Request',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      debugPrint('Could not launch $emailUri');
    }
  }

  // Example function to call a phone number
  void _launchPhone() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '+1234567890');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      debugPrint('Could not launch $phoneUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    // 🎨 Color Palette
    const Color primaryDark = Color(0xFF353535);
    const Color primaryBlue = Color(0xFF1976D2);
    const Color cardGrey = Color(0xFFF5F5F5);
    const Color textBlack87 = Colors.black87;
    const Color textBlack54 = Colors.black54;
    const Color white = Colors.white;

    return Scaffold(
      backgroundColor: cardGrey,
      appBar: AppBar(
        title: const Text(
          'Help & Support',
          style: TextStyle(color: white),
        ),
        backgroundColor: primaryDark,
        elevation: 0,
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
            const SizedBox(height: 20),

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
              elevation: 2,
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
            const SizedBox(height: 20),

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
            Card(
              color: white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: ExpansionTile(
                iconColor: primaryBlue,
                collapsedIconColor: primaryBlue,
                title: const Text(
                  'How do I reset my password?',
                  style: TextStyle(color: textBlack87),
                ),
                children: const [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Go to the login page, click on "Forgot Password", and follow the instructions.',
                      style: TextStyle(color: textBlack54),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Card(
              color: white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: ExpansionTile(
                iconColor: primaryBlue,
                collapsedIconColor: primaryBlue,
                title: const Text(
                  'How can I contact support?',
                  style: TextStyle(color: textBlack87),
                ),
                children: const [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'You can contact us via email or phone using the contact section above.',
                      style: TextStyle(color: textBlack54),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Card(
              color: white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: ExpansionTile(
                iconColor: primaryBlue,
                collapsedIconColor: primaryBlue,
                title: const Text(
                  'Where can I find the user manual?',
                  style: TextStyle(color: textBlack87),
                ),
                children: const [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'The user manual can be found in the "Resources" section of the app.',
                      style: TextStyle(color: textBlack54),
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
}