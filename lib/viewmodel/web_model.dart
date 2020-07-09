import 'package:gds/model/web.dart';
import 'package:gds/provider/view_state_model.dart';
import 'package:gds/respos/respository.dart';

class WebModel extends ViewStateModel{
  WebModel({this.webdata});
  Getweb webdata;
  initData() async {
    setBusy();
    try {
      webdata = await Repository.webview();
      print(webdata);
      setIdle();
    } catch (e, s) {
      print(e);
      print(s);
    }
  }
}