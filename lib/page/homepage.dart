import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/page/L%C4%B1stItem.dart';
import 'package:pokedex/services/pokedex_api.dart';

class Homepage extends StatefulWidget {
Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<PokemonModel>> _pokemonFutureList;

  @override
  void initState() {
    super.initState();
    _pokemonFutureList = PokeAPI.getPokemonModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<PokemonModel>>(
        future: _pokemonFutureList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PokemonModel> _listem = snapshot.data!;
            return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: ScreenUtil().orientation==Orientation.portrait ? 2 : 3 ), itemBuilder: (context, index) => ListItem(pokemon: _listem[index]),);
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
} 