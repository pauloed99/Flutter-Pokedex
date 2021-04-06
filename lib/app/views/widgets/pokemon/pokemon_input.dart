import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/controllers/pokemon_controller.dart';

class PokemonInput extends StatelessWidget {
  final String text;

  final controller = Modular.get<PokemonController>();

  PokemonInput({@required this.text});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * .04),
      ),
      controller: controller.pokemonInput,
      onChanged: (String text) {
        if (controller.filterByType == 'Todos os Tipos')
          controller.pokemonFilter();
        else
          controller.pokemonFilterType();
      },
    );
  }
}
