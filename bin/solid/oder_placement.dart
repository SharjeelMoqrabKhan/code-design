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
