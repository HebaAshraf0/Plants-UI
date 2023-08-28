import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Home'
        ),
        actions: [
          IconButton(onPressed: (){},
              icon: Icon(
                Icons.notification_important_sharp,

              ),)
        ],

      ),
      bottomNavigationBar:BottomNavigationBar(
        selectedItemColor: Colors.teal,


        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              label: 'home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
            color: Colors.grey,
              ),
              label: 'favorite'
          ),

          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.grey,
              ),
              label: 'shopping'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.grey,
              ),
              label: 'person'
          ),

        ],

      ) ,
    );
  }
}
