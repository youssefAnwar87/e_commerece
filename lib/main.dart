import 'package:e_commerece/ui/auth/login/login_screen.dart';
import 'package:e_commerece/ui/auth/register/register_screen.dart';
import 'package:e_commerece/ui/splash/splash_screen.dart';
import 'package:e_commerece/utils/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  Size(430,932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName : (context)=> SplashScreen(),
            RegisterScreen.routeName : (context)=> RegisterScreen(),
            LoginScreen.routeName : (context)=> LoginScreen(),
          },
          theme: AppTheme.mainTheme,
        );
      }
    );
  }
}
