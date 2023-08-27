// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_classes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadingModesModel _$ReadingModesModelFromJson(Map<String, dynamic> json) =>
    ReadingModesModel(
      text: json['text'] as bool?,
      image: json['image'] as bool?,
    );

Map<String, dynamic> _$ReadingModesModelToJson(ReadingModesModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'image': instance.image,
    };

ImageLinksModel _$ImageLinksModelFromJson(Map<String, dynamic> json) =>
    ImageLinksModel(
      smallThumbnail: json['smallThumbnail'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$ImageLinksModelToJson(ImageLinksModel instance) =>
    <String, dynamic>{
      'smallThumbnail': instance.smallThumbnail,
      'thumbnail': instance.thumbnail,
    };

EpubModel _$EpubModelFromJson(Map<String, dynamic> json) => EpubModel(
      isAvailable: json['isAvailable'] as bool?,
      downloadLink: json['downloadLink'] as String?,
    );

Map<String, dynamic> _$EpubModelToJson(EpubModel instance) => <String, dynamic>{
      'isAvailable': instance.isAvailable,
      'downloadLink': instance.downloadLink,
    };
