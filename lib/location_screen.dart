import 'package:flutter/material.dart';
class LocationScreen extends StatefulWidget {
  const LocationScreen({this.locationBody});
  final locationBody;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temprature;
  late String cityName;
  late int condition; 
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUi(widget.locationBody);
  }
  void updateUi(dynamic weatherData){
   double temp=weatherData['main']['temp'];
   temprature=temp.toInt();
   cityName=weatherData['name'];
   condition=weatherData['weather'][0]['id'];
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black45,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.difference),
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
                Text('$temprature °',style: TextStyle(fontSize: 60,color: Colors.white),),
                Icon(Icons.sunny,size: 65,color: Colors.yellow,),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Text.rich(
              TextSpan(
                  children: <InlineSpan>[
              TextSpan(text: 'it\'s time in', style: TextStyle(color: Colors.white,fontSize: 60),),
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(Icons.icecream, color: Colors.white, size: 60,)),
              TextSpan(text: 'san fransisco',style: TextStyle(color: Colors.white,fontSize: 60),),
                  ],
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40
                ),
          ),
          ),
         // Padding(padding: EdgeInsets.only(right: 15), child: Text('it\'s time in $icecream san fransisco',style: TextStyle(color: Colors.white,fontSize: 60), textAlign: TextAlign.right,),),
         ],
          ),),
        ),
      ),
    );
  }
}