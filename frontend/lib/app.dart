import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toprak_rehberi/service/test_get/http_action_buttons.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/utils/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/authentication/screens/first_screen/first_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      home:const FirstScreen(),
      //home: TActionButtons(),
      );
  }
}