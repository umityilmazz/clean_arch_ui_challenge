// ignore_for_file: overridden_fields

import 'package:clean_architechture_temp/features/book/data/models/book_item_model.dart';
import 'package:clean_architechture_temp/features/book/domain/entities/book/book_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_list_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BookListModel extends BookList {
  @override
  final String? kind;
  @override
  final int? totalItems;
  @override
  final List<BookItemModel>? items;
  const BookListModel(
    this.kind,
    this.totalItems,
    this.items,
  );

  factory BookListModel.fromJson(Map<String, dynamic> json) =>
      _$BookListModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookListModelToJson(this);
}
