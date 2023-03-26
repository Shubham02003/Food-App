import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Services/networking.dart';
import '../widgets/custom_carouseslider.dart';
import '../widgets/food_type_widget.dart';
import '../widgets/bottom_navigationbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ref = FirebaseDatabase.instance.ref('foodData');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        title: SizedBox(
          height: 50,
          width: double.infinity,
          child: TextField(
            style: const TextStyle(
                fontSize: 15.0, height: 2.0, color: Colors.black),
            decoration: InputDecoration(
              fillColor: const Color(0xffff5f5f5),
              filled: true,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              hintText: 'Search',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
        ),
        elevation: 0.0,
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            child: const CircleAvatar(
                backgroundColor: Color(0xffff5f5f5),
                radius: 25,
                child: Icon(
                  Icons.notification_add,
                  color: Colors.black,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const CustomSlider(),
                const SizedBox(height: 20),
                 FoodTypeList(),
                FirebaseAnimatedList(
                  query: ref,
                  physics:const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height:230,
                            child: ClipRRect(
                              child: Image.network(
                                snapshot.child('img').value.toString(),
                                fit: BoxFit.fill,
                                width: double.infinity,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                snapshot.child('name').value.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                              const Expanded(child: SizedBox()),
                              GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CBottomNavigationBar(),
    );
  }
}

class List extends StatefulWidget {
  const List({Key? key}) : super(key: key);

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  final ref = FirebaseDatabase.instance.ref('foodData');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('this is appbar'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FirebaseAnimatedList(
            query: ref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              print(index.toString());
              return ListTile(
                title: Text(snapshot.child('description').value.toString()),
              );
            },
          ))
        ],
      ),
    );
  }
}
