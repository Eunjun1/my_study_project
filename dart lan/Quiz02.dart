main() {
  List<int> Dans = [2, 3, 4, 5, 6, 7, 8, 9];
  int D = 2;
  int N = 5;
  List<String> Gugudan = [];
  for (int Dan in Dans) {
    String G = '';
    for (int i = 1; i < 10; i++) {
      String g = "${Dan} X $i = ${Dan * i}\n";
      G += g;
    }
    Gugudan.add(G);
  }
  print("${Gugudan[D].compareTo('$N')}");
  
}
