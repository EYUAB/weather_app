import 'package:flutter/material.dart';
import 'package:weather_app/getRequest.dart';
import 'package:weather_app/location_screen.dart';
import 'package:weather_app/location_tracer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
late double latitude;
late double longitude;
const apiKey='6554778d30a128b3bda993f87cac3c86';
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
    LocationTracer locationTracer=LocationTracer();
    await locationTracer.getLocation();
    latitude= locationTracer.latitude;
    longitude=locationTracer.longitude;
    String uri='https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';
    GetRequest getRe=GetRequest(uri);
   var weatherData=await getRe.getRequest();
   //var cityName= weatherData['name'];
  // print(cityName);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen(),),);
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