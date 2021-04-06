import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerElement extends StatelessWidget {
  final String title;
  final Color titleColor;
  final String image;
  final String route;

  DrawerElement({
    @required this.title,
    @required this.titleColor,
    @required this.image,
    @required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Modular.to.pushReplacementNamed(route),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(image),
              radius: MediaQuery.of(context).size.height * .025,
            ),
            title: Text(
              title,
              style: TextStyle(
                color: titleColor,
                fontSize: MediaQuery.of(context).size.height * .025,
              ),
            ),
            focusColor: titleColor,
          ),
          Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
