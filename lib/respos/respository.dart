import 'dart:convert';

import 'package:gds/model/user.dart';
import 'package:http/http.dart' as http;

class Repository {
  User user;
  /// [login api]
  static Future login(String email, String password) async{
    var url = "http://139.59.115.116:3000/api/BuyerUsers/login";
    var response = await http.post(url, body: {'email': '$email', 'password': '$password'});
    print(response.body);
    Map res = jsonDecode(response.body);
    ResponseData data = ResponseData.fromJson(res);
    return User.fromJsonMap(data.user.toJson());
  }
  // static Future register(
  //   String mail, String name, String lastname, String password) async{

  //     var response = await DioUtils().post(Api.Signin, queryParameters: {
  //       'mail' : mail,
  //       'name' : name,
  //       'last_name' : lastname,
  //       'password' : password,
  //     });
  //     // print(response);
  //     return response.data;
  //   }
}