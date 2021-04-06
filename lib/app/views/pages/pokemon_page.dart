import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/controllers/pokemon_controller.dart';
import 'package:pokedex/app/views/widgets/appBar/app_bar_title.dart';
import 'package:pokedex/app/views/widgets/drawerMenu/drawer_menu.dart';
import 'package:pokedex/app/views/widgets/pokemon/future_builder_pokemon.dart';
import 'package:pokedex/app/views/widgets/pokemon/future_builder_pokemon_type.dart';
import 'package:pokedex/app/views/widgets/pokemon/pokemon_filter_menu.dart';

class PokemonPage extends StatefulWidget {
  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  final pokemonController = Modular.get<PokemonController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: AppBarTitle(),
        actions: [PokemonFilterMenu()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => pokemonController.setPokemonInputStatus(),
        child: Icon(Icons.search),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          final maxWidth = constraints.maxWidth;
          final maxHeight = constraints.maxHeight;
          return Observer(
            builder: (_) {
              final type = pokemonController.filterByType;
              if (type == 'Todos os Tipos')
                return FutureBuilderPokemon(
                  maxWidth: maxWidth,
                  maxHeight: maxHeight,
                );
              else
                return FutureBuilderPokemonType(
                  maxWidth: maxWidth,
                  maxHeight: maxHeight,
                );
            },
          );
        },
      ),
    );
  }
}
