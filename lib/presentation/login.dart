import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:tanta_club/generated/l10n.dart';
import 'package:tanta_club/navigation_menu.dart';
import 'package:tanta_club/providers/auth_provider.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';
import 'package:tanta_club/utils/messages_util.dart' show MessagesUtil;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formState = GlobalKey();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
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
                        controller: _usernameController,
                        enabled: !_isLoading,
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
                        controller: _passwordController,
                        enabled: !_isLoading,
                        obscureText: _obscurePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context)!.pleaseEnterPassword;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.password_check),
                            suffixIcon: IconButton(
                              icon: Icon(_obscurePassword
                                  ? Iconsax.eye_slash
                                  : Iconsax.eye),
                              onPressed: () => setState(
                                  () => _obscurePassword = !_obscurePassword),
                            ),
                            labelText: S.of(context)!.Password),
                      ),

                      const SizedBox(height: 25),

                      //-- Sign in button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: _isLoading ? null : _handleLogin,
                            child: _isLoading
                                ? const CircularProgressIndicator()
                                : Text(S.of(context)!.Signin,
                                    style: TTextTheme.textTheme.titleLarge)),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Future<void> _handleLogin() async {
    if (!formState.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final success = await Provider.of<AuthProvider>(context, listen: false)
          .login(_usernameController.text, _passwordController.text);

      if (success && mounted) {
        MessagesUtil.showSuccessMessage(
          context,
          'Success',
          'Login successful',
        );
        await Future.delayed(const Duration(seconds: 1));
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NavigationMenu()),
        );
      }
    } catch (error) {
      if (!mounted) return;
      MessagesUtil.showErrorMessage(
        context,
        'Error',
        error.toString().replaceAll('Exception: ', ''),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
