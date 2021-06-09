import 'package:http/http.dart' as http;

class User{
  late String id, name, avatar;
  User.fromJson(Map<String, dynamic> json){
    id=json['id'];
    name=json['name'];
    avatar=json['avatar'];
  }

  
}