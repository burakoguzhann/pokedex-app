import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeAPI {
  static const String _url = "https://raw.githubusercontent.com/Purukitto/pokemon-data.json/master/pokedex.json";
  static List<PokemonModel> _list = [];

  static Future<List<PokemonModel>> getPokemonModel() async {
    var dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    var result = await dio.get(_url);
    var pokeJsonDecode = jsonDecode(result.data);
    debugPrint(pokeJsonDecode.toString());

    if (pokeJsonDecode != null && pokeJsonDecode is List) {
      _list = pokeJsonDecode.map<PokemonModel>((e) => PokemonModel.fromJson(e)).toList();
    }

    return _list;
  }
}