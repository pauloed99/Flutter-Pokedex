import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/controllers/pokemon_controller.dart';
import 'package:pokedex/app/models/pokemon/pokemon.dart';
import 'package:pokedex/app/views/widgets/pokemon/pokemon_type_card.dart';

class PokemonCardInformation extends StatelessWidget {
  final double width;
  final double height;
  final Pokemon pokemon;
  final List<Color> colors;

  PokemonCardInformation(
      {@required this.width,
      @required this.height,
      @required this.pokemon,
      @required this.colors});

  final controller = Modular.get<PokemonController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(left: width * .03),
            child: Text(
              '#${pokemon.id}',
              style: TextStyle(
                fontSize: width * .05,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.only(left: width * .05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pokemon.name,
                  style: TextStyle(
                    fontSize: width * .052,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    for (int i = 0; i < pokemon.types.length; i++)
                      PokemonTypeCard(
                        width: width,
                        height: height,
                        typeColor: colors[i],
                        typeName: pokemon.types[i].type.name,
                      )
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          height: height,
          width: width * .0025,
          color: Colors.black,
        ),
        Expanded(
          flex: 2,
          child: Image.network(
            pokemon.sprites.frontDefault,
          ),
        )
      ],
    );
  }
}
