import 'package:flutter/material.dart';

/// A widget that displays a search bar.
class SearchBarWidget extends StatelessWidget {
  /// Constructs a [SearchBarWidget].
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search by name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {},
      ),
    );
  }
}
