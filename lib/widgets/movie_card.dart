import 'package:flutter/material.dart';
import '../movie_service.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback? onTap;

  MovieCard({required this.movie, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(movie.image, width: 50, fit: BoxFit.cover),
        title: Text(movie.title),
        subtitle: Text(movie.summary, maxLines: 2, overflow: TextOverflow.ellipsis),
        onTap: onTap,
      ),
    );
  }
}
