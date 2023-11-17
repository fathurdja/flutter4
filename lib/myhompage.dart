import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomepage extends StatelessWidget {
  const MyHomepage({super.key, required this.prefs});
  final SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    void save() async {
      await prefs.setString("email", emailController.text);
      await prefs.setString("password", passwordController.text);
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Instagram"),
          backgroundColor: Colors.limeAccent,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                title: "Email",
                controller: emailController,
              ),
              const SizedBox(
                height: 16.0,
              ),
              CustomTextField(
                title: "Password",
                controller: passwordController,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      Navigator.pushReplacementNamed(context, "/beranda");
                      save();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Email dan Password harus diisi")));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  child: const Text(
                    "Masuk",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.title, required this.controller});
  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 6.0,
        ),
        Text(title),
        TextFormField(
          controller: controller,
          decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              )),
        ),
        const SizedBox(
          height: 6.0,
        )
      ],
    );
  }
}
