import 'package:buy_metal_app/domain/repository/auth_repository.dart';
import 'package:buy_metal_app/features/main_bottom_navigation_bar/main_bottom_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class GoRouterImplt {
  GoRouterImplt({
    required String initPage,
    required GlobalKey<NavigatorState> rootNavigatorKey,
    required GlobalKey<NavigatorState> dealsNavigatorKey,
    required GlobalKey<NavigatorState> ordersNavigatorKey,
    required GlobalKey<NavigatorState> createOrderNavigatorKey,
    required GlobalKey<NavigatorState> profileNavigatorKey,
    required List<RouteBase> auth,
    required List<RouteBase> root,
    required List<RouteBase> deals,
    required List<RouteBase> orders,
    required List<RouteBase> createOrder,
    required List<RouteBase> profile,

    // Поставщик
    /* required GlobalKey<NavigatorState> supplierDealsNavigatorKey,
    required GlobalKey<NavigatorState> supplierOrdersNavigatorKey,
    required GlobalKey<NavigatorState> supplierCreateOrderNavigatorKey,
    required GlobalKey<NavigatorState> supplierProfileNavigatorKey,
    required List<RouteBase> supplierDeals,
    required List<RouteBase> supplierOrders,
    required List<RouteBase> supplierCreateOrder,
    required List<RouteBase> supplierProfile, */
  }) : router = GoRouter(
          navigatorKey: rootNavigatorKey,
          debugLogDiagnostics: kDebugMode,
          initialLocation: '/$initPage',
          routes: [
            ...auth,
            ...root,
            StatefulShellRoute.indexedStack(
              builder: (BuildContext context, GoRouterState state,
                  StatefulNavigationShell navigationShell) {
                return MainBottomNavigationBar(
                    navigationShell: navigationShell);
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

  GoRouter router;
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
