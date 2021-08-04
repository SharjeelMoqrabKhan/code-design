import 'solid/shape.dart';

void main() {
  var circle = Circle();
  var cal = AreaCalculate(shape: circle);
  cal.calculateArea();
}
