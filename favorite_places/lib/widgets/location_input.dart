import 'dart:convert';
import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onSelectLocation});
  final void Function(PlaceLocation location) onSelectLocation;
  State<LocationInput> createState() {
    return _LocationInputState();
  }
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? _pickedLocation;
  
 
  var _isGettingLocation = false;

  Future<void> _savePlace(double latitude , double longitude) async{

    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=AIzaSyDLcwxUggpPZo8lcbH0TB4Crq55Jitj4ag');
    final response = await http.get(url);
    final resData = json.decode(response.body);
    final address = resData['results'][0]['formatted_address'];
    if (latitude == null || longitude == null) {
      return;
    }
    setState(() {
      _pickedLocation =
          PlaceLocation(latitude: latitude, longitude: longitude, address: address);
      _isGettingLocation = false;
    });


    widget.onSelectLocation(_pickedLocation!);

  }

  

String get locationImage{
    if(_pickedLocation == null){
      return '';
    }
    final lat = _pickedLocation!.latitude;
    final lng = _pickedLocation!.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=16&size=600x300&maptype=roadmap
&markers=color:red%7Clabel:A%7C$lat,$lng
&key=AIzaSyDLcwxUggpPZo8lcbH0TB4Crq55Jitj4ag';
  }







  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
    });

    locationData = await location.getLocation();

    final lat = locationData.latitude;
    final lng = locationData.longitude;

    _savePlace(lat!, lng!);
    // final url = Uri.parse(
    //     'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=AIzaSyDLcwxUggpPZo8lcbH0TB4Crq55Jitj4ag');
    // final response = await http.get(url);
    // final resData = json.decode(response.body);
    // final address = resData['results'][0]['formatted_address'];
    // if (lat == null || lng == null) {
    //   return;
    // }
    // setState(() {
    //   _pickedLocation =
    //       PlaceLocation(latitude: lat, longitude: lng, address: address);
    //   _isGettingLocation = false;
    // });


    // widget.onSelectLocation(_pickedLocation!);
    // print(location.latitude);
    // print(location.longitude);


  }

  void _selectOnMap() async {
final pickedLocation = await Navigator.of(context).push<LatLng>(MaterialPageRoute(builder: (ctx) => MapScreen(),),);
if(_pickedLocation == null){
  return;
}
_savePlace(_pickedLocation!.latitude, _pickedLocation!.longitude)
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
      'no location chosen',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
    );

    if(_pickedLocation != null){
      previewContent = Image.network(_locationImage , fit: BoxFit.cover, width: double.infinity, height: double.infinity);
    }

    if (_isGettingLocation) {
      previewContent = const CircularProgressIndicator();
    }
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
            ),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          ),
          child: previewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.location_on),
              label: const Text('get current location'),
              onPressed: _getCurrentLocation,
            ),
            TextButton.icon(
              icon: const Icon(Icons.map),
              label: const Text('select on map'),
              onPressed: _selectOnMap,
            ),
          ],
        ),
      ],
    );
  }
}
