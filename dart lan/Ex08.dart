main() {
  int num1 = 10;
  int num2 = 4;

  print(
    "출력내용 : ${calc_F(num1, num2, 'add')}출력내용 : ${calc_F(num1, num2, 'sub')}출력내용 : ${calc_F(num1, num2, 'mul')}출력내용 : ${calc_F(num1, num2, 'div')}",
  );

  // 덧셈 결과를 Function으로 작업하여 출력
  // 뺄셈
  // 곱셈
  // 나눗셈
}

calc_F(number1, number2, String part) {
  List<String> calc = ['add', 'sub', 'mul', 'div'];
  for (int i = 0; i < calc.length; i++) {
    if (part == calc[0]) {
      return '"덧셈 결과는 ${number1 + number2}입니다."';
    } else if (part == calc[1]) {
      return '"$number1 - $number2 = ${number1 - number2}"';
    } else if (part == calc[2]) {
      return number1 * number2;
    } else if (part == calc[3]) {
      return number1 / number2;
    }
  }
}
