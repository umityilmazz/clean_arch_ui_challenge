// ignore_for_file: overridden_fields
import 'package:clean_architechture_temp/features/book/data/models/volume_info_model.dart';
import 'package:clean_architechture_temp/features/book/domain/entities/book/book_item.dart';
import 'package:json_annotation/json_annotation.dart';
part 'book_item_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BookItemModel extends BookItem {
  @override
  final String? kind;
  @override
  final String? id;
  @override
  final String? etag;
  @override
  final String? selfLink;
  @override
  final VolumeInfoModel? volumeInfo;
  const BookItemModel(
      this.etag, this.id, this.kind, this.volumeInfo, this.selfLink);

  factory BookItemModel.fromJson(Map<String, dynamic> json) =>
      _$BookItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookItemModelToJson(this);
}
