import 'features/book/data/data_sources/remote/books_api_service.dart';
import 'features/book/data/repository_impls/book_repository_impl.dart';
import 'features/book/domain/repository/book_repository.dart';
import 'features/book/domain/use_cases/get_books_usecase.dart';
import 'features/book/domain/use_cases/get_curently_reading_book_usecase.dart';
import 'features/book/presentation/blocs/article/remote/bloc/remote_book_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

// sl=> SERVICE LOCATOR
final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  // API
  sl.registerSingleton<BooksApiService>(BooksApiService(sl()));

  // REPOSITORY
  sl.registerSingleton<BookRepository>(BookRepositoryImpl(sl()));

  // USE CASE
  sl.registerSingleton<GetBooksUseCase>(GetBooksUseCase());

  sl.registerSingleton<GetCurentlyReadingBookUseCase>(
      GetCurentlyReadingBookUseCase());

  // BLOCS
  sl.registerSingleton<RemoteBookBloc>( RemoteBookBloc(
      sl<GetBooksUseCase>(), sl<GetCurentlyReadingBookUseCase>()));
}
