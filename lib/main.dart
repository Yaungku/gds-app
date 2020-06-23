import 'package:flutter/material.dart';
import 'package:gds/manager/provider_manager.dart';
import 'package:gds/manager/router_manager.dart';
import 'package:gds/manager/storage_manager.dart';
import 'package:gds/viewmodel/local_model.dart';
import 'package:provider/provider.dart';

main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await StorageManager.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    providers: providers,
    child: Consumer<LocaleModel>(
      builder: (context, value, child){ 
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: Router.generateRoute,
      initialRoute: RouteName.login,
    );})
    );
  }
}