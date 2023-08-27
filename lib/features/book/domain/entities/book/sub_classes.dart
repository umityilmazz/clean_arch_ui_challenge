import 'package:equatable/equatable.dart';

class ReadingModes extends Equatable {
  final bool? text;
  final bool? image;

  const ReadingModes({this.text, this.image});

  @override
  List<Object?> get props => [text, image];
}

class ImageLinks extends Equatable {
  final String? smallThumbnail;
  final String? thumbnail;

  const ImageLinks({this.smallThumbnail, this.thumbnail});

  @override
  List<Object?> get props => [smallThumbnail, thumbnail];
}

class Epub extends Equatable {
  final bool? isAvailable;
  final String? downloadLink;

  const Epub({this.isAvailable, this.downloadLink});

  @override
  List<Object?> get props => [isAvailable, downloadLink];
}
