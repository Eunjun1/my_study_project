import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({super.key});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  // ======== Property =========
  late TextEditingController textEditingController;
  late bool switchCart;
  late bool switchClock;
  late bool switchPencil;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    switchCart = true;
    switchClock = false;
    switchPencil = false;
    Message.iconImgPath = 'images/cart.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add View')),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('구매'),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Switch(
                        value: switchCart,
                        onChanged: (value) {
                          value = switchCart;
                          if (switchCart == false) {
                            Message.iconImgPath = "images/cart.png";
                            switchCart = true;
                            switchClock = false;
                            switchPencil = false;
                          }
                          if (switchClock == false && switchPencil == false) {
                            switchCart = true;
                          }
                          setState(() {});
                        },
                      ),
                    ),
                    Image.asset('images/cart.png', width: 50),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('약속'),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Switch(
                        value: switchClock,
                        onChanged: (value) {
                          value = switchClock;
                          if (switchClock == false) {
                            Message.iconImgPath = "images/clock.png";
                            switchCart = false;
                            switchClock = true;
                            switchPencil = false;
                          } else {
                            switchClock = false;
                            switchCart = true;
                            Message.iconImgPath = "images/cart.png";
                          }
                          setState(() {});
                        },
                      ),
                    ),
                    Image.asset('images/clock.png', width: 50),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('스터디'),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Switch(
                        value: switchPencil,
                        onChanged: (value) {
                          value = switchPencil;
                          if (switchPencil == false) {
                            Message.iconImgPath = "images/pencil.png";
                            switchCart = false;
                            switchClock = false;
                            switchPencil = true;
                          } else {
                            switchPencil = false;
                            switchCart = true;
                            Message.iconImgPath = "images/cart.png";
                          }
                          setState(() {});
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset('images/pencil.png', width: 50),
                    ),
                  ],
                ),
              ),

              TextField(
                controller: textEditingController,
                decoration: InputDecoration(labelText: '목록을 입력하세요.'),
                keyboardType: TextInputType.text,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (textEditingController.text.trim().isNotEmpty) {
                      addList();
                    }
                    Navigator.pop(context);
                  },
                  child: Text('입력'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ======== Functions ========

  addList() {
    Message.workList = textEditingController.text;
    Message.iconImgPath = Message.iconImgPath;
    Message.action = true;
  }
}
