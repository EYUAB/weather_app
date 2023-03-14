import 'package:flutter/material.dart';
import 'package:weather_app/location_tracer.dart';
late double latitude;
late double longitude;
void main(List<String> args) {
  runApp(LoadingScreen());
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
    print(latitude);
    print(longitude);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(

    ),
    );
  }
}