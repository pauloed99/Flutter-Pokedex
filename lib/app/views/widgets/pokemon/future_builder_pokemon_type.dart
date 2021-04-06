import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/controllers/pokemon_controller.dart';
import 'package:pokedex/app/models/pokemon/pokemon_type.dart';
import 'package:pokedex/app/views/widgets/pokemon/pokemon_list_type.dart';

class FutureBuilderPokemonType extends StatelessWidget {
  final pokemonController = Modular.get<PokemonController>();

  final double maxWidth;
  final double maxHeight;

  FutureBuilderPokemonType({@required this.maxWidth, @required this.maxHeight});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: pokemonController.getAllPokemonsByType(
        type: pokemonController.filterByType,
      ),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          final PokemonType pokemons = snapshot.data;
          pokemonController.pokemonListType = pokemons.pokemon;
          print(pokemons.moves);
          return Observer(
            builder: (context) {
              final filterList = pokemonController.filteredPokemonListType;
              return pokemonController.pokemonInput.text.isEmpty
                  ? PokemonListType(
                      width: maxWidth,
                      height: maxHeight,
                      pokemons: pokemons.pokemon,
                      length: pokemons.pokemon.length,
                    )
                  : pokemonController.filteredPokemonListType.length != 0
                      ? PokemonListType(
                          width: maxWidth,
                          height: maxHeight,
                          pokemons: filterList,
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
