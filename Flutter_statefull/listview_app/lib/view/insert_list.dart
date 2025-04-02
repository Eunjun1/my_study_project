import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:listview_app/model/animallist.dart';

import 'package:listview_app/model/chest.dart';

class InsertList extends StatefulWidget {
  final List<Animallist> animaLList;
  const InsertList({super.key, required this.animaLList});
  @override
  State<InsertList> createState() => _InsertListState();
}

enum Spec { A, B, C, D, E }

class _InsertListState extends State<InsertList> {
  late TextEditingController textEditingController;
  late Spec _spec = Spec.A;
  late bool flycheck;
  late List<AnimalImg> animalImg;
  late String name;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    flycheck = false;
    animalImg = [];
    name = "";
    addAnimal();
  }

  addAnimal() {
    animalImg.add(AnimalImg(animalImgPath: 'images/bee.png'));
    animalImg.add(AnimalImg(animalImgPath: 'images/cat.png'));
    animalImg.add(AnimalImg(animalImgPath: 'images/cow.png'));
    animalImg.add(AnimalImg(animalImgPath: 'images/dog.png'));
    animalImg.add(AnimalImg(animalImgPath: 'images/fox.png'));
    animalImg.add(AnimalImg(animalImgPath: 'images/monkey.png'));
    animalImg.add(AnimalImg(animalImgPath: 'images/pig.png'));
    animalImg.add(AnimalImg(animalImgPath: 'images/wolf.png'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(labelText: '이름을 입력하세요.'),
                keyboardType: TextInputType.text,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: RadioListTile(
                        title: Text('양서류'),
                        value: Spec.A,
                        groupValue: _spec,
                        onChanged: (Spec? value) {
                          setState(() {
                            _spec = value!;
                            Chest.species = "양서류";
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: RadioListTile(
                        title: Text('파충류'),
                        value: Spec.B,
                        groupValue: _spec,
                        onChanged: (Spec? value) {
                          setState(() {
                            _spec = value!;
                            Chest.species = "파충류";
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: RadioListTile(
                        title: Text('포유류'),
                        value: Spec.C,
                        groupValue: _spec,
                        onChanged: (Spec? value) {
                          setState(() {
                            _spec = value!;
                            Chest.species = "포유류";
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: RadioListTile(
                        title: Text('곤충'),
                        value: Spec.D,
                        groupValue: _spec,
                        onChanged: (Spec? value) {
                          setState(() {
                            _spec = value!;
                            Chest.species = "곤충";
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('날 수 있습니까?'),
                  Checkbox(
                    value: flycheck,
                    onChanged: (value) {
                      if (flycheck == false) {
                        setState(() {
                          Chest.fly = true;
                          flycheck = value!;
                        });
                      } else {
                        Chest.fly = false;
                        flycheck = value!;
                        setState(() {});
                      }
                    },
                  ),
                ],
              ),

              // SizedBox(
              //   height: 100,
              //   child: ListView(
              //     scrollDirection: Axis.horizontal,
              //     children: [
              //       GestureDetector(
              //         onTap: () {
              //           Chest.iconImgpath = animalImg[0].animalImgPath;
              //           name = "벌";
              //         setState(() {});
              //         },
              //         child: Image.asset(animalImg[0].animalImgPath)),
              //       GestureDetector(
              //         onTap: () {
              //           Chest.iconImgpath = animalImg[0].animalImgPath;
              //           name = "벌";
              //         setState(() {});
              //         },
              //         child: Image.asset(animalImg[1].animalImgPath)),
              //       Image.asset(animalImg[2].animalImgPath),
              //       Image.asset(animalImg[3].animalImgPath),
              //       Image.asset(animalImg[4].animalImgPath),
              //       Image.asset(animalImg[5].animalImgPath),
              //       Image.asset(animalImg[6].animalImgPath),
              //       Image.asset(animalImg[7].animalImgPath),
              //     ],
              //   ),
              // ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Chest.iconImgpath = animalImg[0].animalImgPath;
                        name = "벌";
                        setState(() {});
                      },
                      icon: Image.asset(animalImg[0].animalImgPath, width: 70),
                    ),
                    IconButton(
                      onPressed: () {
                        Chest.iconImgpath = animalImg[1].animalImgPath;
                        name = "고양이";
                        setState(() {});
                      },
                      icon: Image.asset(animalImg[1].animalImgPath, width: 70),
                    ),
                    IconButton(
                      onPressed: () {
                        Chest.iconImgpath = animalImg[2].animalImgPath;
                        name = "소";
                        setState(() {});
                      },
                      icon: Image.asset(animalImg[2].animalImgPath, width: 70),
                    ),
                    IconButton(
                      onPressed: () {
                        Chest.iconImgpath = animalImg[3].animalImgPath;
                        name = "강아지";
                        setState(() {});
                      },
                      icon: Image.asset(animalImg[3].animalImgPath, width: 70),
                    ),
                    IconButton(
                      onPressed: () {
                        Chest.iconImgpath = animalImg[4].animalImgPath;
                        name = "여우";
                        setState(() {});
                      },
                      icon: Image.asset(animalImg[4].animalImgPath, width: 70),
                    ),
                    IconButton(
                      onPressed: () {
                        Chest.iconImgpath = animalImg[5].animalImgPath;
                        name = "원숭이";
                        setState(() {});
                      },
                      icon: Image.asset(animalImg[5].animalImgPath, width: 70),
                    ),
                    IconButton(
                      onPressed: () {
                        Chest.iconImgpath = animalImg[6].animalImgPath;
                        name = "돼지";
                        setState(() {});
                      },
                      icon: Image.asset(animalImg[6].animalImgPath, width: 70),
                    ),
                    IconButton(
                      onPressed: () {
                        Chest.iconImgpath = animalImg[7].animalImgPath;
                        name = "늑대";
                        setState(() {});
                      },
                      icon: Image.asset(animalImg[7].animalImgPath, width: 70),
                    ),
                  ],
                ),
              ),
              Text(name),
              ElevatedButton(
                onPressed: () => _showDialog(context),
                child: Text('동물 추가하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    Chest.animalList = textEditingController.text;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('동물 추가하기'),
          content: Text(
            '이 동물은 ${Chest.animalList}입니다.\n또 동물의 종류는 ${Chest.species}입니다.\n이 동물은 ${Chest.fly == true ? '날수 있습니다.' : '날수 없습니다.'}\n이 동물을 추가하시겠습니까?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (Chest.iconImgpath == "" ||
                    Chest.animalList == "" ||
                    Chest.species == "") {
                  Navigator.pop(context);
                  errorMessage(context);
                } else {
                  Chest.action = true;
                  rebuildData();
                  Navigator.pop(context);
                }
              },
              child: Text('확인'),
            ),
            TextButton(
              onPressed: () {
                Chest.action = false;
                Navigator.pop(context);
              },
              child: Text('아니요'),
            ),
          ],
        );
      },
    );
  }

  rebuildData() {
    if (Chest.action == true) {
      widget.animaLList.add(
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

  errorMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('선택하지 않은 사항이 있습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }
}
