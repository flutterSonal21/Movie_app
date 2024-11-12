import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function(String) onSubmitted;

  const SearchBar({required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search movies...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
