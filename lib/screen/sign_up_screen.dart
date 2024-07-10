import 'package:flutter/material.dart';
import 'package:instagram_clone/model/firebase_auth_handling.dart';
import 'package:instagram_clone/screen/sign_in_screen.dart';
import 'package:instagram_clone/widget/account_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController =
      TextEditingController();
  bool toggle = true;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _confirmPasswordTextController.dispose();
    super.dispose();
  }

  bool isConfirmed() {
    if (_passwordTextController.text.trim() ==
        _confirmPasswordTextController.text.trim()) {
      return true;
    }
    return false;
  }

  Future signUp() async {
    if (!isConfirmed()) {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Caution!"),
            content: const Text(
              "The password doesn't match. Please keep checking back.",
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Okay"),
              ),
            ],
          );
        },
      );
    }
    final status = await FirebaseAuthHelper().createAccount(
      email: _emailTextController.text.trim(),
      pass: _passwordTextController.text.trim(),
    );
    if (status == AuthResultStatus.successful) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignInScreen(),
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
                onPressed: () => Navigator.pop(context),
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
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5,
            ),
          ),
          // confirmPasswordTextField
          SizedBox(
            width: 380,
            child: TextField(
              controller: _confirmPasswordTextController,
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
                labelText: "confirm password",
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
          signButton(
            "Sign Up",
            signUp,
          ),
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
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.abc),
                  Text(
                    'Log in with Facebook',
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
                  "Are you alreaady have an account?",
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
                        builder: (context) => const SignInScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Sign In.',
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
