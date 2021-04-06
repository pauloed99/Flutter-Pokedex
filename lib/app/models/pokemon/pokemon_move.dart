class PokemonMove {
  int accuracy;
  ContestCombos contestCombos;
  ContestEffect contestEffect;
  UseAfter contestType;
  UseAfter damageClass;
  int effectChance;
  List<EffectEntries> effectEntries;
  List<FlavorTextEntries> flavorTextEntries;
  UseAfter generation;
  int id;
  List<Machines> machines;
  Meta meta;
  String name;
  List<Names> names;
  int power;
  int pp;
  int priority;
  ContestEffect superContestEffect;
  UseAfter target;
  UseAfter type;

  PokemonMove(
      {this.accuracy,
      this.contestCombos,
      this.contestEffect,
      this.contestType,
      this.damageClass,
      this.effectChance,
      this.effectEntries,
      this.flavorTextEntries,
      this.generation,
      this.id,
      this.machines,
      this.meta,
      this.name,
      this.names,
      this.power,
      this.pp,
      this.priority,
      this.superContestEffect,
      this.target,
      this.type});

  PokemonMove.fromJson(Map<String, dynamic> json) {
    accuracy = json['accuracy'];
    contestCombos = json['contest_combos'] != null
        ? new ContestCombos.fromJson(json['contest_combos'])
        : null;
    contestEffect = json['contest_effect'] != null
        ? new ContestEffect.fromJson(json['contest_effect'])
        : null;
    contestType = json['contest_type'] != null
        ? new UseAfter.fromJson(json['contest_type'])
        : null;
    damageClass = json['damage_class'] != null
        ? new UseAfter.fromJson(json['damage_class'])
        : null;
    effectChance = json['effect_chance'];
    if (json['effect_entries'] != null) {
      effectEntries = new List<EffectEntries>();
      json['effect_entries'].forEach((v) {
        effectEntries.add(new EffectEntries.fromJson(v));
      });
    }
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = new List<FlavorTextEntries>();
      json['flavor_text_entries'].forEach((v) {
        flavorTextEntries.add(new FlavorTextEntries.fromJson(v));
      });
    }
    generation = json['generation'] != null
        ? new UseAfter.fromJson(json['generation'])
        : null;
    id = json['id'];
    if (json['machines'] != null) {
      machines = new List<Machines>();
      json['machines'].forEach((v) {
        machines.add(new Machines.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    name = json['name'];
    if (json['names'] != null) {
      names = new List<Names>();
      json['names'].forEach((v) {
        names.add(new Names.fromJson(v));
      });
    }
    power = json['power'];
    pp = json['pp'];
    priority = json['priority'];
    superContestEffect = json['super_contest_effect'] != null
        ? new ContestEffect.fromJson(json['super_contest_effect'])
        : null;
    target =
        json['target'] != null ? new UseAfter.fromJson(json['target']) : null;
    type = json['type'] != null ? new UseAfter.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accuracy'] = this.accuracy;
    if (this.contestCombos != null) {
      data['contest_combos'] = this.contestCombos.toJson();
    }
    if (this.contestEffect != null) {
      data['contest_effect'] = this.contestEffect.toJson();
    }
    if (this.contestType != null) {
      data['contest_type'] = this.contestType.toJson();
    }
    if (this.damageClass != null) {
      data['damage_class'] = this.damageClass.toJson();
    }
    data['effect_chance'] = this.effectChance;
    if (this.effectEntries != null) {
      data['effect_entries'] =
          this.effectEntries.map((v) => v.toJson()).toList();
    }
    if (this.flavorTextEntries != null) {
      data['flavor_text_entries'] =
          this.flavorTextEntries.map((v) => v.toJson()).toList();
    }
    if (this.generation != null) {
      data['generation'] = this.generation.toJson();
    }
    data['id'] = this.id;
    if (this.machines != null) {
      data['machines'] = this.machines.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    data['name'] = this.name;
    if (this.names != null) {
      data['names'] = this.names.map((v) => v.toJson()).toList();
    }
    data['power'] = this.power;
    data['pp'] = this.pp;
    data['priority'] = this.priority;
    if (this.superContestEffect != null) {
      data['super_contest_effect'] = this.superContestEffect.toJson();
    }
    if (this.target != null) {
      data['target'] = this.target.toJson();
    }
    if (this.type != null) {
      data['type'] = this.type.toJson();
    }
    return data;
  }
}

class ContestCombos {
  Normal normal;

  ContestCombos({this.normal});

  ContestCombos.fromJson(Map<String, dynamic> json) {
    normal =
        json['normal'] != null ? new Normal.fromJson(json['normal']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.normal != null) {
      data['normal'] = this.normal.toJson();
    }
    return data;
  }
}

class Normal {
  List<UseAfter> useAfter;

  Normal({this.useAfter});

  Normal.fromJson(Map<String, dynamic> json) {
    if (json['use_after'] != null) {
      useAfter = new List<UseAfter>();
      json['use_after'].forEach((v) {
        useAfter.add(new UseAfter.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.useAfter != null) {
      data['use_after'] = this.useAfter.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UseAfter {
  String name;
  String url;

  UseAfter({this.name, this.url});

  UseAfter.fromJson(Map<String, dynamic> json) {
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

class ContestEffect {
  String url;

  ContestEffect({this.url});

  ContestEffect.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}

class EffectEntries {
  String effect;
  UseAfter language;
  String shortEffect;

  EffectEntries({this.effect, this.language, this.shortEffect});

  EffectEntries.fromJson(Map<String, dynamic> json) {
    effect = json['effect'];
    language = json['language'] != null
        ? new UseAfter.fromJson(json['language'])
        : null;
    shortEffect = json['short_effect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['effect'] = this.effect;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    data['short_effect'] = this.shortEffect;
    return data;
  }
}

class FlavorTextEntries {
  String flavorText;
  UseAfter language;
  UseAfter versionGroup;

  FlavorTextEntries({this.flavorText, this.language, this.versionGroup});

  FlavorTextEntries.fromJson(Map<String, dynamic> json) {
    flavorText = json['flavor_text'];
    language = json['language'] != null
        ? new UseAfter.fromJson(json['language'])
        : null;
    versionGroup = json['version_group'] != null
        ? new UseAfter.fromJson(json['version_group'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flavor_text'] = this.flavorText;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    if (this.versionGroup != null) {
      data['version_group'] = this.versionGroup.toJson();
    }
    return data;
  }
}

class Machines {
  ContestEffect machine;
  UseAfter versionGroup;

  Machines({this.machine, this.versionGroup});

  Machines.fromJson(Map<String, dynamic> json) {
    machine = json['machine'] != null
        ? new ContestEffect.fromJson(json['machine'])
        : null;
    versionGroup = json['version_group'] != null
        ? new UseAfter.fromJson(json['version_group'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.machine != null) {
      data['machine'] = this.machine.toJson();
    }
    if (this.versionGroup != null) {
      data['version_group'] = this.versionGroup.toJson();
    }
    return data;
  }
}

class Meta {
  UseAfter ailment;
  int ailmentChance;
  UseAfter category;
  int critRate;
  int drain;
  int flinchChance;
  int healing;
  int statChance;

  Meta(
      {this.ailment,
      this.ailmentChance,
      this.category,
      this.critRate,
      this.drain,
      this.flinchChance,
      this.healing,
      this.statChance});

  Meta.fromJson(Map<String, dynamic> json) {
    ailment =
        json['ailment'] != null ? new UseAfter.fromJson(json['ailment']) : null;
    ailmentChance = json['ailment_chance'];
    category = json['category'] != null
        ? new UseAfter.fromJson(json['category'])
        : null;
    critRate = json['crit_rate'];
    drain = json['drain'];
    flinchChance = json['flinch_chance'];
    healing = json['healing'];
    statChance = json['stat_chance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ailment != null) {
      data['ailment'] = this.ailment.toJson();
    }
    data['ailment_chance'] = this.ailmentChance;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['crit_rate'] = this.critRate;
    data['drain'] = this.drain;
    data['flinch_chance'] = this.flinchChance;
    data['healing'] = this.healing;
    data['stat_chance'] = this.statChance;
    return data;
  }
}

class Names {
  UseAfter language;
  String name;

  Names({this.language, this.name});

  Names.fromJson(Map<String, dynamic> json) {
    language = json['language'] != null
        ? new UseAfter.fromJson(json['language'])
        : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    data['name'] = this.name;
    return data;
  }
}