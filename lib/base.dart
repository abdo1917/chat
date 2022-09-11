import 'package:flutter/material.dart';

import 'dialog_utils.dart';

abstract class BaseNavigator {
  void showLoadingDialoge({String? message = 'hide loading'});
  void hideLoaingDialge();
  void showMessageDialoge(String message);
}

class BaseViewModel<Nav extends BaseNavigator> extends ChangeNotifier {
  Nav? navigator;
}

abstract class BaseState<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T>
implements BaseNavigator{
  late VM viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
    viewModel.navigator =this ;
  }
  VM initViewModel();
  @override
  void hideLoaingDialge() {
    // TODO: implement hideLoaingDialge
    hideLoading(context);
  }

  @override
  showLoadingDialoge({String? message = 'hide loading'}) {
    // TODO: implement showLoadingDialoge
    showLoading(context, message ?? '');
  }

  @override
  void showMessageDialoge(String message) {
    // TODO: implement showMessageDialoge
    showMessage( context,  message?? '');
  }
}
