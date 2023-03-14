import 'package:flutter/material.dart';
class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('images/pexels-photo-1118873.jpeg'),
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(onTap: (){}, child: Container(
                  child: Icon(Icons.near_me,size: 50,color: Colors.white,),
                ),),
                InkWell(onTap: (){}, child: Container(
                  child: Icon(Icons.location_city,size: 50,color: Colors.white,),
                ),),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text('data'),
                Text('data'),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 15), child: Text('data',textAlign: TextAlign.right,),),
         ],
          ),),
        ),
      ),
    );
  }
}