import 'package:google_maps_flutter/google_maps_flutter.dart';

List<LatLng> jsonToLatLng(Map<String, dynamic> json) => List.generate(json["coordinates"].length,
    (index) => LatLng(json['coordinates'][index][0] * 1.0, json['coordinates'][index][1] * 1.0));

List<List<double>> latLngtoJson(List<LatLng> latLng) =>
    List.generate(latLng.length, (index) => [latLng[index].latitude, latLng[index].longitude]);
