import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scanalia/models/wifi_qr.dart';
import 'package:scanalia/pages/favorites/favorites_page.dart';
import 'package:scanalia/pages/home_page.dart';
import 'package:scanalia/pages/scan/scan_page.dart';
import 'package:scanalia/pages/settings/settings_page.dart';

part 'page_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
          children: [
            RedirectRoute(path: '', redirectTo: 'scan'),
            AutoRoute(page: FavoritesRoute.page, path: 'favorites'),
            AutoRoute(page: ScanRoute.page, path: 'scan', initial: true),
            AutoRoute(page: SettingsRoute.page, path: 'settings'),
          ],
        ),
        RedirectRoute(path: '*', redirectTo: '/'),
      ];
}
