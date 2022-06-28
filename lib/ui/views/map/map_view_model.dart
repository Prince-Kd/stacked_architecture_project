import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:stacked/stacked.dart';

class MapViewModel extends BaseViewModel{
  MapViewModel(){
    getCurrentLocation();
  }

  LatLng? _currentLocation;
  LatLng? get currentLocation => _currentLocation;


  getCurrentLocation() async{
    Location location = Location();

    bool serviceEnabled = await location.serviceEnabled();
    if(!serviceEnabled){
      serviceEnabled = await location.requestService();
      if(!serviceEnabled){
        return;
      }
    }
    PermissionStatus permissionStatus = await location.hasPermission();
    if(permissionStatus == PermissionStatus.denied){
      permissionStatus = await location.requestPermission();
      if(permissionStatus != PermissionStatus.granted){
        return;
      }
    }

    LocationData locationData = await location.getLocation();
    _currentLocation = LatLng(locationData.latitude!, locationData.longitude!);
  }
}