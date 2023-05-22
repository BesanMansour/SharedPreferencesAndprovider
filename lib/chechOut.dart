import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model/item.dart';
import './model/cart.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("checkOut"),
        ),
        body: Consumer<cart>(
          builder: (context, cart, child) {
            return ListView.builder(
                itemCount: cart.basketItem.length,
                itemBuilder: (context, i) {
                  return Card(
                      child: ListTile(
                    title: Text("${cart.basketItem[i].name}"),
                    trailing: IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        cart.remove(cart.basketItem[i]);
                      },
                    ),
                  ));
                });
          },
        ));
  }
}
