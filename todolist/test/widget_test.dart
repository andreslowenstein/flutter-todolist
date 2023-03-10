import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todolist/pages/home/cubit/todo_cubit.dart';
import 'package:todolist/pages/home/home_page.dart';
import 'package:todolist/routes/routes.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolist/repository/todo_repository.dart';
import 'package:bloc_test/bloc_test.dart';

class MockRepo extends Mock implements TodoRepository {
  final MockFirebase instance;
  MockRepo({required this.instance});
}

class MockFirebase extends Mock implements FirebaseFirestore {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockTodoCubit extends MockCubit<TodoState> implements TodoCubit {
  final MockRepo repo;

  MockTodoCubit(this.repo);
}

void main() {
  testWidgets("add a todo", (WidgetTester tester) async {
    MockFirebase mockF = MockFirebase();
    MockRepo repo = MockRepo(instance: mockF);
    MockTodoCubit dummyCubit = MockTodoCubit(repo);
    // final mockObserver = MockNavigatorObserver();

    await tester.pumpWidget(BlocProvider<TodoCubit>(
      create: (_) => dummyCubit,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: MediaQuery(
          data: const MediaQueryData(),
          child: MaterialApp(
            navigatorObservers: [MockNavigatorObserver()],
            routes: AppRoutes.routesArray,
            home: const HomePage(
              todoModified: "",
              todos: [],
            ),
          ),
        ),
      ),
    ));

    final addNewTodo = find.byKey(const ValueKey("addNewTodo"));
    final textField = find.byKey(const ValueKey("todoTextField"));
    final continueBtn = find.byKey(const ValueKey("continueBtn"));

    await tester.tap(addNewTodo);
    await tester.pumpAndSettle();

    expect(find.text("New todo"), findsOneWidget);
    await tester.enterText(textField, "Todo agregado desde el testing");
    expect(find.text("Todo agregado desde el testing"), findsOneWidget);

    // await tester.tap(continueBtn);
  });
}
