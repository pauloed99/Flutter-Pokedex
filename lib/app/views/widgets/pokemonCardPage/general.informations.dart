import 'package:flutter/material.dart';
import 'package:pokedex/app/models/pokemon/pokemon.dart';

class GeneralInformations extends StatelessWidget {
  final double maxWidth;
  final double maxHeight;
  final Pokemon pokemon;

  GeneralInformations({@required this.maxWidth, @required this.maxHeight, @required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: maxHeight * .03),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(maxWidth * .03),
      ),
      height: maxHeight * .25,
      width: maxWidth * .8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Informações Gerais',
            style: TextStyle(
              fontSize: maxWidth * .05,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: maxWidth * .02),
            width: maxWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pokémon Name : ${pokemon.name}',
                  style: TextStyle(fontSize: maxWidth * .04),
                ),
                Text(
                  'Pokémon Id : ${pokemon.id}',
                  style: TextStyle(fontSize: maxWidth * .04),
                ),
                Text(
                  'Pokémon Weight : ${pokemon.weight / 10} kg',
                  style: TextStyle(fontSize: maxWidth * .04),
                ),
                Text(
                  'Pokémon Height : ${pokemon.height / 10} m',
                  style: TextStyle(fontSize: maxWidth * .04),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
