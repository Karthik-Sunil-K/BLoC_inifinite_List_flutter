
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;
import 'package:query_params/query_params.dart';
import 'package:listmore/models/user.dart';


class UserRepo{
  Future<List<User>?> getUser(URLQueryParams queryParams) async{
    try {
      http.Response response =await http.get(Uri.parse('https://60c077c5b8d3670017555003.mockapi.io/users?${queryParams.toString()}'));
    List<dynamic> list =jsonDecode(response.body);
    List<User> userList=[];
    list.map((data) => userList.add(User.fromJson(data))).toList();
    return userList.length==0?null:userList;
    } catch (err) {
      return null;
    }
    

  }
}