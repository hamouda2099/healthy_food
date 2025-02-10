import 'package:flutter/cupertino.dart';
import 'package:healthy_food/config/enum.dart';

import '../components/item_card.dart';

class CoffeeScreen extends StatelessWidget {
  const CoffeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: coffee.length,
          itemBuilder: (context,index){
            return ItemCard(
              itemName: coffee[index]['name'],
              image: coffee[index]['image'],
              price: coffee[index]['price'].toString(),
              time: coffee[index]['time'],
            );
          }),
    );
  }
}
