# SOLID Principle

S.O.L.I.D is an acronym for the first five object-oriented design(OOD)** principles** by Robert C. Martin, popularly known as Uncle Bob.
These principles, when combined, make it easy for a programmer to develop software that is easy to maintain and extend. They also make it easy for developers to avoid code smells, easily refactor code, and are also a part of agile or adaptive software development.

# S.O.L.I.D. STANDS FOR:

1.  S — Single responsibility principle
2.  O — Open closed principle
3.  L — Liskov substitution principle
4.  I — Interface segregation principle
5.  D — Dependency Inversion principle

# Single-responsibility Principle

```
A class should have one and only one reason to change, meaning that a class should have only one job.
```

Suppose we have an order calculating class that intends to calculate the product sum.

```
class OrderCalulator {
  OrderCalulator({
    this.id,
    this.price,
    this.shippingCharges,
  });

  final String id;
  final num price;
  final num shippingCharges;


  num totalPrice(){
    return price+shippingCharges;
  }

  void sendEmail(){
    print('Sending email');
  }
}
```

although this code is fine, nevertheless this is breaking the principle of the "Single Responsibility Principle" because we are not supposed to define send email method cause that has different aspects not intend to calculate the order price so we may define send email in the different relevant class.

```
class OrderCalulator {
  OrderCalulator({
    this.id,
    this.price,
    this.shippingCharges,
  });

  final String id;
  final num price;
  final num shippingCharges;

  num totalPrice() {
    return price + shippingCharges;
  }

  void sendEmail() {
    print('Sending email');
  }
}

class EmailConfirm {
  static void sendEmail(String email) {
    print('Confirmation Email has to $email');
  }
}

```

Now it is following the single responsibility principle cuase send eamil has in email class and order calculator to it's own class.

# Open-closed Principle

```
Objects or entities should be open for extension, but closed for modification.
```

Suppose we have a abstract class shape which is implemented by other class like circle,sequre and all these class we can calulate the area but little differntly for that we check the type of class like if we circle we will calculate differntly and if we have sequre than we calculate differntly it's all about if-else.

```
abstract class Shape {}

class Circle implements Shape {
  num redious;
}

class Sequre implements Shape {
  num length;
}

class AreaCalculate implements Shape {
  AreaCalculate({this.shape});
  Shape shape;

  void calculate() {
    if (shape is Circle) {
      print('PI r2');
    } else if (shape is Sequre) {
      print('4*r');
    }
  }
}


void main() {
  var circle = Circle();
  var cal = AreaCalculate(shape: circle);
  cal.calculate();
}

```

in this example we are deliberately using if-else statment which breaking the princle of open closed princle. What we can do? We can open to extend but closed for modification in exitsting class.

so now we are going to make a method in abstract class which can be implemented by other class which are using "Shape" implemented class and this method will implement it's own area calculate method. there will be no need for condition statments and show what kind of area will we calculate on runtime.

```
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

import 'solid/shape.dart';

void main() {
  var circle = Circle();
  var cal = AreaCalculate(shape: circle);
  cal.calculateArea();
}

```
# Liskov substitution principle
```
Let q(x) be a property provable about objects of x of type T. Then q(y) should be provable for objects y of type S where S is a subtype of T.
```

* All this is stating is that every subclass/derived class should be substitutable for their base/parent class. 

suppose we have two classes one is ractangle and second is square. squre is a subclass of rectangle.In this case we can use Liskov substitution principle to check if the square is substitutable for rectangle or not.

```
class Rectangle {
  num _heigth;
  num _width;

  void setWidth(num value) {
    _width = value;
    _heigth = value;
  }

  void setHeight(num value) {
    _heigth = value;
    _width = value;
  }

  num get width => _width;
  num get heigth => _heigth;
}

class Sequre extends Rectangle {
  @override
  num _heigth;
  @override
  num _width;

  @override
  void setWidth(num value) {
    _width = value;
  }

  @override
  void setHeight(num value) {
    _heigth = value;
  }

  @override
  num get width => _width;
  @override
  num get heigth => _heigth;
}

void main() {
  var sequre = Sequre();
  sequre.setHeight(100);
  sequre.setWidth(200);
  print(sequre.heigth);
  print(sequre.width);

 var rectangle = Rectangle();
 rectangle.setHeight(100);
 print(rectangle.heigth);
 print(rectangle.width);
}
```
Output will be

```
100 200
100 100
```

it's all about a case which is breaking the principle of Liskov substitution principle.cuase we are not getting same output for both rectangle and square mean we are not substitutable for each other.

so there is way to solve this problem and implement the principle of Liskov substitution principle.

```
class Shape {
  num heigth;
  num width;
}

class Rectangle extends Shape {}

class Sequre extends Shape {}
```

```
import 'solid/shape2.dart';

void main() {
  var sequre = Rectangle();
  sequre.heigth=220;
  sequre.width=200;
  print(sequre.heigth);
  print(sequre.width);

}
```

```
Output
220  200
```

```
import 'solid/shape2.dart';

void main() {
  var sequre = Shape();
  sequre.heigth=220;
  sequre.width=200;
  print(sequre.heigth);
  print(sequre.width);

}
```

```
Output
220  200
```