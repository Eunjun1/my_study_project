class Gugudan {
  //
  late int num1;
  //생성자 추가하기
  Gugudan(int num1) : this.num1 = num1;

  gugudanPrint() {
    print("*****$num1단*****");
    for (int i = 1; i < 10; i++) {
      print("$num1 X ${(i % 2) == 0 ? i : '*'} = ${num1 * i}");
    }
  }
}
