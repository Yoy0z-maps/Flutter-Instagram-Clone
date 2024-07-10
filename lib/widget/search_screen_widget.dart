import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 3.0,
      ),
      child: MasonryGridView.builder(
        itemCount: 8,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset(
            "assets/images/${(index + 1).toString()}.jpg",
          ),
          /* ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/${(index + 1).toString()}.jpg",
            ),
          ), */
        ),
      ),
    );
  }
}
