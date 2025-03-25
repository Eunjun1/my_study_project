main() {
  double height = 170;
  double weight = 70;

  print("출력내용 : ${calc_BMI(height, weight)}");

  // 덧셈 결과를 Function으로 작업하여 출력
  // 뺄셈
  // 곱셈
  // 나눗셈
}

calc_BMI(height, weight) {
  List<String> BMI = ['저체중', '정상체중', '과체중', '비만', '고도비만'];
  List<double> state = [18.9, 22.9, 24.9, 29.9];
  double hei = height / 100;
  double bmi = weight / (hei * hei);

  for (int i = 0; i < state.length; i++) {
    if (bmi > state.last) {
      return BMI.last;
    } else if (bmi <= state[i]) {
      return BMI[i];
    }
  }
}
