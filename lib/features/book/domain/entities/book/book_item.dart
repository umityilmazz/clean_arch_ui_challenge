import 'package:equatable/equatable.dart';

import 'volume_info.dart';

class BookItem extends Equatable {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfo? volumeInfo;

  const BookItem({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
  });

  @override
  List<Object?> get props => [kind, id, etag, selfLink, volumeInfo];
}
