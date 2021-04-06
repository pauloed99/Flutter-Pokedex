import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/models/pokemon/pokemon.dart';
import 'package:pokedex/app/utils/helpers/pokemon_color_type.dart';
import 'package:pokedex/app/views/widgets/appBar/app_bar_text.dart';
import 'package:pokedex/app/views/widgets/pokemonCardPage/general.informations.dart';
import 'package:pokedex/app/views/widgets/pokemonCardPage/pokemon.card.header.dart';
import 'package:pokedex/app/views/widgets/pokemonCardPage/pokemon.stats.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon = Modular.args.data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: AppBarText(text: 'Pokémon Card'),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final maxHeight = constraints.maxHeight;

        final colors = PokemonColorType.verifyPokemonColorType(
          pokemon.types,
        );
        return Container(
          width: maxWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              stops: colors.length == 2 ? [0.5, 1] : [0.5],
            ),
          ),
          child: Column(
            children: [
              PokemonCardHeader(
                maxWidth: maxWidth,
                maxHeight: maxHeight,
                pokemon: pokemon,
              ),
              GeneralInformations(
                maxWidth: maxWidth,
                maxHeight: maxHeight,
                pokemon: pokemon,
              ),
              PokemonStats(
                maxHeight: maxHeight,
                maxWidth: maxWidth,
                pokemon: pokemon,
              ),
            ],
          ),
        );
      }),
    );
  }
}
