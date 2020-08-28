// import 'package:flutter/material.dart';
// import 'package:gds/manager/resource_mananger.dart';
// import 'package:gds/provider/provider_widget.dart';
// import 'package:gds/ui/main/home/home.dart';
// import 'package:gds/ui/widgets/LoginFormContainer_widget.dart';
// import 'package:gds/ui/widgets/login_field_widget.dart';
// import 'package:gds/viewmodel/login_model.dart';
// import 'package:provider/provider.dart';

// class Login extends StatefulWidget {

//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final _email = TextEditingController();
//   final _passw = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        appBar: AppBar(
//          title: Text("App bar"),
//          backgroundColor: Colors.orange,
//        ),
//        body: ProviderWidget<LoginModel>(
//        model: LoginModel(Provider.of(context)),
//        builder: (context, model, child) {
//        return Column(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: <Widget>[
//            Center(
//              child: Image.asset(
//                ImageHelper.wrapAssetsImage("busy.gif"), 
//                fit: BoxFit.fill,
//                height: 120,
//                width: 120,
//                ),
//              ),
            
//             LoginFormContainer(
//             child: Column(children: <Widget>[
//             //email 
//             LoginTextField(
//               label: "Email",
//               // controller: _email,
//             ),
//             //password
//             LoginTextField(
//               label: "Password",
//               // controller: _passw,
//             ),
//             LoginButton(_email, _passw)
//             ]
//             ),
//             ),
            
//        ],
//        );}
//     ));
//   }
// }

// class LoginButton extends StatelessWidget {
//   final email;
//   final passw;

//   LoginButton(this.email, this.passw);

  
//   @override
//   Widget build(BuildContext context) {
//     final _formKey = GlobalKey<FormState>();
//     print(email);
//     print(passw);
//     var model = Provider.of<LoginModel>(context);
//     return RaisedButton(
//       child: Text("Login"),
//       onPressed: model.isBusy? null : () {
//           if (_formKey.currentState.validate()){
//               model
//                   .login(mail , passw.text)
//                   .then((value){
//                     if(value){
//                       Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Home())); 
//                     } else {
//                       model.showErrorMessage(context);
//                     }
//                 });
//         }
//       },
//     );
//   }
// }
// class Signup extends StatelessWidget {
//   const Signup({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text("Sign up"),
//     );
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gds/manager/router_manager.dart';
import 'package:gds/provider/provider_widget.dart';
import 'package:gds/ui/main/home/home.dart';
import 'package:gds/ui/widgets/LoginFormContainer_widget.dart';
import 'package:gds/ui/widgets/login_field_widget.dart';
import 'package:gds/viewmodel/login_model.dart';
import 'package:provider/provider.dart';
import 'package:gds/manager/resource_mananger.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _pwdFocus = FocusNode();
  @override
  void dispose(){
    _mailController.dispose();
    _passwordController.dispose();
    _pwdFocus.unfocus();
    _pwdFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            title: Text("Appbar"),
            backgroundColor: Colors.orange,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 120,
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Image.asset(
                ImageHelper.wrapAssetsImage("busy.gif"),
                fit: BoxFit.fill,
                height: 120,
                width: 120,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      LoginFormContainer(
                        child: ProviderWidget<LoginModel>(
                          model: LoginModel(Provider.of(context)),
                          builder: (context, model, child){
                            return Form(
                              onWillPop: () async {
                                return !model.isBusy;
                              },
                              child: child,
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              LoginTextField(
                                label: "Login",
                                icon: Icons.perm_identity,
                                controller: _mailController,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (text){
                                  FocusScope.of(context)
                                    .requestFocus(_pwdFocus);
                                },
                              ),
                              LoginTextField(
                                controller: _passwordController,
                                label: "password",
                                icon: Icons.lock_outline,
                                obscureText: true,
                                focusNode: _pwdFocus,
                                textInputAction: TextInputAction.done,
                              ),
                              SizedBox(height: 30,),
                              LoginButton(_mailController, _passwordController),
                              SizedBox(height: 30,),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


class LoginButton extends StatelessWidget {
  final mailController;
  final passwordController;
  LoginButton(this.mailController, this.passwordController);

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<LoginModel>(context);
    return RaisedButton(
      child: model.isBusy
        ? Text("Logging In")
        : Text(
          "Login in",
          style: Theme.of(context)
                .accentTextTheme
                .headline6
                .copyWith(wordSpacing: 6),
        ),
        onPressed: model.isBusy
          ? null
          : () {
            var formState = Form.of(context);
            if (formState.validate()){
              model
                  .login(mailController.text, passwordController.text)
                  // .login(mailController.text, passwordController.text)
                  .then((value){
                    if(value){
                      Navigator.of(context).pushReplacementNamed(RouteName.home);
                    } else {
                      model.showErrorMessage(context);
                    }
                  });
            }
          },     
    );
  }
}
