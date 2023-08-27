import '../../../../core/resources/data_state.dart';
import '../entities/book/book_list.dart';
import '../repository/book_repository.dart';
import '../../../../injection_container.dart';

import '../../../../core/usecase/usecase.dart';

class GetBookCardInfoUsecase extends UseCase<DataState<BookList>, String> {
  @override
  Future<DataState<BookList>> call({String? params}) async {
    final response = await sl<BookRepository>().getBookList();
    return response;
  }
}
