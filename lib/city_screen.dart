import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  var typedLocation;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: 
            AssetImage('images/pexels-photo-1118873.jpeg'),
            fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back_ios,size: 50,color: Colors.white,)),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Expanded(child: TextField(
                          onChanged: (value){
                             typedLocation=value;
                          },
                          decoration: InputDecoration(
                            icon: Icon(Icons.location_city,color: Colors.white,size: 40,),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Enter City Name',
                            hintStyle: TextStyle(color: Colors.black38,fontSize: 15),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,),
                            borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                               color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                                             ),),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: InkWell(onTap: (){
                    Navigator.pop(context,typedLocation);
                  },
                  child: Container(
                    child: Text('Get Weather',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
                  ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}