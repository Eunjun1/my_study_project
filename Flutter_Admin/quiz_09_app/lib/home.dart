import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List num;
  int nums = 2;
  late int seletNum;
  late TextEditingController _guguDan;

  @override
  void initState() {
    super.initState();
    seletNum = 0;
    num = List.generate(8, (index) => nums++);
    _guguDan = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${num[seletNum]}단')),

      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: CupertinoPicker(
                itemExtent: 50,
                scrollController: FixedExtentScrollController(initialItem: 0),
                onSelectedItemChanged: (value) {
                  seletNum = value;
                  guguDan(num[seletNum]);
                  setState(() {});
                },
                children: List.generate(
                  num.length,
                  (index) => Center(child: Text('${num[index]}단')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: SizedBox(
                width: 200,
                child: CupertinoTextField(
                  controller: _guguDan,
                  maxLines: 10,
                  textAlign: TextAlign.left,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  readOnly: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  guguDan(int num) {
    String guguDan = "";
    for (int i = 1; i <= 9; i++) {
      guguDan += '$num * $i = ${num * i}\n';
    }
    _guguDan.text = guguDan;
    setState(() {});
  }
}
