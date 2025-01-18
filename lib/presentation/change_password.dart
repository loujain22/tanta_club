import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  const SizedBox(width: 40),
                  Text(AppLocalizations.of(context)!.createNewPassword,
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
              Text(AppLocalizations.of(context)!.yourNewPasswordMustBeDifferent,
                  style: TTextTheme.textTheme.titleMedium),
              Text(AppLocalizations.of(context)!.fromPreviouslyUsedPassword,
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
                      labelText: AppLocalizations.of(context)!.oldPassword),
                ),

                const SizedBox(height: 15),

                // -- New Password
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: const Icon(Iconsax.eye_slash),
                      labelText: AppLocalizations.of(context)!.newPassword),
                ),

                const SizedBox(height: 15),

                // -- Confirm New Password
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: const Icon(Iconsax.eye_slash),
                      labelText: AppLocalizations.of(context)!.confirmNewPassword),
                ),

                const SizedBox(height: 25),

                //-- Sign in button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(AppLocalizations.of(context)!.save,
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
