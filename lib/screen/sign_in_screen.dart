import 'package:flutter/material.dart';
import 'package:instagram_clone/main_page.dart';

import '../common/custome_icon.dart';
import '../model/firebase_auth_handling.dart';
import '../widget/account_field_widget.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  bool toggle = true;

  Future signIn() async {
    /*
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailTextController.text.trim(),
        password: _passwordTextController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
    */
    final status = await FirebaseAuthHelper().login(
      email: _emailTextController.text.trim(),
      pass: _passwordTextController.text.trim(),
    );
    if (status == AuthResultStatus.successful) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ),
      );
    } else {
      final errorMsg = AuthExceptionHandler.generateExceptionMessage(status);
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Caution!"),
            content: Text(
              errorMsg.toString(),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Okay"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 30,
            ),
            child: SizedBox(
              width: 180,
              child: Image.asset("assets/images/instagram.png"),
            ),
          ),
          accountTextField("email", false, _emailTextController),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
          ),
          // passwordTextField
          SizedBox(
            width: 380,
            child: TextField(
              controller: _passwordTextController,
              obscureText: toggle,
              enableSuggestions: true,
              autocorrect: true,
              cursorColor: Colors.white,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      toggle = !toggle;
                    });
                  },
                  icon: toggle
                      ? const Icon(
                          Icons.remove_red_eye,
                        )
                      : const Icon(
                          Icons.remove_red_eye_outlined,
                        ),
                ),
                labelText: "password",
                labelStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: Colors.white.withOpacity(0.3),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 40),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 145,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
                )
              ],
            ),
          ),
          signButton("Sign In", signIn),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Text(
              'OR',
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(
            width: 200,
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    CustomIcons.facebook_squared,
                    color: Colors.blue,
                  ),
                  Text(
                    ' Log in with Facebook',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Sign Up.',
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
