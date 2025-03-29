import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: const Text(
          "Welcome to DocPilot!",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
