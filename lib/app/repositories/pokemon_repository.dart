import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/app/models/pokemon/pokemon.dart';
import 'package:pokedex/app/models/pokemon/pokemon_group.dart';
import 'package:pokedex/app/models/pokemon/pokemon_move.dart';
import 'package:pokedex/app/models/pokemon/pokemon_type.dart';

class PokemonRepository {
  final Dio dio;

  PokemonRepository(this.dio);

  Future<PokemonGroup> getAllPokemons() async {
    try {
      final response = await dio.get('pokemon?limit=1118');
      final pokemons = PokemonGroup.fromJson(response.data);
      return pokemons;
    } on DioError catch (e) {
      throw Exception(e.error);
    }
  }

  Future<Pokemon> getPokemon({@required String id}) async {
    try {
      final response = await dio.get('pokemon/$id');
      final pokemonModel = Pokemon.fromJson(response.data);
      return pokemonModel;
    } on DioError catch (e) {
      throw Exception(e.error);
    }
  }

  Future<PokemonType> getPokemonType({@required String type}) async {
    try {
      final response = await dio.get('type/$type');
      final typeModel = PokemonType.fromJson(response.data);
      return typeModel;
    } on DioError catch (e) {
      throw Exception(e.error);
    }
  }

  Future<PokemonMove> getAnyMove({@required String id}) async {
    try {
      final response = await dio.get('move/$id');
      final moveModel = PokemonMove.fromJson(response.data);
      return moveModel;
    } on DioError catch (e) {
      throw Exception(e.error);
    }
  }
}
