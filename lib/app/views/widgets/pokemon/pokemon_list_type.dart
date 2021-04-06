import 'package:flutter/material.dart';
import 'package:pokedex/app/models/pokemon/pokemon_type.dart';
import 'package:pokedex/app/views/widgets/pokemon/pokemon_card_widget.dart';

class PokemonListType extends StatelessWidget {
  final double width;
  final double height;
  final List<PokemonModel> pokemons;
  final int length;

  PokemonListType({
    @required this.width,
    @required this.height,
    @required this.pokemons,
    @required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: ListView.builder(
        itemCount: length,
        itemBuilder: (context, index) => Center(
          child: PokemonCardWidget(
            height: height,
            width: width,
            pokemonName: pokemons[index].pokemon.url,
          ),
        ),
      ),
    );
  }
}
