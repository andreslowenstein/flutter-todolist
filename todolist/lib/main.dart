import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/pages/home/cubit/todo_cubit.dart';
import 'package:todolist/pages/home/home_page_controller.dart';
import 'package:todolist/repository/todo_repository.dart';
import 'package:todolist/routes/routes.dart';
import 'package:todolist/theme/theme_light.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    BlocProvider(
      create: (_) => TodoCubit(TodoRepository()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      routes: AppRoutes.routesArray,
      home: const HomePageController(),
    );
  }
}
