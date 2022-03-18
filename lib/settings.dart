import 'package:flutter/material.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.settings),
            color: Colors.white,
          ),
          title: const Text("Settings",
              style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 56, 56, 56)),
      backgroundColor: const Color.fromARGB(255, 200, 200, 200),
    );
  }
}
