import 'package:flutter/material.dart';
import 'package:todolist/pages/add_todo/add_todo_page.dart';
import 'package:todolist/pages/help/help_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routesArray =
      <String, WidgetBuilder>{
    AddTodoPage.route: (_) => const AddTodoPage(),
    HelpPage.route: (_) => const HelpPage(),
  };
}
