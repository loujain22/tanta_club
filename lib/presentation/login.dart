import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tanta_club/navigation_menu.dart';
import 'package:tanta_club/providers/auth_provider.dart';
import 'package:tanta_club/utils/helpers/helper_functions.dart';
import 'package:tanta_club/utils/theme/custom_themes/text_theme.dart';
import 'package:tanta_club/utils/messages_util.dart' show MessagesUtil;
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formState = GlobalKey();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _otpController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _showOtpDialog = false;

  Future<void> verifyOtp(BuildContext context, String phone, String otp) async {
    final url = Uri.parse(
        'https://v15.trackintltrade.com/api/method/cms_cloud.cloud_membership.api.verify_otp');
    final headers = {
      'Authorization': 'token 6752561e9b638a6:6490c27487543cd',
      'Content-Type': 'application/json',
      'Cookie':
          'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
    };
    final payload = json.encode({'phone': phone, 'otp': otp});

    try {
      final response = await http.post(url, headers: headers, body: payload);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['message']['status'] == 'success') {
          Navigator.pop(context);
          MessagesUtil.showSuccessMessage(
            context,
            'Success',
            'OTP verified successfully',
          );
          // Clear the phone and OTP text fields
          _phoneController.clear();
          _otpController.clear();
        } else {
          MessagesUtil.showErrorMessage(
            context,
            'Error',
            responseData['message']['message'] ?? 'Invalid OTP',
          );
        }
      } else {
        MessagesUtil.showErrorMessage(
          context,
          'Error',
          'Failed to verify OTP. Please try again.',
        );
      }
    } catch (e) {
      MessagesUtil.showErrorMessage(
        context,
        'Error',
        'An error occurred. Please try again.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  if (Get.locale?.languageCode == 'en') {
                    Get.updateLocale(const Locale('ar'));
                  } else {
                    Get.updateLocale(const Locale('en'));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 6.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/icons/languages.png",
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        Get.locale?.languageCode == 'en'
                            ? AppLocalizations.of(context)!.arabic
                            : AppLocalizations.of(context)!.english,
                        style: TTextTheme.textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
                    Text(AppLocalizations.of(context)!.login,
                        style: TTextTheme.textTheme.headlineMedium),
                    const SizedBox(height: 5),
                    Text(AppLocalizations.of(context)!.loginSubTitle,
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
                      // -- Phone Number
                      TextFormField(
                        controller: _phoneController,
                        enabled: !_isLoading,
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(context)!
                                .pleaseEnterPhoneNumber;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.user),
                            labelText:
                                AppLocalizations.of(context)!.phoneNumber),
                      ),

                      const SizedBox(height: 15),

                      // -- Password
                      TextFormField(
                        controller: _passwordController,
                        enabled: !_isLoading,
                        obscureText: _obscurePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(context)!
                                .pleaseEnterPassword;
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
                            labelText: AppLocalizations.of(context)!.password),
                      ),

                      const SizedBox(height: 5),
                      TextButton(
                        onPressed: () => _showCreateAccountDialog(),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: AppLocalizations.of(context)!.noAccount +
                                    " ",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                              TextSpan(
                                text: AppLocalizations.of(context)!.createOne,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //-- Sign in button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: _isLoading ? null : _handleLogin,
                            child: _isLoading
                                ? const CircularProgressIndicator()
                                : Text(AppLocalizations.of(context)!.signIn,
                                    style: TTextTheme.textTheme.titleLarge)),
                      ),

                      // -- Create Account Button
                    ],
                  ),
                )),
            const SizedBox(height: 24),
            // Center(
            //   child: Text.rich(
            //     TextSpan(
            //       children: [
            //         TextSpan(
            //           text: AppLocalizations.of(context)!.noAccount + " ",
            //           style: const TextStyle(color: Colors.grey),
            //         ),
            //         TextSpan(
            //           text: AppLocalizations.of(context)!.createOne,
            //           style: const TextStyle(
            //             color: Colors.grey,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
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
          .login(_phoneController.text, _passwordController.text, context);

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

  Future<void> _requestOtp() async {
    if (_phoneController.text.isEmpty) {
      MessagesUtil.showErrorMessage(
        context,
        'Error',
        'Please enter a valid phone number',
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await http.post(
        Uri.parse(
            'https://v15.trackintltrade.com/api/method/cms_cloud.cloud_membership.api.otp_request'),
        headers: {
          'Authorization': 'token 6752561e9b638a6:6490c27487543cd',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'phone': _phoneController.text}),
      );

      final data = jsonDecode(response.body);

      if (data['message']['status'] == 'success') {
        setState(() {
          _showOtpDialog = true;
          _isLoading = false;
        });
        _showOtpVerificationDialog();
      } else {
        MessagesUtil.showErrorMessage(
          context,
          'Error',
          'Failed to send OTP. Please try again.',
        );
      }
    } catch (e) {
      MessagesUtil.showErrorMessage(
        context,
        'Error',
        'An error occurred. Please try again.',
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showCreateAccountDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Create Account'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.phoneNumber,
                prefixIcon: Icon(Iconsax.call),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _requestOtp();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: Text(AppLocalizations.of(context)!.sendOtp),
            ),
          ],
        ),
      ),
    );
  }

  void _showOtpVerificationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Enter OTP'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _otpController,
              decoration: InputDecoration(
                labelText: 'OTP Code',
                prefixIcon: Icon(Iconsax.password_check),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await verifyOtp(
                    context, _phoneController.text, _otpController.text);
              },
              child: Text('Verify OTP'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _otpController.dispose();
    super.dispose();
  }
}
