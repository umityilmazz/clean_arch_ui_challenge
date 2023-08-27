

import '../../../../core/enums/api_enums.dart';
import '../../../../core/resources/data_state.dart';
import '../entities/book/book_item.dart';
import '../entities/book/book_list.dart';

abstract interface class BookRepository{
  Future<DataState<BookList>> getBookList({String? q,FilterParams? filter,String? maxResults, String? download,String? apiKey,OrderByParams? orderBy});
  Future<DataState<BookItem>> getCurentlyReadingBook({required String apiKey});
}