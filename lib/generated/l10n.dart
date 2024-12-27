// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S? current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current!;
    });
  } 

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Please Sign in to continue`
  String get loginSubTitle {
    return Intl.message(
      'Please Sign in to continue',
      name: 'loginSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get Username {
    return Intl.message(
      'Username',
      name: 'Username',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get Signin {
    return Intl.message(
      'Sign in',
      name: 'Signin',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get oldPassword {
    return Intl.message(
      'Old Password',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Create New Password`
  String get createNewPassword {
    return Intl.message(
      'Create New Password',
      name: 'createNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Your New Password Must Be Different`
  String get yourNewPasswordMustBeDifferent {
    return Intl.message(
      'Your New Password Must Be Different',
      name: 'yourNewPasswordMustBeDifferent',
      desc: '',
      args: [],
    );
  }

  /// `From Previously Used Password.`
  String get fromPreviouslyUsedPassword {
    return Intl.message(
      'From Previously Used Password.',
      name: 'fromPreviouslyUsedPassword',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Events`
  String get events {
    return Intl.message(
      'Events',
      name: 'events',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `You`
  String get you {
    return Intl.message(
      'You',
      name: 'you',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message(
      'View All',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Sports`
  String get sports {
    return Intl.message(
      'Sports',
      name: 'sports',
      desc: '',
      args: [],
    );
  }

  /// `Football`
  String get football {
    return Intl.message(
      'Football',
      name: 'football',
      desc: '',
      args: [],
    );
  }

  /// `Basketball`
  String get basketball {
    return Intl.message(
      'Basketball',
      name: 'basketball',
      desc: '',
      args: [],
    );
  }

  /// `Crossfit`
  String get crossfit {
    return Intl.message(
      'Crossfit',
      name: 'crossfit',
      desc: '',
      args: [],
    );
  }

  /// `Boxing`
  String get boxing {
    return Intl.message(
      'Boxing',
      name: 'boxing',
      desc: '',
      args: [],
    );
  }

  /// `Running`
  String get running {
    return Intl.message(
      'Running',
      name: 'running',
      desc: '',
      args: [],
    );
  }

  /// `TennisBall`
  String get tennisball {
    return Intl.message(
      'TennisBall',
      name: 'tennisball',
      desc: '',
      args: [],
    );
  }

  /// `Your Profile`
  String get userProfile {
    return Intl.message(
      'Your Profile',
      name: 'userProfile',
      desc: '',
      args: [],
    );
  }

  /// `Tanta Club`
  String get tantaclub {
    return Intl.message(
      'Tanta Club',
      name: 'tantaclub',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Payment Methods`
  String get paymentMethods {
    return Intl.message(
      'Payment Methods',
      name: 'paymentMethods',
      desc: '',
      args: [],
    );
  }

  /// `Card`
  String get card {
    return Intl.message(
      'Card',
      name: 'card',
      desc: '',
      args: [],
    );
  }

  /// `Fawry`
  String get fawry {
    return Intl.message(
      'Fawry',
      name: 'fawry',
      desc: '',
      args: [],
    );
  }

  /// `Invoices`
  String get invoices {
    return Intl.message(
      'Invoices',
      name: 'invoices',
      desc: '',
      args: [],
    );
  }

  /// `Please select the invoice(s) `
  String get invoiceSubtitle1 {
    return Intl.message(
      'Please select the invoice(s) ',
      name: 'invoiceSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `you'd like to pay.`
  String get invoiceSubtitle2 {
    return Intl.message(
      'you\'d like to pay.',
      name: 'invoiceSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Remaining Amount:`
  String get remainingAmount {
    return Intl.message(
      'Remaining Amount:',
      name: 'remainingAmount',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Id:`
  String get invoiceId {
    return Intl.message(
      'Invoice Id:',
      name: 'invoiceId',
      desc: '',
      args: [],
    );
  }

  /// `Invoice Type:`
  String get invoiceType {
    return Intl.message(
      'Invoice Type:',
      name: 'invoiceType',
      desc: '',
      args: [],
    );
  }

  /// `Please select the installment(s)`
  String get installmentSubtitle1 {
    return Intl.message(
      'Please select the installment(s)',
      name: 'installmentSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `you'd like to pay.`
  String get installmentSubtitle2 {
    return Intl.message(
      'you\'d like to pay.',
      name: 'installmentSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Item Name:`
  String get itemName {
    return Intl.message(
      'Item Name:',
      name: 'itemName',
      desc: '',
      args: [],
    );
  }

  /// `Date Of First Installment:`
  String get dateOfFirstInstallment {
    return Intl.message(
      'Date Of First Installment:',
      name: 'dateOfFirstInstallment',
      desc: '',
      args: [],
    );
  }

  /// `Installments`
  String get installments {
    return Intl.message(
      'Installments',
      name: 'installments',
      desc: '',
      args: [],
    );
  }

  /// `Installment:`
  String get installment {
    return Intl.message(
      'Installment:',
      name: 'installment',
      desc: '',
      args: [],
    );
  }

  /// `Installments`
  String get dInstallment {
    return Intl.message(
      'Installments',
      name: 'dInstallment',
      desc: '',
      args: [],
    );
  }

  /// `Total:`
  String get total {
    return Intl.message(
      'Total:',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Please enter username.`
  String get pleaseEnterUsername {
    return Intl.message(
      'Please enter username.',
      name: 'pleaseEnterUsername',
      desc: '',
      args: [],
    );
  }

  /// `Please enter password.`
  String get pleaseEnterPassword {
    return Intl.message(
      'Please enter password.',
      name: 'pleaseEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter installment.`
  String get pleaseEnterInstallment {
    return Intl.message(
      'Please enter installment.',
      name: 'pleaseEnterInstallment',
      desc: '',
      args: [],
    );
  }

  /// `Enter intallment/s`
  String get installmentPlaceholder {
    return Intl.message(
      'Enter intallment/s',
      name: 'installmentPlaceholder',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}