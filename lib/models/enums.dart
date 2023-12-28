import 'package:freezed_annotation/freezed_annotation.dart';

enum Kind {
  @JsonValue("WALK")
  walk("걷기"),

  @JsonValue("RUN")
  run("런닝"),

  @JsonValue("BIKE")
  bike("자전기");

  final String kName;
  const Kind(this.kName);
}
