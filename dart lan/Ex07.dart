main() {
  int num1 = 10;
  int num2 = 4;

  print(
    "출력내용 : ${addition_F(num1, num2)}출력내용 : ${subtraction_F(num1, num2)}출력내용 : ${multiplication_F(num1, num2)}출력내용 : ${division_F(num1, num2)}",
  );

  // 덧셈 결과를 Function으로 작업하여 출력
  // 뺄셈
  // 곱셈
  // 나눗셈
}

String addition_F(number1, number2) {
  return '"덧셈 결과는 ${number1 + number2}입니다."';
}

String subtraction_F(number1, number2) {
  return '"$number1 - $number2 = ${number1 - number2}"';
}

int multiplication_F(number1, number2) {
  return number1 * number2;
}

double division_F(number1, number2) {
  return number1 / number2;
}
