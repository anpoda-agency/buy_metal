import 'package:buy_metal_app/features/1.2/ui/buyer_orders_list_page.dart';
import 'package:buy_metal_app/features/1.3/ui/suppliers_proposals_list_page.dart';
import 'package:buy_metal_app/features/1.5/ui/description_of_supplier_proposal_page.dart';
import 'package:buy_metal_app/features/1.6/ui/supplier_contacts_page.dart';
import 'package:buy_metal_app/features/1.7/ui/create_order_page.dart';
import 'package:buy_metal_app/features/1.8/success_order_page.dart';
import 'package:buy_metal_app/features/2.1.1/ui/selected_buyer_list_of_orders_page.dart';
import 'package:buy_metal_app/features/2.2/ui/description_of_buyer_order_page.dart';
import 'package:buy_metal_app/features/2.3/selection_of_create_proposal_page.dart';
import 'package:buy_metal_app/features/2.4.1.1/ui/buyer_deals_page.dart';
import 'package:buy_metal_app/features/2.4.2.1/ui/buyer_deal_status_info_page.dart';
import 'package:buy_metal_app/features/2.4.3/ui/buyer_deal_supplier_contacts_page.dart';
import 'package:buy_metal_app/features/2.4.4/ui/buyer_deal_supplier_proposal_page.dart';
import 'package:buy_metal_app/features/2.4/ui/create_compliance_proposal_page.dart';
import 'package:buy_metal_app/features/2.5/ui/create_similar_proposal_page.dart';
import 'package:buy_metal_app/features/2.6/success_proposal_page.dart';
import 'package:buy_metal_app/features/3.2.1/ui/supplier_proposals_page.dart';
import 'package:buy_metal_app/features/3.2.2/ui/supplier_proposal_description_page.dart';
import 'package:buy_metal_app/features/3.4.1/ui/supplier_deals_page.dart';
import 'package:buy_metal_app/features/3.4.2.1/ui/supplier_deal_status_info_page.dart';
import 'package:buy_metal_app/features/3.4.3/ui/supplier_deal_buyer_contacts_page.dart';
import 'package:buy_metal_app/features/3.4.4/ui/supplier_deal_supplier_proposal_page.dart';
import 'package:buy_metal_app/features/auth/ui/auth_page.dart';
import 'package:buy_metal_app/features/profile/profile_editor/ui/profile_edit_page.dart';
import 'package:buy_metal_app/features/profile/profile_page/ui/profile_page.dart';
import 'package:buy_metal_app/features/profile/profile_statistics/ui/profile_statistics_page.dart';
import 'package:buy_metal_app/features/profile/profile_statistics_deals_history/ui/profile_statistics_deals_history_page.dart';
import 'package:buy_metal_app/features/registration/reg_confirm_conditions/ui/reg_confirm_conditions_page.dart';
import 'package:buy_metal_app/features/registration/reg_page/ui/reg_page.dart';
import 'package:buy_metal_app/features/registration/reg_phone_page/ui/reg_phone_pade.dart';
import 'package:buy_metal_app/features/registration/reg_sms_code_page/ui/reg_sms_code_page.dart';
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

// RegPhonePage, RegSmsCodePage
  static auth(RootRoutes route, {Object? args}) {
    if (route == RootRoutes.startPage) {
      return const StartPage();
    } else if (route == RootRoutes.authPage) {
      return const AuthPage();
    } else if (route == RootRoutes.regPage) {
      return const RegPage();
    } else if (route == RootRoutes.regConfirmConditionsPage) {
      return RegConfirmConditionsPage(args: args);
    } else if (route == RootRoutes.regPhonePage) {
      return const RegPhonePage();
    } else if (route == RootRoutes.regSmsCodePage) {
      return RegSmsCodePage(args: args);
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('404')),
        body: const Center(child: Text('Page not found')),
      );
    }
  }

  static deals(DealsRoutes route, {Object? args}) {
    if (route == DealsRoutes.deals) {
      return const BuyerDealsPage();
      /* return Scaffold(
        appBar: AppBar(title: const Text('deals')),
        body: const Center(child: Text('Page not found')),
      ); */
    } else if (route == DealsRoutes.buyerDealStatusInfo) {
      return BuyerDealStatusInfoPage(args: args);
    } else if (route == DealsRoutes.buyerDealSupplierContacts) {
      return const BuyerDealSupplierContactsPage();
    } else if (route == DealsRoutes.buyerDealSupplierProposal) {
      return const BuyerDealSupplierProposalPage();
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('404')),
        body: const Center(child: Text('Page not found')),
      );
    }
  }

// SupplierFlow
  static dealsSupplier(DealsSupplierRoutes route, {Object? args}) {
    if (route == DealsSupplierRoutes.dealsSupplier) {
      return const SupplierDealsPage();
      /* return Scaffold(
        appBar: AppBar(title: const Text('deals')),
        body: const Center(child: Text('Page not found')),
      ); */
    } else if (route == DealsSupplierRoutes.supplierDealStatusInfo) {
      return SupplierDealStatusInfoPage(args: args);
    } else if (route == DealsSupplierRoutes.supplierDealBuyerContacts) {
      return const SupplierDealBuyerContactsPage();
    } else if (route == DealsSupplierRoutes.supplierDealSupplierProposal) {
      return const SupplierDealSupplierProposalPage();
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
    } else if (route == OrdersRoutes.supplierContacts) {
      return SupplierContactsPage(args: args);
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('404')),
        body: const Center(child: Text('Page not found')),
      );
    }
  }

// Экрана с ответами поставщика даже нет, попробую сюда закинуть экран
// из флоу заказчика, где ему ответы высвечиваются ... но там ответы
// на конкретную заявку, похоже придется в любрм случае новый экран...
  static proposals(ProposalsRoutes route, {Object? args}) {
    if (route == ProposalsRoutes.proposals) {
      return const SuppliersProposalsPage();
    } else if (route == ProposalsRoutes.supplierProposalDescription) {
      return SupplierProposalDescriptionPage(args: args);
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

  // SupplierFlow
  // SelectionOfCreateProposalPage
  // CreateComplianceProposalPage
  // CreateSimilarProposalPage
  // SuccessProposalPage
  static findCustomer(FindCustomerRoutes route, {Object? args}) {
    if (route == FindCustomerRoutes.findCustomer) {
      return const SelectedBuyerListOfOrdersPage();
      //
    } else if (route == FindCustomerRoutes.descriptionOfBuyerOrder) {
      return DescriptionOfBuyerOrderPage(args: args);
    } else if (route == FindCustomerRoutes.selectionOfCreateProposal) {
      return SelectionOfCreateProposalPage(args: args);
    } else if (route == FindCustomerRoutes.createComplianceProposal) {
      return CreateComplianceProposalPage(args: args);
    } else if (route == FindCustomerRoutes.createSimilarProposal) {
      return CreateSimilarProposalPage(args: args);
    } else if (route == FindCustomerRoutes.successProposal) {
      return const SuccessProposalPage();
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('404')),
        body: const Center(child: Text('Page not found')),
      );
    }
  }

// ProfileStatisticsDealsHistoryPage
  static profile(ProfileRoutes route, {Object? args}) {
    if (route == ProfileRoutes.profile) {
      return ProfilePage(
        args: args,
      );
    } else if (route == ProfileRoutes.profileEdit) {
      return ProfileEditPage(
        args: args,
      );
    } else if (route == ProfileRoutes.profileStatistics) {
      return ProfileStatisticsPage(
        args: args,
      );
    } else if (route == ProfileRoutes.rofileStatisticsDealsHistory) {
      return const ProfileStatisticsDealsHistoryPage(
          //args: args,
          );
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('404')),
        body: const Center(child: Text('Page not found')),
      );
    }
  }

// SupplierFlow
  static profileSupplier(ProfileSupplierRoutes route, {Object? args}) {
    if (route == ProfileSupplierRoutes.profileSupplier) {
      return ProfilePage(
        args: args,
      );
    } else if (route == ProfileSupplierRoutes.profileSupplierEdit) {
      return ProfileEditPage(
        args: args,
      );
    } else if (route == ProfileSupplierRoutes.profileSupplierStatistics) {
      return ProfileStatisticsPage(
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
//ProfileStatisticsPage

enum RootRoutes {
  startPage,
  authPage,
  regPage,
  regConfirmConditionsPage,
  regPhonePage,
  regSmsCodePage,
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
  buyerDealStatusInfo,
  buyerDealSupplierContacts,
  buyerDealSupplierProposal,
  empty, // reserved name for routing
}

// SupplierFlow
enum DealsSupplierRoutes {
  dealsSupplier,
  supplierDealStatusInfo,
  supplierDealBuyerContacts,
  supplierDealSupplierProposal,
  empty, // reserved name for routing
}

enum OrdersRoutes {
  orders,
  suppliersProposalsList,
  descriptionOfSupplierProposal,
  supplierContacts,
  empty, // reserved name for routing
}

// SupplierFlow
enum ProposalsRoutes {
  proposals,
  supplierProposalDescription,
  empty,
}

enum CreateOrderRoutes {
  createOrder,
  successOrder,
  empty,
}

// SupplierFlow
enum FindCustomerRoutes {
  findCustomer,
  descriptionOfBuyerOrder,
  selectionOfCreateProposal,
  createComplianceProposal,
  createSimilarProposal,
  successProposal,
  empty,
}

enum ProfileRoutes {
  profile,
  profileEdit,
  profileStatistics,
  rofileStatisticsDealsHistory,
  empty, // reserved name for routing
}

// SupplierFlow
enum ProfileSupplierRoutes {
  profileSupplier,
  profileSupplierEdit,
  profileSupplierStatistics,
  empty,
}
