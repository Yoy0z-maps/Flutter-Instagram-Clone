import 'package:flutter/material.dart';
import 'package:instagram_clone/widget/profile_screen_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isPrivate = true;

  final List<Widget> _tabs = const [
    Tab(
      icon: Icon(
        Icons.table_chart_outlined,
        color: Colors.black,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.video_collection_outlined,
        color: Colors.black,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.person_pin_outlined,
        color: Colors.black,
      ),
    ),
  ];

  final List<Widget> _tabBarViews = const [
    FeedView(),
    ReelsView(),
    TaggedView(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: profileAppBar(isPrivate),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // CircleAvatar
                  GestureDetector(
                    child: Column(
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            const SizedBox(
                              width: 80,
                              height: 80,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://i.imgur.com/KFXF6Po.jpg'),
                              ),
                            ),
                            Container(
                              width: 70,
                              height: 70,
                              alignment: Alignment.bottomRight,
                              child: Stack(
                                alignment: Alignment.center,
                                children: const <Widget>[
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: FloatingActionButton(
                                      elevation: 0,
                                      onPressed: null,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25,
                                    height: 25,
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
                      ],
                    ),
                  ),
                  // Text = Posts / Followers / Following
                  Row(
                    children: [
                      Column(
                        children: const <Widget>[
                          Text(
                            '71',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Posts',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: const <Widget>[
                          Text(
                            '2.8M',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Followers',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: const <Widget>[
                          Text(
                            '14',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Following',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Name, Info
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    '조유리',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('조유리임돠...~'),
                ],
              ),
            ),
            // Buttons
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey[200]!),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: const SizedBox(
                      width: 130,
                      child: Center(
                        child: Text(
                          'Share profile',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey[200]!),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: const SizedBox(
                      width: 130,
                      child: Center(
                        child: Text(
                          'Edit profile',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const SizedBox(
                      height: 35,
                      width: 35,
                      child: Icon(
                        Icons.person_add_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              indicatorWeight: 1.0,
              indicatorColor: Colors.black,
              tabs: _tabs,
            ),
            Expanded(child: TabBarView(children: _tabBarViews))
          ],
        ),
      ),
    );
  }
}
