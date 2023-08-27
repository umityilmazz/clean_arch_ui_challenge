// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookListModel _$BookListModelFromJson(Map<String, dynamic> json) =>
    BookListModel(
      json['kind'] as String?,
      json['totalItems'] as int?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => BookItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookListModelToJson(BookListModel instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'totalItems': instance.totalItems,
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };
