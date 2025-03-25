// BMI 계산하기
// 신장이 170 몸무게가 70kg BMI 계산

main() {
  double height = 173;
  double weight = 60;

  double BMI = weight / ((height / 100) * (height / 100));

  if (BMI <= 18.4) {
    print('저체중');
  } else if (BMI <= 22.9) {
    print('정상체중');
  } else if (BMI <= 24.9) {
    print('과체중');
  } else if (BMI <= 29.9) {
    print('비만');
  } else {
    print('고도비만');
  }
}
