import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tanta_club/generated/l10n.dart';
import 'package:tanta_club/presentation/events.dart';
import 'package:tanta_club/presentation/home/home.dart';
import 'package:tanta_club/presentation/member_profile.dart';
import 'package:tanta_club/presentation/news.dart';
import 'package:tanta_club/presentation/payment.dart';
import 'package:tanta_club/style/colors.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';

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
              destinations: [
                NavigationDestination(
                    icon: const Icon(Iconsax.home), label: S.of(context).home),
                NavigationDestination(
                    icon: const Icon(Iconsax.calendar),
                    label: S.of(context).events),
                NavigationDestination(
                    icon: const Icon(Icons.newspaper),
                    label: S.of(context).news),
                // NavigationDestination(
                //     icon: const Icon(Iconsax.money_2),
                //     label: S.of(context).payment),
                NavigationDestination(
                    icon: const Icon(Iconsax.user), label: S.of(context).you),
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
    //  const PaymentScreen(),
    const MemberProfileScreen()
  ];
}
