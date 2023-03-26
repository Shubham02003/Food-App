import 'package:flutter/material.dart';
import 'package:food_app/Screens/login_page.dart';
import 'package:food_app/Services/networking.dart';
import '../widgets/bottom_navigationbar.dart';
class CBottomNavigationBar extends StatelessWidget {
  const CBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index){
        if(index==4){
          NetWorking.loggedOut();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        }
      },
      type: BottomNavigationBarType.fixed,
      items: const [

        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_shopping_cart_rounded),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_offer),
          label: 'Promo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
