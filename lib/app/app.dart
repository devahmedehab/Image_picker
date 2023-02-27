
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/data/controller/home_cubit/home_cubit.dart';
import '../presentation/resources/routs_manager.dart';
import '../presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {

  //named constructor
  MyApp._internal();

  int appState =0;

  static final MyApp _instance =MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance;  //factory

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (BuildContext context)=>HomeCubit()
          )
        ],
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    ));

  }
}


