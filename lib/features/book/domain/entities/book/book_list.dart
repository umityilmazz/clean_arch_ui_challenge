// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'book_item.dart';


class BookList extends Equatable {
 final String? kind;
 final int? totalItems;
 final List<BookItem>? items;

 const BookList({this.kind, this.totalItems, this.items});

  @override
  List<Object?> get props => [kind,totalItems,items];
}
