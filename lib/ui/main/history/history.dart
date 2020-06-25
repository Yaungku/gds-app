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
          //print(model.list.length);
          return CustomScrollView(
            slivers: <Widget> [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                (context, index){
                  History history = model.list[index];
                    return Column(
                      children: <Widget>[ 
                      ListTile(
                        // leading: CircleAvatar(
                        //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        //   backgroundImage: NetworkImage(history),
                        // ),
                        title: Text(history.name),
                        ///[Last Message]
                        subtitle: Text(history.name),
                        onTap: () {},         
                        ),
                        Divider(color: Colors.grey,)
                      ]
                    );
                  },
                childCount: model.list?.length ?? 0,
                ),
              )
            ]
          ); 
        },
      )
    );
  }
}
