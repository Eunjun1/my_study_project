import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';
import 'package:listview_todo_app/model/todo_list.dart';

class TableList extends StatefulWidget {
  const TableList({super.key});

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  // ======== Property ========
  late List<TodoList> todoList;

  @override
  void initState() {
    super.initState();
    todoList = [];

    addData();
  }

  // ======== addData Function =========

  addData() {
    todoList.add(TodoList(iconImgPath: 'images/cart.png', workList: '책 구매'));
    todoList.add(TodoList(iconImgPath: 'images/clock.png', workList: '철수와 약속'));
    todoList.add(
      TodoList(iconImgPath: 'images/pencil.png', workList: '스터디 준비하기'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main View'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/insert',
              ).then((value) => rebuildData());
            },
            icon: Icon(Icons.add_outlined),
          ),
          IconButton(
            onPressed: () {
              removeView();
            },
            icon: Icon(Icons.remove_outlined),
          ),
        ],
      ),

      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return Dismissible(
              direction: DismissDirection.horizontal,
              key: ValueKey(todoList[index]),
              onDismissed: (direction) {
                todoList.remove(todoList[index]);
                setState(() {});
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Icon(Icons.delete_forever, size: 50),
              ),
              child: GestureDetector(
                onTap: () {
                  Message.iconImgPath = todoList[index].iconImgPath;
                  Message.workList = todoList[index].workList;

                  Navigator.pushNamed(context, '/detail');
                },
                child: SizedBox(
                  height: 100,
                  child: Card(
                    color:
                        index % 2 == 0
                            ? const Color.fromARGB(255, 201, 228, 251)
                            : const Color.fromARGB(255, 249, 227, 158),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            todoList[index].iconImgPath,
                            color:
                                todoList[index].iconImgPath ==
                                        'images/pencil.png'
                                    ? index % 2 > 0
                                        ? const Color.fromARGB(
                                          255,
                                          255,
                                          183,
                                          178,
                                        )
                                        : const Color.fromARGB(
                                          255,
                                          147,
                                          197,
                                          91,
                                        )
                                    : null,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(todoList[index].workList),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  rebuildData() {
    if (Message.action == true) {
      todoList.add(
        TodoList(iconImgPath: Message.iconImgPath, workList: Message.workList),
      );
      Message.action = false;
    }

    setState(() {});
  }

  removeView() {
    if (todoList.isNotEmpty) {
      todoList.removeLast();
      setState(() {});
    }
  }
}
