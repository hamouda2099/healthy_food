import 'package:flutter/cupertino.dart';
import 'package:healthy_food/config/enum.dart';

import '../components/item_card.dart';

class BreakfastScreen extends StatelessWidget {
  const BreakfastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
          itemCount: breakfast.length,
          itemBuilder: (context,index){
        return ItemCard(
          itemName: breakfast[index]['name'],
          image: breakfast[index]['image'],
          price: breakfast[index]['price'].toString(),
          time: breakfast[index]['time'],
        );
      }),
    );
  }
}
