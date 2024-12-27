import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tanta_club/components/messages/failure_message.dart';
import 'package:tanta_club/generated/l10n.dart';
import 'package:tanta_club/navigation_menu.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // -- Logo
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Center(
                child: Image.asset("assets/logos/logo.png",
                    height: 210, width: 210)),
          ),
          // -- Title & SubTitle
          Padding(
              padding: EdgeInsets.only(
                  top: 70,
                  bottom: 20,
                  right: isArabic() ? 25 : 0,
                  left: isArabic() ? 0 : 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context)!.login,
                      style: TTextTheme.textTheme.headlineMedium),
                  const SizedBox(height: 5),
                  Text(S.of(context)!.loginSubTitle,
                      style: TTextTheme.textTheme.bodyLarge),
                ],
              )),

          //-- Form
          Form(
              key: formState,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    // -- Username
                    TextFormField(
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context)!.pleaseEnterUsername;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.user),
                          labelText: S.of(context)!.Username),
                    ),

                    const SizedBox(height: 15),

                    // -- Password
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context)!.pleaseEnterPassword;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.password_check),
                          suffixIcon: const Icon(Iconsax.eye_slash),
                          labelText: S.of(context)!.Password),
                    ),

                    const SizedBox(height: 25),

                    //-- Sign in button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);

                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            if (formState.currentState!.validate()) {
                              Get.to(() => const NavigationMenu());
                            } else {
                              FailureMessage(
                                title: isArabic() ? "مشكلة!" : "On Snap!",
                                message: isArabic()
                                    ? "لقد فشلت في قراءة رسالة الفشل هذه. يرجى المحاولة مرة أخرى!"
                                    : "You have failed to read this failure message. Please try again.",
                              );
                            }
                          },
                          child: Text(S.of(context)!.Signin,
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
