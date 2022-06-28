import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_project/ui/views/home/home_view.dart';
import 'package:stacked_architecture_project/ui/views/map/map_view.dart';
import 'package:stacked_architecture_project/ui/views/settings/settings_view.dart';
import 'package:stacked_architecture_project/ui/views/startup/startup_view_model.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
        viewModelBuilder: () => StartupViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: PageTransitionSwitcher(
              duration: const Duration(milliseconds: 300),
              reverse: model.reverse,
              transitionBuilder: (Widget child, animation, secondaryAnimation) {
                return SharedAxisTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.horizontal,
                  child: child,
                );
              },
              child: getIndexView(model.currentIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: model.currentIndex,
              onTap: model.setIndex,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: '',
                  activeIcon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.map_outlined),
                  label: '',
                  activeIcon: Icon(Icons.map),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  label: '',
                  activeIcon: Icon(Icons.settings),
                ),
              ],
            ),
          );
        });
  }

  Widget getIndexView(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const MapView();
      case 2:
        return const SettingsView();
      default:
        return const HomeView();
    }
  }
}
