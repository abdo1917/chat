import 'package:chat/Login_screen.dart';
import 'package:chat/dialog_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register_Screen extends StatefulWidget {
  static const String routeName= 'Register';

  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
  bool securiedPassword = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            'assets/images/background_image.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              'Create Account',
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(12),
            child: Form(
              key: formkey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'First Name'),
                      onChanged: (text) {

                      },
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter first Name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                        decoration: InputDecoration(labelText: 'Last Name'),
                        onChanged: (text) {

                        },
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter last Name';
                          }
                          return null;
                        }),
                    TextFormField(
                        decoration: InputDecoration(labelText: 'User Name'),
                        onChanged: (text) {

                        },
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter user Name';
                          }
                          if (text.contains(' ')) {
                            return 'user name must not contains white spaces';
                          }
                          return null;
                        }),
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
                        child: Text('Create Account')),
                    InkWell(
                        onTap: (){
                          Navigator.pushReplacementNamed(context,
                              Login_Screen.routeName);
                        },
                        child: Text("Already have an account ? "))
                  ],
                ),
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
    showLoading(context, 'Loading...');
    auth_server.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text)
        .then((userCreditinal)  {
          hideLoading(context);
          showMessage(context, userCreditinal.user!.uid);
    })
    .onError((error, stackTrace) {
      hideLoading(context);
      showMessage(context, error.toString());
    })
    ;
  }
}
