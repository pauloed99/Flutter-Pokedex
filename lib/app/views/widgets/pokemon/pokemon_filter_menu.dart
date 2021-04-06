import 'package:flutter/material.dart';
import 'package:pokedex/app/utils/constants/constants.dart';
import 'package:pokedex/app/views/widgets/pokemon/pokemon_filter_type.dart';

class PokemonFilterMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return PopupMenuButton(
      onSelected: (String value) {
        if (value == Constants.type)
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(width * .05),
                topRight: Radius.circular(width * .05),
              ),
            ),
            context: context,
            builder: (_) => PokemonFilterType(width: width, height: height),
          );
      },
      icon: Icon(Icons.filter_list_sharp),
      itemBuilder: (_) => [
        PopupMenuItem(
          value: Constants.type,
          child: Text(
            Constants.type,
            style: TextStyle(
              fontSize: width * .03,
            ),
          ),
        ),
      ],
    );
  }
}
