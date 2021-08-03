## Encapsulation

Encapsulation in OOP is ‘a mechanism of wrapping the data (variables) and code acting on the data (methods) together as a single unit.’ For example, a capsule which is mixed of several medicines.

In encapsulation, the variables of a class will be hidden from other classes, and can be accessed only through the methods of their current class. Therefore, it is also known as data hiding.

```
1) To achieve encapsulation in Dart − 
2) Declare the variables of a class as private. 
3) Provide public setter and getter methods to modify and view the variables values.
```
![alt](https://www.cpp.thiyagaraaj.com/cms/assets/cimages/encapsulation.png)

```
class Bank {
  num _balance = 0;

  void withdraw(num amount) {
    if (amount >= 0) {
      _balance -= amount;
    } else {
      throw Exception('Amount can\'t be less than zero');
    }
  }

  void deposit(num amount) {
    if (amount >= 0) {
      _balance += amount;
    } else {
      throw Exception('Amount can\'t be less than zero');
    }
  }

  num getBalance() {
    return _balance;
  }
}

```

```
import 'opp/abstraction/bank.dart';

void main() {
var bank = Bank(); 
bank.deposit(500);
print(bank.getBalance());
bank.withdraw(475.50);
print(bank.getBalance());
bank.deposit(60);
print(bank.getBalance());
}
```

# Abstraction

Abstraction means to hide the Unnecessary from user. Abstraction data hiding can be done by making the methods private but an abstraction we hide the data just the sake of reduce the complexity for user but and encapsulation we hide the data for security reasons.

![alt](https://qph.fs.quoracdn.net/main-qimg-d416d714184b5665ff5ae3f231e854f4)

```
class Bank {

  Bank.open(){
    _submitPaper();
    _approvalFromManger();
    _uploadingOnDb();
  }

  void _submitPaper(){

  }

  void _approvalFromManger(){

  }

  void _uploadingOnDb(){

  }

  num _balance = 0;
  void withdraw(num amount) {
    if (amount >= 0) {
      _balance -= amount;
    } else {
      throw Exception('Amount can\'t be less than zero');
    }
  }

  void deposit(num amount) {
    if (amount >= 0) {
      _balance += amount;
    } else {
      throw Exception('Amount can\'t be less than zero');
    }
  }

  num getBalance() {
    return _balance;
  }
}

```

```
import 'opp/bank.dart';

void main() {
var bank = Bank.open(); 
bank.deposit(500);
print(bank.getBalance());
bank.withdraw(475.50);
print(bank.getBalance());
bank.deposit(60);
print(bank.getBalance());
}

```

#Inheritance

inheritanc is a mechanism of using the code of one class to create a new class.In dart we can make a class inherit from another class by using extends keyword.

![alt](https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190501121513/inheritance.png)
```
class PkWidget {
  String name;
  void enabele() {
    print('enable');
  }

  void disable() {
    print('disable');
  }
}

class PkTextWidget extends PkWidget {
  void renderingText() {
    print('rendering text');
  }
}

class PkTextButton extends PkWidget {
  void renderingButton(){
    print('rendering button');
  }
}

import 'opp/pk_widget.dart';

void main() {
var text = PkTextWidget();
text.name = 'Sharjeel';
text.renderingText();
}

```

# Polymorphism

Polymorphism is nothing but utilizing single thing in multiple ways. It is derived as poly means many and morphs is nothing but forms.

So in Computer programming, Polymorphism is generally used to reduce way of expressing a statement. Using an operators in multiple way or a function name in multiple ways with in single block. Technically it is divided as Run time polymorphism and Compile time Polymorphism where, Compile time polymorphism generally deals with Operator Overloading and Run time polymorphism can be implemented in 2 ways. One is Method overloading and other is Method Overriding.


In Dart, we have only runtime(Method Overrding) polymorphism which mean we can not use compile time polymorphism in Dart.A Compile time polymorphism mean method overlaoding.

![alt](https://www.scientecheasy.com/wp-content/uploads/2020/02/java-polymorphism.png)

```
abstract class PkWidget implements RenderingEngine {
  String name;
  void enabele() {
    print('enable');
  }

  void disable() {
    print('disable');
  }

  @override
  void render() {
    print('Render');
  }
}

class PkTextWidget extends PkWidget {
  @override
  void render() {
    print('Render text widget');
  }
}

class PkTextButton extends PkWidget {
  @override
  void render() {
    print('Render button widget');
  }
}

abstract class RenderingEngine {
  void render() {}
}

```

```


import 'opp/pk_widget.dart';

void main() {
renderComponet(PkTextWidget());
renderComponet(PkTextButton());
}

dynamic renderComponet(PkWidget pkWidget) {
  return pkWidget.render();
}

```