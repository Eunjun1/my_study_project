// 입력한 자릿수 정수의 합 구하기
// 입력숫자 : 12345678
// 결과
// Sum of 12345678 = 36

main() {
  int inputNumber = 12345678;
  int s = inputNumber;
  int result = 0;
  int mNumber = 0;

  for (int i = inputNumber; i >= 1;) {
    if (i == 0) {
      break;
    }
    mNumber = i % 10;
    result += mNumber;
    i = i ~/ 10;
  }

  print('Sum of $s = $result');
}
