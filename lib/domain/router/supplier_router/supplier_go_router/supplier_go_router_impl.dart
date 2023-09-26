import 'package:buy_metal_app/domain/repository/auth_repository.dart';
import 'package:buy_metal_app/features/main_bottom_navigation_bar/main_bottom_navigation_bar.dart';
import 'package:buy_metal_app/features/main_bottom_navigation_bar/supplier_main_bottom_navigator_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class SupplierGoRouterImplt {
  SupplierGoRouterImplt({
    required String initPage,
    required GlobalKey<NavigatorState> supplierRootNavigatorKey,
    required GlobalKey<NavigatorState> supplierDealsNavigatorKey,
    required GlobalKey<NavigatorState> supplierProposalsNavigatorKey,
    required GlobalKey<NavigatorState> supplierSearchOrdersNavigatorKey,
    required GlobalKey<NavigatorState> supplierProfileNavigatorKey,
    required List<RouteBase> supplierAuth,
    required List<RouteBase> supplierRoot,
    required List<RouteBase> supplierDeals,
    required List<RouteBase> supplierProposals,
    required List<RouteBase> supplierSearchOrders,
    required List<RouteBase> supplierProfile,

    // Поставщик
    /* required GlobalKey<NavigatorState> supplierDealsNavigatorKey,
    required GlobalKey<NavigatorState> supplierOrdersNavigatorKey,
    required GlobalKey<NavigatorState> supplierCreateOrderNavigatorKey,
    required GlobalKey<NavigatorState> supplierProfileNavigatorKey,
    required List<RouteBase> supplierDeals,
    required List<RouteBase> supplierOrders,
    required List<RouteBase> supplierCreateOrder,
    required List<RouteBase> supplierProfile, */
  }) : supplierRouter = GoRouter(
          navigatorKey: supplierRootNavigatorKey,
          debugLogDiagnostics: kDebugMode,
          initialLocation: '/$initPage',
          routes: [
            ...supplierAuth,
            ...supplierRoot,
            StatefulShellRoute.indexedStack(
              builder: (BuildContext context, GoRouterState state,
                  StatefulNavigationShell navigationShell) {
                return SupplierMainBottomNavigationBar(
                    navigationShell: navigationShell);
              },
              branches: [
                if (supplierDeals.isNotEmpty)
                  StatefulShellBranch(
                    navigatorKey: supplierDealsNavigatorKey,
                    routes: supplierDeals,
                  ),
                if (supplierProposals.isNotEmpty)
                  StatefulShellBranch(
                    navigatorKey: supplierProposalsNavigatorKey,
                    routes: supplierProposals,
                  ),
                if (supplierSearchOrders.isNotEmpty)
                  StatefulShellBranch(
                    navigatorKey: supplierSearchOrdersNavigatorKey,
                    routes: supplierSearchOrders,
                  ),
                if (supplierProfile.isNotEmpty)
                  StatefulShellBranch(
                    navigatorKey: supplierProfileNavigatorKey,
                    routes: supplierProfile,
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

  GoRouter supplierRouter;
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
