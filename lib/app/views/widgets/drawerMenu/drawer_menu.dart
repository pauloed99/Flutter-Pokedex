import 'package:flutter/material.dart';
import 'package:pokedex/app/views/widgets/drawerMenu/drawer_element.dart';
import 'custom_drawer_header.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          CustomDrawerHeader(),
          DrawerElement(
            title: 'Pokémons',
            titleColor: Colors.orange,
            image: 'assets/images/pokemonIcon.jpg',
            route: '/pokemon',
          ),
          DrawerElement(
            title: 'Favorites',
            titleColor: Colors.purple,
            image: 'assets/images/favorites.png',
            route: '/favorites',
          ),
        ],
      ),
    );
  }
}
