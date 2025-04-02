class Animallist {
  // ======== Property =========

  String iconImgPath;
  String animalList;
  String species;
  bool fly;

  //======= Constructor =======

  Animallist({
    required this.animalList,
    required this.fly,
    required this.iconImgPath,
    required this.species,
  });

  //
}

class AnimalImg {
  String animalImgPath;

  AnimalImg({required this.animalImgPath});
}
