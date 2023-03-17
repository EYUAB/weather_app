import 'package:flutter/material.dart';
import 'package:weather_app/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/weather.dart';
late double latitude;
late double longitude;
void main(List<String> args) {
  runApp( const MaterialApp(
       debugShowCheckedModeBanner: false,
       home: LoadingScreen(),
  ),
  );
}
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    getLocationTraced();
  }
  void getLocationTraced() async{
    WeatherCondition weather=WeatherCondition();
   var weatherBody= await weather.getLocationWeather();
   //var cityName= weatherData['name'];
  // print(cityName);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen(locationBody: weatherBody,),),);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
             backgroundColor:Colors.black45,
             body: Center(
              child: SpinKitPulse(color: Colors.white,size: 100,),
             ),
    );
  }
}