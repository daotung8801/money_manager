import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.heading}) : super(key: key);

  final String heading;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          heading,
          style: const TextStyle(fontSize: 24),
        ),
      );
}

class Paragraph extends StatelessWidget {
  const Paragraph({Key? key, required this.content}) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          content,
          style: const TextStyle(fontSize: 18),
        ),
      );
}

class IconAndDetail extends StatelessWidget {
  const IconAndDetail({Key? key, required this.icon, required this.detail})
      : super(key: key);

  final IconData icon;
  final String detail;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(
              detail,
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      );
}

class CommonStyle {
  static InputDecoration textFieldStyle(
      {required String labelText, required String hintText}) {
    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      // labelStyle: TextStyle(
      //   fontSize: 18,
      //   fontFamily: 'Inter',
      //   color: Colors.black,
      // ),
      // hintStyle: TextStyle(
      //   fontSize: 18,
      //   fontFamily: 'Inter',
      //   color: Color.fromARGB(255, 189, 189, 189),
      // ),
      border: const OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 189, 189, 189)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromARGB(255, 35, 111, 87), width: 2),
      ),
      // fillColor: Color.fromARGB(255, 232, 232, 232),
      // filled: true,
    );
  }

  static InputDecoration passwordFieldStyle(
      {required String labelText,
      required String hintText,
      required Function() iconVisibilityOnPressed}) {
    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      suffixIcon: IconButton(
        // iconSize: 30,
        icon: const Icon(Icons.visibility),
        color: const Color.fromARGB(255, 35, 111, 87),
        onPressed: iconVisibilityOnPressed,
      ),
      border: const OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 189, 189, 189)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromARGB(255, 35, 111, 87), width: 2),
      ),
    );
  }
}

class StyledTextButton extends StatelessWidget {
  final Widget child;
  final void Function() onPressed;

  const StyledTextButton(
      {Key? key, required this.onPressed, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      TextButton(onPressed: onPressed, child: child);
}

class MyIconButton {
  static IconButton icon({required String url, required Function() onPressed}) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      iconSize: 60,
      icon: Image.asset(url),
      onPressed: onPressed,
    );
  }
}

class StyledElevatedButton extends StatelessWidget {
  const StyledElevatedButton(
      {Key? key,
      required this.child,
      required this.onPressed,
      required this.width,
      required this.height})
      : super(key: key);

  final double width, height;
  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          minimumSize: Size(width, height)),
      onPressed: onPressed,
      child: child);
}
