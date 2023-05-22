import 'package:flutter/material.dart';
import 'package:provider_test/chechOut.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import './model/cart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'model/item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.title),
          actions: <Widget>[
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return CheckOut();
                      }));
                    },
                    icon: Icon(Icons.add_shopping_cart)),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Consumer<cart>(
                    builder: (context, cart, child) {
                      return Text("${cart.count}");
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Consumer<cart>(builder: (context, cart, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: cart.items_list.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        cart.controller.text = cart.items_list[i].name;
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  textDirection: TextDirection.rtl,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Mobile ",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                    SizedBox(height: 30),
                                    TextField(
                                      controller: cart.controller, // استخدام TextEditingController
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 30),
                                    ElevatedButton(
                                      onPressed: () {
                                        cart.changeData(
                                          Item(
                                              cart.controller.text, // استخدام القيمة الحالية في الـ TextEditingController
                                            cart.items_list[i].price,
                                          ),
                                          i,
                                        );
                                        Navigator.pop(context);
                                      },
                                      child: Text("Edit"),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: ListTile(
                        title: Text("${cart.items_list[i].name}"),
                        trailing: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            cart.add(cart.items_list[i]);
                          },
                        ),
                      ),
                    ),
                  );
                }),
          );
        }
        )
    );
  }
}





