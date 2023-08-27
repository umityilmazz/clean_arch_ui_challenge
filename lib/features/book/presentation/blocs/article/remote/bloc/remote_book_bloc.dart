// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../../../../core/enums/api_enums.dart';
import '../../../../../domain/entities/book/book_item.dart';
import '../../../../../domain/use_cases/get_books_usecase.dart';
import '../../../../../domain/use_cases/get_curently_reading_book_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/entities/book/volume_info.dart';

part 'remote_book_event.dart';
part 'remote_book_state.dart';

class RemoteBookBloc extends Bloc<RemoteBookEvent, RemoteBookState> {
  final GetBooksUseCase _getBooksUseCase;
  final GetCurentlyReadingBookUseCase _getCurentlyReadingBookUseCase;
  RemoteBookBloc(
    this._getBooksUseCase,
    this._getCurentlyReadingBookUseCase,
  ) : super(RemoteBookInitial()) {
    on<RemoteLoadBooksEvent>(_onLoadBooks);
    on<RemoteLoadNewestBooksEvent>(_onLoadNewestBooks);
    on<RemoteLoadPopularBooksEvent>(_onLoadPopularBooks);
    if (state is RemoteBookInitial) {
      add(RemoteLoadBooksEvent());
    }
  }

  void _onLoadBooks(
      RemoteLoadBooksEvent event, Emitter<RemoteBookState> emit) async {
    final responseSingleBook = await _getCurentlyReadingBookUseCase();

    final responseBooks = await _getBooksUseCase();
    final bookInfos =
        responseBooks.data?.items?.map((e) => e.volumeInfo).toList();
    emit(RemoteBookLoaded(
        bookInfos, state.curentlyReadingBook ?? responseSingleBook.data));
  }

  void _onLoadPopularBooks(
      RemoteLoadPopularBooksEvent event, Emitter<RemoteBookState> emit) async {
    final responseBooks =
        await _getBooksUseCase(params: {"orderBy": OrderByParams.relevance});
    final bookInfos =
        responseBooks.data?.items?.map((e) => e.volumeInfo).toList();
    emit(RemoteBookLoadedPopular(bookInfos, state.curentlyReadingBook));
  }

  void _onLoadNewestBooks(
      RemoteLoadNewestBooksEvent event, Emitter<RemoteBookState> emit) async {
    final responseBooks =
        await _getBooksUseCase(params: {"orderBy": OrderByParams.newest});
    final bookInfos =
        responseBooks.data?.items?.map((e) => e.volumeInfo).toList();
    emit(RemoteBookLoadedNewest(bookInfos, state.curentlyReadingBook));
  }
}
