class Gugudan {
  gugudanPrint(num1) {
    String gugudan = "*****$num1단*****";
    print(gugudan);
    for (int i = 1; i < 10; i++) {
      print("$num1 X $i = ${num1 * i}");
    }
  }
}
