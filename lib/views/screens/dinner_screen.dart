import 'package:flutter/cupertino.dart';

import '../../config/enum.dart';
import '../components/item_card.dart';

class DinnerScreen extends StatelessWidget {
  const DinnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: dinner.length,
          itemBuilder: (context,index){
            return ItemCard(
              itemName: dinner[index]['name'],
              image: dinner[index]['image'],
              price: dinner[index]['price'].toString(),
              time: dinner[index]['time'],
            );
          }),
    );
  }
}
