import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/pages/home/cubit/todo_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.todos,
    required this.todoModified,
  });

  final List<Todo> todos;
  final String? todoModified;

  void onTap(BuildContext context, String id, String todo) {
    BlocProvider.of<TodoCubit>(context).updateTodo(id, todo);
  }

  void markedAsDone(BuildContext context, String id) {
    BlocProvider.of<TodoCubit>(context).markedAsDone(id);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        content: const Text("Marked as done!"),
      ),
    );
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
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
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          autofocus: false,
                          initialValue: todo.todo,
                          style: text.titleMedium,
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
                              child: LiteRollingSwitch(
                                onDoubleTap: () {},
                                onSwipe: () {},
                                onTap: () {},
                                value: false,
                                textOn: '',
                                textOff: 'Mark as done',
                                colorOn: color.primary,
                                colorOff: color.primary,
                                iconOn: Icons.done,
                                iconOff: Icons.done,
                                textSize: 10.0,
                                onChanged: (bool state) {
                                  Timer(
                                    const Duration(seconds: 1),
                                    () => markedAsDone(context, todo.id),
                                  );
                                },
                              ),
                            )
                          : Animate(
                              effects: const [FadeEffect()],
                              child: Expanded(
                                flex: 1,
                                child: InkWell(
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    ),
                                    onTap: () {
                                      onTap(context, todo.id, todoModified!);
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
