import 'package:flutter_application_1/model/book.dart';
abstract class BookState {}

class BookListState extends BookState {
  final List<Book> books;

  BookListState(this.books);
}

class BookDetailState extends BookState {
  final Book book;

  BookDetailState(this.book);
}
class LoadingState extends BookState {
  LoadingState();
} 