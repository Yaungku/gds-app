import 'package:gds/provider/view_state_list_model.dart';
import 'package:gds/respos/respository.dart';

class HistoryModel extends ViewStateListModel{
  
  @override
  Future<List> loadData() async {
    return await Repository.history();
  }
}