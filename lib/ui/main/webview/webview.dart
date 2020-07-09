import 'package:flutter/material.dart';
import 'package:gds/model/web.dart';
import 'package:gds/provider/provider_widget.dart';
import 'package:gds/provider/view_state_error_widget.dart';
import 'package:gds/viewmodel/web_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MTKweb extends StatefulWidget {
  MTKweb({Key key}) : super(key: key);

  @override
  _MTKwebState createState() => _MTKwebState();
}

class _MTKwebState extends State<MTKweb> {
  Getweb webdata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("MTK")),
       body: ProviderWidget<WebModel> (
         model: WebModel(webdata: webdata),
         onModelReady: (model) => model.initData(),
         builder: (context, model, child) {
          if(model.isError && model.isEmpty){
            return ViewStateErrorWidget(
              error: model.viewStateError, 
              onPressed: model.initData);
          }
           print(webdata);
           return Container();
          //  return WebView(
          //    initialUrl: "https://agent_api.mintheinkha.com/agent/list/b1JWeU1EeGh0SWV6a004SFgvblFJWG9jZUUvR0VpNEdlVkZ2TjhwM2I5WVVva3VEemdUeTlrZnYwSkZJLzBEYw==",
          //    javascriptMode: JavascriptMode.unrestricted,
          //  );
         },
       ),
    );
  }
}