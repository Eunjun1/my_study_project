import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController heightController;
  late TextEditingController weightController;
  late String bmiResult;
  late String bmiImages;

  @override
  void initState() {
    super.initState();
    heightController = TextEditingController();
    weightController = TextEditingController();
    bmiResult = "";
    bmiImages = 'bmi.png';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),

      child: Scaffold(
        appBar: AppBar(title: Text('BMI 계산기')),

        body: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Column(
                    children: [
                      TextField(
                        controller: heightController,
                        decoration: InputDecoration(
                          labelText: '신장을 입력하세요. (단위 : cm)',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      TextField(
                        controller: weightController,
                        decoration: InputDecoration(
                          labelText: '체중을 입력하세요. (단위 : kg)',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () => onClick(),
                        child: Text('BMI 계산'),
                      ),
                      SizedBox(height: 20),
                      Text(
                        bmiResult,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Image.asset('images/$bmiImages'),
          ],
        ),
      ),
    );
  }

  onClick() {
    if (heightController.text.trim().isEmpty ||
        weightController.text.trim().isEmpty ||
        heightController.text == '0' ||
        weightController.text == '0') {
      errorSnackBar();
      bmiResult = '';
    } else {
      String bmi = '';
      double height = double.parse(heightController.text);
      double weight = double.parse(weightController.text);
      double sum = weight / ((height / 100) * (height / 100));
      String bmisum = sum.toStringAsFixed(1);
      if (sum <= 18.4) {
        bmi = '저체중';
        bmiImages = 'underweight.png';
      } else if (sum <= 22.9) {
        bmi = '정상 체중';
        bmiImages = 'normal.png';
      } else if (sum <= 24.9) {
        bmi = '과체중';
        bmiImages = 'risk.png';
      } else if (sum <= 29.9) {
        bmi = '비만';
        bmiImages = 'overweight.png';
      } else {
        bmi = '고도 비만';
        bmiImages = 'obese.png';
      }

      bmiResult = '귀하의 bmi 지수는 \n$bmisum이고\n $bmi 입니다.';
    }
    setState(() {});
  }

  errorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("다시 입력해 주세요.")],
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}
