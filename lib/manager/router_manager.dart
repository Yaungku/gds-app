import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RouteName{
  static const String main = '/';
  static const String comment = 'comment';
  static const String network = 'network';
  // static const String error = 'error';
  static const String imagepick = 'imagepick';
  static const String takepicture = 'takepicture';
  static const String story = 'story';
  static const String setprofile = 'setprofile';
  static const String updateprofile = 'updateprofile';
  static const String otp = 'otp';
  static const String login = 'login';
  static const String register = 'register';
  static const String registerAsPartner = 'registerAsPartner';
  static const String search = 'search';
  static const String setting = 'setting';
  static const String partnerDetail = 'parnterDetail';
  static const String partnerOwnProfile = 'parnterOwnProfile';

}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case RouteName.splash:
        return NoAnimRouteBuilder(SplashPage());
      case RouteName.main:
        return NoAnimRouteBuilder(MainTabPage());
      case RouteName.network:
        return NoAnimRouteBuilder(NetWorkPage());
      case RouteName.takepicture:
        return NoAnimRouteBuilder(TakePictureScreen());
      case RouteName.comment:
        return CupertinoPageRoute(builder: (_) => CommentsPage());
      // case RouteName.search:
      //   return CupertinoPageRoute(builder: (_) => SearchPage());
      case RouteName.imagepick:
        return CupertinoPageRoute(builder: (_) => ImagePickerPage());
      // case RouteName.story:
      //   return CupertinoPageRoute(builder: (_) => StoriesPage());
      case RouteName.login:
        return CupertinoPageRoute(
          fullscreenDialog: true, builder: (_) => LoginPage());
      case RouteName.registerAsPartner:
        return CupertinoPageRoute(
          fullscreenDialog: true, builder: (_) => OtpPage());
      case RouteName.register:
        return CupertinoPageRoute(builder: (_) => RegisterPage());
      case RouteName.setting:
        return CupertinoPageRoute(builder: (_) => SettingsPage());
    
      /// [get some error to pass params in route name method, using simple push method first]
      // case RouteName.partnerDetail:
      //   // var posts = settings.arguments as PartnerUser;
      //   return CupertinoPageRoute(builder: (_) {
      //     return PartnerDetailPage();
      //   });
      case RouteName.partnerOwnProfile:
        return CupertinoPageRoute(builder: (_) => PartnerOwnProfilePage());
      case RouteName.setprofile:
        return CupertinoPageRoute(builder: (_) => SetPartnerProfilePage());

      case RouteName.updateprofile:
        return CupertinoPageRoute(builder: (_) => UpdatePartnerProfilePage());
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