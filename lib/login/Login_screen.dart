import 'package:chat/Register/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../base.dart';
import '../dialog_utils.dart';
import 'loginViewModel.dart';

class Login_Screen extends StatefulWidget {
  static const String routeName= 'Login';

  @override
  State<Login_Screen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<Login_Screen, login_viewModel>
implements LoginNavigator
{
  bool securiedPassword = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  login_viewModel initViewModel(){
    return login_viewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ChangeNotifierProvider(
          create: (_)=>viewModel,
          child: Container(
            color: Colors.white,
            child: Image.asset(
              'assets/images/background_image.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              'Login',
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(12),
            child: Form(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      onChanged: (text) {

                      },
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter Email';
                        }

                        bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);
                        if (!emailValid) {
                          return 'email format not valid';
                        }
                        return null;
                      }),
                  TextFormField(
                    controller: passwordController,
                    obscureText: securiedPassword,
                    decoration: InputDecoration(labelText: 'Password',
                        suffixIcon: InkWell(onTap: (){
                          securiedPassword=!securiedPassword;
                          setState((){});
                        },
                            child: securiedPassword? Icon(Icons.visibility_off):Icon(Icons.visibility))),
                    onChanged: (text) {

                    },
                    validator: (text) {

                      if (text == null || text.trim().isEmpty) {
                        return 'please enter password';
                      }
                      if (text.trim().length < 6) {
                        return 'password should be at least 6 chars';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Login_Click();
                      },
                      child: Text('Login')),
                  InkWell(
                      onTap: (){
                        Navigator.pushReplacementNamed(context,
                            Register_Screen.routeName);
                      },
                      child: Text("Don't have an account ? "))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  var auth_server= FirebaseAuth.instance;

  void Login_Click() {
    if(formkey.currentState?.validate() == false){
      return;
    }
    viewModel.login(emailController.text, passwordController.text);

  }





}
