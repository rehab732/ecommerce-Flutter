import 'package:flutter/cupertino.dart';

class LoadingCircle extends ChangeNotifier {
  bool isloading = false;
  changeloading(bool value) {
    isloading = value;
    notifyListeners();
  }
}
