import 'package:flutter/material.dart';
import 'package:weather_app/getRequest.dart';
import 'package:weather_app/location_tracer.dart';
class WeatherCondition{
   final apiKey='6554778d30a128b3bda993f87cac3c86';
   final a='e72ca729af228beabd5d20e3b7749713';
   late double latitude;
  late double longitude;
  Future<dynamic> getCityWeather(var typedCity)async{
 String uri='https://api.openweathermap.org/data/2.5/weather?q=$typedCity&appid=$apiKey';
    GetRequest getRe=GetRequest(uri);
   var weatherData=await getRe.getRequest();
     return weatherData;
  }
  Future<dynamic> getLocationWeather() async{
    LocationTracer locationTracer=LocationTracer();
    await locationTracer.getLocation();
    latitude= locationTracer.latitude;
    longitude=locationTracer.longitude;
    String uri='https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';
    GetRequest getRe=GetRequest(uri);
   var weatherData=await getRe.getRequest();
     return weatherData;
  }
  String getWeatherIcon(int condition){
    if(condition < 300){
      return '❄️';
    }
    else if(condition < 400){
        return '🌨';
    }
    else if(condition < 600){
        return '☔️';
    }
    else if(condition < 700){
        return '🥶';
    }
    else if(condition < 800){
        return '💨';
    }
    else if(condition == 800){
        return '🌞';
    }
    else if(condition <= 804){
        return '☁️';
    }
    else {
      return '🤷‍♀️';
    }
    
  }
  Widget getMessage(int temp, String cityName){
    if(temp==null){
      return Text('Their is not weather data');
    }
     else if(temp > 25){
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
        Row(
           mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('It\'s',textAlign: TextAlign.right, style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
        Icon(Icons.icecream,color: Colors.white, size: 50),
          ],
        ),
        Text('time',textAlign: TextAlign.right, style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
        Text('in $cityName',textAlign: TextAlign.right,style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),)
        ],);
    }
    else if(temp > 20){
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
          children: [
       Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
           Text('It\'s',textAlign: TextAlign.right, style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
        Icon(Icons.umbrella,color: Colors.white, size: 50),
        
        ],
       ),
       Text('time',textAlign: TextAlign.right, style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
        Text('in $cityName',textAlign: TextAlign.right,style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
        ],);
    }
    else if(temp < 10){
        return Column(
           mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
          children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('You\'ll need',textAlign: TextAlign.right, style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
        Icon(Icons.umbrella,color: Colors.white, size: 50),
          ],
        ),
        Text('in $cityName',textAlign: TextAlign.right,style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold), ),
        ],);
    }
    else{
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text('Bring a', textAlign: TextAlign.right,style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
        Icon(Icons.umbrella,color: Colors.white, size: 50),],
        ),
        Text(' just incase',  style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
        Text('in $cityName',textAlign: TextAlign.right, style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
        ],);
    }
  }
}