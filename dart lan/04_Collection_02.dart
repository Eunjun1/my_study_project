main() {
  // Map : Key와 Value로 이루어진 Collection
  Map fruits = {'apple': '사과', 'grape': '포도', 'watermelon': '수박'};

  // 원하는 정보 검색
  print(fruits['apple']);

  // 수정하기
  fruits['watermelon'] = '시원한 수박';
  print(fruits);

  // 데이터 추가하기
  fruits['banana'] = '바나나';
  print(fruits);

  // Map 새로운 구성
  Map carMakers = {};
  carMakers['aaa'] = 'AAA';
  // 추가할떄는 addAll({' ' : ' '})
  carMakers.addAll({'hyundai': '현대자동차'});
  print(carMakers);

  // Map의 key만 따로 출력
  print(carMakers.keys.toString()); // Tuple : 읽기전용
  print(carMakers.keys.toList()); // List
  print(carMakers.values.toList()); // List

  var carMakersNames = carMakers.keys.toString();

  // Generic 선언
  Map<String, int> fruitsPrice = {
    'apple': 1000,
    'grape': 2000,
    'watermelon': 3000,
  };

  print(fruitsPrice['apple']);
  var applePrice = fruitsPrice['apple'];
  print("사과의 가격은 $applePrice원 입니다.");
}
