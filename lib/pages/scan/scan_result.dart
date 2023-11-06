import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanalia/providers/snackbar_provider.dart';

class ResultOutput extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? resultText;
  final IconData? suffixIcon;
  const ResultOutput({
    super.key,
    required this.text,
    required this.resultText,
    required this.icon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    FocusNode? focusNode = FocusNode();
    double width = MediaQuery.of(context).size.width;
    TextStyle resultStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
    );
    return Consumer<SnackbarProvider>(
      builder: (context, prov, child) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: SizedBox(
            width: width * 0.74,
            height: 35,
            child: TextField(
              focusNode: focusNode,
              canRequestFocus: suffixIcon != null,
              readOnly: true,
              style: resultStyle.copyWith(fontSize: 16),
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (currentFocus.canRequestFocus) {
                  currentFocus.unfocus();
                }
                if (suffixIcon == null || resultText == null) {
                  return;
                }

                prov.showSnackBar(
                  type: ContentType.success,
                  message: 'The $text has been copied to the clipboard',
                  value: resultText ?? '',
                );
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusColor: Colors.red,
                prefixIcon: Icon(
                  icon,
                  size: 22,
                  color: Colors.grey,
                ),
                suffixIcon: suffixIcon != null
                    ? Icon(
                        suffixIcon,
                        size: 20,
                      )
                    : null,
                suffixIconColor: Colors.grey[600],
                hintText: resultText ?? text,
                hintStyle: resultStyle.copyWith(
                  color: resultText != null ? Colors.black : Colors.grey,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  gapPadding: 2,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
