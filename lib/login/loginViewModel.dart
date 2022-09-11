import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../base.dart';

import '../dialog_utils.dart';

abstract class LoginNavigator extends BaseNavigator{

}


class login_viewModel extends BaseViewModel<LoginNavigator>{
  var auth= FirebaseAuth.instance;
  void login(String email , String password,) async {
    try {
      navigator?.showLoadingDialoge();
      var creditinal = await auth.signInWithEmailAndPassword(
          email: email,
          password: password);
      navigator?.hideLoaingDialge();
      navigator?.showMessageDialoge(creditinal.user?.uid  ?? '');
    } on FirebaseAuthException catch (e) {
      navigator?.hideLoaingDialge();
      navigator?.showMessageDialoge('wrong user name or password');
    }
  }
}