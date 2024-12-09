
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reveria/core/routing/app_router.dart';
import 'package:reveria/reveria_app.dart';



void main()async 
{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Reveria(appRouter: AppRouter()));

}
