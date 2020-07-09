import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gds/ui/main/home/home.dart';
import 'package:gds/ui/main/login/login.dart';
import 'package:gds/ui/main/history/history.dart';
import 'package:gds/ui/main/webview/webview.dart';
import 'package:gds/ui/widgets/page_route_animation.dart';

class RouteName{
  static const String login = '/';
  static const String home = 'home';
  static const String network = 'network';
  static const String history = 'history';
  static const String web = 'web';
  // static const String error = 'error';
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case RouteName.login:
        return NoAnimRouteBuilder(Login());
      case RouteName.home:
        return NoAnimRouteBuilder(HomePage());
      case RouteName.history:
        return CupertinoPageRoute(builder: (_) => HistoryPage());
      case RouteName.web:
        return CupertinoPageRoute(builder: (_) => MTKweb());
      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}

//Pop route
class PopRoute extends PopupRoute{
  final Duration _duration = Duration(milliseconds: 300);
  Widget child;

  PopRoute({@required this.child});

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}