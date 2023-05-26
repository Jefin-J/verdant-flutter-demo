import 'package:flutter/material.dart';
import 'package:login_demo/screens/home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passWordController = TextEditingController();

  bool isHidden = true;

  void _handleLogin() {
    if (usernameController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Username can't be empty")));
      return;
    }

    if (passWordController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Password can't be empty")));
      return;
    }

    if (passWordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Password must be atleast 6 characters")));
      return;
    }

    if (usernameController.text == 'admin' &&
        passWordController.text == '123456') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login Success")));

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Homepage()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Wrong Credentials")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Image.asset(
                    'assets/flutter-logo.png',
                    height: 200,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Username',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: passWordController,
                    obscureText: isHidden,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Password',
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            isHidden = !isHidden;
                          });
                        },
                        icon: Icon(
                            isHidden ? Icons.visibility : Icons.visibility_off),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _handleLogin,
                  child: const Text('LOGIN'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
