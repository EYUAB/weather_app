import 'package:flutter/material.dart';
import 'package:weather_app/location_screen.dart';
import 'package:weather_app/location_tracer.dart';
late double latitude;
late double longitude;
void main(List<String> args) {
  runApp(MaterialApp(home: LoadingScreen()));
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
     Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen(),),);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

    );
  }
}