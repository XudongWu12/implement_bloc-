import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubits/book_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/book.dart';

class ImageOnlyCard extends StatelessWidget {
  final Book book;

  const ImageOnlyCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<BookCubit>().showBookDetail(book);
      },
      child: SizedBox(
        width: 150,
        height: 350,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Card(
            margin: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 3 / 4,
                  child: book.image.isNotEmpty
                      ? Image.network(
                          book.image,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(
                              Icons.image,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}