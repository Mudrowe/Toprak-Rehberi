import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

import '../../../../dtos/user_field_update_request.dart';
import '../../../../navigation_menu.dart';
import '../../../../service/user/update_user.dart';

Future<void> changeInfo({
  required BuildContext context,
  required String info,
}) {
  final bool dark = THelperFunctions.isDarkMode(context);
  final String title = _getTitle(info);
  final bool isPassword = info == TTexts.password;
  final Color textColor = dark ? TColors.light : TColors.dark;

  final TextEditingController oldValueController = TextEditingController();
  final TextEditingController newValueController = TextEditingController();
  TextEditingController? confirmPasswordController;

  if (isPassword) {
    confirmPasswordController = TextEditingController();
  }

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: _buildTitle(title, dark, textColor),
        content: _buildContent(info, isPassword, textColor, oldValueController,
            newValueController, confirmPasswordController),
        actions: _buildActions(context, info, oldValueController,
            newValueController, confirmPasswordController),
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

Widget _buildContent(
    String info,
    bool isPassword,
    Color textColor,
    TextEditingController oldValueController,
    TextEditingController newValueController,
    TextEditingController? confirmPasswordController) {
  return SizedBox(
    height: isPassword
        ? TSizes.changeInfoHeightPassword
        : TSizes.changeInfoHeightDefault,
    child: Column(
      children: [
        if (isPassword)
          _buildTextField('Eski $info', textColor, oldValueController),
        _buildTextField('Yeni $info', textColor, newValueController),
        if (isPassword)
          _buildTextField(
              'Yeni $info Tekrar', textColor, confirmPasswordController!),
      ],
    ),
  );
}

Widget _buildTextField(
    String label, Color textColor, TextEditingController controller) {
  return Expanded(
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontSize: TSizes.fontSizeSm, color: textColor),
      ),
    ),
  );
}

Map<String, String> fieldMapping = {
  TTexts.firstName: 'firstName',
  TTexts.lastName: 'lastName',
  TTexts.email: 'email',
  TTexts.phoneNo: 'phoneNumber',
  TTexts.password: 'password',
};

List<Widget> _buildActions(
    BuildContext context,
    String info,
    TextEditingController oldValueController,
    TextEditingController newValueController,
    TextEditingController? confirmPasswordController) {
  return [
    TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: const Text(TTexts.cancel),
    ),
    TextButton(
      onPressed: () async {
        String newValue = newValueController.text;

        String? backendFieldName = fieldMapping[info];

        if (backendFieldName == null) {
          return;
        }

        UserFieldUpdateRequest updateRequest = UserFieldUpdateRequest(
          fieldName: backendFieldName,
          newValue: newValue,
        );

        try {
          await updateUserField(updateRequest);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Bilginiz Güncellendi!')),
          );
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const NavigationMenu(
                initialIndex: 3,
              ),
            ),
            (Route<dynamic> route) => false,
          );
        } catch (error) {}
      },
      child: const Text(TTexts.submit),
    ),
  ];
}
