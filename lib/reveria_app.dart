
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reveria/core/helpers/strings.dart';
import 'package:reveria/core/routing/app_router.dart';
import 'package:reveria/core/routing/routes.dart';
import 'package:reveria/core/theming/colors.dart';

class Reveria extends StatelessWidget {
  const Reveria({super.key, required this.appRouter});
  final AppRouter appRouter ;

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      child: MaterialApp(
        title: Strings.appTitle,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: ColorsManager.primaryColorTeal,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.login,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  
  }
}