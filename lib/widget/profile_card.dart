import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    //final model = ProfileCardModel();

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
}
