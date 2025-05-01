import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/loading_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/book_cubit.dart';
import '../cubits/book_state.dart';
import 'book_list_view.dart';
import 'book_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Club'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort_by_alpha),
            onPressed: () {
              context.read<BookCubit>().sortByTitle(); // 按标题排序
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              context.read<BookCubit>().sortByAuthor(); 
            },
          ),
        ],
      ),
      body: BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case LoadingState:
              return const LoadingView();
            case BookListState:
              return const BookListView(); 
            case BookDetailState:
              final detailState = state as BookDetailState;
              return BookDetailPage(book: detailState.book); 
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}