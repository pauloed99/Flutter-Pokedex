import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/controllers/pokemon_controller.dart';
import 'package:pokedex/app/views/widgets/pokemon/pokemon_input.dart';

import 'app_bar_text.dart';

class AppBarTitle extends StatelessWidget {
  final pokemonController = Modular.get<PokemonController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return pokemonController.pokemonInputLoaded
            ? PokemonInput(
                text: 'Pesquise algum pokémon',
              )
            : AppBarText(text: 'Pokémon List');
      },
    );
  }
}
