import 'package:mypokedex/models/pokemon_details.dart';
import 'package:mypokedex/models/pokemons.dart';
import 'package:mypokedex/resources/pokemons_api_provider.dart';

class Repository{
  final pokemonsApiProvider = PokemonsApiProvider();

  Future<PokemonsRequest> fetchAllPokemons(int offset){
    return pokemonsApiProvider.fetchPokemonList(offset);
  }

  Future<PokemonDetails> fetchDetails(String name){
    return pokemonsApiProvider.fetchDetails(name);
  }

}