import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class SnackbarProvider extends ChangeNotifier {
  ContentType? _type;
  String _message = '';
  String _value = '';

  ContentType? get type => _type;
  String get message => _message;
  String get value => _value;

  void showSnackBar({
    required ContentType type,
    required String message,
    String value = '',
  }) {
    _type = type;
    _message = message;
    _value = value;
    notifyListeners();
  }

  void resetSnackBar() {
    _type = null;
    _message = '';
    _value = '';
    notifyListeners();
  }
}
