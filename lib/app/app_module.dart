import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/app_widget.dart';
import 'package:pokedex/app/modules/pokemon_module.dart';
import 'package:pokedex/app/utils/constants/constants.dart';
import 'package:pokedex/app/views/pages/splash_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<Dio>(
          (i) => Dio(BaseOptions(baseUrl: Constants.baseUrl)),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => SplashPage()),
        ModularRouter('/pokemon', module: PokemonModule()),
      ];
}
