import 'package:gds/model/home.dart';
import 'package:gds/provider/view_state_model.dart';
import 'package:gds/respos/respository.dart';

class HomeModel extends ViewStateModel{
  Home data;
  HomeModel({this.data});
  initData() async {
    setBusy();
    try {
      data = await Repository.home();
      setIdle();
    } catch (e, s) {
      print(e);
      print(s);
    }
  }
}