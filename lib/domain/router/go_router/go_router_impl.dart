import 'package:buy_metal_app/domain/repository/auth_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:buy_metal_app/features/main_bottom_navigation_bar/main_bottom_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

GetIt getIt = GetIt.instance;

class GoRouterImplt {
  /* GetIt getIt = GetIt.instance;

  bool isSupplier = context.read<GetIt>().get<UserRepository>(); */
  //final UserRepository userRepository;

  GoRouterImplt({
    //required this.userRepository,
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
  }) : router = GoRouter(
          navigatorKey: rootNavigatorKey,
          debugLogDiagnostics: kDebugMode,
          initialLocation: '/$initPage',
          routes: [
            ...auth,
            ...root,
            StatefulShellRoute.indexedStack(
              builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
                return MainBottomNavigationBar(
                  navigationShell: navigationShell,
                  userRepository: context.read<GetIt>().get<UserRepository>(),
                );
                //return StatefulNavigationShell(navigationShell: navigationShell);
              },
              branches: [
                if (deals.isNotEmpty && getIt.get<UserRepository>().user?.user.position == 'CUSTOMER')
                  StatefulShellBranch(
                    navigatorKey: dealsNavigatorKey,
                    routes: deals,
                  ),
                // SupplierFlow
                //if (GetIt.instance.get<UserRepository>().user?.user.position == 'SUPPLIER')
                if (dealsSupplier.isNotEmpty &&
                    getIt.get<UserRepository>().user?.user.position == 'SUPPLIER') // SupplierFlow
                  StatefulShellBranch(
                    navigatorKey: dealsSupplierNavigatorKey,
                    routes: dealsSupplier,
                  ),
                if (orders.isNotEmpty && getIt.get<UserRepository>().user?.user.position == 'CUSTOMER')
                  StatefulShellBranch(
                    navigatorKey: ordersNavigatorKey,
                    routes: orders,
                  ),
                // SupplierFlow
                if (proposals.isNotEmpty &&
                    getIt.get<UserRepository>().user?.user.position == 'SUPPLIER') // SupplierFlow
                  StatefulShellBranch(
                    navigatorKey: proposalsNavigatorKey,
                    routes: proposals,
                  ),
                if (createOrder.isNotEmpty && getIt.get<UserRepository>().user?.user.position == 'CUSTOMER')
                  StatefulShellBranch(
                    navigatorKey: createOrderNavigatorKey,
                    routes: createOrder,
                  ),
                // SupplierFlow
                if (findCustomer.isNotEmpty &&
                    getIt.get<UserRepository>().user?.user.position == 'SUPPLIER') // SupplierFlow
                  StatefulShellBranch(
                    navigatorKey: findCustomerNavigatorKey,
                    routes: findCustomer,
                  ),
                if (profile.isNotEmpty && getIt.get<UserRepository>().user?.user.position == 'CUSTOMER')
                  StatefulShellBranch(
                    navigatorKey: profileNavigatorKey,
                    routes: profile,
                  ),
                // SupplierFlow
                if (profileSupplier.isNotEmpty &&
                    getIt.get<UserRepository>().user?.user.position == 'SUPPLIER') // SupplierFlow
                  StatefulShellBranch(
                    navigatorKey: profileSupplierNavigatorKey,
                    routes: profileSupplier,
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
