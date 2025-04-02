import 'package:flutter/material.dart';
import 'package:listview_app/model/animallist.dart';

class ListAnimal extends StatefulWidget {
  final List<Animallist> animaLList;
  const ListAnimal({super.key, required this.animaLList});

  @override
  State<ListAnimal> createState() => _ListAnimalState();
}

class _ListAnimalState extends State<ListAnimal> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: widget.animaLList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _showDialog(context, index),
              child: Card(
                child: Row(
                  children: [
                    Image.asset(
                      widget.animaLList[index].iconImgPath,
                      width: 90,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(widget.animaLList[index].animalList),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _showDialog(BuildContext context, index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(widget.animaLList[index].animalList),
          content: Text(
            '이 동물은 ${widget.animaLList[index].species}입니다.\n이 동물은 ${widget.animaLList[index].fly == true ? '날수 있습니다.' : '날수 없습니다.'}',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }
}
