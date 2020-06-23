import 'package:gds/manager/storage_manager.dart';
import 'package:gds/model/user.dart';
import 'package:gds/provider/view_state_model.dart';
import 'package:gds/respos/respository.dart';
import 'package:gds/viewmodel/usermodel.dart';

// save user login name to let them get their last name after logout
const String mail = 'mail';
const String baba = 'user';
// save token to pass our server
const String token = 'token';
const String phno = 'phno';
class LoginModel extends ViewStateModel{
  final UserModel userModel;
  LoginModel(this.userModel) : assert(userModel != null);

  String getmail(){
    return StorageManager.sharedPreferences.getString(mail);
  }
  // String getUserId(){
  //   return StorageManager.sharedPreferences.getString(mUserId);
  // }
  // String getMPassword(){
  //   return StorageManager.sharedPreferences.getString(mPassWord);
  // }
  
  Future<bool> login(mail, password) async {
    setBusy();
    try{
      var user = await Repository.login(mail, password);
      print(user.token);
      userModel.saveUser(user);
      print(userModel.user.id);
      StorageManager.sharedPreferences
        .setString(token, user.token);
      StorageManager.sharedPreferences
        .setString(mail, user.name);
      StorageManager.sharedPreferences
        .setString(phno, user.phno);
      setIdle();
      return true;
    } catch (e, s){
      print(s);
      return false;
    }
  }
//Logout
  // Future<bool> logout() async {
  //   if (!userModel.hasUser){
  //     // avoid from 2 user in same time
  //     return false;
  //   }

  //   setBusy();
  //   try{
  //     await Repository.logout();
  //     userModel.clearUser();
  //     setIdle();
  //     return true;
  //   } catch(e,s){
  //     setError(e, s);
  //     return false;
  //   }
  // }

}
