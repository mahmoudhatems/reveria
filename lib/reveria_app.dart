
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reveria/core/features/home/ui/home_screen.dart';
import 'package:reveria/core/features/login/login_screen.dart';
import 'package:reveria/core/helpers/strings.dart';
import 'package:reveria/core/routing/app_router.dart';
import 'package:reveria/core/routing/routes.dart';
import 'package:reveria/core/theming/colors.dart';

class Reveria extends StatefulWidget {
  const Reveria({super.key, required this.appRouter});
  final AppRouter appRouter ;

  @override
  State<Reveria> createState() => _ReveriaState();
}

class _ReveriaState extends State<Reveria> {

@override
  void initState() {
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('===============================================================User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      child: MaterialApp(
        home: FirebaseAuth.instance.currentUser ==null ?LoginScreen():HomeScreen(),
        title: Strings.appTitle,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: ColorsManager.primaryColorTeal,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.login,
        onGenerateRoute: widget.appRouter.generateRoute,
      ),
    );
  
  }
}