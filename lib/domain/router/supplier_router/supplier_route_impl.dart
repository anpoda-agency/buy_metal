import 'package:buy_metal_app/domain/router/supplier_router/supplier_go_router/supplier_go_router_impl.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'supplier_route_constants.dart';

class SupplierRouteImpl {
  final GlobalKey<NavigatorState> supplierRootNavigatorKey;
  final GlobalKey<NavigatorState> supplierDealsNavigatorKey;
  final GlobalKey<NavigatorState> supplierProposalsNavigatorKey;
  final GlobalKey<NavigatorState> supplierSearchOrdersNavigatorKey;
  final GlobalKey<NavigatorState> supplierProfileNavigatorKey;
  SupplierGoRouterImplt supplierGoRouterImplt;

  SupplierRouteImpl({
    required this.supplierRootNavigatorKey,
    required this.supplierDealsNavigatorKey,
    required this.supplierProposalsNavigatorKey,
    required this.supplierSearchOrdersNavigatorKey,
    required this.supplierProfileNavigatorKey,
  }) : supplierGoRouterImplt = SupplierGoRouterImplt(
          initPage: SupplierRootRoutes.startPage.name,
          supplierRootNavigatorKey: supplierRootNavigatorKey,
          supplierDealsNavigatorKey: supplierDealsNavigatorKey,
          supplierProposalsNavigatorKey: supplierProposalsNavigatorKey,
          supplierSearchOrdersNavigatorKey: supplierSearchOrdersNavigatorKey,
          supplierProfileNavigatorKey: supplierProfileNavigatorKey,
          supplierAuth: SupplierRootRoutes.values
              .map(
                (e) => GoRoute(
                  path: '/auth/${e.name}',
                  builder: (context, GoRouterState state) =>
                      SupplierRouteConstants.supplierAuth(e, args: state.extra),
                ),
              )
              .toList(),
          supplierRoot: SupplierRootRoutes.values
              .map(
                (e) => GoRoute(
                  path: '/${e.name}',
                  builder: (context, GoRouterState state) =>
                      SupplierRouteConstants.supplierRoot(e, args: state.extra),
                ),
              )
              .toList(),
          supplierDeals: SupplierDealsRoutes.values
              .map(
                (e) => GoRoute(
                  path: '/${e.name}',
                  builder: (context, GoRouterState state) =>
                      SupplierRouteConstants.supplierDeals(e,
                          args: state.extra),
                ),
              )
              .toList(),
          supplierProposals: SupplierProposalsRoutes.values
              .map(
                (e) => GoRoute(
                  path: '/${e.name}',
                  builder: (context, GoRouterState state) =>
                      SupplierRouteConstants.supplierProposals(e,
                          args: state.extra),
                ),
              )
              .toList(),
          supplierSearchOrders: SupplierSearchOrdersRoutes.values
              .map(
                (e) => GoRoute(
                  path: '/${e.name}',
                  builder: (context, GoRouterState state) =>
                      SupplierRouteConstants.supplierSearchOrders(e,
                          args: state.extra),
                ),
              )
              .toList(),
          supplierProfile: SupplierProfileRoutes.values
              .map(
                (e) => GoRoute(
                  path: '/${e.name}',
                  builder: (context, GoRouterState state) =>
                      SupplierRouteConstants.supplierProfile(e,
                          args: state.extra),
                ),
              )
              .toList(),
        );

  void pop<T extends Object?>([T? result]) {
    supplierGoRouterImplt.supplierRouter.pop(result);
  }

  Future<T?> push<T extends Object?>(
    String? route, {
    Object? args,
    bool rootContext = false,
  }) async {
    if (route != null) {
      if (rootContext) {
        var routeName = SupplierRootRoutes.values
            .firstWhereOrNull((el) => el.name == route);
        return (routeName != null)
            ? supplierRootNavigatorKey.currentState?.push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      SupplierRouteConstants.supplierRoot(routeName,
                          args: args),
                  settings: RouteSettings(name: '/$route', arguments: args),
                ),
              )
            : null;
      } else {
        return supplierGoRouterImplt.supplierRouter
            .push('/$route', extra: args);
      }
    }
    return null;
  }

  void go(String? route, {Object? args}) {
    if (route != null) {
      supplierGoRouterImplt.supplierRouter.go('/$route', extra: args);
    }
  }

  void popUntilAndPush(
      {required String routeUntil, required String route, Object? args}) {
    var canPop = false;
    int countPop = 0;
    for (var element in supplierGoRouterImplt
        .supplierRouter.routerDelegate.currentConfiguration.matches) {
      countPop++;
      if (element.matchedLocation == '/$routeUntil') {
        canPop = true;
        break;
      }
    }

    if (canPop) {
      while (countPop > 0) {
        pop();
        countPop--;
      }
      supplierGoRouterImplt.supplierRouter.push('/$route', extra: args);
    }
  }

  void pushAndReplaceAll(String? route, {Object? args}) {
    if (route != null) {
      supplierGoRouterImplt.supplierRouter.go('/$route', extra: args);
    }
  }

  void pushAndReplace(String? route, {Object? args}) async {
    if (route != null) {
      supplierGoRouterImplt.supplierRouter.replace('/$route', extra: args);
    }
  }

  void pushAndReplaceNamed(String route, {Object? args}) {
    supplierGoRouterImplt.supplierRouter.replace(route, extra: args);
  }

  void newRoutesPath(List<String> routesPath, {Object? args}) {
    if (routesPath.isNotEmpty) {
      for (var i = supplierGoRouterImplt.supplierRouter.routerDelegate
              .currentConfiguration.matches.length;
          i > 1;
          i--) {
        pop();
      }
      for (var route in routesPath) {
        if (route == routesPath.first) {
          pushAndReplaceAll(
            route,
            args: route == routesPath[routesPath.length - 1] ? args : null,
          );
        } else {
          push(
            route,
            args: route == routesPath[routesPath.length - 1] ? args : null,
          );
        }
      }
    }
  }
}
