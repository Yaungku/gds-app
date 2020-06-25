import 'package:flutter/material.dart';
import 'package:gds/provider/provider_widget.dart';
import 'package:gds/viewmodel/web_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MTKweb extends StatefulWidget {
  MTKweb({Key key}) : super(key: key);

  @override
  _MTKwebState createState() => _MTKwebState();
}

class _MTKwebState extends State<MTKweb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("MTK")),
       body: ProviderWidget<WebModel> (
         model: WebModel(),
         builder: (context, model, child) {
           return WebView(
             initialUrl: "https://agent_api.mintheinkha.com/agent/list/b1JWeU1EeGh0SWV6a004SFgvblFJV1YzM0JEUHlsOFFlTEthQWxkRW9uQ1BJWlV2Q3RwOEVTTENiUnlCMGV1OA==",
             javascriptMode: JavascriptMode.unrestricted,
           );
         },
       ),
    );
  }
}