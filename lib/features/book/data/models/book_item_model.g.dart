// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookItemModel _$BookItemModelFromJson(Map<String, dynamic> json) =>
    BookItemModel(
      json['etag'] as String?,
      json['id'] as String?,
      json['kind'] as String?,
      json['volumeInfo'] == null
          ? null
          : VolumeInfoModel.fromJson(
              json['volumeInfo'] as Map<String, dynamic>),
      json['selfLink'] as String?,
    );

Map<String, dynamic> _$BookItemModelToJson(BookItemModel instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'id': instance.id,
      'etag': instance.etag,
      'selfLink': instance.selfLink,
      'volumeInfo': instance.volumeInfo?.toJson(),
    };
