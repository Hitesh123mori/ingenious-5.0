import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' ;
import 'package:ingenious_5/apis/FireStoreAPIs/InterestAPIs.dart';
import 'package:ingenious_5/providers/CurrentUser.dart';
import 'package:ingenious_5/screens/Institute/home_screen_institute.dart';
import 'package:ingenious_5/screens/Institute/home_tab_institute.dart';
import 'package:ingenious_5/screens/onboard_screen/onboarding_screen.dart';
import 'package:ingenious_5/screens/onboard_screen/splash_screen.dart';
import 'package:ingenious_5/screens/student/home_tabs_student.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';


late Size mq ;

void  main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (context)=>AppUserProvider())], child: MyApp()));
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginScreen(),2
      // home: SplashScreen(),
      // home: HomeTabsStudents(),
      // home: HomeTabsInstitute(),,
      home:OnboardingScreen(),
    );
  }
}
