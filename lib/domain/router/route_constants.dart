import 'package:flutter/material.dart';
import 'package:quick_meet/features/auth/auth_start/start_page.dart';
import 'package:quick_meet/features/auth/auth_with_password/ui/auth_password_page.dart';
import 'package:quick_meet/features/auth/auth_with_sms/step_one_phone/ui/auth_sms_page.dart';
import 'package:quick_meet/features/auth/auth_with_sms/step_two_code/ui/auth_sms_code_page.dart';
import 'package:quick_meet/features/map/map_page/ui/map_page.dart';
import 'package:quick_meet/features/profile/profile_editor/ui/profile_edit_page.dart';
import 'package:quick_meet/features/profile/profile_page/ui/profile_page.dart';
import 'package:quick_meet/features/registration/step_four_fields/ui/reg_final_page.dart';
import 'package:quick_meet/features/registration/step_one_phone/ui/reg_phone_page.dart';
import 'package:quick_meet/features/registration/step_three_password/reg_password_page.dart';
import 'package:quick_meet/features/registration/step_two_code/ui/reg_sms_code_page.dart';
import 'package:quick_meet/features/reset_password/step_one/ui/password_recovery_phone_page.dart';
import 'package:quick_meet/features/reset_password/step_three/ui/password_recovery_enter_page.dart';
import 'package:quick_meet/features/reset_password/step_two/ui/password_recovery_sms_code_page.dart';

class RouteConstants {
  static root(RootRoutes route, {Object? args}) {
    if (route == RootRoutes.start) {
      return const StartPage();
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('root')),
        body: const Center(child: Text('Page not found')),
      );
    }
  }

  static auth(RootRoutes route, {Object? args}) {
    if (route == RootRoutes.authChoose) {
      return const StartPage();
    } else if (route == RootRoutes.authWithSmsPhone) {
      return const AuthSmsPage();
    } else if (route == RootRoutes.authWithSmsCode) {
      return AuthSmsCodePage(args: args);
    } else if (route == RootRoutes.authWithPassword) {
      return const AuthPasswordPage();
    } else if (route == RootRoutes.registrationPhone) {
      return const RegPhonePage();
    } else if (route == RootRoutes.registrationCode) {
      return RegSmsCodePage(args: args);
    } else if (route == RootRoutes.registrationPassword) {
      return RegPasswordPage(args: args);
    } else if (route == RootRoutes.registrationPersonalData) {
      return RegFinalPage(args: args);
    } else if (route == RootRoutes.resetPasswordPhone) {
      return const PasswordRecoveryPhonePage();
    } else if (route == RootRoutes.resetPasswordCode) {
      return PasswordRecoverySmsCodePage(args: args);
    } else if (route == RootRoutes.resetPasswordEnterPassword) {
      return PasswordRecoveryEnterPage(args: args);
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('404')),
        body: const Center(child: Text('Page not found')),
      );
    }
  }

  static meets(MeetsRoutes route, {Object? args}) {
    if (route == MeetsRoutes.meets) {
      return Scaffold(
        appBar: AppBar(title: const Text('meets')),
        body: const Center(child: Text('Page not found')),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('404')),
        body: const Center(child: Text('Page not found')),
      );
    }
  }

  static map(MapRoutes route, {Object? args}) {
    if (route == MapRoutes.map) {
      return const MapScreen();
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('404')),
        body: const Center(child: Text('Page not found')),
      );
    }
  }

  static profile(ProfileRoutes route, {Object? args}) {
    if (route == ProfileRoutes.profile) {
      return const ProfilePage();
    } else if (route == ProfileRoutes.profileEdit) {
      return const ProfileEditPage();
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('404')),
        body: const Center(child: Text('Page not found')),
      );
    }
  }

  static business(BusinessRoutes route, {Object? args}) {
    if (route == BusinessRoutes.business) {
      return Scaffold(
        appBar: AppBar(title: const Text('business')),
        body: const Center(child: Text('Page not found')),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('404')),
        body: const Center(child: Text('Page not found')),
      );
    }
  }
}

enum RootRoutes {
  start,
  authChoose,
  authWithSmsPhone,
  authWithPassword,
  registrationPhone,
  registrationCode,
  registrationPassword,
  registrationPersonalData,
  authWithSmsCode,
  resetPasswordPhone,
  resetPasswordCode,
  resetPasswordEnterPassword,
  empty, // reserved name for routing
}

enum MeetsRoutes {
  meets,
  empty, // reserved name for routing
}

enum MapRoutes {
  map,
  empty, // reserved name for routing
}

enum ProfileRoutes {
  profile,
  empty,
  profileEdit, // reserved name for routing
}

enum BusinessRoutes {
  business,
  empty, // reserved name for routing
}
