main() {
  // 연산자
  // 자동 증강 연산자
  int num = 0;
  num++; // num = num + 1;
  print(num);

  num--; // num = num -1;

  num += 2; // num = num + 2;

  // Optional : Null Safety
  int num1 = 10;
  // int num 2 = null;
  int? num2 = null;
  print(num2);

  num2 ??= 8;
  print(num2);

  int? num3;
  print(num3 ??= 5);

  // int num4;
  // print(num4++);

  // 조건 연산자
  int num5 = 10;
  int num6 = 5;

  print(num5 < num6);
  print(num5 > num6);
  print(num5 <= num6);
  print(num5 >= num6);
  print(num5 == num6);
  print(num5 != num6);

  // 논리 연산자
  bool result = 12 > 10 && 1 > 0;
  print(result);

  bool result2 = 10 > 5 || 1 > 2;
  print(result2);
}
