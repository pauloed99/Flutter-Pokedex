import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/controllers/pokemon_controller.dart';
import 'package:pokedex/app/repositories/pokemon_repository.dart';
import 'package:pokedex/app/views/pages/pokemon_card.dart';
import 'package:pokedex/app/views/pages/pokemon_page.dart';

class PokemonModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PokemonRepository(i.get<Dio>())),
        Bind(
          (i) => PokemonController(
            i.get<PokemonRepository>(),
          ),
        )
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => PokemonPage()),
        ModularRouter('/card', child: (_, args) => PokemonCard()),
      ];
}
