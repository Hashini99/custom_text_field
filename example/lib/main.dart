import 'package:custom_text_field_plugin/custom_text_field_plugin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Using Custom Plugin')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  controller: textController,
                  hint: "Enter Name",
                  labelText: "Name",
                  prefixIcon: Icon(Icons.person, color: Colors.black),
                  borderColor: Colors.green,
                  fillColor: Colors.white,
                  borderWidth: .9,
                  obscureText: true,
                  onChanged: (value) {
                    print("Text: $value");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
