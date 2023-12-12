import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  late LatLng currentLocation;
  CameraPosition cameraPosition = const CameraPosition(target: LatLng(0, 0), zoom: 14);
  double zoomLevel = 14;
  late GoogleMapController controller;

  Future<void> setInitLocation() async {
    final position = await Geolocator.getCurrentPosition();
    currentLocation = LatLng(position.latitude, position.longitude);
  }

  @override
  void initState() {
    setInitLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
      ),
      body: SafeArea(
        child: Center(
          child: GoogleMap(
            initialCameraPosition: cameraPosition,
            onMapCreated: (controller) async {
              setState(() => this.controller = controller);
              await this.controller.moveCamera(CameraUpdate.newLatLng(currentLocation));
            },
            zoomControlsEnabled: true,
            mapType: MapType.normal,
            compassEnabled: true,
            myLocationEnabled: true,
          ),
        ),
      ),
    );
  }
}
