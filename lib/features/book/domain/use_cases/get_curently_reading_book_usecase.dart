import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/book/book_item.dart';
import '../repository/book_repository.dart';
import '../../../../injection_container.dart';

import '../../../../core/constants/constants.dart';

class GetCurentlyReadingBookUseCase extends UseCase<DataState<BookItem>, void> {
  @override
  Future<DataState<BookItem>> call({void params}) async {
    final bookItem = await sl<BookRepository>().getCurentlyReadingBook(apiKey: newsAPIkey);
    return bookItem;
  }
}
