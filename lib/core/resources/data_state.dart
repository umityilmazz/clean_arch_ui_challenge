
import 'package:dio/dio.dart';

sealed class DataState<T> {
  final T? data;
  final DioException? dioError;
  const DataState({this.data, this.dioError});
}

class DataStateSucces<T> extends DataState<T> {
  const DataStateSucces(T data) : super(data: data);
}

class DataStateFailed<T> extends DataState<T> {
  const DataStateFailed(DioException dioExp) : super(dioError: dioExp);
}
