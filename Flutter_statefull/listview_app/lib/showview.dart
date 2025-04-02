import 'package:flutter/material.dart';
import 'package:listview_app/model/chest.dart';
import 'package:listview_app/model/animallist.dart';
import 'package:listview_app/view/insert_list.dart';
import 'package:listview_app/view/list_animal.dart';

class Showview extends StatefulWidget {
  const Showview({super.key});

  @override
  State<Showview> createState() => _ShowviewState();
}

class _ShowviewState extends State<Showview>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  late List<Animallist> animalList;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    animalList = [];
    addFirst();
  }

  addFirst() {
    animalList.add(
      Animallist(
        animalList: '벌',
        fly: true,
        iconImgPath: 'images/bee.png',
        species: '곤충',
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listview Test')),

      body: TabBarView(
        controller: controller,
        children: [
          ListAnimal(animaLList: animalList),
          InsertList(animaLList: animalList),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.amber,
        height: 70,
        child: TabBar(
          controller: controller,
          labelColor: Colors.blue,
          indicatorColor: Colors.red,
          indicatorWeight: 10,
          tabs: [Tab(text: 'List'), Tab(text: '추가')],
        ),
      ),
    );
  }

  rebuildData() {
    if (Chest.action == true) {
      animalList.add(
        Animallist(
          animalList: Chest.animalList,
          fly: Chest.fly,
          iconImgPath: Chest.iconImgpath,
          species: Chest.species,
        ),
      );
      Chest.action = false;
    }
  }
}
