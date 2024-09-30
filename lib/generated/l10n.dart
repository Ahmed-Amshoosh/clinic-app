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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `hello `
  String get title {
    return Intl.message(
      'hello ',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Appointment `
  String get appointment {
    return Intl.message(
      'Appointment ',
      name: 'appointment',
      desc: '',
      args: [],
    );
  }

  /// `Medical Advice  `
  String get medical_Advice {
    return Intl.message(
      'Medical Advice  ',
      name: 'medical_Advice',
      desc: '',
      args: [],
    );
  }

  /// ` Doctors `
  String get doctors {
    return Intl.message(
      ' Doctors ',
      name: 'doctors',
      desc: '',
      args: [],
    );
  }

  /// `Make Appoint  `
  String get make_appoint {
    return Intl.message(
      'Make Appoint  ',
      name: 'make_appoint',
      desc: '',
      args: [],
    );
  }

  /// `Make Post `
  String get make_post {
    return Intl.message(
      'Make Post ',
      name: 'make_post',
      desc: '',
      args: [],
    );
  }

  /// `Title Post  `
  String get title_post {
    return Intl.message(
      'Title Post  ',
      name: 'title_post',
      desc: '',
      args: [],
    );
  }

  /// `Description Post`
  String get desc_post {
    return Intl.message(
      'Description Post',
      name: 'desc_post',
      desc: '',
      args: [],
    );
  }

  /// `Upload Image `
  String get img_post {
    return Intl.message(
      'Upload Image ',
      name: 'img_post',
      desc: '',
      args: [],
    );
  }

  /// `Setting  `
  String get setting {
    return Intl.message(
      'Setting  ',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Language `
  String get lang {
    return Intl.message(
      'Language ',
      name: 'lang',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode `
  String get dark_mode {
    return Intl.message(
      'Dark Mode ',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Log Out  `
  String get log_out {
    return Intl.message(
      'Log Out  ',
      name: 'log_out',
      desc: '',
      args: [],
    );
  }

  /// `No `
  String get no {
    return Intl.message(
      'No ',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Yes `
  String get yes {
    return Intl.message(
      'Yes ',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to log out of the application? `
  String get messgeLogout {
    return Intl.message(
      'Do you want to log out of the application? ',
      name: 'messgeLogout',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get light_mode {
    return Intl.message(
      'Light Mode',
      name: 'light_mode',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Notice Text`
  String get notice_text {
    return Intl.message(
      'Notice Text',
      name: 'notice_text',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Name `
  String get name {
    return Intl.message(
      'Name ',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone {
    return Intl.message(
      'Phone Number',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `PassWord `
  String get password {
    return Intl.message(
      'PassWord ',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes `
  String get Save_changes {
    return Intl.message(
      'Save Changes ',
      name: 'Save_changes',
      desc: '',
      args: [],
    );
  }

  /// `There Are No Notifications `
  String get there_are_no_notifications {
    return Intl.message(
      'There Are No Notifications ',
      name: 'there_are_no_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Do You Want To Delete This Notification?`
  String get do_you_want_to_delete_this_notification {
    return Intl.message(
      'Do You Want To Delete This Notification?',
      name: 'do_you_want_to_delete_this_notification',
      desc: '',
      args: [],
    );
  }

  /// `Patient Name`
  String get patient_name {
    return Intl.message(
      'Patient Name',
      name: 'patient_name',
      desc: '',
      args: [],
    );
  }

  /// `Patient's Age`
  String get patient_age {
    return Intl.message(
      'Patient\'s Age',
      name: 'patient_age',
      desc: '',
      args: [],
    );
  }

  /// `Patient's Gender`
  String get patient_gender {
    return Intl.message(
      'Patient\'s Gender',
      name: 'patient_gender',
      desc: '',
      args: [],
    );
  }

  /// `Patient Problem`
  String get patient_problem {
    return Intl.message(
      'Patient Problem',
      name: 'patient_problem',
      desc: '',
      args: [],
    );
  }

  /// `Booking Date`
  String get booking_date {
    return Intl.message(
      'Booking Date',
      name: 'booking_date',
      desc: '',
      args: [],
    );
  }

  /// `Notice`
  String get notice {
    return Intl.message(
      'Notice',
      name: 'notice',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Thank you, your reservation has been completed successfully`
  String get Thank_you_your_reservation_has_been_completed_successfully {
    return Intl.message(
      'Thank you, your reservation has been completed successfully',
      name: 'Thank_you_your_reservation_has_been_completed_successfully',
      desc: '',
      args: [],
    );
  }

  /// `There Are No appointment`
  String get there_are_no_appointments {
    return Intl.message(
      'There Are No appointment',
      name: 'there_are_no_appointments',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `There are no completed dates`
  String get there_are_no_completed_dates {
    return Intl.message(
      'There are no completed dates',
      name: 'there_are_no_completed_dates',
      desc: '',
      args: [],
    );
  }

  /// `Schedule`
  String get schedule {
    return Intl.message(
      'Schedule',
      name: 'schedule',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `My Appointments`
  String get my_appointments {
    return Intl.message(
      'My Appointments',
      name: 'my_appointments',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Complete`
  String get complete {
    return Intl.message(
      'Complete',
      name: 'complete',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to cancel this appointment?`
  String get do_you_want_to_cancel_this_appointment {
    return Intl.message(
      'Do you want to cancel this appointment?',
      name: 'do_you_want_to_cancel_this_appointment',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get Login {
    return Intl.message(
      'Log In',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for this email`
  String get the_account_already_exists_for_this_email {
    return Intl.message(
      'The account already exists for this email',
      name: 'the_account_already_exists_for_this_email',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password provided for that user`
  String get wrong_password_provided_for_that_user {
    return Intl.message(
      'Wrong password provided for that user',
      name: 'wrong_password_provided_for_that_user',
      desc: '',
      args: [],
    );
  }

  /// `The email or password is incorrect`
  String get the_email_or_password_is_incorrect {
    return Intl.message(
      'The email or password is incorrect',
      name: 'the_email_or_password_is_incorrect',
      desc: '',
      args: [],
    );
  }

  /// `Create a new account`
  String get create_a_new_account {
    return Intl.message(
      'Create a new account',
      name: 'create_a_new_account',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `You already have an account`
  String get you_already_have_an_account {
    return Intl.message(
      'You already have an account',
      name: 'you_already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak`
  String get the_password_provided_is_too_weak {
    return Intl.message(
      'The password provided is too weak',
      name: 'the_password_provided_is_too_weak',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get user_name {
    return Intl.message(
      'User Name',
      name: 'user_name',
      desc: '',
      args: [],
    );
  }

  /// `Department of Dental Implants`
  String get department_of_dental_implants {
    return Intl.message(
      'Department of Dental Implants',
      name: 'department_of_dental_implants',
      desc: '',
      args: [],
    );
  }

  /// `Installations Department`
  String get installations_department {
    return Intl.message(
      'Installations Department',
      name: 'installations_department',
      desc: '',
      args: [],
    );
  }

  /// `Department of Oral and Periodontal Surgery`
  String get Department_of_oral_and_periodontal_surgery {
    return Intl.message(
      'Department of Oral and Periodontal Surgery',
      name: 'Department_of_oral_and_periodontal_surgery',
      desc: '',
      args: [],
    );
  }

  /// `Doctor details`
  String get doctor_details {
    return Intl.message(
      'Doctor details',
      name: 'doctor_details',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '' key
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
