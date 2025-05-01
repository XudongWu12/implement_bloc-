import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/book.dart';
import 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  List<Book> _books = []; 

  BookCubit() : super(BookListState([])); 
  void init() {
    _books = [
      Book(
        image: "https://th.bing.com/th/id/OIP.Z5KLQbybGAxlM5JdjOWeWwHaKe?w=184&h=260&c=7&r=0&o=5&pid=1.7",
        title: '1984',
        author: 'George Orwell',
        description: 'A dystopian novel set in a totalitarian society under constant surveillance.',
      ),
      Book(
        image: "https://th.bing.com/th/id/OIP.G067O0bgyyx4Edq4bYrwiwHaLJ?w=184&h=277&c=7&r=0&o=5&pid=1.7",
        title: 'To Kill a Mockingbird',
        author: 'Harper Lee',
        description: 'A novel about serious issues.',
      ),
      Book(
        image: "https://th.bing.com/th/id/OIP.pWkWGTBJvzbKOyC9Cy1oJQHaJr?w=133&h=180&c=7&r=0&o=5&pid=1.7",
        title: 'The Great Gatsby',
        author: 'F. Scott Fitzgerald',
        description: 'A story about the American dream and the Jazz Age.',
      ),
      Book(
        image: "https://th.bing.com/th/id/OIP.DT6xu1BSxqD5nJicD3qbDAHaLe?w=122&h=190&c=7&r=0&o=5&pid=1.7",
        title: 'Little Goods',
        author: 'Meng Jin',
        description: 'A novel about a Chinese-American family and their struggles.',
      ),
      
    ];
    sortByAuthor();
  }

  void sortByAuthor() {
    // emit(LoadingState());
    if (state is BookListState) {
      _books.sort((a, b) => a.author.compareTo(b.author));
      emit(BookListState(_books));
    }
  }

  void sortByTitle() {
    // emit(LoadingState());
    if (state is BookListState) {
      _books.sort((a, b) => a.title.compareTo(b.title));
      emit(BookListState(_books));
    }
  }

  void showBookDetail(Book book) {
    // emit(LoadingState());
    emit(BookDetailState(book));
  }

  void showBookList() {
    if (state is BookDetailState) {
      // emit(LoadingState());
      emit(BookListState(_books)); 
    }
  }
}