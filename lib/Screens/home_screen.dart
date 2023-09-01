import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:planet_ui/Screens/details_screen.dart';
import 'package:planet_ui/Shared/Components/constants.dart';

import '../Models/plants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0 ;


    Size size = MediaQuery.of(context).size;


    List<Plant> _plantList = Plant.plantList;



    List<String> _plantTypes = [
      'Recommended',
      'Indoor',
      'Outdoor',
      'Garden',
      'Supplement'
    ];

    bool toggleIsFavorite(bool isFavorite){
      return !isFavorite;
    }



    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    width: size.width * 0.9,
                    //width: 350.0,

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon( 
                            Icons.search,
                          color: Colors.black.withOpacity(0.6),
                        
                        ),
                        Expanded(
                          child: TextField(
                            showCursor: false,
                            decoration: InputDecoration(
                              hintText: 'search plant',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              
                            ),
                          ),
                        ),
                        Icon(
                            Icons.mic,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ],

                    ),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20.0),
                    ),

                  ),
                ],

              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              height: 50.0,
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: _plantTypes.length,
                  itemBuilder: (BuildContext context , int index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedIndex = index;

                        });
                      },
                      child: Text(
                        _plantTypes[index],
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: selectedIndex==index? FontWeight.bold : FontWeight.w300,
                          color: selectedIndex==index? Constants.primaryColor : Constants.blackColor,
                        ),
                      ),

                    ),
                  );

                  },
              ),
            ),
            SizedBox(
              height: size.height * 0.3,
              child: ListView.builder(
                itemCount: _plantList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context , int index){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, PageTransition(child: DetailsScreen(
                      plantId: _plantList[index].plantId,
                    ), type: PageTransitionType.bottomToTop));
                  },
                  child: Container(
                    width: 200,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Stack(

                      children: [
                        Positioned(
                          top: 10.0,
                            right: 20.0,
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              child: IconButton(
                                onPressed: (){
                                  setState(() {
                                    bool isFav = toggleIsFavorite(_plantList[index].isFavorated);
                                    _plantList[index].isFavorated = isFav;

                                  });
                                },
                                color: Constants.primaryColor,
                                iconSize: 30.0,
                                icon: Icon(
                                  _plantList[index].isFavorated==true ? Icons.favorite : Icons.favorite_border,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                        ),
                        Positioned(
                          top: 50.0,
                          right: 50.0,
                          bottom: 50.0,
                          left: 50.0,
                          child: Image.asset(_plantList[index].imageURL),
                        ),
                        Positioned(
                          bottom: 10.0,
                          left: 20.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                _plantList[index].category,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                _plantList[index].plantName,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],

                          ),
                        ),
                        Positioned(
                          bottom: 15.0,
                          right: 20.0,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 2.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),

                            ),
                            child: Text(
                              r'$' + _plantList[index].price.toString(),
                              style: TextStyle(
                                color: Constants.primaryColor,
                                fontSize: 16.0,
                              ),
                            ),
                          ) ,
                        ),
                      ],

                    ),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20.0),

                    ),

                  ),
                );
              }),
            ),
            Container(
              padding: EdgeInsets.only(bottom:20 ,top:20 ,left: 16),
              child: Text(
                'New Plants',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),

              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              height: size.height * 0.5,
              child: ListView.builder(
                itemCount: _plantList.length,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (
                  BuildContext context , int index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, PageTransition(child: DetailsScreen(
                        plantId: _plantList[index].plantId,
                      ), type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10,top: 10),
                      padding: EdgeInsets.only(left: 10,top: 10),
                      height: 80.0,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 60.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: Constants.primaryColor.withOpacity(0.8),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Positioned(
                                left: 0,
                                  right: 0,
                                  bottom: 5,
                                  child:SizedBox(
                                    height: 80,
                                    child: Image.asset(_plantList[index].imageURL),

                                  ),
                              ),
                              Positioned(
                                left: 80,
                                bottom: 5,
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(_plantList[index].category),
                                    Text(_plantList[index].plantName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Constants.blackColor,
                                    ),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              r'$' + _plantList[index].price.toString(),
                              style: TextStyle(
                                fontSize:18.0 ,
                                fontWeight: FontWeight.bold ,
                                color: Constants.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),


                    ),
                  );

                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
