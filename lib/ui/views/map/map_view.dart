import 'package:flutter/material.dart';
import 'package:here_sdk/mapview.dart' as mv;
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_project/ui/views/map/map_view_model.dart';
import 'package:here_sdk/core.dart';

class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MapViewModel>.reactive(
        viewModelBuilder: () => MapViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: model.currentLocation == null ? const Center(child: SizedBox(height: 30, width: 30, child: CircularProgressIndicator(strokeWidth: 2,),))
                : mv.HereMap(
              onMapCreated: model.onMapCreated,
              onMapViewCreated: model.onMapViewCreated,
            ),
          );
        });
  }



  // void _onMapViewCreated( mapView) {
  //   mapView.mapScene.loadSceneForMapScheme(mv.MapScheme.normalDay,
  //       (mv.MapError error) {
  //     if (error != null) {
  //       print("Map scene not loaded. MapError: " + error.toString());
  //     }
  //
  //     double distanceToEarthInMeters = 8000;
  //     mapView.camera.lookAtPointWithDistance(
  //         GeoCoordinates(52.530932, 13.384915), distanceToEarthInMeters);
  //   });
  // }
}
