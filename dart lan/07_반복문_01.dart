main() {
  // for문
  // 1부터 10까지 출력하기

  for (int i = 1; i <= 10; i++) {
    print(i);
  }

  // 1부터 10까지 합 구하기

  int sum = 0;
  int startNum = 1;
  int endNum = 10;

  for (int i = startNum; i <= endNum; i++) {
    sum += i;
  }

  print('$startNum부터 $endNum까지의 합은 $sum입니다.');

  // Exercise

  int sN = 1;
  int eN = 100;
  int Holsum = 0;
  int JJaksum = 0;

  for (int i = sN; i <= eN; i++) {
    if (i % 2 == 0) {
      Holsum += i;
    } else {
      JJaksum += i;
    }
  }
  print("$sN부터 $eN까지의 수중 짝수의 합은 $Holsum이고 홀수의 합은 $JJaksum입니다.");

  // List를 반복문에 사용하기
  List<int> numList = [1, 3, 5, 7, 9];
  int sumList = 0;
  for (int i = 0; i < numList.length; i++) {
    sumList += numList[i];
  }
  print(sumList);

  sumList = 0;
  for (int num in numList) {
    sumList += num;
  }
  print(sumList);

  //while
  int sumNum = 0;
  int number = 1;

  while (number <= 10) {
    sumNum += number;
    number++;
  }
  print(sumNum);

  while (number <= 100) {
    if (number > 10) {
      break;
    }
    number++;
  }

  for (int i = 1; i <= 10; i++) {
    if (i == 5) {
      print(15);
      continue; //break는 반복문 빠져나오기 , continue는 실행후 반복문 복귀
    }
    if (i == 7) {
      break;
    }
    print(i);
  }

  //
}
