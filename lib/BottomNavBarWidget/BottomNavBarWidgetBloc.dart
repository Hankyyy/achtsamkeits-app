import 'dart:async';

enum BottomNavBarItem { Home, Kalender, Ubungen, Ziele }

class BottomNavBarBloc {
  final StreamController<BottomNavBarItem> _navBarStreamController =
      StreamController<BottomNavBarItem>.broadcast();

  BottomNavBarItem defaultItem = BottomNavBarItem.Home;

  Stream<BottomNavBarItem> get navBarStream => _navBarStreamController.stream;

  void pickItem(int i) {
    switch (i) {
      case 0:
        _navBarStreamController.sink.add(BottomNavBarItem.Home);
        break;
      case 1:
        _navBarStreamController.sink.add(BottomNavBarItem.Kalender);
        break;
      case 2:
        _navBarStreamController.sink.add(BottomNavBarItem.Ubungen);
        break;
      case 3:
        _navBarStreamController.sink.add(BottomNavBarItem.Ziele);
        break;
    }
  }

  dispose() {
    _navBarStreamController.close();
  }
}
