import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //-------- Property --------
  //late List<String> todoList;

  late List<int> todoList;

  @override
  void initState() {
    super.initState();
    todoList = [];
    addData();
  }

  // -------- addData Function --------
  addData() {
    
    
    /*
    todoList.add('Jmages');
    todoList.add('Cathy');
    todoList.add('Martin');
    todoList.add('유비');
    todoList.add('관우');
    todoList.add('장비');
    todoList.add('피카츄');
    todoList.add('라이츄');
    todoList.add('꼬부기');
    todoList.add('조조');
    todoList.add('여포');
    todoList.add('동탁');
    */


    for (int i = 1; i <= 1000; i++) {
      todoList.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ======== AppBar ========
      appBar: AppBar(title: Text('Main View')),

      // ======== Body ========
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return SizedBox(
              
              height: 100,

              // ======== Card ========
              child: Card(
                color: Colors.lightBlueAccent,
                surfaceTintColor: Colors.amber,
                child: Center(
                  child: Text(
                    
                    todoList[index].toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
