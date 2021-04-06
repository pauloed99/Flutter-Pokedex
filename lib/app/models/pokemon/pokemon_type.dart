class PokemonType {
  List<MovesModel> moves;
  String name;
  List<PokemonModel> pokemon;

  PokemonType({this.moves, this.name, this.pokemon});

  PokemonType.fromJson(Map<String, dynamic> json) {
    if (json['moves'] != null) {
      moves = new List<MovesModel>();
      json['moves'].forEach((v) {
        moves.add(new MovesModel.fromJson(v));
      });
    }
    name = json['name'];
    if (json['pokemon'] != null) {
      pokemon = new List<PokemonModel>();
      json['pokemon'].forEach((v) {
        pokemon.add(new PokemonModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.moves != null) {
      data['moves'] = this.moves.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MovesModel {
  String name;
  String url;

  MovesModel({this.name, this.url});

  MovesModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class PokemonModel {
  MovesModel pokemon;
  int slot;

  PokemonModel({this.pokemon, this.slot});

  PokemonModel.fromJson(Map<String, dynamic> json) {
    pokemon =
        json['pokemon'] != null ? new MovesModel.fromJson(json['pokemon']) : null;
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon.toJson();
    }
    data['slot'] = this.slot;
    return data;
  }
}