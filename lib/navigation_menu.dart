import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tanta_club/presentation/events.dart';
import 'package:tanta_club/presentation/home.dart';
import 'package:tanta_club/presentation/member_profile.dart';
import 'package:tanta_club/presentation/news.dart';
import 'package:tanta_club/presentation/payment.dart';
import 'package:tanta_club/style/colors.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(() => NavigationBar(
              height: 80,
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) =>
                  controller.selectedIndex.value = index,
              indicatorColor: TColors.primary,
              destinations: const [
                NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
                NavigationDestination(
                    icon: Icon(Iconsax.calendar), label: "Events"),
                NavigationDestination(
                    icon: Icon(Icons.newspaper), label: "News"),
                NavigationDestination(
                    icon: Icon(Iconsax.money_2), label: "Payment"),
                NavigationDestination(icon: Icon(Iconsax.user), label: "You"),
              ])),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const EventsScreen(),
    const NewsScreen(),
    const PaymentScreen(),
    const MemberProfileScreen()
  ];
}
