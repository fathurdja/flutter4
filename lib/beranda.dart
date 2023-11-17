import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beranda"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/");
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
        backgroundColor: Colors.limeAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: const Column(
          children: [],
        ),
      ),
    );
  }
}
