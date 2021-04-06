import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/app/app_module.dart';
import 'package:pokedex/app/mocks/dio_mock.dart';
import 'package:pokedex/app/models/pokemon/pokemon.dart';
import 'package:pokedex/app/models/pokemon/pokemon_group.dart';
import 'package:pokedex/app/models/pokemon/pokemon_type.dart';
import 'package:pokedex/app/modules/pokemon_module.dart';
import 'package:pokedex/app/repositories/pokemon_repository.dart';
import '../../../assets/mocks/pokemon_group.dart';
import '../../../assets/mocks/pokemon.dart';
import '../../../assets/mocks/type.dart';

void main() {
  PokemonRepository pokemonRepository;
  Dio dioMock;

  setUp(() {
    initModule(
      AppModule(),
      changeBinds: [
        Bind<Dio>((i) => DioMock()),
      ],
    );
    initModule(
      PokemonModule(),
    );
    pokemonRepository = Modular.get<PokemonRepository>();
    dioMock = Modular.get<Dio>();
  });

  group('GetAllPokemons', () {
    test('Should return a PokemonGroup model and number of pokemons', () async {
      final json = jsonDecode(pokemonGroupJson);

      when(dioMock.get(any)).thenAnswer(
        (_) async => Response(
          data: json,
        ),
      );

      final pokemonGroup = await pokemonRepository.getAllPokemons();

      expect(pokemonGroup, isA<PokemonGroup>());
      expect(pokemonGroup.count, 1118);
    });

    test('Should throw an exception', () {
      when(dioMock.get(any)).thenThrow(Exception());

      expect(pokemonRepository.getAllPokemons(), throwsException);
    });
  });

  group('GetAnyPokemon', () {
    test('Should return a pokemon Model', () async {
      final json = jsonDecode(pokemonJson);

      when(dioMock.get(any)).thenAnswer((_) async => Response(data: json));

      final pokemon = await pokemonRepository.getPokemon(id: '');

      expect(pokemon, isA<Pokemon>());
    });

    test('Should throw an exception', () {
      when(dioMock.get(any)).thenThrow(Exception());

      expect(pokemonRepository.getPokemon(id: ''), throwsException);
    });
  });

  group('GetPokemonsByType', () {
    test('Should return a pokemonType model', () async {
      final json = jsonDecode(typeJson);

      when(dioMock.get(any)).thenAnswer((_) async => Response(data: json));

      final pokemonsType = await pokemonRepository.getPokemonType(type: '');

      expect(pokemonsType, isA<PokemonType>());
    });

    test('Should return a exception', (){
      when(dioMock.get(any)).thenThrow(Exception());

      expect(pokemonRepository.getPokemonType(type: ''), throwsException);
    });
  });
}
