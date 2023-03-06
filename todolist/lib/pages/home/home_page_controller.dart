import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/pages/home/cubit/todo_cubit.dart';
import 'package:todolist/pages/home/home_page.dart';

class HomePageController extends StatelessWidget {
  const HomePageController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      bloc: BlocProvider.of<TodoCubit>(context)..getTodos(),
      builder: ((context, state) {
        if (state is TodoLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is TodoError) {
          return Text(state.error);
        }
        state as TodoLoaded;
        return HomePage(
          todos: state.todos,
          todoModified: state.todoModified,
        );
      }),
    );
  }
}
