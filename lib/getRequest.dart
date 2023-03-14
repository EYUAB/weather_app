import 'package:http/http.dart' as http;
import 'dart:convert';
late double longitude;
late double latitude;
class GetRequest{
  GetRequest(this.uri);
  String uri;
Future getRequest() async{
http.Response response= await http.get(Uri.parse(uri));
if(response.statusCode==200){
   var data=response.body;
   var dataBody=jsonDecode(data);
   return dataBody;
}
else{
  print(response.statusCode);
}
}
}