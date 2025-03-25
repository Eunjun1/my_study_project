class Calc03 {
  // property
  int _num1 = 0; // _ 는 Privite
  int _num2 = 0;

  // Construct(생성자)
  Calc03(int num1, int num2) : _num1 = num1, _num2 = num2;

  // Method
  int addition() {
    return _num1 + _num2;
  }

  int subtraction() {
    return _num1 - _num2;
  }

  int multiplication() {
    return _num1 * _num2;
  }

  double division() {
    return _num1 / _num2;
  }
}
