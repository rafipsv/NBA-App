import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nba/Pages/Splash/Splash.dart';
import 'package:provider/provider.dart';

import 'Providers/SplashProvider.dart';

// starting of App
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // using screen utils package for responsiveness.
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      builder: (context, child) {
        // using provider for better state management.
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => SplashProvider(),
            ),
          ],
          // defining root materialapp.
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            // Defining Home App.
            home: Splash(),
          ),
        );
      },
    );
  }
}
