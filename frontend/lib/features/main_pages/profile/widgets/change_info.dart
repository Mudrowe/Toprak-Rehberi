import 'package:flutter/material.dart';
import 'package:toprak_rehberi/dtos/UserDTO.dart';
import 'package:toprak_rehberi/service/fetching/pages/fetch_user.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';
import '../../../../dtos/update_password_request.dart';
import '../../../../dtos/user_field_update_request.dart';
import '../../../../navigation_menu.dart';
import '../../../../service/user/update_user.dart';
import 'logout.dart';

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
          _buildPasswordField(textColor, oldValueController, newValueController,
              confirmPasswordController!),
        if (info == TTexts.firstName)
          _buildFirstNameField(textColor, newValueController),
        if (info == TTexts.lastName)
          _buildLastNameField(textColor, newValueController),
        if (info == TTexts.email)
          _buildEmailField(textColor, newValueController),
        if (info == TTexts.phoneNo)
          _buildPhoneField(textColor, newValueController),
      ],
    ),
  );
}

Widget _buildFirstNameField(Color textColor, TextEditingController controller) {
  return Expanded(
    child: TextFormField(
      controller: controller,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: 'Yeni Ad',
        labelStyle: TextStyle(fontSize: TSizes.fontSizeSm, color: textColor),
      ),
    ),
  );
}

Widget _buildLastNameField(Color textColor, TextEditingController controller) {
  return Expanded(
    child: TextFormField(
      controller: controller,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: 'Yeni Soyad',
        labelStyle: TextStyle(fontSize: TSizes.fontSizeSm, color: textColor),
      ),
    ),
  );
}

Widget _buildEmailField(Color textColor, TextEditingController controller) {
  return Expanded(
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Yeni Email',
        labelStyle: TextStyle(fontSize: TSizes.fontSizeSm, color: textColor),
      ),
    ),
  );
}

Widget _buildPhoneField(Color textColor, TextEditingController controller) {
  return Expanded(
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: 'Yeni Telefon Numarası',
        labelStyle: TextStyle(fontSize: TSizes.fontSizeSm, color: textColor),
      ),
    ),
  );
}

Widget _buildPasswordField(
    Color textColor,
    TextEditingController oldValueController,
    TextEditingController newValueController,
    TextEditingController confirmPasswordController) {
  return Column(
    children: [
      TextFormField(
        controller: oldValueController,
        decoration: InputDecoration(
          labelText: 'Eski Şifre',
          labelStyle: TextStyle(fontSize: TSizes.fontSizeSm, color: textColor),
        ),
      ),
      const SizedBox(height: TSizes.spaceBtwItems),
      TextFormField(
        controller: newValueController,
        decoration: InputDecoration(
          labelText: 'Yeni Şifre',
          labelStyle: TextStyle(fontSize: TSizes.fontSizeSm, color: textColor),
        ),
      ),
      const SizedBox(height: TSizes.spaceBtwItems),
      TextFormField(
        controller: confirmPasswordController,
        decoration: InputDecoration(
          labelText: 'Yeni Şifre Tekrar',
          labelStyle: TextStyle(fontSize: TSizes.fontSizeSm, color: textColor),
        ),
      ),
    ],
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
        if (info == TTexts.password) {
          // Handle password update
          if (newValueController.text != confirmPasswordController?.text) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Şifreler uyuşmuyor!')),
            );
            return;
          }

          UserDTO user = await fetchUser();
          UpdatePasswordRequest updatePasswordRequest = UpdatePasswordRequest(
            userId: user.id!,
            oldPassword: oldValueController.text,
            newPassword: newValueController.text,
          );

          try {
            await updatePassword(updatePasswordRequest);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Şifreniz güncellendi!')),
            );
            // Log the user out after updating password
            logout(context);
          } catch (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Şifre güncelleme başarısız!')),
            );
          }
        } else {
          // Handle other field updates
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
              const SnackBar(content: Text('Bilginiz güncellendi!')),
            );
            // If the field is email, log the user out after updating
            if (info == TTexts.email) {
              logout(context);
            } else {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const NavigationMenu(initialIndex: 4)),
                    (Route<dynamic> route) => false,
              );
            }
          } catch (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Güncelleme başarısız!')),
            );
          }
        }
      },
      child: const Text(TTexts.submit),
    ),
  ];
}
