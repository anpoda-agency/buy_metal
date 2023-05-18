import 'package:buy_metal_app/ui/pages/auth_pages/auth_page.dart';
import 'package:buy_metal_app/ui/pages/1.2/buyer_orders_list_page.dart';
import 'package:buy_metal_app/ui/pages/1.1/buyer_workplace_page.dart';
import 'package:buy_metal_app/ui/pages/2.4/create_compliance_proposal_page.dart';
import 'package:buy_metal_app/ui/pages/1.7/create_order_page.dart';
import 'package:buy_metal_app/ui/pages/2.5/create_similar_proposal_page.dart';
import 'package:buy_metal_app/ui/pages/2.2/description_of_buyer_order_page.dart';
import 'package:buy_metal_app/ui/pages/1.5/description_of_supplier_proposal_page.dart';
import 'package:buy_metal_app/ui/pages/home_page/home_page.dart';
import 'package:buy_metal_app/ui/pages/auth_pages/reg_page.dart';
import 'package:buy_metal_app/ui/pages/2.1.1/selected_buyer_list_of_orders_page.dart';
import 'package:buy_metal_app/ui/pages/2.3/selection_of_create_proposal_page.dart';
import 'package:buy_metal_app/ui/pages/1.6/supplier_contacts_page.dart';
import 'package:buy_metal_app/ui/pages/1.4/supplier_proposals_list_page.dart';
import 'package:buy_metal_app/ui/pages/2.1/supplier_workplace_page.dart';
import 'package:buy_metal_app/ui/pages/1.3/suppliers_list_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'repo/main_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyBoXWzMysUo_Wtwrq4ojjHnmnoNf_XAGNA',
    appId: '1:667451689375:android:2e85ac9c87d1a8b38495aa',
    messagingSenderId: '667451689375',
    projectId: 'anmetal-72487',
    storageBucket: 'anmetal-72487.appspot.com',
  ));
  initGetIt();
  runApp(const MyApp());
}

initGetIt() {
  GetIt locator = GetIt.instance;
  locator.registerSingleton<MainRepository>(MainRepository());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home_page': (context) => const HomePage(), // new 1.0 start page

        '/reg_page': (context) => const RegPage(), // registration

        '/auth_page': (context) => const AuthPage(), //1.0 authorization

        '/buyer_workplace_page': (context) => const BuyerWorkplacePage(), //1.1

        '/buyer_orders_list_page': (context) =>
            const BuyerOrdersListPage(), // 1.2

        '/suppliers_list_page': (context) => const SuppliersListPage(), //1.3

        '/supplier_proposals_list_page': (context) =>
            const SupplierProposalsListPage(), //1.4

        '/description_of_supplier_proposal_page': (context) =>
            const DescriptionOfSupplierProposalPage(), // 1.5

        '/supplier_contacts_page': (context) =>
            const SupplierContactsPage(), // 1.6

        '/create_order_page': (context) => const CreateOrderPage(), //1.7

        '/supplier_workplace_page': (context) =>
            const SupplierWorkplacePage(), //2.1

        '/selected_buyer_list_of_orders_page': (context) =>
            const SelectedBuyerListOfOrdersPage(), // 2.1.1

        '/description_of_buyer_order_page': (context) =>
            const DescriptionOfBuyerOrderPage(), //2.2

        '/selection_of_create_proposal_page': (context) =>
            const SelectionOfCreateProposalPage(), //2.3

        '/create_compliance_proposal_page': (context) =>
            const CreateComplianceProposalPage(), //2.4

        '/create_similar_proposal_page': (context) =>
            const CreateSimilarProposalPage(), //2.5
      },
      initialRoute: '/home_page',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //var repo = GetIt.instance.get<MainRepository>();
    return const HomePage();
  }
}
