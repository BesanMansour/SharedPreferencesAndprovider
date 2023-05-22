import 'package:flutter/material.dart';
import 'item.dart';

class cart with ChangeNotifier{
  List<Item> items= [];
  double price = 0.0;
  void add(Item item){
    items.add(item);
    price += item.price;
    notifyListeners();
  }
  void remove(Item item){
    items.remove(item);
    price -= item.price;
    notifyListeners();
  }

  int get count{
    return items.length;
  }
  double get totalPrice {
    return price;
  }
  List<Item> get basketItem{
    return items;
  }
  changeData(newData,index){
    items_list[index] = newData;
    notifyListeners();
  }
  TextEditingController controller = TextEditingController();

init (index){
  controller.text = items_list[index].name;
  notifyListeners();
}

  List<Item> items_list = [
    Item("S20 ultra", 250),
    Item("p30 ultra", 400),
    Item("S40 ultra", 350),
    Item("S50 ultra", 450),
    Item("S80 ultra", 300),
  ];



}