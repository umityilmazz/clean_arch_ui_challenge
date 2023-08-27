// ignore_for_file: overridden_fields

import 'package:clean_architechture_temp/features/book/data/models/sub_classes_model.dart';
import 'package:clean_architechture_temp/features/book/domain/entities/book/volume_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'volume_info_model.g.dart';


@JsonSerializable(explicitToJson: true)
class VolumeInfoModel extends VolumeInfo {
  @override
  final String? title;
  @override
  final String? subtitle;
  @override
  final List<String>? authors;
  @override
  final String? publishedDate;
  @override
  final ReadingModesModel? readingModes;
  @override
  final int? pageCount;
  @override
  final String? printType;
  @override
  final List<String>? categories;
  @override
  final String? maturityRating;
  @override
  final ImageLinksModel? imageLinks;
  @override
  final String? language;
  @override


  const VolumeInfoModel(
    this.title,
    this.subtitle,
    this.authors,
    this.publishedDate,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.maturityRating,
    this.imageLinks,
    this.language,
  );

  factory VolumeInfoModel.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeInfoModelToJson(this);
}
