import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Tracker for the image
  bool isOn = false;

  // ON OFF Switch
  void toggleBulb() {
    setState(() {
      isOn = !isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Image Changer"),
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: toggleBulb,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: isOn ? Colors.yellow : Colors.grey[800],
          child:  Column(
            children: [
              Center(
                child: Container(
                  height: 500,
                  width: 500,
                  child: Image.asset(
                    isOn ? 'images/lightbulb-on.jpg': 'images/lightbulb-off.jpg',
                  ),
                ),
              ),
              Text('Tap to change the Image, This app was developed while talking with Rubeena',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
