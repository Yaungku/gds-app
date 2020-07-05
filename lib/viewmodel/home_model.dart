import 'package:gds/model/web.dart';
import 'package:gds/provider/view_state_model.dart';
import 'package:gds/respos/respository.dart';
import 'package:gds/ui/main/home/home.dart';

class HomeModel extends ViewStateModel{
  HomeModel({this.data});
  Home data;
  initData() async {
    setBusy();
    try {
      data = await Repository.webview();
      setIdle();
    } catch (e, s) {
      print(e);
      print(s);
    }
  }
}