import 'package:flutter/material.dart';

AppBar profileAppBar(bool isPrivate) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Row(
      children: <Widget>[
        isPrivate
            ? const Padding(
                padding: EdgeInsets.only(
                  right: 5,
                ),
                child: Icon(
                  Icons.lock_outline,
                  color: Colors.black,
                ),
              )
            : Container(),
        isPrivate
            ? const Padding(
                padding: EdgeInsets.only(
                  left: 3,
                ),
                child: Text(
                  'zo_glass',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            : const Text(
                'zo_glass',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.expand_more,
            color: Colors.black,
          ),
        )
      ],
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.add_box_outlined,
          color: Colors.black,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu_rounded,
          color: Colors.black,
        ),
      ),
    ],
  );
}

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 8,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 3,
        crossAxisSpacing: 3,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) => SizedBox(
        child: GestureDetector(
          child: Image.asset(
            "assets/images/${index + 1}.jpg",
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ReelsView extends StatelessWidget {
  const ReelsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("ReelsView"),
    );
  }
}

class TaggedView extends StatelessWidget {
  const TaggedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("TaggedView"),
    );
  }
}
