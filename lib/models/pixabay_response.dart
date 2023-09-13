import 'package:json_annotation/json_annotation.dart';
import 'package:pixabay/models/pixabay_item.dart';

part 'pixabay_response.g.dart';

@JsonSerializable()
class PixabayResponse {
  late final int total;
  late final int totalHits;
  late final List<PixabayItem> hits;

  factory PixabayResponse.fromJson(Map<String, dynamic> json) =>
      _$PixabayResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PixabayResponseToJson(this);

  PixabayResponse(this.total, this.totalHits, this.hits);
}
