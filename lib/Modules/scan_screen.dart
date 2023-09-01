import 'package:flutter/material.dart';
import 'package:planet_ui/Shared/Components/constants.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants _constants = Constants();

    return  Scaffold(
     body: Stack(
       children: [
         Positioned(
           top: 50,
             left: 20,
             right: 20,
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
                       },
                      icon: Icon(
                        Icons.share,
                      ),
                     ),
                   ),
                 ),
               ],

             ),
         ),
         Positioned(
           top: 10,
           left: 20,
           right: 20,
           child: Container(
             width: size.width *0.8,
             height: size.height *0.8,
             padding: EdgeInsets.all(20),
             child: Center(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Icon(
                     Icons.qr_code_scanner,
                     color: Constants.primaryColor,
                     size: 150,
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   Text(
                       'Tap to Scan',
                     style: TextStyle(
                       color: Constants.primaryColor.withOpacity(0.8),
                       fontSize: 20.0,
                       fontWeight: FontWeight.w500
                     ),
                   ),
                 ],
               ),
             ),

           ),
         ),

       ],
     ),
    );
  }
}
