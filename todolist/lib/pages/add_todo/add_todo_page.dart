import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/pages/home/cubit/todo_cubit.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  static const String route = "add-todo-page";

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  void onPressed(BuildContext context, String todo) {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    BlocProvider.of<TodoCubit>(context).newTodo(todo);

    Navigator.pop(context);

    CoolAlert.show(
      context: context,
      type: CoolAlertType.success,
      text: "Todo created!",
      title: "Success",
      confirmBtnColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    var text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("New todo"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add a new todo here!",
                style: text.titleMedium,
              ),
              TextFormField(
                key: const Key("todoTextField"),
                controller: _controller,
                validator: (value) {
                  if (value == "") {
                    return "You must complete this field";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  fillColor: Colors.grey,
                  focusColor: Colors.white,
                  hintText: "Todo",
                  filled: true,
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: MaterialButton(
                  key: const Key("continueBtn"),
                  color: color.primary,
                  height: 30,
                  onPressed: () {
                    onPressed(context, _controller.text);
                  },
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: text.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
