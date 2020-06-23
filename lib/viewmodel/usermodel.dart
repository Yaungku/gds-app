import 'package:flutter/cupertino.dart';
import 'package:gds/manager/storage_manager.dart';
import 'package:gds/model/user.dart';
import 'package:gds/viewmodel/favorite_model.dart';

class UserModel extends ChangeNotifier {
  static const String mUser = 'mUser';



  final GlobalFavouriteStateModel globalFavouriteStateModel;

  User _user;

  User get user => _user;

  bool get hasUser => user != null;
  
  // UserModel(){
  //   var userMap = StorageManager.localStorage.getItem(mUser);
  //   _user = userMap != null ? User.fromJsonMap(userMap) : null; 
  // }

  //TODO: Below one is the way i think should work

  UserModel({@required this.globalFavouriteStateModel}) {
    // var userMap = StorageManager.localStorage.getItem(mUser);
    // _user = userMap != null ? User.fromJsonMap(userMap) : null;
  }

  saveUser(User user) {
    _user = user;
    print(user.toJson());
    notifyListeners();
    StorageManager.localStorage.setItem(mUser, "something");
  }

  /// clear user data
  clearUser() {
    _user = null;
    notifyListeners();
    StorageManager.localStorage.deleteItem(mUser);
    StorageManager.sharedPreferences.clear();
  }
}
