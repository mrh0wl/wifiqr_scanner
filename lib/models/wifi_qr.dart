import 'package:isar/isar.dart';
import 'package:scanalia/errors/wifi_qr.dart';

part 'wifi_qr.g.dart';

@collection
class WifiQR {
  final Id id = Isar.autoIncrement;
  @Index(type: IndexType.value)
  final String ssid;
  final String? pass;
  final String security;
  @Name("created_at")
  final DateTime createdAt = DateTime.now();

  WifiQR({required this.ssid, this.pass, required this.security});

  factory WifiQR.fromQRText(String qrText) {
    String pattern =
        r'^WIFI:T:(?<SECURITY>.*?);S:(?<SSID>.*?);P:(?<PASSWORD>.*?);;$';
    RegExp regExp = RegExp(pattern);
    RegExpMatch? regMatch = regExp.firstMatch(qrText);

    if (regMatch == null) throw WifiQRFromTextException;
    return WifiQR(
        ssid: regMatch.namedGroup('SSID') ?? '',
        pass: regMatch.namedGroup('PASSWORD') ?? '',
        security: regMatch.namedGroup('SECURITY') ?? 'Unknown');
  }
}
