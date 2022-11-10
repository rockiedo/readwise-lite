import 'package:cached_network_image/cached_network_image.dart';
import 'package:core_model/core_model.dart';
import 'package:flutter/material.dart';

class BookTileWidget extends StatelessWidget {
  final Book book;

  const BookTileWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        leading: CachedNetworkImage(
          height: 80,
          width: 60,
          imageUrl: book.coverImageUrl,
        ),
        title: Text(book.title),
        subtitle: book.author != null ? Text(book.author!) : null,
        onTap: () {

        },
      ),
    );
  }
}
