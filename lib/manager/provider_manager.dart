import 'package:gds/viewmodel/favorite_model.dart';
import 'package:gds/viewmodel/local_model.dart';
import 'package:gds/viewmodel/usermodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<LocaleModel>(
    create: (context) => LocaleModel(),
  ),
  ChangeNotifierProvider<GlobalFavouriteStateModel>(
    create: (context) => GlobalFavouriteStateModel(),
  )

];

// UserModel gonna depand on favourite state model
List<SingleChildWidget> dependentServices = [
  ChangeNotifierProxyProvider<GlobalFavouriteStateModel, UserModel>(
    create: null,
    update: (context, globalFavouriteStateModel, userModel) =>
    userModel ??
        UserModel(globalFavouriteStateModel: globalFavouriteStateModel),
  )
];

List<SingleChildWidget> uiConsumableProviders = [
//  StreamProvider<User>(
//    builder: (context) => Provider.of<AuthenticationService>(context, listen: false).user,
//  )
];