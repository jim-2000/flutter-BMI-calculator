import 'package:flutter/material.dart';
import 'package:mybmi/utils/app_constain.dart';
import 'package:mybmi/widgets/left_bar.dart';
import 'package:mybmi/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _widthController = TextEditingController();
  double _bmiResult = 0;
  String TextResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _widthController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_widthController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  print(_bmiResult);
                  if (_bmiResult > 25) {
                    TextResult = " You\'re over weight";
                  } else if (_bmiResult > 18.5 && _bmiResult <= 25) {
                    TextResult = " You\'re normal weight";
                  } else {
                    TextResult = "You\re under weight ";
                  }
                });
              },
              child: Text(
                "Calculate",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: accentHexColor,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(
                    fontSize: 90,
                    fontWeight: FontWeight.bold,
                    color: accentHexColor),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: TextResult.isNotEmpty,
              child: Text(
                TextResult,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: accentHexColor,
                ),
              ),
            ),
            SizedBox(height: 10),
            LeftBar(barWidth: 50),
            SizedBox(height: 10),
            LeftBar(barWidth: 40),
            SizedBox(height: 10),
            LeftBar(barWidth: 30),
            SizedBox(height: 50),
            RightBar(barWidth: 50),
            SizedBox(height: 10),
            RightBar(barWidth: 80),
            SizedBox(height: 10),
            RightBar(barWidth: 50),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
