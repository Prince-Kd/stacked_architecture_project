import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_architecture_project/ui/views/home/home_view.dart';
import 'package:stacked_architecture_project/ui/views/home/home_view_model.dart';
import 'package:stacked_architecture_project/ui/views/onboarding/onboarding_view.dart';
import 'package:stacked_architecture_project/ui/views/startup/startup_view.dart';
import 'package:stacked_services/stacked_services.dart';



@StackedApp(
  routes: [
    MaterialRoute(page: OnboardingView, initial: true),
    MaterialRoute(page: StartupView,),
    CupertinoRoute(page: HomeView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: HomeViewModel)
  ]
)
class AppSetup{

}