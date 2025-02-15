import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthy_food/config/constants.dart';
import 'package:healthy_food/config/margin.dart';
import 'package:healthy_food/config/navigator.dart';
import 'package:healthy_food/main.dart';
import 'package:healthy_food/views/screens/item_details_screen.dart';

class ItemCard extends StatelessWidget {
  ItemCard({this.itemName,this.image,this.price,this.time,this.description});
  String? itemName;
  String? time;
  String? price;
  String? image;
  String? description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          navigator(context: context, screen: ItemDetailsScreen(
            itemName: itemName,
            time: time,
            price: price??"0",
            image: image,
          ));
        },
        child: Container(
          padding: EdgeInsets.all(10),
          width: screenWidth/1.2,
          decoration: BoxDecoration(
            color: kPrimaryColor,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(itemName??"",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),),
                    Row(
                      children: [
                        Text("$time min",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),),
                        5.w,
                        Icon(Icons.access_time_rounded,color: Colors.white,)
                      ],
                    ),
                    Text("$price LE",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),),
                  ],
                ),
              ),
              20.w,
              Image.asset("assets/images/$image.png",width: screenWidth/3,height: screenWidth/3,),
            ],
          ),
        ),
      ),
    );
  }
}
