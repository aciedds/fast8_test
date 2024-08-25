import 'package:fast8_test/presentation/profile/profile_controller.dart';
import 'package:fast8_test/presentation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  String getInitials(String name) {
    return name.split(' ').map((word) => word[0]).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.offNamed(Routes.HOME),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20), // Spacer
          Obx(() {
            return controller.userData.value.maybeWhen(
              orElse: () => const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 50,
                ),
              ),
              loading: () => CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                child: Shimmer.fromColors(
                  baseColor: Colors.black12,
                  highlightColor: Colors.white12,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              success: (data) => CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 50,
                child: Text(
                  getInitials(data.name),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          }),
          const SizedBox(height: 10),
          Obx(() {
            return controller.userData.value.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              loading: () => SizedBox(
                width: 50,
                height: 12,
                child: Shimmer.fromColors(
                  baseColor: Colors.black12,
                  highlightColor: Colors.white12,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
              ),
              success: (data) => Text(
                data.name,
                style: const TextStyle(fontSize: 20),
              ),
            );
          }),
          const SizedBox(height: 20), // Spacer
          Expanded(
            child: ListView(
              children: [
                ProfileMenuItem(
                  icon: Icons.person,
                  title: 'Informasi Pribadi',
                  onTap: () => Get.offNamed(Routes.PERSONAL_INFORMATION),
                ),
                ProfileMenuItem(
                  icon: Icons.article,
                  title: 'Syarat & Ketentuan',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.help_outline,
                  title: 'Bantuan',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.privacy_tip_outlined,
                  title: 'Kebijakan Privasi',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.logout,
                  title: 'Log Out',
                  onTap: controller.logout,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'Fast8 Test\nVersi: 0.0.1',
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
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
