import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ormi2_4/models/enums.dart';

import '../common/latlng_util.dart';

part 'record_model.freezed.dart';
part 'record_model.g.dart';

@freezed
class Record with _$Record {
  const Record._();
  const factory Record(
      {required int id,
      required int user,
      required DateTime startAt,
      @Default(null) DateTime? endAt,
      @Default(null) String? staticMap,
      @JsonKey(name: "coords", fromJson: jsonToLatLng, toJson: latLngtoJson)
      @Default([])
      List<LatLng> coords,
      required double distance,
      required String time,
      required DateTime createdAt,
      required Kind kind,
      required List<String> images,
      required double calorie}) = _Record;

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}
