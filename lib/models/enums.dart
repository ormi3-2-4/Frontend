import 'package:freezed_annotation/freezed_annotation.dart';

enum Kind {
  @JsonValue("WALK")
  walk,

  @JsonValue("RUN")
  run,

  @JsonValue("BIKE")
  bike
}
