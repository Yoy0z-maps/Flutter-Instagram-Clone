import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screen/sign_in_screen.dart';
import 'package:instagram_clone/screen/tab_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // StreamBuilder(): 스트림 데이터를 기반으로 UI로 변경해주는 위젯
    return StreamBuilder<User?>(
      // stream: 수시로 변경되는 데이터를 처리하는 타입
      // FirebaseAuth.instance: Firebase를 통해 인증을 하는 객체에 정보
      // .authStateChanges(): 로그인 여부를 알려주는 스트림
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // snapshop: <User>는 Firebase에서 로그인한 객체에 대한 정보
        if (!snapshot.hasData) {
          return const SignInScreen();
        }
        return const TabScreen();
      },
    );
  }
}
