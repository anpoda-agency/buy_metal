import 'dart:async';

import 'package:buy_metal_app/data/storage/enum.dart';
import 'package:buy_metal_app/domain/repository/auth_repository.dart';
import 'package:buy_metal_app/features/main_bottom_navigation_bar/main_bottom_navigation_bar.dart';
import 'package:buy_metal_app/features/supplier_bottom_navigation_bar.dart';
import 'package:buy_metal_app/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

StreamSubscription<GlobalEvents>? subGS = globalStream.stream.listen(_refresh);

_refresh(GlobalEvents event) {
  if (event == GlobalEvents.toBuyerBar) {
    isBuyerBar = true;
    isSupplierBar = false;
  }
  if (event == GlobalEvents.toSupplierBar) {
    isBuyerBar = false;
    isSupplierBar = true;
  }
}

void buyerBar() {
  isBuyerBar = true;
  isSupplierBar = false;
}

void supplierBar() {
  isBuyerBar = false;
  isSupplierBar = true;
}

bool isBuyerBar = false;
bool isSupplierBar = true;

class GoRouterImplt {
  late GoRouter router;
  //GoRouterImplt.test() : StreamSubscription<GlobalEvents>? subGS = globalStream.stream.listen(_refresh);
  GoRouterImplt({
    required String initPage,
    required GlobalKey<NavigatorState> rootNavigatorKey,
    required GlobalKey<NavigatorState> dealsNavigatorKey,
    required GlobalKey<NavigatorState> dealsSupplierNavigatorKey, // SupplierFlow
    required GlobalKey<NavigatorState> ordersNavigatorKey,
    required GlobalKey<NavigatorState> proposalsNavigatorKey, // SupplierFlow
    required GlobalKey<NavigatorState> createOrderNavigatorKey,
    required GlobalKey<NavigatorState> findCustomerNavigatorKey, // SupplierFLow
    required GlobalKey<NavigatorState> profileNavigatorKey,
    required GlobalKey<NavigatorState> profileSupplierNavigatorKey, // SupplierFlow

    required List<RouteBase> auth,
    required List<RouteBase> root,
    required List<RouteBase> deals,
    required List<RouteBase> dealsSupplier, // SupplierFlow
    required List<RouteBase> orders,
    required List<RouteBase> proposals, // SupplierFlow
    required List<RouteBase> createOrder,
    required List<RouteBase> findCustomer, // SupplierFlow
    required List<RouteBase> profile,
    required List<RouteBase> profileSupplier, // SupplierFlow
  }) : super() {
    subGS = globalStream.stream.listen(_refresh);
    router = GoRouter(
      navigatorKey: rootNavigatorKey,
      debugLogDiagnostics: kDebugMode,
      initialLocation: '/$initPage',
      routes: [
        ...auth,
        ...root,
        if (isBuyerBar) ...[
          StatefulShellRoute.indexedStack(
            builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
              return MainBottomNavigationBar(navigationShell: navigationShell);
              //return StatefulNavigationShell(navigationShell: navigationShell);
            },
            branches: [
              if (deals.isNotEmpty)
                StatefulShellBranch(
                  navigatorKey: dealsNavigatorKey,
                  routes: deals,
                ),
              if (orders.isNotEmpty)
                StatefulShellBranch(
                  navigatorKey: ordersNavigatorKey,
                  routes: orders,
                ),
              if (createOrder.isNotEmpty)
                StatefulShellBranch(
                  navigatorKey: createOrderNavigatorKey,
                  routes: createOrder,
                ),
              if (profile.isNotEmpty)
                StatefulShellBranch(
                  navigatorKey: profileNavigatorKey,
                  routes: profile,
                ),
            ],
          ),
        ],
        if (isSupplierBar) ...[
          StatefulShellRoute.indexedStack(
            builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
              return SupplierBottomNavigationBar(navigationShell: navigationShell);
              //return StatefulNavigationShell(navigationShell: navigationShell);
            },
            branches: [
              if (dealsSupplier.isNotEmpty) // SupplierFlow
                StatefulShellBranch(
                  navigatorKey: dealsSupplierNavigatorKey,
                  routes: dealsSupplier,
                ),

              // SupplierFlow
              if (proposals.isNotEmpty) // SupplierFlow
                StatefulShellBranch(
                  navigatorKey: proposalsNavigatorKey,
                  routes: proposals,
                ),

              // SupplierFlow
              if (findCustomer.isNotEmpty) // SupplierFlow
                StatefulShellBranch(
                  navigatorKey: findCustomerNavigatorKey,
                  routes: findCustomer,
                ),

              // SupplierFlow
              if (profileSupplier.isNotEmpty) // SupplierFlow
                StatefulShellBranch(
                  navigatorKey: profileSupplierNavigatorKey,
                  routes: profileSupplier,
                ),
            ],
          ),
        ],

        /* StatefulShellRoute.indexedStack(
              builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
                return MainBottomNavigationBar(navigationShell: navigationShell);
                //return StatefulNavigationShell(navigationShell: navigationShell);
              },
              branches: [
                if (deals.isNotEmpty)
                  StatefulShellBranch(
                    navigatorKey: dealsNavigatorKey,
                    routes: [
                      ...deals,
                      StatefulShellRoute.indexedStack(
                        builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
                          return SupplierBottomNavigationBar(navigationShell: navigationShell);
                          //return StatefulNavigationShell(navigationShell: navigationShell);
                        },
                        branches: [
                          if (dealsSupplier.isNotEmpty) // SupplierFlow
                            StatefulShellBranch(
                              navigatorKey: dealsSupplierNavigatorKey,
                              routes: dealsSupplier,
                            ),

                          // SupplierFlow
                          if (proposals.isNotEmpty) // SupplierFlow
                            StatefulShellBranch(
                              navigatorKey: proposalsNavigatorKey,
                              routes: proposals,
                            ),

                          // SupplierFlow
                          if (findCustomer.isNotEmpty) // SupplierFlow
                            StatefulShellBranch(
                              navigatorKey: findCustomerNavigatorKey,
                              routes: findCustomer,
                            ),

                          // SupplierFlow
                          if (profileSupplier.isNotEmpty) // SupplierFlow
                            StatefulShellBranch(
                              navigatorKey: profileSupplierNavigatorKey,
                              routes: profileSupplier,
                            ),
                        ],
                      ),
                    ],
                  ),
                if (orders.isNotEmpty)
                  StatefulShellBranch(
                    navigatorKey: ordersNavigatorKey,
                    routes: orders,
                  ),
                if (createOrder.isNotEmpty)
                  StatefulShellBranch(
                    navigatorKey: createOrderNavigatorKey,
                    routes: createOrder,
                  ),
                if (profile.isNotEmpty)
                  StatefulShellBranch(
                    navigatorKey: profileNavigatorKey,
                    routes: profile,
                  ),
              ],
            ), */
      ],
      redirect: (BuildContext context, state) {
        bool loggingIn = context.read<GetIt>().get<AuthRepository>().isAuth;
        if ((!loggingIn) && (!state.uri.toString().startsWith('/auth'))) {
          //return '/auth/auth';
          return '/startPage';
        } else {
          return null;
        }
      },
    );
    subGS = globalStream.stream.listen(_refresh);
  }

  //GoRouter router;
}

// class GoRouterRefreshStreamCustom extends ChangeNotifier {
//   GoRouterRefreshStreamCustom(Stream<dynamic> stream) {
//     notifyListeners();
//     _subscription = stream.asBroadcastStream().listen(
//       (data) {
//         if (data is NavState) {
//           notifyListeners();
//         }
//       },
//     );
//   }

//   late final StreamSubscription<dynamic> _subscription;

//   @override
//   void dispose() {
//     _subscription.cancel();
//     super.dispose();
//   }
// }
