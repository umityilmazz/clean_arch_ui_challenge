part of 'remote_book_bloc.dart';

sealed class RemoteBookEvent extends Equatable {
  const RemoteBookEvent();
  @override
  List<Object> get props => [];
}

final class RemoteLoadBooksEvent extends RemoteBookEvent {}

final class RemoteLoadPopularBooksEvent extends RemoteBookEvent {}

final class RemoteLoadNewestBooksEvent extends RemoteBookEvent {}
