import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/controllers/pokemon_controller.dart';
import 'package:pokedex/app/models/pokemon/pokemon_group.dart';
import 'package:pokedex/app/views/widgets/pokemon/pokemon_list_widget.dart';

class FutureBuilderPokemon extends StatelessWidget {
  final pokemonController = Modular.get<PokemonController>();

  final double maxWidth;
  final double maxHeight;

  FutureBuilderPokemon({@required this.maxWidth, @required this.maxHeight});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: pokemonController.getAllPokemons(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          final PokemonGroup pokemons = snapshot.data;
          pokemonController.pokemonList = pokemons.results;
          return Observer(
            builder: (context) {
              final filterList = pokemonController.filteredPokemonList;
              return pokemonController.pokemonInput.text.isEmpty
                  ? PokemonList(
                      width: maxWidth,
                      height: maxHeight,
                      results: pokemons.results,
                      length: pokemons.results.length,
                    )
                  : pokemonController.filteredPokemonList.length != 0
                      ? PokemonList(
                          width: maxWidth,
                          height: maxHeight,
                          results: filterList,
                          length: filterList.length,
                        )
                      : Center(
                          child: Text(
                            "Nenhum pokémon foi encontrado !",
                          ),
                        );
            },
          );
        }
        if (snapshot.hasError)
          return Center(
            child: Text(
              "Ocorreu um erro no servidor do aplicativo.\n Tente verificar se você está conectado à internet",
              style: TextStyle(fontSize: maxWidth * .04),
              textAlign: TextAlign.center,
            ),
          );
        else
          return Center(child: CircularProgressIndicator());
      },
    );
  }
}
