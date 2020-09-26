import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulHookWidget {

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController mapController;
  String _mapStyle;
  final LatLng _center = const LatLng(-1.967165, 30.103201);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(_mapStyle);
    
    @override
    void initState() {
      super.initState();
      rootBundle.loadString('assets/map_style.txt').then((string) {
        _mapStyle = string;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Where Can I use SPAN?'),
      ),
      body: GoogleMap(
        trafficEnabled: false,
        mapType: MapType.normal,
        myLocationEnabled: true,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 14.0,
        ),
      ),
    );
  }
}
