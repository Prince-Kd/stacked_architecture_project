import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_project/ui/views/settings/settings_view_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
        viewModelBuilder: () => SettingsViewModel(),
        builder: (context, model, child){
          return Scaffold(
              body: Center(
                child: Text(model.title),
              ),
              // floatingActionButton: FloatingActionButton(
              //     onPressed: (){},
              //     child: Icon(Icons.add, color: Colors.white)
              // )
          );
        });
  }
}
