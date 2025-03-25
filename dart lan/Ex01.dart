// Factiorial 구하기
// 4! = 4*3*2*1
// 결과
// 4's factorial value = 24

main() {
  int inputValue = 4;
  int fatResult = 1;
  for (int i = fatResult; i <= inputValue; i++) {
    fatResult = fatResult * i;
  }
  print(fatResult);
}
