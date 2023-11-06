import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_utils/qr_code_utils.dart';
import 'package:scanalia/models/wifi_qr.dart';
import 'package:scanalia/pages/scan/scan_result.dart';
import 'package:scanalia/providers/snackbar_provider.dart';
import 'package:scanalia/services/wifi_qr_service.dart';
import 'package:wiflutter/wiflutter.dart';

@RoutePage()
class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  XFile? _image;
  String? _data;
  final String _securityHintText = 'Security';
  final String _ssidHintText = 'Network name';
  final String _passwordHintText = 'Password (optional)';
  final WifiQRService service = WifiQRService();

  final _wiFlutterPlugin = WiFlutter();
  String? _ssidText;
  String? _passwordText;
  String? _securityText;

  final ImagePicker _picker = ImagePicker();
  WifiQR? decodedQR;

  Future getImage(ImageSource media, SnackbarProvider prov) async {
    var img = await _picker.pickImage(source: media);

    if (!mounted || img == null) return;
    setState(() {
      _image = img;
      decodeQRImage(_image!.path, prov);
    });
  }

  Future decodeQRImage(String file, SnackbarProvider prov) async {
    try {
      _data = await QrCodeUtils.decodeFrom(file) ?? '';
    } on PlatformException {
      prov.showSnackBar(
        type: ContentType.failure,
        message: 'Esa imagen no es valida :(',
        value: 'Error',
      );
      _data = null;
      _securityText = null;
      _ssidText = null;
      _passwordText = null;
    }

    if (_data == null) return;
    decodedQR = WifiQR.fromQRText(_data!);
    setState(() {
      _securityText = decodedQR?.security;
      _ssidText = decodedQR?.ssid;
      _passwordText = decodedQR?.pass;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return StreamBuilder<List<WifiQR>>(
        stream: service.listenToWifiQRs(),
        builder: (context, snapshot) {
          return Scaffold(
            body: Consumer<SnackbarProvider>(
              builder: (context, prov, child) {
                return SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          _image == null
                              ? 'Select an image'
                              : 'Selected image:',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(fontSize: 20),
                        ),
                      ),
                      if (_image == null)
                        InkWell(
                          onTap: () {
                            getImage(
                              ImageSource.gallery,
                              prov,
                            );
                          },
                          child: Stack(
                            children: [
                              Center(
                                child: DottedBorder(
                                  color: Colors.grey[300]!,
                                  borderType: BorderType.RRect,
                                  strokeWidth: 2,
                                  dashPattern: const [8, 4],
                                  strokeCap: StrokeCap.round,
                                  padding: const EdgeInsets.all(4),
                                  radius: const Radius.circular(14),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    child: Container(
                                      width: width * 0.7,
                                      height: height * 0.3,
                                      color: Colors.grey[100],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 16,
                                left: width * 0.2,
                                child: SvgPicture.asset(
                                  'assets/upload.svg',
                                  width: width * 0.6,
                                  fit: BoxFit.fill,
                                  semanticsLabel: 'Acme Logo',
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (_image != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              splashFactory: NoSplash.splashFactory,
                              onTap: () => getImage(
                                ImageSource.gallery,
                                prov,
                              ),
                              child: Image.file(
                                //to show image, you type like this.
                                File(_image!.path),
                                fit: BoxFit.fitHeight,
                                width: MediaQuery.of(context).size.width,
                                height: 300,
                              ),
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Text(
                          'Results of the QR code:',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      ResultOutput(
                        icon: IconsaxOutline.security,
                        text: _securityHintText,
                        resultText: _securityText,
                      ),
                      ResultOutput(
                        icon: IconsaxOutline.document_normal,
                        text: _ssidHintText,
                        resultText: _ssidText,
                      ),
                      ResultOutput(
                        icon: IconsaxOutline.password_check,
                        text: _passwordHintText,
                        resultText: _passwordText,
                        suffixIcon: IconsaxOutline.note_2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          width: width * 0.6,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              splashFactory:
                                  _data == null ? NoSplash.splashFactory : null,
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  _data != null ? Colors.black : Colors.grey),
                              elevation: MaterialStateProperty.all<double>(0.0),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side: BorderSide(color: Colors.grey[300]!),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              if (_ssidText == null) return;
                              await service.saveWifiQR(
                                WifiQR(
                                  ssid: _ssidText!,
                                  security: _securityText ?? '',
                                  pass: _passwordText,
                                ),
                              );
                              await _wiFlutterPlugin.connect(
                                ssid: _ssidText!,
                                password: _passwordText,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  IconsaxBold.wifi_square,
                                  color: _data != null
                                      ? Colors.white
                                      : Colors.grey[300],
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'Add Wi-Fi network',
                                  style: TextStyle(
                                    color: _data != null
                                        ? Colors.white
                                        : Colors.grey[300],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}
