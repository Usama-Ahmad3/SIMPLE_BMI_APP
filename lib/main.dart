
import 'package:bmi_app/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'FontHead',
        primarySwatch: Colors.orange,
      ),
      home: const Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtControler = TextEditingController();
  var inchControler = TextEditingController();
  var fetControler = TextEditingController();
  var result = "";
  var bgcolor = Colors.green.shade100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI App'),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Your BMI',
                  style: TextStyle(fontSize: 44, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 17,
                ),
                TextField(
                  controller: wtControler,
                  decoration: InputDecoration(
                      label: const Text('Enter Your Weight In KGs'),
                      prefixIcon: const Icon(Icons.line_weight),
                      hintText: '00',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: fetControler,
                  decoration: InputDecoration(
                      label: const Text('Enter Your Height In Feets'),
                      prefixIcon: const Icon(Icons.line_weight),
                      hintText: '00',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: inchControler,
                  decoration: InputDecoration(
                      label: const Text('Enter Your Height In Inches'),
                      prefixIcon: const Icon(Icons.line_weight),
                      hintText: '00',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 17,
                ),
                ElevatedButton(
                    onPressed: () {
                      var weight = wtControler.text.toString();
                      var inch = inchControler.text.toString();
                      var feet = fetControler.text.toString();
                      var msg = "";
                      if (weight != "" && inch != "" && feet != "") {
                        var wt = int.parse(weight);
                        var inc = int.parse(inch);
                        var ft = int.parse(feet);
                        var tinch = (ft * 12) + inc;

                        var tcm = tinch * 2.54;

                        var tM = tcm / 100;

                        var bmi = wt / (tM * tM);
                        if (bmi > 25) {
                          msg = "You're Over Weight";
                          bgcolor = Colors.redAccent.shade100;
                        } else if (bmi < 18) {
                          msg = "You're Under Weight";
                          bgcolor = Colors.deepOrangeAccent;
                        } else {
                          msg = "You're Healthy";
                          bgcolor = Colors.pinkAccent.shade100;
                        }

                        setState(() {
                          result =
                              "$msg \nYour BMI Is: ${bmi.toStringAsFixed(2)}";
                        });
                      } else {
                        result = "Please Fill All The Blanks!";
                        setState(() {});
                      }
                    },
                    child: const Text(
                      'Calculate',
                      style: TextStyle(fontFamily: 'Crimson'),
                    )),
                const SizedBox(
                  height: 13,
                ),
                Text(
                  result,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}