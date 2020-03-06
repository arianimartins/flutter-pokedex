import 'dart:convert';

import 'package:http/http.dart';
import 'package:mypokedex/models/pokemon_details.dart';
import 'package:mypokedex/models/pokemons.dart';

class PokemonsApiProvider{
  Client client = Client();
  final _baseUrl = 'https://pokeapi.co/api/v2';

  Future<PokemonsRequest> fetchPokemonList(int offset) async{
    print('ENTERED');
    final response = await client.get('$_baseUrl/pokemon?offset=$offset');
    print(response.body.toString());

    if(response.statusCode == 200){
      return PokemonsRequest.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to fetch data');
    }
  }

  Future<PokemonDetails> fetchDetails(String name) async{
    print('Entered');
    final response = await client.get('$_baseUrl/pokemon/$name');
    print(response.body.toString());

    if(response.statusCode == 200){
      return PokemonDetails.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to fetch details');
    }
  }


}
