import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  LatLng currentLocation = const LatLng(0, 0);
  CameraPosition cameraPosition = const CameraPosition(target: LatLng(0, 0), zoom: 14);
  double zoomLevel = 14;
  late GoogleMapController controller;

  Future<void> checkPermissionAndGetCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    final currentPosition = await Geolocator.getCurrentPosition();
    cameraPosition = CameraPosition(
        target: LatLng(currentPosition.latitude, currentPosition.longitude), zoom: zoomLevel);

    setState(() {});
  }

  @override
  void initState() {
    checkPermissionAndGetCurrentLocation();
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
