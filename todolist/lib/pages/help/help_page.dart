import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  static const String route = "help-page";

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.help_outline,
                size: 60,
                color: color.primary,
              ),
              Text(
                "In this app you can add as many todos as you like.\nPush the + button to add a new todo.\nYou can edit the todo by pressing on the text!",
                textAlign: TextAlign.center,
                style: text.bodyLarge,
              ),
              Text(
                "Made by Andrés Lowenstein",
                textAlign: TextAlign.center,
                style: text.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
