import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/widget/home_screen_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFollowed = true;
  int pageIndex = 0;

  List<String> path = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg"
  ];

  List<Widget> postImage() {
    return (path.map(
      (e) => Container(color: Colors.black, child: Image.asset(e)),
    )).toList();
  }

  void onPageChanged(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  Widget Posting() {
    return Column(
      children: <Widget>[
        // Posting Top
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: const [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://mblogthumb-phinf.pstatic.net/MjAyMTAzMThfMjQz/MDAxNjE2MDY1MzE4MDM3.jd1CH-2hDZel_CMIlX2Vahma4V0JsaWwBEKwrRyNLLQg.MBUXaB3g0qneuhIqm4a0EDC8U4YoVXSBLwmSurp577cg.PNG.tkfkdgowt13/6.png?type=w800',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                  ),
                  Text(
                    '_chaechae_1',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                isFollowed
                    ? ElevatedButton(
                        style: ButtonStyle(
                          elevation: const MaterialStatePropertyAll(0),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey[200]!),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
            ),
          ],
        ),
        // Posting Image
        SizedBox(
          height: 300,
          width: double.infinity,
          child: PageView(
            onPageChanged: onPageChanged,
            children: postImage(),
          ),
        ),
        // Posting Bottom
        Row(
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chat_bubble),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share_arrival_time),
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
            Center(
              child: CarouselIndicator(
                cornerRadius: BorderSide.strokeAlignCenter,
                color: Colors.grey,
                activeColor: Colors.blueAccent,
                count: path.length,
                index: pageIndex,
              ),
            ),
            const Padding(padding: EdgeInsets.only(left: 100)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.bookmark),
            ),
          ],
        ),
        Row(
          children: const <Widget>[
            SizedBox(
              width: 20,
              height: 20,
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://i.imgur.com/KFXF6Po.jpg'),
              ),
            ),
            Text(
              'hanyoanyochamchimayo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '님 외 281,233명이 좋아합니다',
            ),
          ],
        ),
        Row(
          children: const <Widget>[
            Text(
              'jo_glssss',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('다시 한번 이번 엘범으로 글래시분들께 인사드릴\n수 있어서....')
          ],
        ),
        const Text('댓글 6,011개 모두 보기'),
        const Text('15시간 전 - 추천 게시물')
      ],
    );
  }

  bool isCheck = false;

  void onTap() {
    if (!isCheck) {
      setState(() {
        isCheck = !isCheck;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: MyStoryWidget(),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                ),
                StoryWidget(isCheck, onTap),
                // asdfasdf
              ],
            ),
            Posting(),
            SizedBox(
              height: 254,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ProfileCard(),
                  ProfileCard(),
                  ProfileCard(),
                  ProfileCard(),
                ],
              ),
            ),
            Posting()
          ],
        ),
      ),
    );
  }
}
