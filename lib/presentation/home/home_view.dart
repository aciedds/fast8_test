import 'dart:math';

import 'package:fast8_test/presentation/home/home_controller.dart';
import 'package:fast8_test/presentation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              return Text(
                controller.greetingMessage.value,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              );
            }),
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
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              );
            }),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: controller.logout,
          ),
          Obx(() {
            return controller.userData.value.maybeWhen(
              orElse: () => IconButton(
                icon: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                onPressed: () => Get.offNamed(Routes.LOGIN),
              ),
              loading: () => CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                child: Shimmer.fromColors(
                  baseColor: Colors.black12,
                  highlightColor: Colors.white12,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              success: (data) => IconButton(
                icon: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text(
                    getInitials(data.name),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                onPressed: () => Get.offNamed(Routes.PROFILE),
              ),
            );
          }),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGridSection(
                title: 'Produk Keuangan',
                crossAxisCount: 4,
                data: [
                  GridMenu(
                    title: 'Pengeluaran',
                    icon: Icons.arrow_downward,
                    onTap: () {},
                  ),
                  GridMenu(
                    title: 'Pemasukan',
                    icon: Icons.arrow_upward,
                    onTap: () {},
                  ),
                  GridMenu(
                    title: 'Kategori',
                    icon: Icons.category,
                    onTap: () {},
                  ),
                  GridMenu(
                    title: 'Voucher',
                    icon: Icons.card_giftcard,
                    onTap: () {},
                  ),
                  GridMenu(
                    title: 'Lainnya',
                    icon: Icons.more_horiz,
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildGridSection(
                title: 'Kategori Pilihan',
                crossAxisCount: 4,
                data: [
                  GridMenu(
                    title: 'Hobby',
                    icon: Icons.palette, // Example icon
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Hobby tapped')),
                      );
                    },
                  ),
                  GridMenu(
                    title: 'Merchandise',
                    icon: Icons.shopping_cart, // Example icon
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Merchandise tapped')),
                      );
                    },
                  ),
                  GridMenu(
                    title: 'Lifestyle',
                    icon: Icons.style, // Example icon
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Lifestyle tapped')),
                      );
                    },
                  ),
                  GridMenu(
                    title: 'Spiritual Counseling',
                    icon: Icons.self_improvement, // Example icon
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Spiritual Counseling tapped')),
                      );
                    },
                  ),
                  GridMenu(
                    title: 'Self Development',
                    icon: Icons.emoji_people, // Example icon
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Self Development tapped')),
                      );
                    },
                  ),
                  GridMenu(
                    title: 'Money Management',
                    icon: Icons.attach_money, // Example icon
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Money Management tapped')),
                      );
                    },
                  ),
                  GridMenu(
                    title: 'Medical Counseling',
                    icon: Icons.local_hospital, // Example icon
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Medical tapped')),
                      );
                    },
                  ),
                  GridMenu(
                    title: 'Lainnya',
                    icon: Icons.more_horiz,
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildVoucherSection(),
            ],
          ),
        ),
      ),
    );
  }

  String getInitials(String name) {
    return name.split(' ').map((word) => word[0]).join();
  }

  Color getRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255, // opacity
      random.nextInt(256), // red
      random.nextInt(256), // green
      random.nextInt(256), // blue
    );
  }

  Widget _buildGridSection({
    required String title,
    required List<GridMenu> data,
    required int crossAxisCount,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    data[index].icon,
                    size: 40,
                    color: getRandomColor(),
                  ),
                  Text(
                    data[index].title,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildVoucherSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Explore Wellness',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Obx(
              () => DropdownButton<String>(
                value: controller.selectedVoucherOption.value,
                icon: const Icon(
                  Icons.arrow_downward,
                  color: Colors.deepOrangeAccent,
                ),
                items: <String>['Terpopuler', 'Baru', 'Diskon']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  controller.selectedVoucherOption.value = newValue!;
                },
              ),
            ),
          ],
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemCount: 4,
          // Adjust item count based on your needs
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.network(
                          'https://api.duniagames.co.id/api/content/upload/file/6547944201699346670.jpg',
                          width: double.infinity,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Voucher ${index + 1}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Discount for ${index + 1}: 50%",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class GridMenu {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  GridMenu({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
