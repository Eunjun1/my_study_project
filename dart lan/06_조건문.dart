main() {
  // 조건문 (Conditional Statement)
  int num1 = 5;
  String result = "";

  if (num1 > 10) {
    result = "10보다 큰";
  } else if (num1 == 10) {
    result = "10과 같은";
  } else {
    result = "10보다 작은";
  }

  String output = "입력된 숫자 $num1은(는) $result 수 입니다.";

  print(output);

  //-----------------------------------//
  // Exercise
  /// 변수에 있는 숫자 값을 비교하여
  /// 숫자가 5의 배수이면 '입력된 숫자 __는 5의 배수 입니다.
  /// 숫자가 5의 배수가 아니면 '입력된 숫자는 __는 5의 배수가 아니며 나머지 값은 __ 입니다.'

  int num2 = 14;
  String result01 = "";

  if (num2 % 5 == 0) {
    result01 = "5의 배수입니다";
  } else {
    result01 = "5의 배수가 아니며 나머지 값은 ${num2 % 5}입니다.";
  }

  String output1 = "입력된 숫자 $num2는 $result01";

  print(output1);

  // Swich

  switch (num2 % 5) {
    case 0:
      result01 = "5의 배수입니다";

    default:
      result01 = "5의 배수가 아니며 나머지 값은 ${num2 % 5}입니다.";
  }

  print(output1);

  // Exercise

  num2 = 116543;
  if (num2 % 2 == 0 && num2 % 3 == 0 && num2 % 5 == 0) {
    if (num2 % 2 == 0) {
      print('2의 배수입니다.');
    }
    if (num2 % 3 == 0) {
      print('3의 배수입니다.');
    }
    if (num2 % 5 == 0) {
      print('5의 배수입니다.');
    }
  } else {
    print('$num2는(은) 2,3,5의 배수가 아닙니다.');
  }

  //Exercise
  int num3 = 80;
  String hak = "";

  if (num3 > 100 || num3 < 0) {
    print("숫자를 다시 입력해주세요");
  } else {
    if (num3 >= 90) {
      hak = "A";
    } else if (num3 >= 80) {
      hak = "B";
    } else if (num3 >= 70) {
      hak = "C";
    } else if (num3 >= 60) {
      hak = "D";
    } else {
      hak = "F";
    }
    String output01 = "입력하신 점수 $num3은 $hak학점 입니다.";

    print(output01);
  }

  // swich로 만들기
  num3 = 70;
  switch (num3 > 100 || num3 < 0) {
    case false:
      switch (num3 ~/ 10) {
        case 9:
          hak = "A";
        case 8:
          hak = "E";
        case 7:
          hak = "C";
        case 6:
          hak = "D";
        default:
          hak = "F";
      }
      String output01 = "입력하신 점수 $num3은 $hak학점 입니다.";
      print(output01);

    default:
      print("숫자를 다시 입력해주세요");
  }

  // 상황 연산자

  bool isPublic = false;
  // ignore: dead_code
  var vis = isPublic ? "True" : "False";
  print(vis);

  num2 = 210;
  switch (num2 % 2 == 0 || num2 % 3 == 0 || num2 % 5 == 0) {
    case true:
      switch (num2 % 2) {
        case 0:
          print('2의 배수입니다.');
        default:
          0;
      }
      switch (num2 % 3) {
        case 0:
          print('3의 배수입니다.');
        default:
          0;
      }
      switch (num2 % 5) {
        case 0:
          print('5의 배수입니다.');
        default:
          0;
      }
    default:
      print('$num2는(은) 2,3,5의 배수가 아닙니다.');
  }
}
