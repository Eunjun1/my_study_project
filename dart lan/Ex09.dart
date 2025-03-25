// 1부터 10까지의 합을 구하고 그 합이 홀수 인지 짝수인지 출력
// 단 클래스 한개 생성하고 클래스 Method를 2개(합계, 홀짝수 판단)
// 숫자의 범위는 main에서 선정한다.
// 클래스와의 데이터 연계방법은 생성자를 사용한다.
import 'calc.dart';

main() {
  int startNum = 10;
  int endNum = 1;

  Calc calc = Calc.check(startNum, endNum);
  int sum = calc.sumCalc();
  String result = calc.evenOdd(sum);

  print("$startNum부터 $endNum까지의 합은 $sum입니다.");
  print("$startNum부터 $endNum까지의 합은 수는 $result입니다.");
}
