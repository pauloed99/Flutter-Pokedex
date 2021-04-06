import 'package:flutter/material.dart';

class PokemonTypeCard extends StatelessWidget {
  final double width;
  final double height;
  final Color typeColor;
  final String typeName;
  final double left;

  PokemonTypeCard({
    @required this.width,
    @required this.height,
    @required this.typeColor,
    @required this.typeName,
    this.left = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: height * .015,
        right: width * .015,
        left: left,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width * .03),
        border: Border.all(
          color: Colors.black,
        ),
        color: typeColor,
      ),
      width: width * .15,
      height: height * .05,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          typeName,
          style: TextStyle(
            fontSize: width * .04,
          ),
        ),
      ),
    );
  }
}
