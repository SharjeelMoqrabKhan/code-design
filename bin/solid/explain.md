# SOLID Principle

S.O.L.I.D is an acronym for the first five object-oriented design(OOD)** principles** by Robert C. Martin, popularly known as Uncle Bob.
These principles, when combined, make it easy for a programmer to develop software that is easy to maintain and extend. They also make it easy for developers to avoid code smells, easily refactor code, and are also a part of agile or adaptive software development.

# S.O.L.I.D. STANDS FOR:
1)  S — Single responsibility principle
2)  O — Open closed principle
3)  L — Liskov substitution principle
4)  I — Interface segregation principle
5)  D — Dependency Inversion principle

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