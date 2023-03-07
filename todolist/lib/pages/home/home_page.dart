import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:load_switch/load_switch.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/pages/add_todo/add_todo_page.dart';
import 'package:todolist/pages/help/help_page.dart';
import 'package:todolist/pages/home/cubit/todo_cubit.dart';
import 'package:cool_alert/cool_alert.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.todos,
    required this.todoModified,
  });

  final List<Todo> todos;
  final String? todoModified;

  void updateTodo(BuildContext context, String id, String todo) {
    BlocProvider.of<TodoCubit>(context).updateTodo(id, todo);
  }

  void markedAsDone(BuildContext context, String id) {
    BlocProvider.of<TodoCubit>(context).markedAsDone(id);

    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      title: "",
      widget: Column(
        children: const [
          Text(
            "Todo marked as done!",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      confirmBtnColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }

  Future<bool> _getFuture() async {
    await Future.delayed(const Duration(seconds: 2));
    return !false;
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    var text = Theme.of(context).textTheme;
    final cubit = BlocProvider.of<TodoCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.primary,
        title: const Text("Todolist App"),
        leading: IconButton(
            key: const Key("goToHelpPage"),
            onPressed: () {
              Navigator.pushNamed(context, HelpPage.route);
            },
            icon: const Icon(Icons.help_outline)),
        actions: <Widget>[
          IconButton(
            key: const Key("addNewTodo"),
            icon: const Icon(Icons.add),
            tooltip: 'Show Snackbar',
            onPressed: () {
              Navigator.pushNamed(context, AddTodoPage.route);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: todos.isEmpty
            ? const Center(
                child: Text("There are no todos for now, add a new one!"),
              )
            : ListView.separated(
                separatorBuilder: (ctx, i) => const Divider(
                  endIndent: 15,
                  indent: 15,
                  height: 1,
                  color: Colors.grey,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: todos.length,
                itemBuilder: ((context, index) {
                  final todo = todos[index];
                  return SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 5,
                              child: TextFormField(
                                autofocus: false,
                                initialValue: todo.todo,
                                style: text.titleSmall,
                                decoration: const InputDecoration(
                                  enabledBorder: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  cubit.todoModified(value);
                                },
                              ),
                            ),
                            todoModified == null
                                ? Expanded(
                                    flex: 1,
                                    child: LoadSwitch(
                                      height: 30,
                                      value: false,
                                      trueColor: Colors.transparent,
                                      spinColor: color.primary,
                                      loadingBlurColor: Colors.transparent,
                                      neutralColor: Colors.transparent,
                                      future: _getFuture,
                                      onChange: (v) {
                                        Timer(
                                          const Duration(seconds: 1),
                                          () => markedAsDone(context, todo.id),
                                        );
                                      },
                                      onTap: (v) {},
                                    ))
                                : Animate(
                                    effects: const [FadeEffect()],
                                    child: Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                          child: const Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          ),
                                          onTap: () {
                                            updateTodo(context, todo.id,
                                                todoModified!);
                                          }),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
      ),
    );
  }
}
