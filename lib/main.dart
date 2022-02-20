import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:doan2/screens/home/home_page.dart';
import 'package:doan2/screens/sign_in.dart';
import 'package:doan2/theme/colors/light_colors.dart';

import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: LightColors.kLightYellow, // navigation bar color
    statusBarColor: Color(0xffffb969), // status bar color
  ));

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: LightColors.kDarkBlue,
            displayColor: LightColors.kDarkBlue,
            fontFamily: 'Poppins'),
      ),
      home: SignInPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
