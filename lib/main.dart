import 'package:flutter/material.dart';
import 'package:stacked_architecture_project/app/app.locator.dart';
import 'package:stacked_architecture_project/app/app.router.dart';
import 'package:stacked_architecture_project/ui/views/home/home_view.dart';
import 'package:stacked_services/stacked_services.dart';

Future main() async{
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}

