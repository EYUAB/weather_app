import 'package:flutter/material.dart';

class WeatherCondition{
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
     if(temp > 25){
      return Column(children: [
        Row(
          children: [
            Text('It\'s',textAlign: TextAlign.right, style: TextStyle(color: Colors.white,fontSize: 30),),
        Icon(Icons.icecream,color: Colors.white, size: 30),
        Text('time',textAlign: TextAlign.right, style: TextStyle(color: Colors.white,fontSize: 30),),
          ],
        ),
        Text(cityName,textAlign: TextAlign.right,style: TextStyle(color: Colors.white,fontSize: 30),)
        ],);
    }
    else if(temp > 20){
        return Column(children: [
       Row(
        children: [
           Text('It\'s',textAlign: TextAlign.right, style: TextStyle(color: Colors.white,fontSize: 30),),
        Icon(Icons.umbrella,color: Colors.white, size: 30),
        Text('time',textAlign: TextAlign.right, style: TextStyle(color: Colors.white,fontSize: 30),),
        ],
       ),
        Text(cityName,textAlign: TextAlign.right,style: TextStyle(color: Colors.white,fontSize: 30),),
        ],);
    }
    else if(temp < 10){
        return Row(children: [
        Row(
          children: [
            Text('You\'ll need',textAlign: TextAlign.right, style: TextStyle(color: Colors.white,fontSize: 30),),
        Icon(Icons.umbrella,color: Colors.white, size: 30),
          ],
        ),
        Text('in $cityName',textAlign: TextAlign.right,style: TextStyle(color: Colors.white,fontSize: 30), ),
        ],);
    }
    else{
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
        Text('Bring a', style: TextStyle(color: Colors.white,fontSize: 30),),
        Icon(Icons.umbrella,color: Colors.white, size: 30),
        Text('incase in',  style: TextStyle(color: Colors.white,fontSize: 30),),
          ],
        ),
        Text(cityName,textAlign: TextAlign.right, style: TextStyle(color: Colors.white,fontSize: 30),),
        ],);
    }
  }
}