import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/controllers/pokemon_controller.dart';
import 'package:pokedex/app/utils/constants/constants.dart';
import 'package:pokedex/app/views/widgets/pokemon/pokemon_type_card.dart';

class PokemonFilterType extends StatelessWidget {
  final double width;
  final double height;

  final typesName = Constants.pokemonTypeColors.keys.toList();

  final typesColor = Constants.pokemonTypeColors.values.toList();

  final pokemonController = Modular.get<PokemonController>();

  PokemonFilterType({@required this.width, @required this.height});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: typesName.length,
      itemBuilder: (context, index) => index == 0
          ? Column(
              children: [
                SizedBox(
                  width: width,
                  child: GestureDetector(
                    onTap: () =>
                        pokemonController.setFilterByType('Todos os Tipos'),
                    child: PokemonTypeCard(
                      width: width * 1.4,
                      height: height * 1.6,
                      typeColor: Colors.grey,
                      typeName: 'Todos os Tipos',
                      left: width * .015,
                    ),
                  ),
                ),
                SizedBox(
                  width: width,
                  child: GestureDetector(
                    onTap: () =>
                        pokemonController.setFilterByType(typesName[index]),
                    child: PokemonTypeCard(
                      width: width * 1.4,
                      height: height * 1.6,
                      typeColor: typesColor[index],
                      typeName: typesName[index],
                      left: width * .015,
                    ),
                  ),
                ),
              ],
            )
          : GestureDetector(
              onTap: () => pokemonController.setFilterByType(typesName[index]),
              child: PokemonTypeCard(
                width: width * 1.4,
                height: height * 1.6,
                typeColor: typesColor[index],
                typeName: typesName[index],
                left: width * .015,
              ),
            ),
    );
  }
}
