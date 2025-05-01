import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/image_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/book_cubit.dart';
import '../cubits/book_state.dart';
import '../model/book.dart';
import 'book_card.dart';
import 'image_card.dart';

class BookListView extends StatefulWidget {
  const BookListView({super.key});

  @override
  State<BookListView> createState() => _BookListViewState();
}

class _BookListViewState extends State<BookListView> {
  bool showImageOnly = false; 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                showImageOnly = !showImageOnly; 
              });
            },
            child: Text(showImageOnly ? 'FULL DESCRIPTION' : 'IMAGE ONLY'), 
          ),
        ),
        Expanded(
          child: BlocBuilder<BookCubit, BookState>(
            builder: (context, state) {
              if (state is BookListState) {
                final books = state.books;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                  
                    return showImageOnly
                        ? ImageOnlyCard(book: book)
                        : BookCard(book: book);
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }
}