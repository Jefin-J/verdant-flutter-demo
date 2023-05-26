import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "My Title",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/flutter-logo.png',
                      height: 50,
                    ),
                    Text("Lorem Ipsum fdd dfghdh ddfgd fg")
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
