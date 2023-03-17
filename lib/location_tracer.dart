import 'package:geolocator/geolocator.dart';
class LocationTracer{
  late double latitude;
  late double longitude;
Future getLocation() async{
 bool serviceEnabled;
LocationPermission permission;

serviceEnabled = await Geolocator.isLocationServiceEnabled();
if (!serviceEnabled) {
  latitude=60000;
  longitude=100000;
  return null;
}

permission = await Geolocator.checkPermission();
if (permission == LocationPermission.denied) {
  permission = await Geolocator.requestPermission();
  if (permission == LocationPermission.denied) {
    return Future.error('Location permissions are denied');
  }
}

if (permission == LocationPermission.deniedForever) {
  return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
}
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  latitude=position.latitude;
  longitude=position.longitude;
}
}