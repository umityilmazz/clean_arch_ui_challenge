// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolumeInfoModel _$VolumeInfoModelFromJson(Map<String, dynamic> json) =>
    VolumeInfoModel(
      json['title'] as String?,
      json['subtitle'] as String?,
      (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['publishedDate'] as String?,
      json['readingModes'] == null
          ? null
          : ReadingModesModel.fromJson(
              json['readingModes'] as Map<String, dynamic>),
      json['pageCount'] as int?,
      json['printType'] as String?,
      (json['categories'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['maturityRating'] as String?,
      json['imageLinks'] == null
          ? null
          : ImageLinksModel.fromJson(
              json['imageLinks'] as Map<String, dynamic>),
      json['language'] as String?,
    );

Map<String, dynamic> _$VolumeInfoModelToJson(VolumeInfoModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'authors': instance.authors,
      'publishedDate': instance.publishedDate,
      'readingModes': instance.readingModes?.toJson(),
      'pageCount': instance.pageCount,
      'printType': instance.printType,
      'categories': instance.categories,
      'maturityRating': instance.maturityRating,
      'imageLinks': instance.imageLinks?.toJson(),
      'language': instance.language,
    };
