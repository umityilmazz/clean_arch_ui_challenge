import '../../models/book_item_model.dart';
import '../../models/book_list_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'books_api_service.g.dart';

@RestApi(baseUrl: "https://www.googleapis.com/books/v1/volumes")
abstract class BooksApiService {
  factory BooksApiService(Dio dio) = _BooksApiService;

  @GET("")
  Future<BookListModel> getBookList({
    @Query("q") String? q="science fiction",
    @Query("key") String? apiKey,
    @Query("filter") String? filter,
    @Query("download") String? download,
    @Query("maxResults") String? maxResults,
    @Query("orderBy") String? orderBy,
  });

  @GET("/B2zQAAAAMAAJ")
  Future<BookItemModel> getSingleBook({
    @Query("key") String? apiKey,
  });
}
