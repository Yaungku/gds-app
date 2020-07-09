import 'package:flutter/material.dart';
import 'package:gds/manager/router_manager.dart';
import 'package:gds/model/history.dart';
import 'package:gds/model/home.dart';
import 'package:gds/provider/provider_widget.dart';
import 'package:gds/provider/view_state_error_widget.dart';
import 'package:gds/ui/main/history/history.dart';
import 'package:gds/viewmodel/home_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  Home user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Home"),
       ),
       floatingActionButton: FloatingActionButton(
         child: Icon(Icons.history),
         onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => HistoryPage()))
       ),
       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
       body: ProviderWidget<HomeModel> (
         model: HomeModel(data: user),
         onModelReady: (model) => model.initData(),
         builder: (context, model, child){
          if(model.isError && model.isEmpty){
            return ViewStateErrorWidget(
              error: model.viewStateError, 
              onPressed: model.initData);
          }
           print(model.data.name);
           return Container(
             padding: EdgeInsets.all(20),
             child: ListTile(
               leading: Text(model.data.name),
               trailing: Text(model.data.balance.toString()),
             )
           );
         },
       )
    );
  }
}