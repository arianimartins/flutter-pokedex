import 'package:mypokedex/models/pokemons.dart';
import 'package:mypokedex/resources/repository.dart';
import 'package:rxdart/rxdart.dart';


class PokemonsBloc{
  final _repository = Repository();
  final _pokemonsFetcher = PublishSubject<PokemonsRequest>();

  bool _isDisposed = false;


  Stream<PokemonsRequest> get allPokemons{
    if(_isDisposed){
      return null;
    }
    return _pokemonsFetcher.stream;
  }

  fetchAllPokemons(int offset) async{
    PokemonsRequest pokemonsList = await _repository.fetchAllPokemons(offset);
    if(!_pokemonsFetcher.isClosed){
      _pokemonsFetcher.sink.add(pokemonsList);
    }
  }

  dispose(){
    _pokemonsFetcher.close();
    _isDisposed = true;
  }

}

final bloc = PokemonsBloc();