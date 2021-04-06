import 'package:flutter/material.dart';
import 'package:pokedex/app/models/pokemon/pokemon.dart';
import 'package:pokedex/app/utils/helpers/pokemon_color_type.dart';
import 'package:pokedex/app/views/widgets/pokemon/pokemon_type_card.dart';

class PokemonCardHeader extends StatelessWidget {
  final double maxWidth;
  final double maxHeight;
  final Pokemon pokemon;

  PokemonCardHeader(
      {@required this.maxWidth,
      @required this.maxHeight,
      @required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final colors = PokemonColorType.verifyPokemonColorType(
      pokemon.types,
    );

    return Column(children: [
      Image.network(
        pokemon.sprites.frontDefault,
        width: maxWidth * .35,
        height: maxHeight * .2,
        fit: BoxFit.cover,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < pokemon.types.length; i++)
            PokemonTypeCard(
              width: maxWidth,
              height: maxHeight,
              typeColor: colors[i],
              typeName: pokemon.types[i].type.name,
            )
        ],
      ),
      Container(
        margin: EdgeInsets.only(top: maxHeight * .02),
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        height: maxHeight * .001,
      )
    ]);
  }
}
