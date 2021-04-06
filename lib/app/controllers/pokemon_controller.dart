import 'package:flutter/material.dart';
import 'package:pokedex/app/models/pokemon/pokemon.dart';
import 'package:pokedex/app/models/pokemon/pokemon_group.dart';
import 'package:pokedex/app/models/pokemon/pokemon_move.dart';
import 'package:pokedex/app/models/pokemon/pokemon_type.dart';
import 'package:pokedex/app/repositories/pokemon_repository.dart';
import 'package:mobx/mobx.dart';
part 'pokemon_controller.g.dart';

class PokemonController = _PokemonControllerBase with _$PokemonController;

abstract class _PokemonControllerBase with Store {
  final PokemonRepository pokemonRepository;

  final pokemonInput = TextEditingController();

  List<Results> pokemonList;

  List<PokemonModel> pokemonListType;

  _PokemonControllerBase(this.pokemonRepository);

  @observable
  bool pokemonInputLoaded = false;

  @observable
  List<Results> filteredPokemonList = [];

  @observable
  List<PokemonModel> filteredPokemonListType = [];

  @observable
  String filterByType = 'Todos os Tipos';

  @action
  void setFilterByType(String value) => filterByType = value;

  @action
  void setPokemonInputStatus() => pokemonInputLoaded = !pokemonInputLoaded;

  @action
  void pokemonFilter() {
    pokemonInput.text.toLowerCase();
    filteredPokemonList = pokemonList
        .where((element) => element.name.startsWith(pokemonInput.text))
        .toList();
  }

  @action
  void pokemonFilterType() {
    pokemonInput.text.toLowerCase();
    filteredPokemonListType = pokemonListType
        .where((element) => element.pokemon.name.startsWith(pokemonInput.text))
        .toList();
  }

  Future<PokemonGroup> getAllPokemons() async {
    final pokemons = await pokemonRepository.getAllPokemons();
    return pokemons;
  }

  Future<Pokemon> getAnyPokemon({@required String pokemonId}) async {
    final pokemon = await pokemonRepository.getPokemon(id: pokemonId);
    return pokemon;
  }

  Future<PokemonType> getAllPokemonsByType({@required String type}) async {
    final pokemonsType = await pokemonRepository.getPokemonType(type: type);
    return pokemonsType;
  }

  Future<PokemonMove> getAnyMove({@required String id}) async {
    final pokemonMove = await pokemonRepository.getAnyMove(id: id);
    return pokemonMove;
  }
}
