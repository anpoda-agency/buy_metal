import 'package:buy_metal_app/features/auth/ui/auth_page.dart';
import 'package:buy_metal_app/features/registration/reg_confirm_conditions/ui/reg_confirm_conditions_page.dart';
import 'package:buy_metal_app/features/registration/reg_page/ui/reg_page.dart';
import 'package:buy_metal_app/features/start_page/start_page.dart';
import 'package:flutter/material.dart';

class SupplierRouteConstants {
  static supplierRoot(SupplierRootRoutes route, {Object? args}) {
    if (route == SupplierRootRoutes.startPage) {
      return const StartPage();
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('root')),
        body: const Center(child: Text('Page not found')),
      );
    }
  }

  static supplierAuth(SupplierRootRoutes route, {Object? args}) {
    if (route == SupplierRootRoutes.startPage) {
      return const StartPage();
    } else if (route == SupplierRootRoutes.authPage) {
      return const AuthPage();
    } else if (route == SupplierRootRoutes.regPage) {
      return const RegPage();
    } else if (route == SupplierRootRoutes.regConfirmConditionsPage) {
      return RegConfirmConditionsPage(args: args);

      /*
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
    */
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('404')),
        body: const Center(child: Text('Page not found')),
      );
    }
  }

  static supplierDeals(SupplierDealsRoutes route, {Object? args}) {
    if (route == SupplierDealsRoutes.supplierDeals) {
      return Scaffold(
        appBar: AppBar(title: const Text('supplierDeals')),
        body: const Center(child: Text('Page not found')),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('404')),
        body: const Center(child: Text('Page not found')),
      );
    }
  }

  static supplierProposals(SupplierProposalsRoutes route, {Object? args}) {
    if (route == SupplierProposalsRoutes.supplierProposals) {
      //return const MapScreen();
      return Scaffold(
        appBar: AppBar(title: const Text('supplierProposals')),
        body: const Center(child: Text('Page not found')),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('404')),
        body: const Center(child: Text('Page not found')),
      );
    }
  }

  static supplierSearchOrders(SupplierSearchOrdersRoutes route,
      {Object? args}) {
    if (route == SupplierSearchOrdersRoutes.supplierSearchOrders) {
      return Scaffold(
        appBar: AppBar(title: const Text('supplierSearchOrders')),
        body: const Center(child: Text('Page not found')),
      );
      /*
      return const ProfilePage();
    } else if (route == ProfileRoutes.profileEdit) {
      return const ProfileEditPage();
      */
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('404')),
        body: const Center(child: Text('Page not found')),
      );
    }
  }

  static supplierProfile(SupplierProfileRoutes route, {Object? args}) {
    if (route == SupplierProfileRoutes.supplierProfile) {
      return Scaffold(
        appBar: AppBar(title: const Text('supplierProfile')),
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

enum SupplierRootRoutes {
  startPage,
  authPage,
  regPage,
  regConfirmConditionsPage,
  // Дописать машруты на восстановление пароля

/* 
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
   */
}

enum SupplierDealsRoutes {
  supplierDeals,
  empty, // reserved name for routing
}

enum SupplierProposalsRoutes {
  supplierProposals,
  empty, // reserved name for routing
}

enum SupplierSearchOrdersRoutes {
  supplierSearchOrders,
  empty,
}

enum SupplierProfileRoutes {
  supplierProfile,
  profileEdit,
  empty, // reserved name for routing
}
