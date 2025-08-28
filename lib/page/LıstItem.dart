import 'package:flutter/material.dart';
import 'package:pokedex/design/UI.dart';
import 'package:pokedex/model/pokemon_model.dart';

class ListItem extends StatelessWidget {
  ListItem({super.key, required this.pokemon});
  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      margin: UIHelper.getDefaultPadding(),
      shadowColor: Colors.black,
      child: Column(
        children: [
          Text(pokemon.name.toString()),
          Chip(label: Text(typeValues.reverse[pokemon.type[0]] ?? '')),
        ], 
      ),
    );
  }
}

