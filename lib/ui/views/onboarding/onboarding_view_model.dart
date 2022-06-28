import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_project/app/app.locator.dart';
import 'package:stacked_architecture_project/ui/views/startup/startup_view.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingViewModel extends BaseViewModel{
  final _nagivationService = locator<NavigationService>();
  final pageController = PageController();

  int _currentPage = 0;

  int get currentPage => _currentPage;

  setCurrentIndex(int index){
    _currentPage = index;
    notifyListeners();
  }

  completeOnboarding(){
    _nagivationService.clearStackAndShowView(const StartupView());
  }

  nextPage(){
    pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}