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
  testWidgets("go to help page", (WidgetTester tester) async {
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

    final goToHelpPage = find.byKey(const ValueKey("goToHelpPage"));

    await tester.tap(goToHelpPage);
    await tester.pumpAndSettle();

    expect(find.text("Made by Andrés Lowenstein"), findsOneWidget);
  });
}
