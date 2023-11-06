import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scanalia/models/wifi_qr.dart';

class WifiQRService with ChangeNotifier {
  late Future<Isar> db;

  WifiQRService() {
    db = openDB();
  }

  Future<void> saveWifiQR(WifiQR wifi) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.wifiQRs.putSync(wifi));
  }

  Future<List<WifiQR>> getAllWifiQRs() async {
    final isar = await db;
    return await isar.wifiQRs.where().findAll();
  }

  Stream<List<WifiQR>> listenToWifiQRs() async* {
    final isar = await db;
    yield* isar.wifiQRs.where().watch(fireImmediately: true);
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [WifiQRSchema],
        directory: appDocumentDir.path,
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
