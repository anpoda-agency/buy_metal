import 'package:buy_metal_app/features/1.2/ui/buyer_orders_list_page.dart';
import 'package:buy_metal_app/features/1.3/ui/suppliers_proposals_list_page.dart';
import 'package:buy_metal_app/features/1.5/ui/description_of_supplier_proposal_page.dart';
import 'package:buy_metal_app/features/1.7/ui/create_order_page.dart';
import 'package:buy_metal_app/features/1.8/success_order_page.dart';
import 'package:buy_metal_app/features/auth/ui/auth_page.dart';
import 'package:buy_metal_app/features/profile/profile_editor/ui/profile_edit_page.dart';
import 'package:buy_metal_app/features/profile/profile_page/ui/profile_page.dart';
import 'package:buy_metal_app/features/registration/reg_confirm_conditions/ui/reg_confirm_conditions_page.dart';
import 'package:buy_metal_app/features/registration/reg_page/ui/reg_page.dart';
import 'package:buy_metal_app/features/start_page/start_page.dart';
import 'package:flutter/material.dart';

class RouteConstants {
  static root(RootRoutes route, {Object? args}) {
    if (route == RootRoutes.startPage) {
      return const StartPage();
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('root')),
        body: const Center(child: Text('Page not found')),
      );
    }
  }

  static auth(RootRoutes route, {Object? args}) {
    if (route == RootRoutes.startPage) {
      return const StartPage();
    } else if (route == RootRoutes.authPage) {
      return const AuthPage();
    } else if (route == RootRoutes.regPage) {
      return const RegPage();
    } else if (route == RootRoutes.regConfirmConditionsPage) {
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

  static deals(DealsRoutes route, {Object? args}) {
    if (route == DealsRoutes.deals) {
      return Scaffold(
        appBar: AppBar(title: const Text('deals')),
        body: const Center(child: Text('Page not found')),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('404')),
        body: const Center(child: Text('Page not found')),
      );
    }
  }

  static orders(OrdersRoutes route, {Object? args}) {
    if (route == OrdersRoutes.orders) {
      //return const MapScreen();
      /* return Scaffold(
        appBar: AppBar(title: const Text('orders')),
        body: const Center(child: Text('Page not found')), 
        );
        */
      return const BuyerOrdersListPage();
    } else if (route == OrdersRoutes.suppliersProposalsList) {
      return SuppliersProposalsListPage(args: args);
    } else if (route == OrdersRoutes.descriptionOfSupplierProposal) {
      return DescriptionOfSupplierProposalPage(args: args);
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('404')),
        body: const Center(child: Text('Page not found')),
      );
    }
  }

  static createOrder(CreateOrderRoutes route, {Object? args}) {
    if (route == CreateOrderRoutes.createOrder) {
      /* return Scaffold(
        appBar: AppBar(title: const Text('createOrder')),
        body: const Center(child: Text('Page not found')),
      ); */
      /*
      return const ProfilePage();
    } else if (route == ProfileRoutes.profileEdit) {
      return const ProfileEditPage();
      */
      return const CreateOrderPage();
    } else if (route == CreateOrderRoutes.successOrder) {
      return const SuccessOrderPage();
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('404')),
        body: const Center(child: Text('Page not found')),
      );
    }
  }

  static profile(ProfileRoutes route, {Object? args}) {
    if (route == ProfileRoutes.profile) {
      return ProfilePage(
        args: args,
      );
    } else if (route == ProfileRoutes.profileEdit) {
      return ProfileEditPage(
        args: args,
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

enum DealsRoutes {
  deals,
  empty, // reserved name for routing
}

enum OrdersRoutes {
  orders,
  suppliersProposalsList,
  descriptionOfSupplierProposal,
  empty, // reserved name for routing
}

enum CreateOrderRoutes {
  createOrder,
  successOrder,
  empty,
}

enum ProfileRoutes {
  profile,
  profileEdit,
  empty, // reserved name for routing
}
