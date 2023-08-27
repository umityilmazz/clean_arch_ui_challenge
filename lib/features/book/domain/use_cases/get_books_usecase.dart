import '../../../../core/resources/data_state.dart';
import '../repository/book_repository.dart';
import '../../../../injection_container.dart';
import 'package:dio/dio.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/book/book_list.dart';

class GetBooksUseCase
    implements UseCase<DataState<BookList>, Map<String, dynamic>> {
  @override
  Future<DataState<BookList>> call({Map<String, dynamic>? params}) async {
    try {
      final bookList = await sl<BookRepository>().getBookList(
        apiKey: params?["apiKey"],
        download: params?["download"],
        filter: params?["filter"],
        maxResults: params?["maxRsult"],
        orderBy: params?["orderBy"],
        q: params?["q"],
      );
      return bookList;
    } on DioException catch (e) {
      return DataStateFailed(e);
    }
  }
}
