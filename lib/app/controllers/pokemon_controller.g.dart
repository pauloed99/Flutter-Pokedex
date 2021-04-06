// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonController on _PokemonControllerBase, Store {
  final _$pokemonInputLoadedAtom =
      Atom(name: '_PokemonControllerBase.pokemonInputLoaded');

  @override
  bool get pokemonInputLoaded {
    _$pokemonInputLoadedAtom.reportRead();
    return super.pokemonInputLoaded;
  }

  @override
  set pokemonInputLoaded(bool value) {
    _$pokemonInputLoadedAtom.reportWrite(value, super.pokemonInputLoaded, () {
      super.pokemonInputLoaded = value;
    });
  }

  final _$filteredPokemonListAtom =
      Atom(name: '_PokemonControllerBase.filteredPokemonList');

  @override
  List<Results> get filteredPokemonList {
    _$filteredPokemonListAtom.reportRead();
    return super.filteredPokemonList;
  }

  @override
  set filteredPokemonList(List<Results> value) {
    _$filteredPokemonListAtom.reportWrite(value, super.filteredPokemonList, () {
      super.filteredPokemonList = value;
    });
  }

  final _$filteredPokemonListTypeAtom =
      Atom(name: '_PokemonControllerBase.filteredPokemonListType');

  @override
  List<PokemonModel> get filteredPokemonListType {
    _$filteredPokemonListTypeAtom.reportRead();
    return super.filteredPokemonListType;
  }

  @override
  set filteredPokemonListType(List<PokemonModel> value) {
    _$filteredPokemonListTypeAtom
        .reportWrite(value, super.filteredPokemonListType, () {
      super.filteredPokemonListType = value;
    });
  }

  final _$filterByTypeAtom = Atom(name: '_PokemonControllerBase.filterByType');

  @override
  String get filterByType {
    _$filterByTypeAtom.reportRead();
    return super.filterByType;
  }

  @override
  set filterByType(String value) {
    _$filterByTypeAtom.reportWrite(value, super.filterByType, () {
      super.filterByType = value;
    });
  }

  final _$_PokemonControllerBaseActionController =
      ActionController(name: '_PokemonControllerBase');

  @override
  void setFilterByType(String value) {
    final _$actionInfo = _$_PokemonControllerBaseActionController.startAction(
        name: '_PokemonControllerBase.setFilterByType');
    try {
      return super.setFilterByType(value);
    } finally {
      _$_PokemonControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPokemonInputStatus() {
    final _$actionInfo = _$_PokemonControllerBaseActionController.startAction(
        name: '_PokemonControllerBase.setPokemonInputStatus');
    try {
      return super.setPokemonInputStatus();
    } finally {
      _$_PokemonControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pokemonFilter() {
    final _$actionInfo = _$_PokemonControllerBaseActionController.startAction(
        name: '_PokemonControllerBase.pokemonFilter');
    try {
      return super.pokemonFilter();
    } finally {
      _$_PokemonControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pokemonFilterType() {
    final _$actionInfo = _$_PokemonControllerBaseActionController.startAction(
        name: '_PokemonControllerBase.pokemonFilterType');
    try {
      return super.pokemonFilterType();
    } finally {
      _$_PokemonControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemonInputLoaded: ${pokemonInputLoaded},
filteredPokemonList: ${filteredPokemonList},
filteredPokemonListType: ${filteredPokemonListType},
filterByType: ${filterByType}
    ''';
  }
}
