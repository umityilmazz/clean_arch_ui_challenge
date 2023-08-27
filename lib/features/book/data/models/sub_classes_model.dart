import '../../domain/entities/book/sub_classes.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sub_classes_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ReadingModesModel extends ReadingModes {
  const ReadingModesModel({required bool? text, required bool? image})
      : super(image: image, text: text);

  factory ReadingModesModel.fromJson(Map<String, dynamic> json) =>
      _$ReadingModesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReadingModesModelToJson(this);
}
@JsonSerializable(explicitToJson: true)
class ImageLinksModel extends ImageLinks {
  const ImageLinksModel({
    required String? smallThumbnail,
    required String? thumbnail,
  }) : super(smallThumbnail: smallThumbnail, thumbnail: thumbnail);
  factory ImageLinksModel.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageLinksModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class EpubModel extends Epub {
  const EpubModel({required bool? isAvailable, required String? downloadLink})
      : super(downloadLink: downloadLink, isAvailable: isAvailable);

  factory EpubModel.fromJson(Map<String, dynamic> json) =>
      _$EpubModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpubModelToJson(this);
}
