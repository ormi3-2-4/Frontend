import 'package:google_maps_flutter/google_maps_flutter.dart';

List<LatLng> jsonToLatLng(List<dynamic> json) =>
    List.generate(json.length, (index) => LatLng(json[index][0] * 1.0, json[index][1] * 1.0));

List<List<double>> latLngtoJson(List<LatLng> latLng) =>
    List.generate(latLng.length, (index) => [latLng[index].latitude, latLng[index].longitude]);
