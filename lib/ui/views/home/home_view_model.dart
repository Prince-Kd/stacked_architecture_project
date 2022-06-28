import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel{
  String _title = 'Counter';
  String get title => _title;

  int _value = 0;
  int get value => _value;

  increment(){
    _value += 1;
    notifyListeners();
  }

  decrement(){
    if(_value > 0){
      _value -= 1;
      notifyListeners();
    }
  }
}