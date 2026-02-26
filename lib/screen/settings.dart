import 'package:flutter/material.dart';
import 'package:market/screen/help&support.dart';

/// 🎨 ORBIT COLORS
class AppColors {
  static const Color orbitDarkBlue = Color(0xff0D47A1);
  static const Color orbitBlue = Color(0xff1565C0);
  static const Color orbitLightBlue = Color(0xff42A5F5);
  static const Color orbitSky = Color(0xffE3F2FD);
}

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
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: iconColor.withOpacity(0.2),
          child: Icon(icon, color: iconColor, size: 24),
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
      backgroundColor: AppColors.orbitSky,
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.orbitDarkBlue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            /// Notifications Toggle
            buildSettingTile(
              icon: Icons.notifications,
              iconColor: AppColors.orbitBlue,
              title: "Notifications",
              subtitle: "Enable or disable notifications",
              trailingWidget: Switch(
                value: notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    notificationsEnabled = value;
                  });
                },
                activeColor: AppColors.orbitBlue,
              ),
            ),

            /// Help & Support
            buildSettingTile(
              icon: Icons.help_outline,
              iconColor: AppColors.orbitLightBlue,
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