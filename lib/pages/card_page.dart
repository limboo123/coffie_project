import 'package:coffee_project/goggle_fonts.dart';
import 'package:coffee_project/model/card_model.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _removeItem(int index) {
    setState(() {
      CartModel.cartItems.removeAt(index);
    });
  }

  void _placeOrder() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => OrderPage()),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart',style: myStyle(22,),),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_checkout),
            onPressed: _placeOrder,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: CartModel.cartItems.length,
          itemBuilder: (context, index) {
            final coffee = CartModel.cartItems[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Image.asset(coffee.image, width: 50, fit: BoxFit.cover),
                title: Text(coffee.name),
                subtitle: Text('\$${coffee.price}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _removeItem(index),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}