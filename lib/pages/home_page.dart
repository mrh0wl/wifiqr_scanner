import 'package:auto_route/auto_route.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scanalia/models/wifi_qr.dart';
import 'package:scanalia/providers/snackbar_provider.dart';
import 'package:scanalia/router/page_router.dart';
import 'package:scanalia/services/wifi_qr_service.dart';
import 'package:scanalia/widgets/bottom_navbar.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<IconData> _icons = [
    IconsaxOutline.note_favorite,
    IconsaxOutline.scan_barcode,
    IconsaxOutline.setting_3
  ];
  final service = WifiQRService();

  getSnackbar(SnackbarProvider prov) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: 60),
      duration: const Duration(milliseconds: 800),
      content: AwesomeSnackbarContent(
        title: 'Holis guapa!',
        message: prov.message,
        contentType: prov.type ?? ContentType.failure,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
    prov.resetSnackBar();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return StreamBuilder<List<WifiQR>>(
        stream: service.listenToWifiQRs(),
        builder: (context, snapshot) {
          return AutoTabsRouter(
            routes: [
              FavoritesRoute(wifiQRs: snapshot.data),
              const ScanRoute(),
              const SettingsRoute(),
            ],
            builder: (context, child) => Scaffold(
              body: GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: Consumer<SnackbarProvider>(
                  builder: (_, prov, child) {
                    if (prov.type == ContentType.success) {
                      Clipboard.setData(ClipboardData(text: prov.value))
                          .then((value) => getSnackbar(prov));
                    }
                    return child!;
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.bottomCenter,
                    children: [
                      child,
                      Positioned(
                        bottom: 12,
                        width: width / 1.5,
                        child: FloatingBottomNavbar(
                          icons: _icons,
                          unselectedColor: Colors.white,
                          barColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
