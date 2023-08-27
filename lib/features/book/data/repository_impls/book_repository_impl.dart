import '../../../../core/enums/api_enums.dart';
import '../../../../core/resources/data_state.dart';
import '../data_sources/remote/books_api_service.dart';
import '../../domain/entities/book/book_item.dart';
import '../../domain/entities/book/book_list.dart';
import '../../domain/repository/book_repository.dart';
import 'package:dio/dio.dart';
import '../../../../core/extensions/enum_extensions.dart';

class BookRepositoryImpl implements BookRepository {
  final BooksApiService _booksApiService;

  BookRepositoryImpl(this._booksApiService);

  @override
  Future<DataState<BookList>> getBookList(
      {String? q,
      FilterParams? filter,
      String? maxResults,
      String? download,
      String? apiKey,
      OrderByParams? orderBy}) async {
    try {
      final response = await _booksApiService.getBookList(
          apiKey: apiKey,
          download: download,
          filter: filter?.getParam,
          maxResults: maxResults,
          q: q??"science fiction",
          orderBy: orderBy?.getParam);
      return DataStateSucces(response);
    } on DioException catch (e) {
      return DataStateFailed(e);
    }
  }

  @override
  Future<DataState<BookItem>> getCurentlyReadingBook({
    required String apiKey,
  }) async {
    try {
      final response = await _booksApiService.getSingleBook();
      return DataStateSucces(response);
    } on DioException catch (e) {
      return DataStateFailed(e);
    }
  }
}
