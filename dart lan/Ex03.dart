// List의 최댓값 최댓값 위치 구하기

// 결과
// 숫자들 중 최댓값은 15이고 5번째입니다.

main() {
  List<int> num = [8, 13, 8, 15, 12];
  int Max = num[0];
  int loopCount = 0;
  int position = 0;

  for (int i = 0; i < num.length; i++) {
    loopCount++;
    if (Max > num[i]) {
      Max = num[i];
      position = loopCount;
    }
    if (Max == num[0]) {
      position = 1;
    }
  }

  print('숫자들 중 최소값은 $Max이고 $position번째입니다.');
}
