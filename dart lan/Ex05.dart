// List를 이용ㅏ여 5보다 작은 숫자만 List에 넣기

main() {
  List<int> num = [1, 1, 2, 3, 5, 8, 13, 21, 34, 66, 89];
  List<int> result = [];

  for (int i = 0; i < num.length; i++) {
    if (num[i] < 5) {
      result.add(num[i]);
    }
  }

  print(result);

  // List Comprehension
  print([
    for (int x in num)
      if (x < 5) x,
  ]);
}
