import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_project/app/app.locator.dart';
import 'package:stacked_architecture_project/ui/views/home/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      disposeViewModel: false,
        initialiseSpecialViewModelsOnce: true,
        viewModelBuilder: () => locator<HomeViewModel>(),
        builder: (context, model, child){
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(model.title),
                Text('${model.value}')
              ],
            )
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.red,
                  onPressed: model.decrement,
                  child: const Icon(Icons.remove, color: Colors.white)
              ),
              const SizedBox(height: 20,),
              FloatingActionButton(
                  onPressed: model.increment,
                  child: const Icon(Icons.add, color: Colors.white)
              )
            ],
          )
        );
    });
  }
}
