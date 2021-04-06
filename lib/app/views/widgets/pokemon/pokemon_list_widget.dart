import 'package:flutter/material.dart';
import 'package:pokedex/app/models/pokemon/pokemon_group.dart';
import 'package:pokedex/app/views/widgets/pokemon/pokemon_card_widget.dart';

class PokemonList extends StatelessWidget {
  final double width;
  final double height;
  final List<Results> results;
  final int length;

  PokemonList({
    @required this.width,
    @required this.height,
    @required this.results,
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
            pokemonName: results[index].url,
          ),
        ),
      ),
    );
  }
}
