import 'package:flutter/material.dart';
import 'package:pokedex/app/models/pokemon/pokemon.dart';
import 'package:pokedex/app/utils/constants/constants.dart';

class PokemonColorType {
  static List<Color> verifyPokemonColorType(List<Types> types) {
    final List<Color> colors = [];
    final typeColors = Constants.pokemonTypeColors;
    for (var pokemon in types) {
      for (var type in typeColors.keys) {
        if (pokemon.type.name == type) colors.add(typeColors[type]);
      }
    }
    return colors;
  }

  
}
