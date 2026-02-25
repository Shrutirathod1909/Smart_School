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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support',style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 53, 53, 53),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Need Assistance?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'We are here to help! Please check the FAQ below or contact us directly via email or phone.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Contact Section
            const Text(
              'Contact Us',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.blueAccent),
              title: const Text('support@example.com'),
              onTap: _launchEmail,
            ),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.blueAccent),
              title: const Text('+1 234 567 890'),
              onTap: _launchPhone,
            ),
            const SizedBox(height: 20),

            // FAQ Section
            const Text(
              'Frequently Asked Questions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ExpansionTile(
              title: const Text('How do I reset my password?'),
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'Go to the login page, click on "Forgot Password", and follow the instructions.'),
                ),
              ],
            ),
            ExpansionTile(
              title: const Text('How can I contact support?'),
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'You can contact us via email or phone using the contact section above.'),
                ),
              ],
            ),
            ExpansionTile(
              title: const Text('Where can I find the user manual?'),
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'The user manual can be found in the "Resources" section of the app.'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}