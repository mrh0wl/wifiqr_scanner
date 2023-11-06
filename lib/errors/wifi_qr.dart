class WifiQRException implements Exception {
  String msg;
  WifiQRException([this.msg = '']);
  @override
  String toString() => 'WifiQR Error: $msg';
}

class WifiQRFromTextException extends WifiQRException {
  final String message;

  WifiQRFromTextException([this.message = 'QR Text is not valid.']);
  @override
  set msg(String message) => message;
}
