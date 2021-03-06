import 'dart:convert';
import 'package:gds/manager/storage_manager.dart';
import 'package:gds/model/history.dart';
import 'package:gds/model/home.dart';
import 'package:gds/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:gds/viewmodel/login_model.dart';

class Repository {
  User user;
  /// [login api]
  static Future login(String email, String password) async{
    print("Logging in");
    var url = "http://139.59.115.116:3000/api/BuyerUsers/login";
    var response = await http.post(url, body: {'email': '$email', 'password': '$password'});
    print(response.body);
    Map res = jsonDecode(response.body);
    print(res);
    ResponseData data = ResponseData.fromJson(res);
    return User.fromJsonMap(data.user.toJson());
  }
  ///[This is not working]
  static Future webview() async {
    print("Getting webview");
    var url = "https://agent_api.mintheinkha.com/agent/demo/request";
    var phone = StorageManager.sharedPreferences.getString(phno);
    var response = await http.post(url, body: {
      "mtk_agent":"medi",
      "mtk_agent_code":" MEDI9654",
      "mtk_agent_secret":"259kj2345k2034jdf893jkd893jfd8",
    "user_agent":"+959899819738"
  });
    print(response.body);
    return response.body;
  }
  ///[History]
  static Future history() async{
    var url = "https://us-central1-gdsprototypeapi-1968a.cloudfunctions.net/app/api/users/transaction/read/";
    var phone = StorageManager.sharedPreferences.getString(phno);
    int phoneno = int.parse(phone);
    var response = await http.get(url+"$phoneno");
    var data = json.decode(response.body);
    print(data);
    return data.map<History>((item) => History.fromJson(item))
        .toList();
    // return res.map((key, value) => List)
    // return History.fromJson(res);
  }

  static Future home() async {
    var url = "https://us-central1-gdsprototypeapi-1968a.cloudfunctions.net/app/api/users/read/";
    var phone = StorageManager.sharedPreferences.getString(phno);
    int phoneno = int.parse(phone);
    var response = await http.get(url+ "$phoneno");
    print(response.body);
    Map data = json.decode(response.body);
    print(data);
    return Home.fromJson(data);
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