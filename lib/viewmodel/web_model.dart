import 'package:gds/manager/storage_manager.dart';
import 'package:gds/provider/view_state_model.dart';
import 'package:gds/respos/respository.dart';
import 'package:gds/viewmodel/usermodel.dart';

class WebModel extends ViewStateModel{
  
  Future<bool> webview() async {
    setBusy();
    try{
      var user = await Repository.webview();
      setIdle();
      return true;
    } catch (e, s){
      print(s);
      return false;
    }
  }
}