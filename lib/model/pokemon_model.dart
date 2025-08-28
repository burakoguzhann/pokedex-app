// To parse this JSON data, do
//
//     final pokemonModel = pokemonModelFromJson(jsonString);
import 'dart:convert';

List<PokemonModel> pokemonModelFromJson(String str) => List<PokemonModel>.from(json.decode(str).map((x) => PokemonModel.fromJson(x)));

String pokemonModelToJson(List<PokemonModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PokemonModel {
    int id;
    Name name;
    List<Type> type;
    Base base;
    String species;
    String description;
    Evolution evolution;
    Profile profile;
    Image image;

    PokemonModel({
        required this.id,
        required this.name,
        required this.type,
        required this.base,
        required this.species,
        required this.description,
        required this.evolution,
        required this.profile,
        required this.image,
    });

    factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        id: json["id"],
        name: Name.fromJson(json["name"] ?? {}),
        type: List<Type>.from(json["type"]?.map((x) => typeValues.map[x]) ?? []),
        base: Base.fromJson(json["base"] ?? {}),
        species: json["species"] ?? '',
        description: json["description"] ?? '',
        evolution: Evolution.fromJson(json["evolution"] ?? {}),
        profile: Profile.fromJson(json["profile"] ?? {}),
        image: Image.fromJson(json["image"] ?? {}),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name.toJson(),
        "type": List<dynamic>.from(type.map((x) => typeValues.reverse[x])),
        "base": base.toJson(),
        "species": species,
        "description": description,
        "evolution": evolution.toJson(),
        "profile": profile.toJson(),
        "image": image.toJson(),
    };
}

class Base {
    int hp;
    int attack;
    int defense;
    int spAttack;
    int spDefense;
    int speed;

    Base({
        required this.hp,
        required this.attack,
        required this.defense,
        required this.spAttack,
        required this.spDefense,
        required this.speed,
    });

    factory Base.fromJson(Map<String, dynamic> json) => Base(
        hp: json["HP"] ?? 0,
        attack: json["Attack"] ?? 0,
        defense: json["Defense"] ?? 0,
        spAttack: json["Sp. Attack"]?? 0,
        spDefense: json["Sp. Defense"]?? 0,
        speed: json["Speed"] ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "HP": hp,
        "Attack": attack,
        "Defense": defense,
        "Sp. Attack": spAttack,
        "Sp. Defense": spDefense,
        "Speed": speed,
    };
}

class Evolution {
    List<List<String>> next;
    List<String> prev;

    Evolution({
        required this.next,
        required this.prev,
    });

    factory Evolution.fromJson(Map<String, dynamic> json) => Evolution(
        next: json["next"] != null
            ? List<List<String>>.from(json["next"].map((x) => List<String>.from(x.map((x) => x))))
            : [],
        prev: json["prev"] != null
            ? List<String>.from(json["prev"].map((x) => x))
            : [],
    );

    Map<String, dynamic> toJson() => {
        "next": List<dynamic>.from(next.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "prev": List<dynamic>.from(prev.map((x) => x)),
    };
}

class Image {
    String sprite;
    String thumbnail;
    String hires;

    Image({
        required this.sprite,
        required this.thumbnail,
        required this.hires,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        sprite: json["sprite"] ?? '',
        thumbnail: json["thumbnail"] ?? '',
        hires: json["hires"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "sprite": sprite,
        "thumbnail": thumbnail,
        "hires": hires,
    };
}

class Name {
    String english;
    String japanese;
    String chinese;
    String french;

    Name({
        required this.english,
        required this.japanese,
        required this.chinese,
        required this.french,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        english: json["english"] ?? '',
        japanese: json["japanese"] ?? '',
        chinese: json["chinese"] ?? '',
        french: json["french"] ?? '',
    );
 
    Map<String, dynamic> toJson() => {
        "english": english,
        "japanese": japanese,
        "chinese": chinese,
        "french": french,
    };

    @override
    String toString() {
        return english; // veya istediğiniz başka bir alan
    }
}

class Profile {
    double height;
    double weight;
    List<Egg> egg;
    List<List<String>> ability;
    Gender gender;

    Profile({
        required this.height,
        required this.weight,
        required this.egg,
        required this.ability,
        required this.gender,
    });

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        height: json["height"] is String ? double.tryParse(json["height"]) ?? 0.0 : json["height"] ?? 0.0,
        weight: json["weight"] is String ? double.tryParse(json["weight"]) ?? 0.0 : json["weight"] ?? 0.0,
        egg: json["egg"] != null
            ? List<Egg>.from(json["egg"].map((x) => eggValues.map[x]))
            : [],
        ability: json["ability"] != null
            ? List<List<String>>.from(json["ability"].map((x) => List<String>.from(x.map((x) => x))))
            : [],
        gender: genderValues.map[json["gender"]] ?? Gender.GENDERLESS,
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "weight": weight,
        "egg": List<dynamic>.from(egg.map((x) => eggValues.reverse[x])),
        "ability": List<dynamic>.from(ability.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "gender": genderValues.reverse[gender],
    };
}

enum Egg {
    AMORPHOUS,
    BUG,
    DITTO,
    DRAGON,
    FAIRY,
    FIELD,
    FLYING,
    GRASS,
    HUMAN_LIKE,
    MINERAL,
    MONSTER,
    UNDISCOVERED,
    WATER_1,
    WATER_2,
    WATER_3
}

final eggValues = EnumValues({
    "Amorphous": Egg.AMORPHOUS,
    "Bug": Egg.BUG,
    "Ditto": Egg.DITTO,
    "Dragon": Egg.DRAGON,
    "Fairy": Egg.FAIRY,
    "Field": Egg.FIELD,
    "Flying": Egg.FLYING,
    "Grass": Egg.GRASS,
    "Human-Like": Egg.HUMAN_LIKE,
    "Mineral": Egg.MINERAL,
    "Monster": Egg.MONSTER,
    "Undiscovered": Egg.UNDISCOVERED,
    "Water 1": Egg.WATER_1,
    "Water 2": Egg.WATER_2,
    "Water 3": Egg.WATER_3
});

enum Gender {
    GENDERLESS,
    THE_001000,
    THE_0100,
    THE_1000,
    THE_100000,
    THE_125875,
    THE_250750,
    THE_2575,
    THE_500500,
    THE_5050,
    THE_7525,
    THE_875125
}

final genderValues = EnumValues({
    "Genderless": Gender.GENDERLESS,
    "0.0:100.0": Gender.THE_001000,
    "0:100": Gender.THE_0100,
    "100:0": Gender.THE_1000,
    "100.0:0.0": Gender.THE_100000,
    "12.5:87.5": Gender.THE_125875,
    "25.0:75.0": Gender.THE_250750,
    "25:75": Gender.THE_2575,
    "50.0:50.0": Gender.THE_500500,
    "50:50": Gender.THE_5050,
    "75:25": Gender.THE_7525,
    "87.5:12.5": Gender.THE_875125
});

enum Type {
    BUG,
    DARK,
    DRAGON,
    ELECTRIC,
    FAIRY,
    FIGHTING,
    FIRE,
    FLYING,
    GHOST,
    GRASS,
    GROUND,
    ICE,
    NORMAL,
    POISON,
    PSYCHIC,
    ROCK,
    STEEL,
    WATER
}

final typeValues = EnumValues({
    "Bug": Type.BUG,
    "Dark": Type.DARK,
    "Dragon": Type.DRAGON,
    "Electric": Type.ELECTRIC,
    "Fairy": Type.FAIRY,
    "Fighting": Type.FIGHTING,
    "Fire": Type.FIRE,
    "Flying": Type.FLYING,
    "Ghost": Type.GHOST,
    "Grass": Type.GRASS,
    "Ground": Type.GROUND,
    "Ice": Type.ICE,
    "Normal": Type.NORMAL,
    "Poison": Type.POISON,
    "Psychic": Type.PSYCHIC,
    "Rock": Type.ROCK,
    "Steel": Type.STEEL,
    "Water": Type.WATER
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
