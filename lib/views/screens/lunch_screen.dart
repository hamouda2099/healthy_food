import 'package:flutter/cupertino.dart';
import 'package:healthy_food/config/enum.dart';

import '../components/item_card.dart';

class LunchScreen extends StatelessWidget {
  const LunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: lunch.length,
          itemBuilder: (context,index){
            return ItemCard(
              itemName: lunch[index]['name'],
              image: lunch[index]['image'],
              price: lunch[index]['price'].toString(),
              time: lunch[index]['time'],
            );
          }),
    );
  }
}
