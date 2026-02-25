import 'package:flutter/material.dart';
import 'package:market/screen/help&support.dart';

class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({super.key});

  @override
  State<AppSettingsScreen> createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
  bool notificationsEnabled = true;
 

  Widget buildSettingTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    Widget? trailingWidget,
    VoidCallback? onTap,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: iconColor.withOpacity(0.15),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.grey.shade600),
        ),
        trailing: trailingWidget ?? const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF383839),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            /// Notifications Toggle
            buildSettingTile(
              icon: Icons.notifications,
              iconColor: Colors.orange,
              title: "Notifications",
              subtitle: "Enable or disable notifications",
              trailingWidget: Switch(
                value: notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    notificationsEnabled = value;
                  });
                },
                activeColor: Colors.orange,
              ),
            ),

            
            buildSettingTile(
              icon: Icons.help_outline,
              iconColor: Colors.grey,
              title: "Help & Support",
              subtitle: "FAQs & contact us",
              onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const HelpSupportPage(),
      ),
    );
  },
            ),
          ],
        ),
      ),
    );
  }
}