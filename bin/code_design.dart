import 'solid/oder_placement.dart';

void main() {
  var order = OrderCalulator(
    id: 'Cam-Nik-D3400-b',
    price: 50000,
    shippingCharges: 1000,
  );
  print(order.totalPrice());
  EmailConfirm.sendEmail('Sharjeelmoqrabkhan@gmail.com');
}
