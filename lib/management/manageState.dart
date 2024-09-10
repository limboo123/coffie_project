import 'package:coffee_project/model/coffee_class.dart';
import 'package:get/get.dart';

class Managestate extends GetxController{
  var _counter = 0;

  int variable = 0;

  void inc() {
    variable++;
    update();
  }


  RxInt _c = 0.obs;

  int get c => _c.value;
  set c(int val) => _c.value = val;

  void increment() {
    _counter++;
    update();
  }

  get counter => _counter;

  final _cartProducts = <CoffeeClass>[];


  bool addToCart(CoffeeClass product) {
    if (!_cartProducts.contains(product)) {
      _cartProducts.add(product);
      _counter++;
      update();

      return true;
    }
    return false;
  }

  get cartProducts => _cartProducts;



  void increaseQuantity(CoffeeClass product) {
    product.quantity++;
    // _cartProducts.refresh();
    update();
  }

  void decreaseQuantity(CoffeeClass product) {
    if (product.quantity > 1) {
      product.quantity--;
    }
    // _cartProducts.refresh();
    update();
  }

  void deleteProduct(CoffeeClass product) {
    product.quantity = 0;
    _cartProducts.remove(product);
    _counter--;
    update();
    // _cartProducts.refresh();
  }

  /// Find total price
  double getTotalPrice() {
    double total = 0.0;
    for (var product in _cartProducts) {
      total = total + product.price * product.quantity;
    }
    return total;
  }
}