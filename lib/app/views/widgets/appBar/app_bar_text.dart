import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  final String text;

  AppBarText({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.orange[300],
        fontSize: MediaQuery.of(context).size.height * .025,
      ),
    );
  }
}
