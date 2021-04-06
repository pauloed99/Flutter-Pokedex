import 'package:flutter/material.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: LayoutBuilder(
        builder: (_, constraints) {
          final maxHeight = constraints.maxHeight;
          final maxWidth = constraints.maxWidth;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: maxHeight * .3,
                backgroundImage: AssetImage('assets/images/pokeball.jpg'),
              ),
              SizedBox(width: maxWidth * .015),
              Text(
                'Pokedéx Menu',
                style: TextStyle(
                  color: Colors.orange[300],
                  fontSize: maxWidth * .075,
                ),
              ),
            ],
          );
        },
      ),
      decoration: BoxDecoration(color: Colors.red),
    );
  }
}
