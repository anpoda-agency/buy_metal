import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'go_router/go_router_impl.dart';
import 'route_constants.dart';

class RouteImpl {
  final GlobalKey<NavigatorState> rootNavigatorKey;
  final GlobalKey<NavigatorState> meetsNavigatorKey;
  final GlobalKey<NavigatorState> mapNavigatorKey;
  final GlobalKey<NavigatorState> businessNavigatorKey;
  final GlobalKey<NavigatorState> profileNavigatorKey;
  GoRouterImplt goRouterImplt;

  RouteImpl({
    required this.rootNavigatorKey,
    required this.meetsNavigatorKey,
    required this.mapNavigatorKey,
    required this.businessNavigatorKey,
    required this.profileNavigatorKey,
  }) : goRouterImplt = GoRouterImplt(
          initPage: RootRoutes.start.name,
          rootNavigatorKey: rootNavigatorKey,
          meetsNavigatorKey: meetsNavigatorKey,
          mapNavigatorKey: mapNavigatorKey,
          businessNavigatorKey: businessNavigatorKey,
          profileNavigatorKey: profileNavigatorKey,
          auth: RootRoutes.values
              .map(
                (e) => GoRoute(
                  path: '/auth/${e.name}',
                  builder: (context, GoRouterState state) => RouteConstants.auth(e, args: state.extra),
                ),
              )
              .toList(),
          root: RootRoutes.values
              .map(
                (e) => GoRoute(
                  path: '/${e.name}',
                  builder: (context, GoRouterState state) => RouteConstants.root(e, args: state.extra),
                ),
              )
              .toList(),
          meets: MeetsRoutes.values
              .map(
                (e) => GoRoute(
                  path: '/${e.name}',
                  builder: (context, GoRouterState state) => RouteConstants.meets(e, args: state.extra),
                ),
              )
              .toList(),
          map: MapRoutes.values
              .map(
                (e) => GoRoute(
                  path: '/${e.name}',
                  builder: (context, GoRouterState state) => RouteConstants.map(e, args: state.extra),
                ),
              )
              .toList(),
          business: BusinessRoutes.values
              .map(
                (e) => GoRoute(
                  path: '/${e.name}',
                  builder: (context, GoRouterState state) => RouteConstants.business(e, args: state.extra),
                ),
              )
              .toList(),
          profile: ProfileRoutes.values
              .map(
                (e) => GoRoute(
                  path: '/${e.name}',
                  builder: (context, GoRouterState state) => RouteConstants.profile(e, args: state.extra),
                ),
              )
              .toList(),
        );

  void pop<T extends Object?>([T? result]) {
    goRouterImplt.router.pop(result);
  }

  Future<T?> push<T extends Object?>(
    String? route, {
    Object? args,
    bool rootContext = false,
  }) async {
    if (route != null) {
      if (rootContext) {
        var routeName = RootRoutes.values.firstWhereOrNull((el) => el.name == route);
        return (routeName != null)
            ? rootNavigatorKey.currentState?.push(
                MaterialPageRoute(
                  builder: (BuildContext context) => RouteConstants.root(routeName, args: args),
                  settings: RouteSettings(name: '/$route', arguments: args),
                ),
              )
            : null;
      } else {
        return goRouterImplt.router.push('/$route', extra: args);
      }
    }
    return null;
  }

  void go(String? route, {Object? args}) {
    if (route != null) {
      goRouterImplt.router.go('/$route', extra: args);
    }
  }

  void popUntilAndPush({required String routeUntil, required String route, Object? args}) {
    var canPop = false;
    int countPop = 0;
    for (var element in goRouterImplt.router.routerDelegate.currentConfiguration.matches) {
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
      goRouterImplt.router.push('/$route', extra: args);
    }
  }

  void pushAndReplaceAll(String? route, {Object? args}) {
    if (route != null) {
      goRouterImplt.router.go('/$route', extra: args);
    }
  }

  void pushAndReplace(String? route, {Object? args}) async {
    if (route != null) {
      goRouterImplt.router.replace('/$route', extra: args);
    }
  }

  void pushAndReplaceNamed(String route, {Object? args}) {
    goRouterImplt.router.replace(route, extra: args);
  }

  void newRoutesPath(List<String> routesPath, {Object? args}) {
    if (routesPath.isNotEmpty) {
      for (var i = goRouterImplt.router.routerDelegate.currentConfiguration.matches.length; i > 1; i--) {
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
