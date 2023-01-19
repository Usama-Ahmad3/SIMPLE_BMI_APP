import 'dart:async';

import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MyHomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Splash Screen"),
      ),
      body: Container(
        color: Colors.teal.shade100,
        child: const Center(
            child: Text(
          'Welcome',
          style: TextStyle(
              fontSize: 50, fontFamily: 'Crimson', fontWeight: FontWeight.w800),
        )),
      ),
    );
  }
}
