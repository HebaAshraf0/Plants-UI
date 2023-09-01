import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:planet_ui/Models/plants.dart';
import 'package:planet_ui/Shared/Components/constants.dart';

class DetailsScreen extends StatefulWidget {
  final int plantId;

  const DetailsScreen({Key? key, required this.plantId}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> _plantList = Plant.plantList;
    bool toggleIsFavorite(bool isFavorite){
      return !isFavorite;
    }
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: 20,
            left: 20,
            top: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);

                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Constants.primaryColor.withOpacity(0.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    debugPrint('favorite');

                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Constants.primaryColor.withOpacity(0.15),
                    ),
                    child: IconButton(
                      onPressed: (){
                        setState(() {
                          bool isFavorite = toggleIsFavorite(_plantList[widget.plantId].isFavorated);
                          _plantList[widget.plantId].isFavorated = isFavorite;
                        });
                      },
                      icon: Icon(
                        _plantList[widget.plantId].isFavorated==true ? Icons.favorite : Icons.favorite_border,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              width: size.width *0.8,
              height: size.height *0.8,
              padding: EdgeInsets.all(20),
              child: Stack(
                children: [

                  Positioned(
                    top: 10,
                    right: 0,
                    child: SizedBox(
                      height:150 ,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PlantFeature(title :'Size', plantFeature :_plantList[widget.plantId].size),
                          PlantFeature(title :'Humidity', plantFeature :_plantList[widget.plantId].humidity.toString()),
                          PlantFeature(title :'Temperature', plantFeature :_plantList[widget.plantId].temperature),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 0,
                    child: SizedBox(
                      height: 200,
                      child: Image.asset(_plantList[widget.plantId].imageURL),
                    ),
                  ),
                  Positioned(

                    bottom: 0,
                    left: 0,
                     right: 0,
                    child: Container(
                      padding: EdgeInsets.only(top: 80.0,left: 50, right: 50.0),
                      height: size.height*0.5,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _plantList[widget.plantId].plantName,
                                    style: TextStyle(
                                      color: Constants.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,

                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    r'$'+_plantList[widget.plantId].price.toString(),
                                    style: TextStyle(
                                      color: Constants.blackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.0,

                                    ),
                                  ),

                                ],
                              ),
                              Row(

                                children: [
                                  Text(
                                    _plantList[widget.plantId].rating.toString(),
                                    style: TextStyle(
                                      color: Constants.primaryColor,
                                      fontSize: 20.0,

                                    ),
                                  ),
                                  Icon(Icons.star, color: Constants.primaryColor,),

                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            _plantList[widget.plantId].decription,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Constants.blackColor.withOpacity(0.7),
                              fontSize: 18,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],

              ),
            ),
          ),
        ],
      ),

    );
  }
}

class PlantFeature extends StatelessWidget {
  final String plantFeature;
  final String title;

  const PlantFeature({
    super.key, required this.plantFeature, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Constants.blackColor,
          ),
        ),
        Text(
          plantFeature,
          style: TextStyle(
            color: Constants.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('plantFeature', plantFeature));
    properties.add(StringProperty('plantFeature', plantFeature));
  }
}
