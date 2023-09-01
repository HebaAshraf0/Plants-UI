import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:planet_ui/Modules/scan_screen.dart';
import 'package:planet_ui/Screens/card_screen.dart';
import 'package:planet_ui/Screens/favorate_screen.dart';
import 'package:planet_ui/Screens/home_screen.dart';
import 'package:planet_ui/Screens/profile_screen.dart';
import 'package:planet_ui/Shared/Components/constants.dart';

class RootScteen extends StatefulWidget {
  const RootScteen({Key? key}) : super(key: key);

  @override
  State<RootScteen> createState() => _RootScteenState();
}

class _RootScteenState extends State<RootScteen> {


  int bottomNavIndex =0;


  List <Widget> pages = [
    HomeScreen(),
    FavoriteScreen(favoritedPlants: [],),
    CartScreen(addedToCartPlants:[]),
    ProfileScreen()

  ];



List <String> titleList=[
  'home',
  'favorite',
  'cart',
  'profile',
];



  List <IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[bottomNavIndex],
              style: TextStyle(
                color: Constants.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 24.0,
              ),
            ),
            Icon(
              Icons.notifications,
              color: Constants.blackColor,
              size: 30.0,


            ),

          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: bottomNavIndex,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, PageTransition(
             child: ScanScreen(),
            type: PageTransitionType.bottomToTop,
          ));
        },
        // child: Image.asset(
        //   'assets/images/qr-code-scan.png',
        //   height: 30.0,
        // ),
        child: Icon(Icons.qr_code,color: Colors.white,size: 35.0,),
        backgroundColor: Constants.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        inactiveColor: Colors.black.withOpacity(0.5),
        activeIndex: bottomNavIndex,
        activeColor: Constants.primaryColor,
        gapLocation: GapLocation.center,
        icons: iconList,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index){
          setState(() {
            bottomNavIndex = index;
          });


        },

      ),
    );
  }
}
