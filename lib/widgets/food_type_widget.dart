import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class FoodTypeList extends StatelessWidget {
  FoodTypeList({Key? key}) : super(key: key);
  final refFoodCategory = FirebaseDatabase.instance.ref('foodCategory');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: const [
              Text(
                'Official Brand',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Expanded(child: SizedBox()),
              Text(
                'See all',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 90,
          //color: Colors.red,
          child: FirebaseAnimatedList(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              // itemCount: 10,
              query: refFoodCategory,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.grey,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(snapshot.child('CategoryName').value.toString()),
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
