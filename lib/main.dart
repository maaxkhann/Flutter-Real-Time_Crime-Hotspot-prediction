import 'package:crime_management_system/firebase_options.dart';
import 'package:crime_management_system/splash_view.dart';
import 'package:crime_management_system/view-model/auth_view_model.dart';
import 'package:crime_management_system/view-model/profile_view_model.dart';
import 'package:crime_management_system/view-model/report_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => AuthViewModel()),
              ChangeNotifierProvider(create: (_) => ReportViewModel()),
              ChangeNotifierProvider(create: (_) => ProfileViewModel()),
            ],
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'CrimeAlertPro',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: child,
            ),
          );
        },
        child: const SplashView());
  }
}
