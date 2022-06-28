import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_project/ui/views/map/map_view_model.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by 'flutter_map.dart'
import 'package:latlong2/latlong.dart';

class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapController mapController = MapController();
    return ViewModelBuilder<MapViewModel>.reactive(
        viewModelBuilder: () => MapViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: model.currentLocation == null
                ? const Center(
                    child: SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ))
                : FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      center: model.currentLocation,
                      zoom: 13.0,
                      maxZoom: 19.0,
                      rotation: 180.0
                    ),
                    children: [],
                  ),
          );
        });
  }
}
