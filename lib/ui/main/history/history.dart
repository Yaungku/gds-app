import 'package:flutter/material.dart';
import 'package:gds/model/history.dart';
import 'package:gds/provider/provider_widget.dart';
import 'package:gds/provider/view_state_error_widget.dart';
import 'package:gds/viewmodel/history_model.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("History")),
      body: ProviderWidget<HistoryModel> (
        model: HistoryModel(),
        onModelReady: (model) => model.initData(),
        builder: (context,model,child) {
          if(model.isError && model.list.isEmpty){
            return ViewStateErrorWidget(
              error: model.viewStateError, 
              onPressed: model.initData);
          }
          print(model.list.length);
          return Container(
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: <Widget> [
              new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              sliver: new SliverFixedExtentList(
                itemExtent: 172.0,
                delegate: SliverChildBuilderDelegate(
                (context, index){
                  History history = model.list[index];
                    return 
                      Container(
                        margin: new EdgeInsets.all(16.0),
                        padding: new EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.all(Radius.circular(15.0),
                          ),
                        ),
                        // color: Colors.red,
                        height: 90.0,
                        child: new Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Name : "+history.name),
                                    Text("Phone No : "+ history.phno),
                                    Text("Cost : "+ history.cost.toString() ),
                                    Text("From : " + history.tranid),
                                    Text("Agent : "+ history.agent)
                                  ],
                                )
                              ],
                        )
                      ]
                    ));
                  },
                childCount: model.list?.length ?? 0,
                ),
              ))
            ]
          )); 
        },
      )
    );
  }
}
