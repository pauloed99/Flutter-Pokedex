import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/controllers/pokemon_controller.dart';
import 'package:pokedex/app/models/pokemon/pokemon.dart';
import 'package:pokedex/app/utils/helpers/pokemon_color_type.dart';
import 'package:pokedex/app/views/widgets/pokemon/pokemon_card_information.dart';

class PokemonCardWidget extends StatelessWidget {
  final double height;
  final double width;
  final String pokemonName;

  PokemonCardWidget({
    @required this.height,
    @required this.width,
    @required this.pokemonName,
  });

  final pokemonController = Modular.get<PokemonController>();

  @override
  Widget build(BuildContext context) {
    final List<String> id = pokemonName.split('pokemon/');
    return FutureBuilder(
      future: pokemonController.getAnyPokemon(pokemonId: id[1]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final Pokemon pokemon = snapshot.data;

          final colors = PokemonColorType.verifyPokemonColorType(
            snapshot.data.types,
          );

          return Padding(
            padding: EdgeInsets.only(top: height * .05),
            child: GestureDetector(
              onTap: () =>
                  Modular.to.pushNamed('/pokemon/card', arguments: pokemon),
              child: Container(
                width: width * .95,
                height: height * .15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * .1),
                  gradient: LinearGradient(
                    colors: colors,
                    stops: colors.length == 2 ? [0.5, 0.8] : [0.5],
                  ),
                ),
                child: PokemonCardInformation(
                  width: width,
                  height: height,
                  pokemon: pokemon,
                  colors: colors,
                ),
              ),
            ),
          );
        }
        if (snapshot.hasError)
          return Center(
            child: Text(
              "Ocorreu um erro no servidor do aplicativo.\n Tente verificar se você está conectado à internet",
              style: TextStyle(fontSize: width * .04),
              textAlign: TextAlign.center,
            ),
          );
        else
          return Center(child: CircularProgressIndicator());
      },
    );
  }
}
