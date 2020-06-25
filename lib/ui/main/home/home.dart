import 'package:flutter/material.dart';
import 'package:gds/manager/router_manager.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Home"),
       ),
       floatingActionButton: FloatingActionButton(
         onPressed: () => Navigator.of(context).pushReplacementNamed(RouteName.history),
       ),
       body: FloatingActionButton(
         onPressed: () => Navigator.of(context).pushReplacementNamed(RouteName.web),
       ),
    );
  }
}