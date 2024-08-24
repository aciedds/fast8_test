import 'package:fast8_test/presentation/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back navigation
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20), // Spacer
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey[300],
            child: Text(
              "A", // First letter of the name
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Achmad Irsyad',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            'Masuk dengan Google',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 20), // Spacer

          Expanded(
            child: ListView(
              children: [
                ProfileMenuItem(
                  icon: Icons.person,
                  title: 'Informasi Pribadi',
                  onTap: () {
                    // Navigate to Personal Information
                  },
                ),
                ProfileMenuItem(
                  icon: Icons.article,
                  title: 'Syarat & Ketentuan',
                  onTap: () {
                    // Navigate to Terms and Conditions
                  },
                ),
                ProfileMenuItem(
                  icon: Icons.help_outline,
                  title: 'Bantuan',
                  onTap: () {
                    // Navigate to Help
                  },
                ),
                ProfileMenuItem(
                  icon: Icons.privacy_tip_outlined,
                  title: 'Kebijakan Privasi',
                  onTap: () {
                    // Navigate to Privacy Policy
                  },
                ),
                ProfileMenuItem(
                  icon: Icons.logout,
                  title: 'Log Out',
                  onTap: () {
                    // Handle log out
                  },
                ),
                ProfileMenuItem(
                  icon: Icons.delete_outline,
                  title: 'Hapus Akun',
                  onTap: () {
                    // Handle account deletion
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              'payuung\nVersi: 1.8.0',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
