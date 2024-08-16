import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

Future<void> changeInfo({
  required BuildContext context,
  required String info,
}) {
  final bool dark = THelperFunctions.isDarkMode(context);
  final String title = _getTitle(info);
  final bool isPassword = info == TTexts.password;
  final Color textColor = dark ? TColors.light : TColors.primaryColor;

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: _buildTitle(title, dark, textColor),
        content: _buildContent(info, isPassword, textColor),
        actions: _buildActions(context),
      );
    },
  );
}

String _getTitle(String info) {
  switch (info) {
    case TTexts.firstName:
      return 'Adınızı Değiştirin';
    case TTexts.lastName:
      return 'Soyadınızı Değiştirin';
    case TTexts.email:
      return 'Emailinizi Değiştirin';
    case TTexts.phoneNo:
      return 'Telefon Numaranızı Değiştirin';
    case TTexts.password:
      return 'Şifrenizi Değiştirin';
    default:
      return '${info}nizi Değiştirin';
  }
}

Widget _buildTitle(String title, bool dark, Color textColor) {
  return Text(
    title,
    style: TextStyle(color: textColor),
  );
}

Widget _buildContent(String info, bool isPassword, Color textColor) {
  return SizedBox(
    height: isPassword
        ? TSizes.changeInfoHeightPassword
        : TSizes.changeInfoHeightDefault,
    child: Column(
      children: [
        _buildTextField('Yeni $info', textColor),
        if (isPassword) _buildTextField('Yeni $info Tekrar', textColor),
      ],
    ),
  );
}

Widget _buildTextField(String label, Color textColor) {
  return Expanded(
    child: TextFormField(
      expands: false,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontSize: TSizes.fontSizeSm, color: textColor),
      ),
    ),
  );
}

List<Widget> _buildActions(BuildContext context) {
  return [
    TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: const Text(TTexts.cancel),
    ),
    TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: const Text(TTexts.submit),
    ),
  ];
}
