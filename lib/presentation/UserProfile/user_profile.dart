import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanta_club/generated/l10n.dart';
import 'package:tanta_club/presentation/UserProfile/user_profile_header.dart';
import 'package:tanta_club/presentation/UserProfile/user_profile_image.dart';
import 'package:tanta_club/presentation/UserProfile/user_profile_items.dart';
import 'package:tanta_club/presentation/change_password.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});
  // final Function(Locale) onLocaleChange;

  @override
  Widget build(BuildContext context) {
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
                      title: isArabic() ? "رقم العضوية" : "Member Id",
                      itemIcon: "assets/icons/member-id.png"),
                  Padding(
                    padding: EdgeInsets.only(
                        right: isArabic() ? 45 : 0, left: isArabic() ? 0 : 45),
                    child: const Text(
                      "2024/10133",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 190, 190, 190),
                  ),

                  // -- Number of Affiliate Members
                  UserProfileItem(
                      title: isArabic()
                          ? "عدد الأعضاء التابعين"
                          : "Number of  affiliate members",
                      itemIcon: "assets/icons/affiliated-members.png"),
                  Padding(
                    padding: EdgeInsets.only(
                        right: isArabic() ? 45 : 0, left: isArabic() ? 0 : 45),
                    child: const Text(
                      "3",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 190, 190, 190),
                  ),

                  // -- Invoices
                  UserProfileItem(
                      title: isArabic() ? "الفواتير" : "Invoices",
                      itemIcon: "assets/icons/invoices.png"),
                  const SizedBox(height: 5),
                  const Divider(
                    color: Color.fromARGB(255, 190, 190, 190),
                  ),

                  // -- Installments
                  UserProfileItem(
                      title: isArabic() ? "الأقساط" : "Installments",
                      itemIcon: "assets/icons/installments.png"),
                  const SizedBox(height: 5),
                  const Divider(
                    color: Color.fromARGB(255, 190, 190, 190),
                  ),

                  // -- Change Password
                  InkWell(
                    onTap: () => Get.to(() => const ChangePasswordScreen()),
                    child: UserProfileItem(
                        title: isArabic()
                            ? "تغيير كلمة المرور"
                            : "Change Password",
                        itemIcon: "assets/icons/change-password.png"),
                  ),
                  const SizedBox(height: 5),
                  const Divider(
                    color: Color.fromARGB(255, 190, 190, 190),
                  ),

                  // -- Barcode
                  const UserProfileItem(
                      title: "QR Code", itemIcon: "assets/icons/QR.png"),
                  const SizedBox(height: 5),
                  const Divider(
                    color: Color.fromARGB(255, 190, 190, 190),
                  ),

                  // -- Languages
                  InkWell(
                    onTap: () {
                      print("Arabic Lang");
                      // widget.onLocaleChange(const Locale('en'));
                    },
                    child: UserProfileItem(
                        title: isArabic() ? "العربية" : "Arabic",
                        itemIcon: "assets/icons/languages.png"),
                  ),
                  const SizedBox(height: 5),
                  const Divider(
                    color: Color.fromARGB(255, 190, 190, 190),
                  ),

                  // -- Logout
                  Padding(
                    padding: EdgeInsets.only(
                        left: isArabic() ? 0 : 10, right: isArabic() ? 5 : 0),
                    child: Row(
                      children: [
                        Image.asset("assets/icons/logout.png",
                            height: 20, width: 20),
                        const SizedBox(width: 20),
                        Text(S.of(context)!.logout,
                            style: const TextStyle(fontSize: 16))
                      ],
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
