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

# Interface segregation principle
A client should never be forced to implement an interface that it doesn’t use or clients shouldn’t be forced to depend on methods they do not use.

in this example we have abstract class of bird and it has some properties like see run and fly whicv is very obvious for brid class and we are implmenting this brid class for egle and kiwi which both are bird but kiwi can't fly technically and egle flies high level. So we have fly method in our abstract class for both, egle use fly method but kiwi can't so here we are breaking the interface segregation principle. if a method is used for technically work for the class don't segregate.


```
abstract class Brid{
  void see();
  void run();
  void fly();
}

class Egle implements Brid{
  @override
  void fly() {
    
  }

  @override
  void run() {

  }

  @override
  void see() {
 
  }

}

class Kiwi implements Brid{
  @override
  void fly() {

  }

  @override
  void run() {
  
  }

  @override
  void see() {
   
  }

}
```

Now we are rid off the fly method from Bird class so reaming class won't implemented it and make a new abstract fly class and pass the fly method it and implents it with those class who may use it fly method.

```
abstract class Brid {
  void see();
  void run();
}
abstract class Fly{
  void fly();
}

class Eagle implements Brid ,Fly {
  @override
  void run() {}

  @override
  void see() {}

  @override
  void fly() {
   
  }
}

class Kiwi implements Brid {
  @override
  void run() {}

  @override
  void see() {}
}

```
# Dependency inversion principle

```
Entities must depend on abstractions not on concretions. It states that the high level module must not depend on the low level module, but they should depend on abstractions.
```

Suppose we have two classes one is service and second is database connetection. database connection is used for creating the connection for database. in service class we will use intance of database class like this.

```
class Service{
DatabaseConnection connection = DatabaseConnection();
void attach(){
  connection.connect();
}
  
}

class DatabaseConnection{
  void connect(){
    print('Connecting Database');
  }
}

import 'solid/conntection.dart';


void main() {
var db = Service();
db.attach();
}

```

suppose tommorow we have to change the database like firebase or anyother no sql so that we have to change in higher level in Serive class which is breaking the principle of Dependency inversion principle because high level(Service) module must not depend on the low level(Database connection) module but they should depend on abstractions.

we can slove this by abstraction/interface.

```
class Service {
  ConnectionInterface connection ;  
  void attach() {
    connection.connect();
  }
}

abstract class ConnectionInterface {
  void connect();
}

class Sql implements ConnectionInterface {
  @override
  void connect() {
    print('Connecting to sql-server');
  }
}

class NoSql implements ConnectionInterface {
  @override
  void connect() {
    print('Connecting to Firebase');
  }
}
import 'solid/conntection.dart';


void main() {
var db = Service();
db.connection= NoSql();
db.attach();
}
```

so now we can't change in our higher module which is service cause we abstracted in interfaceConnection connection which defines what kind of connection will going to eastablish. Here we achieve the last principle of solid design Dependency inversion principle.

# Conclusion
Honestly, S.O.L.I.D might seem to be a handful at first, but with continuous usage and adherence to its guidelines, it becomes a part of you and your code which can easily be extended, modified, tested, and refactored without any problems