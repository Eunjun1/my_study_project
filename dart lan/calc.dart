class Calc {
  late int num1;
  late int num2;
  Calc(num1, num2) : this.num1 = num1, this.num2 = num2;

  // factory 생성자
  factory Calc.check(int num1, int num2) {
    int startNum = 0;
    int endNum = 0;

    if (num1 > num2) {
      startNum = num2;
      endNum = num1;
    } else {
      startNum = num1;
      endNum = num2;
    }
    return Calc(startNum, endNum);
  }

  int sumCalc() {
    int sum = 0;
    for (int i = num1; i <= num2; i++) {
      sum += i;
    }
    return sum;
  }

  String evenOdd(sum) {
    String odd = "";
    if (sum % 2 == 0) {
      odd = "짝수";
    } else {
      odd = "홀수";
    }
    return odd;
  }
}
