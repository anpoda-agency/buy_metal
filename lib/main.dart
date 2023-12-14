import 'dart:async';

import 'package:buy_metal_app/core/constants.dart';
import 'package:buy_metal_app/data/storage/enum.dart';
import 'package:buy_metal_app/di/service_locator.dart';
import 'package:buy_metal_app/domain/router/route_constants.dart';
import 'package:buy_metal_app/domain/router/route_impl.dart';
import 'package:buy_metal_app/features/start_page/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

GetIt getIt = GetIt.instance;
final globalStream = StreamController<GlobalEvents>.broadcast();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //init(globalStream);
  //initGetIt();
  runApp(const MyApp());
}

/* void initGetIt() async {
  setup();
} */

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

var router = RouteImpl(
  rootNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'root'),
  dealsNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'deals'),
  dealsSupplierNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'dealsSupplier'), // SupplierFlow
  ordersNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'orders'),
  proposalsNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'proposals'), // SupplierFlow
  createOrderNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'createOrders'),
  findCustomerNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'findCustomer'), // SupplierFlow
  profileNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'profile'),
  profileSupplierNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'profileSupplier'), // SupplierFlow
);

Widget startRouter() {
  var router = RouteImpl(
    rootNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'root'),
    dealsNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'deals'),
    dealsSupplierNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'dealsSupplier'), // SupplierFlow
    ordersNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'orders'),
    proposalsNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'proposals'), // SupplierFlow
    createOrderNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'createOrders'),
    findCustomerNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'findCustomer'), // SupplierFlow
    profileNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'profile'),
    profileSupplierNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'profileSupplier'), // SupplierFlow
  );
  return MultiProvider(
      providers: [
        RepositoryProvider(create: (context) => getIt),
        RepositoryProvider(create: (context) => router),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router.goRouterImplt.router,
      ));
}

class _MyAppState extends State<MyApp> {
  //final globalStream = StreamController<GlobalEvents>.broadcast();

  bool loading = true;

  /* var router = RouteImpl(
    rootNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'root'),
    dealsNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'deals'),
    dealsSupplierNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'dealsSupplier'), // SupplierFlow
    ordersNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'orders'),
    proposalsNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'proposals'), // SupplierFlow
    createOrderNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'createOrders'),
    findCustomerNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'findCustomer'), // SupplierFlow
    profileNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'profile'),
    profileSupplierNavigatorKey: GlobalKey<NavigatorState>(debugLabel: 'profileSupplier'), // SupplierFlow
  ); */

  @override
  void initState() {
    super.initState();

    init(globalStream).then((auth) {
      setState(() {
        loading = false;
      });
      auth ? router.newRoutesPath([ProfileRoutes.profile.name]) : router.newRoutesPath([RootRoutes.startPage.name]);
      //FlutterNativeSplash.remove();
    });

    globalStream.stream.listen((event) {
      if (event == GlobalEvents.toStart) {
        router.go(RootRoutes.startPage.name);
        //getIt.get<HomeRepository>().changeVisibleNavBar(visible: true);
      }
    });
  }

  /* Widget startRouter() {
    return MultiProvider(
        providers: [
          RepositoryProvider(create: (context) => getIt),
          RepositoryProvider(create: (context) => router),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router.goRouterImplt.router,
        ));
  } */

  @override
  Widget build(BuildContext context) {
    //final Object? args = ModalRoute.of(context)?.settings.arguments;

    return startRouter();
    /* MultiProvider(
        providers: [
          RepositoryProvider(create: (context) => getIt),
          RepositoryProvider(create: (context) => router),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router.goRouterImplt.router,
        )

        /*
      MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/home_page': (context) => const StartPage(), // new 1.0 start page

          '/reg_page': (context) => const RegPage(), // registration

          '/reg_confirm_conditions_page': (context) => RegConfirmConditionsPage(arsg: args),

          '/auth_page': (context) => const AuthPage(), //1.0 authorization

          '/profile_page': (context) => ProfilePage(args: args),

          '/profile_edit_page': (context) => ProfileEditPage(args: args),

          '/buyer_workplace_page': (context) => const BuyerWorkplacePage(), //1.1

          '/buyer_orders_list_page': (context) => const BuyerOrdersListPage(), // 1.2

          '/suppliers_list_page': (context) => SuppliersProposalsListPage(args: args), //1.3

          '/description_of_supplier_proposal_page': (context) => DescriptionOfSupplierProposalPage(args: args), // 1.5

          '/supplier_contacts_page': (context) => SupplierContactsPage(args: args), // 1.6

          '/create_order_page': (context) => const CreateOrderPage(), //1.7

          '/success_order_page': (context) => const SuccessOrderPage(), //1.8

          '/selected_buyer_list_of_orders_page': (context) => const SelectedBuyerListOfOrdersPage(), // 2.1.1

          '/description_of_buyer_order_page': (context) => DescriptionOfBuyerOrderPage(args: args), //2.2

          '/selection_of_create_proposal_page': (context) => SelectionOfCreateProposalPage(args: args), //2.3

          '/create_compliance_proposal_page': (context) => CreateComplianceProposalPage(args: args), //2.4

          '/create_similar_proposal_page': (context) => CreateSimilarProposalPage(args: args), //2.5

          '/success_proposal_page': (context) => const SuccessProposalPage(), //2.6
        },
        home: const StartPage(),
      ),
      */
        ); */
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
    return const StartPage();
  }
}

// потом разберусь как кэши сделать

Future<bool> init(
  StreamController<GlobalEvents> gs,
) async {
  bool isAuth = await setup(gs);

  var url = Uri.tryParse(AppConstants.baseUrl);

  if (url == null) {
    throw 'AppConstants.serverUrl error';
  }

  return isAuth;
}
