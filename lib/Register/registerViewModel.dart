import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../base.dart';
import '../dialog_utils.dart';

abstract class RegisterNavigator extends BaseNavigator{


}


class Register_viewModel extends BaseViewModel<RegisterNavigator>{
  var auth= FirebaseAuth.instance;
  void Register(String email , String password,) async {
    try {
      navigator?.showLoadingDialoge();
      var creditinal = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password);
      navigator?.hideLoaingDialge();
      navigator?.showMessageDialoge(creditinal.user?.uid  ?? '');
    } on FirebaseAuthException catch (e) {
      if(e.code == 'weak-password'){
        navigator?.showMessageDialoge('The passowrd provided is too weak');
      } else if (e.code == 'email-already-in-use'){
        navigator?.showMessageDialoge('Email is already registed');
      }
    }
    catch(e){
      navigator?.showMessageDialoge('someting went weong , please try again later');

    }
  }
}