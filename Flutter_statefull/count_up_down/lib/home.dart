import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Count Up & Down', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('현재 클릭 수는 $count입니다.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FloatingActionButton(
                    onPressed: () => _countUp(),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: CircleBorder(),
                    child: Icon(Icons.add),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FloatingActionButton(
                    onPressed: () => _countDown(),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: CircleBorder(),
                    child: Icon(Icons.remove),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton(
              onPressed: () => _countUp(),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: CircleBorder(),
              child: Icon(Icons.add),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton(
              onPressed: () => _countDown(),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: CircleBorder(),
              child: Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }

  _countUp() {
    count++;
    setState(() {});
  }
  _countDown() {
    count > 0 ? count-- : count = 0;
    setState(() {});
  }
}
