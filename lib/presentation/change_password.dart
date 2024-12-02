import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tanta_club/generated/l10n.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // -- Header
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 30,
                  left: isArabic() ? 0 : 25,
                  right: isArabic() ? 25 : 0),
              child: Row(
                children: [
                  IconButton.outlined(
                      onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                  const SizedBox(width: 50),
                  Text(S.of(context).createNewPassword,
                      style: TTextTheme.textTheme.titleLarge)
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),

          // -- Change Password Image
          Center(
            child: Image.asset("assets/images/changePasswordImage.png",
                height: 250, width: 250),
          ),
          const SizedBox(height: 30),

          // --  Description
          Column(
            children: [
              Text(S.of(context).yourNewPasswordMustBeDifferent,
                  style: TTextTheme.textTheme.titleMedium),
              Text(S.of(context).fromPreviouslyUsedPassword,
                  style: TTextTheme.textTheme.titleMedium)
            ],
          ),
          const SizedBox(height: 50),

          // -- Form
          Form(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                // -- Old Password
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      labelText: S.of(context).oldPassword),
                ),

                const SizedBox(height: 15),

                // -- New Password
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: const Icon(Iconsax.eye_slash),
                      labelText: S.of(context).newPassword),
                ),

                const SizedBox(height: 15),

                // -- Confirm New Password
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: const Icon(Iconsax.eye_slash),
                      labelText: S.of(context).confirmNewPassword),
                ),

                const SizedBox(height: 25),

                //-- Sign in button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(S.of(context).save,
                          style: TTextTheme.textTheme.titleLarge)),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
