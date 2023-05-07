import 'package:flutter/material.dart';
import 'package:admin/presentation/screens/1Splash_Screen/splash_view.dart';
import 'package:admin/presentation/screens/4Bus_Screen/bus_view.dart';
import 'package:admin/shared/components/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      // home: Wait_View()
    );
  }
}
