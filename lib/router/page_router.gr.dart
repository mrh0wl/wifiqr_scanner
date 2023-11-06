// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'page_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    FavoritesRoute.name: (routeData) {
      final args = routeData.argsAs<FavoritesRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FavoritesPage(
          key: args.key,
          wifiQRs: args.wifiQRs,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    ScanRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScanPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
  };
}

/// generated route for
/// [FavoritesPage]
class FavoritesRoute extends PageRouteInfo<FavoritesRouteArgs> {
  FavoritesRoute({
    Key? key,
    required List<WifiQR>? wifiQRs,
    List<PageRouteInfo>? children,
  }) : super(
          FavoritesRoute.name,
          args: FavoritesRouteArgs(
            key: key,
            wifiQRs: wifiQRs,
          ),
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static const PageInfo<FavoritesRouteArgs> page =
      PageInfo<FavoritesRouteArgs>(name);
}

class FavoritesRouteArgs {
  const FavoritesRouteArgs({
    this.key,
    required this.wifiQRs,
  });

  final Key? key;

  final List<WifiQR>? wifiQRs;

  @override
  String toString() {
    return 'FavoritesRouteArgs{key: $key, wifiQRs: $wifiQRs}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScanPage]
class ScanRoute extends PageRouteInfo<void> {
  const ScanRoute({List<PageRouteInfo>? children})
      : super(
          ScanRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScanRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
