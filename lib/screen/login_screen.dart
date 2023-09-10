import 'package:flutter/material.dart';
import 'package:monitor_app/screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(''),),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameCon,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                label: Text('Username'),
                hintText: "Please type username",
              ),
            ),
            TextField(
              obscureText: true,
              controller: passwordCon,
              decoration: const InputDecoration(
                label: Text('Password'),
                hintText: "Please type password",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(
                      HomeScreen.routeName,
                      arguments: usernameCon.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size.fromHeight(40), // NEW
                ),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
