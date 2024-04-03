import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:temp1/splesh.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: splesh(),
      title: 'MyHomePage',
      color: Colors.purple,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weController = TextEditingController();
  var heController = TextEditingController();
  var inController = TextEditingController();
  var textColor;
  var msg;

  var _result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Center(
            child: Text(
          'BODY MASS INDEX',
          style: TextStyle(color: Colors.black87),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'B',
                    style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    'M',
                    style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade800),
                  ),
                ),
                Center(
                  child: Text(
                    'I',
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 40)),
            TextField(
              controller: weController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  //focusColor: Colors.purple,
                  // filled: true,
                  //fillColor: Colors.purple,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  suffixText: 'Kg.',
                  prefixIcon: FaIcon(Icons.line_weight),
                  prefixIconColor: Colors.black,
                  hintText: 'Enter Your Weight in Kg.'),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            TextField(
              controller: heController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  suffixText: 'feet',
                  prefixIcon: FaIcon(Icons.height),
                  prefixIconColor: Colors.black,
                  hintText: 'Enter Your Height in feets'),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            TextField(
              controller: inController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  suffixText: 'inches',
                  prefixIcon: FaIcon(Icons.height),
                  prefixIconColor: Colors.black,
                  hintText: 'Enter Your Height in Inches'),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                onPressed: () {
                  var wt = weController.text.toString();
                  var ft = heController.text.toString();
                  var inch = inController.text.toString();

                  if (wt != "" && ft != "" && inch != "") {
                    //BMI calculation
                    //covert all the values in integer
                    var iwt = int.parse(wt);
                    var ift = int.parse(ft);
                    var iinch = int.parse(inch);

                    //convert ft into inches
                    //tinch = total inch

                    var tInch = (ift * 12) + iinch;
                    //convert inches in cm
                    // 1 inch = 2.54 cm
                    var tCm = tInch * 2.54;
                    //convert cm into meter, devide by 100
                    var tM = tCm / 100;
                    //calculate BMI
                    //BMI is weight in kilograms divided by height in meters squared
                    var bmi = iwt / (tM * tM);
                    _result = "Your BMI is : ${bmi.toStringAsFixed(2)}";
                    //var msg;

                    if (bmi > 25) {
                      msg = "You are OverWeight!!";
                      textColor = Colors.red;
                    } else if (bmi < 18) {
                      msg = "You are UnderWeight!!";
                      textColor = Colors.pinkAccent;
                    } else {
                      msg = "You are Healthy";
                      textColor = Colors.green;
                    }
                    setState(() {});
                  } else {
                    _result = "Please Fill all the Required Blanks";
                    setState(() {});
                  }
                },
                child: Text(
                  'Calculate',
                  style: TextStyle(color: Colors.black),
                )),
            Padding(padding: EdgeInsets.only(top: 30)),
            Text(
              '$_result',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              '$msg',
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
