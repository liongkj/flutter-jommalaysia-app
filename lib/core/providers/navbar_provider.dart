import 'base_provider.dart';

class NavBarProvider extends BaseProvider {
  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  void switchTab(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
