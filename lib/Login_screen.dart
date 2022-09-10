import 'package:chat/Register.dart';
import 'package:flutter/material.dart';

class Login_Screen extends StatelessWidget {
  static const String routeName= 'Login';
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
                      decoration: InputDecoration(labelText: 'Email'),
                      onChanged: (text) {

                      },
                      validator: (text) {

                      }),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
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
}
