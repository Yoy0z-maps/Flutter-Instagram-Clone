// ignore_for_file: non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

AppBar HomeAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    title: const SizedBox(
      height: 38,
      child: Image(
        image: AssetImage(
          'assets/images/instagram.png',
        ),
        fit: BoxFit.fitHeight,
      ),
    ),
    actions: <Widget>[
      IconButton(
        onPressed: () {},
        color: Colors.black,
        icon: const Icon(Icons.add_box),
      ),
      IconButton(
        onPressed: () {},
        color: Colors.black,
        icon: const Icon(Icons.favorite),
      ),
      IconButton(
        onPressed: () {},
        color: Colors.black,
        icon: const Icon(Icons.chat),
      ),
    ],
  );
}

GestureDetector MyStoryWidget() {
  return GestureDetector(
    child: Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            const SizedBox(
              width: 60,
              height: 60,
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://i.imgur.com/KFXF6Po.jpg'),
              ),
            ),
            Container(
              width: 60,
              height: 60,
              alignment: Alignment.bottomRight,
              child: Stack(
                alignment: Alignment.center,
                children: const <Widget>[
                  SizedBox(
                    width: 25,
                    height: 25,
                    child: FloatingActionButton(
                      elevation: 0,
                      onPressed: null,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: FloatingActionButton(
                      hoverElevation: 0,
                      focusElevation: 0,
                      elevation: 0,
                      onPressed: null,
                      child: Icon(
                        Icons.add,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 1),
        ),
        Container(
          padding: const EdgeInsets.only(top: 3),
          width: 55,
          child: const AutoSizeText(
            'My Story',
            maxLines: 1,
          ),
        ),
      ],
    ),
  );
}

GestureDetector StoryWidget(bool isCheck, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: SizedBox(
                width: 70,
                height: 70,
                child: Image.network(isCheck
                    ? 'https://i.imgur.com/blBWH2E.pngg'
                    : 'https://i.imgur.com/9FcsDA0.png'),
              ),
            ),
            Container(
              width: 65,
              height: 65,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 60,
              height: 60,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://file2.nocutnews.co.kr/newsroom/image/2022/10/25/202210250517532480_0.jpg',
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 60,
          child: AutoSizeText(
            'jo_glasss',
            maxLines: 1,
            style: TextStyle(
              color: isCheck ? Colors.black.withOpacity(0.5) : Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget ProfileCard() {
  return Card(
    elevation: 4.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          const SizedBox(
            width: 80,
            height: 80,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://mblogthumb-phinf.pstatic.net/MjAyMTAzMThfMjQz/MDAxNjE2MDY1MzE4MDM3.jd1CH-2hDZel_CMIlX2Vahma4V0JsaWwBEKwrRyNLLQg.MBUXaB3g0qneuhIqm4a0EDC8U4YoVXSBLwmSurp577cg.PNG.tkfkdgowt13/6.png?type=w800',

                //model.getProfileImageUrl(),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8),
          ),
          const Text(
            "gd",
            //model.getNickName(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text('johnhan님 외 9명이 \n 팔로우합니다'),
          const Text(/*model.getEmail()*/ "gd"),
          const Padding(
            padding: EdgeInsets.only(top: 8),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("팔로우"),
          ),
        ],
      ),
    ),
  );
}

Padding PostWritterWidget(String url, String name) {
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Row(
      children: [
        SizedBox(
          width: 30,
          height: 30,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              url,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 5,
          ),
        ),
        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}

Row PostButtonsWidget(bool isFollowed) {
  return Row(
    children: [
      isFollowed
          ? ElevatedButton(
              style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(0),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.grey[200]!),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Follow",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : Container(),
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.more_vert,
        ),
      ),
    ],
  );
}
