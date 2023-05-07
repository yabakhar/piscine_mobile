import 'package:flutter/material.dart';

class MyFirstProj extends StatefulWidget {
  MyFirstProj({super.key});

  @override
  State<MyFirstProj> createState() => _MyFirstProjState();
}

class _MyFirstProjState extends State<MyFirstProj> {
  int initialValue = 0;
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                initialValue % 2 == 0 ? "A Simple Text" : "Hello World!",
                style: const TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    print("Button pressed");
                    initialValue++;
                  });
                },
                child: Text("Click Me"),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 2, color: Colors.blue),
                ))
          ],
        ),
      ),
    );
  }
}
