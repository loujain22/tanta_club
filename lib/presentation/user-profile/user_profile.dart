import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tanta_club/presentation/installments/installments.dart';
import 'package:tanta_club/presentation/user-profile/qr_code_dialog.dart';
import 'package:tanta_club/presentation/user-profile/user_profile_header.dart';
import 'package:tanta_club/presentation/user-profile/user_profile_image.dart';
import 'package:tanta_club/presentation/user-profile/user_profile_items.dart';
import 'package:tanta_club/presentation/change_password.dart';
import 'package:tanta_club/presentation/Invoices/invoices.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:provider/provider.dart';
import 'package:tanta_club/providers/user_provider.dart';
import 'package:tanta_club/providers/auth_provider.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});
  // final Function(Locale) onLocaleChange;

  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context);
    final isEnglish = currentLocale.languageCode == 'en';

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              child: isArabic()
                  ? Image.asset("assets/images/rightAppBarBg.png")
                  : Image.asset("assets/images/leftAppBarBg.png")),

          // -- Page Header
          const UserProfileHeader(),

          const UserProfileImage(),

          Padding(
            padding: const EdgeInsets.only(top: 350, right: 30, left: 30),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -- Member Id
                  UserProfileItem(
                      title: AppLocalizations.of(context)!.memberId,
                      itemIcon: "assets/icons/member-id.png"),
                  Padding(
                    padding: EdgeInsets.only(
                        right: isArabic() ? 45 : 0, left: isArabic() ? 0 : 45),
                    child: Consumer<UserProvider>(
                      builder: (context, userProvider, _) => Text(
                        userProvider.user?.membershipId ?? "",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 190, 190, 190),
                  ),

                  // -- Number of Affiliate Members
                  UserProfileItem(
                      title: AppLocalizations.of(context)!.affiliateMembers,
                      itemIcon: "assets/icons/affiliated-members.png"),
                  Padding(
                    padding: EdgeInsets.only(
                        right: isArabic() ? 45 : 0, left: isArabic() ? 0 : 45),
                    child: Consumer<UserProvider>(
                      builder: (context, userProvider, _) => Text(
                        userProvider.user?.numberOfKins.toString() ?? "0",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 190, 190, 190),
                  ),

                  // -- Invoices
                  InkWell(
                    onTap: () => Get.to(() => const InvoicesScreen()),
                    child: UserProfileItem(
                        title: AppLocalizations.of(context)!.invoices,
                        itemIcon: "assets/icons/invoices.png"),
                  ),
                  const SizedBox(height: 5),
                  const Divider(
                    color: Color.fromARGB(255, 190, 190, 190),
                  ),

                  // -- Installments
                  InkWell(
                    onTap: () => Get.to(() => const InstallmentsScreen()),
                    child: UserProfileItem(
                        title: AppLocalizations.of(context)!.installments,
                        itemIcon: "assets/icons/installments.png"),
                  ),
                  const SizedBox(height: 5),
                  const Divider(
                    color: Color.fromARGB(255, 190, 190, 190),
                  ),

                  // -- Change Password
                  InkWell(
                    onTap: () => Get.to(() => const ChangePasswordScreen()),
                    child: UserProfileItem(
                        title: AppLocalizations.of(context)!.changePassword,
                        itemIcon: "assets/icons/change-password.png"),
                  ),
                  const SizedBox(height: 5),
                  const Divider(
                    color: Color.fromARGB(255, 190, 190, 190),
                  ),

                  // -- QR Code
                  UserProfileItem(
                    title: "QR Code",
                    itemIcon: "assets/icons/QR.png",
                    onTap: () {
                      final memberId =
                          context.read<UserProvider>().user?.membershipId;
                      if (memberId != null) {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              QRCodeDialog(memberId: memberId),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 5),
                  const Divider(
                    color: Color.fromARGB(255, 190, 190, 190),
                  ),

                  // -- Languages
                  InkWell(
                    onTap: () {
                      if (isEnglish) {
                        Get.updateLocale(const Locale('ar'));
                      } else {
                        Get.updateLocale(const Locale('en'));
                      }
                    },
                    child: UserProfileItem(
                        title: isEnglish
                            ? AppLocalizations.of(context)!.arabic
                            : AppLocalizations.of(context)!.english,
                        itemIcon: "assets/icons/languages.png"),
                  ),
                  const SizedBox(height: 5),
                  const Divider(
                    color: Color.fromARGB(255, 190, 190, 190),
                  ),

                  // -- Logout
                  GestureDetector(
                    onTap: () async {
                      final authProvider =
                          Provider.of<AuthProvider>(context, listen: false);
                      await authProvider.logout();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: isArabic() ? 0 : 10, right: isArabic() ? 5 : 0),
                      child: Row(
                        children: [
                          Image.asset("assets/icons/logout.png",
                              height: 20, width: 20),
                          const SizedBox(width: 20),
                          Text(AppLocalizations.of(context)!.logout,
                              style: const TextStyle(fontSize: 16))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
