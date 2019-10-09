import 'package:flutter/material.dart';
import 'package:jommalaysia/core/enums/viewstate.dart';

class BaseProvider extends ChangeNotifier {
  ViewState _state;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
