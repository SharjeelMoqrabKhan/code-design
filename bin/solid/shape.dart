abstract class Shape {
  void calculateArea();
}

class Circle implements Shape {
  num redious;

  @override
  void calculateArea() {
    print('PI r2');
  }
}

class Sequre implements Shape {
  num length;

  @override
  void calculateArea() {
    print('4*r');
  }
}

class AreaCalculate implements Shape {
  AreaCalculate({this.shape});
  Shape shape;

  @override
  void calculateArea() {
    shape.calculateArea();
  }
}
