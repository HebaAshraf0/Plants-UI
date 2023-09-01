import 'package:flutter/material.dart';
import 'package:planet_ui/Shared/Components/constants.dart';
import 'package:planet_ui/Models/plants.dart';

import '../Shared/Components/components.dart';


class FavoriteScreen extends StatefulWidget {
  final List<Plant> favoritedPlants;
  const FavoriteScreen({Key? key, required this.favoritedPlants})
      : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.favoritedPlants.isEmpty
          ? Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Icon(Icons.favorite_sharp,size: 100,color: Constants.primaryColor,)
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Your favorited Plants',
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
            ),
          ],
        ),
      )
          : Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        height: size.height * .5,
        child: ListView.builder(
            itemCount: widget.favoritedPlants.length,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return PlantWidget(
                  index: index, plantList: widget.favoritedPlants);
            }),
      ),
    );
  }
}