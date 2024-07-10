import 'package:flutter/material.dart';
import 'package:instagram_clone/widget/search_screen_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          // Search TextField
          Padding(
            padding: const EdgeInsets.only(
              top: 60,
              bottom: 5,
            ),
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          /* Clear the search field */
                        },
                      ),
                      hintText: 'Search...',
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
          // MasonryGridView
          MediaQuery.removePadding(
            // https://api.flutter.dev/flutter/widgets/MediaQuery/MediaQuery.removePadding.html
            context: context,
            removeTop: true,
            child: const Expanded(
              child: SearchView(),
            ),
          ),
        ],
      ),
    );
  }
}

/*
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SizedBox(
              width: 400,
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Search",
                  filled: true,
                  fillColor: Colors.grey[300],
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                  ),
                ),
              ),
            ),
          ),
        ),
*/