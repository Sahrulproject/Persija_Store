import 'package:flutter/material.dart';
import 'package:flutter_toko_sederhana/screens/home.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Bottom extends StatelessWidget {
  Bottom({super.key});

  // inject controller
  final NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final List<Widget> screens = [
    const Home(),
    Container(color: Colors.teal),
    Container(color: Colors.amberAccent),
    Container(color: Colors.purple),
    Container(color: Colors.deepOrange),
  ];
}
