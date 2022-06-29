import 'package:latlong2/latlong.dart';
import 'package:location/location.dart' as l;
import 'package:stacked/stacked.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';

class MapViewModel extends BaseViewModel {
  MapViewModel() {
    getCurrentLocation();
  }

  LatLng? _currentLocation;
  LatLng? get currentLocation => _currentLocation;

  getCurrentLocation() async {
    l.Location location = l.Location();

    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    l.PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == l.PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != l.PermissionStatus.granted) {
        return;
      }
    }

    l.LocationData locationData = await location.getLocation();
    _currentLocation = LatLng(locationData.latitude!, locationData.longitude!);
    notifyListeners();
  }


  void onMapCreated(HereMapController hereMapController) {
    void _addMapMarker(GeoCoordinates geoCoordinates) {
      int imageWidth = 40;
      int imageHeight = 60;
      MapImage mapImage = MapImage.withFilePathAndWidthAndHeight("assets/car_icon.png", imageWidth, imageHeight);
      MapMarker mapMarker = MapMarker(geoCoordinates, mapImage);
      hereMapController.mapScene.addMapMarker(mapMarker);
    }

    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.normalDay,
        (MapError? error) {
      if (error != null) {
        print('Map scene not loaded. MapError: ${error.toString()}');
        return;
      }

      const double distanceToEarthInMeters = 8000;
      MapMeasure mapMeasureZoom =
          MapMeasure(MapMeasureKind.distance, distanceToEarthInMeters);
      hereMapController.camera.lookAtPointWithMeasure(
          GeoCoordinates(5.6628, -0.1309), mapMeasureZoom);

      // hereMapController.camera.lookAtPointWithMeasure(GeoCoordinates(_currentLocation!.latitude, _currentLocation!.longitude), mapMeasureZoom);

      // Optionally enable textured 3D landmarks.
      hereMapController.mapScene.setLayerVisibility(
          MapSceneLayers.landmarks, VisibilityState.visible);
      _addMapMarker(GeoCoordinates(5.6628, -0.1309));
    });
  }

  void onMapViewCreated(mapView) {
    mapView.mapScene.loadSceneForMapScheme(MapScheme.normalDay,
        (MapError error) {
      if (error != null) {
        print("Map scene not loaded. MapError: " + error.toString());
      }

      double distanceToEarthInMeters = 8000;

      mapView.camera.lookAtPointWithDistance(
          GeoCoordinates(5.6628, -0.1309), distanceToEarthInMeters);
      // mapView.camera.lookAtPointWithDistance(
      //     GeoCoordinates(_currentLocation!.latitude, _currentLocation!.longitude),
      //     distanceToEarthInMeters);
    });
  }
}
