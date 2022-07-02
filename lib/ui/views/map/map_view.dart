import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:here_sdk/mapview.dart' as mv;
import 'package:latlong2/latlong.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_project/ui/views/map/map_view_model.dart';
import 'package:here_sdk/core.dart';

class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = MapController();

    return ViewModelBuilder<MapViewModel>.reactive(
        viewModelBuilder: () => MapViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.my_location),
                onPressed: () {
                  controller.move(
                      LatLng(model.currentLocation!.latitude,
                          model.currentLocation!.longitude),
                      13);
                },
              ),
              body: model.currentLocation == null
                  ? const Center(
                      child: SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ))
                  : FlutterMap(
                      mapController: controller,
                      options: MapOptions(
                        onTap: (position, points) {
                          print(points);
                        },
                        center: LatLng(model.currentLocation!.latitude,
                            model.currentLocation!.longitude),
                        zoom: 13.5,
                      ),
                      layers: [
                        TileLayerOptions(
                          urlTemplate:
                              "https://api.mapbox.com/styles/v1/cold-blood/cl5101eh0000n15pfqrf6n749/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiY29sZC1ibG9vZCIsImEiOiJja3p2amQ2NHkyOXR1MnJwZWVqdDR6MDhvIn0.7w8LlLUhgzCWXXRUDm2aOA",
                        ),
                        MarkerLayerOptions(markers: [
                          Marker(
                              point: LatLng(model.currentLocation!.latitude,
                                  model.currentLocation!.longitude),
                              builder: (context) => Icon(
                                    Icons.location_on,
                                    color: Colors.blue,
                                    size: 30,
                                  ))
                        ])
                      ],
                    ));
        });
  }
}

// mv.HereMap(
// onMapCreated: model.onMapCreated,
// onMapViewCreated: model.onMapViewCreated,
// ),
