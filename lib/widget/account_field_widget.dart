import 'package:flutter/material.dart';

SizedBox accountTextField(
    String text, bool isPassword, TextEditingController controller) {
  return SizedBox(
    width: 380,
    child: TextField(
      controller: controller,
      obscureText: isPassword,
      enableSuggestions: isPassword,
      autocorrect: isPassword,
      cursorColor: Colors.white,
      keyboardType: isPassword
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(
          color: Colors.black.withOpacity(0.5),
        ),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: const OutlineInputBorder(),
      ),
    ),
  );
}

ElevatedButton signButton(String text, Function onPressed) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blueAccent,
    ),
    child: SizedBox(
      width: 350,
      height: 50,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ),
    onPressed: () {
      onPressed();
    },
  );
}
