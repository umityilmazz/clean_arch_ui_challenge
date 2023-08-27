part of 'remote_book_bloc.dart';

sealed class RemoteBookState extends Equatable {
  final List<VolumeInfo?>? bookInfos;
  final BookItem? curentlyReadingBook;
  const RemoteBookState(this.bookInfos, this.curentlyReadingBook);
  @override
  List<Object> get props => [bookInfos??"", curentlyReadingBook??""];
}

final class RemoteBookInitial extends RemoteBookState {
  RemoteBookInitial() : super([], null);
}

final class RemoteBookLoading extends RemoteBookState {
  RemoteBookLoading() : super([], null);
}

final class RemoteBookLoaded extends RemoteBookState {
  const RemoteBookLoaded(
      final List<VolumeInfo?>? bookInfos, final BookItem? curentlyReadingBook)
      : super(bookInfos, curentlyReadingBook);
}

final class RemoteBookLoadedPopular extends RemoteBookState {
  const RemoteBookLoadedPopular(
      final List<VolumeInfo?>? bookInfos, final BookItem? curentlyReadingBook)
      : super(bookInfos, curentlyReadingBook);
}

final class RemoteBookLoadedNewest extends RemoteBookState {
  const RemoteBookLoadedNewest(
      final List<VolumeInfo?>? bookInfos, final BookItem? curentlyReadingBook)
      : super(bookInfos, curentlyReadingBook);
}
