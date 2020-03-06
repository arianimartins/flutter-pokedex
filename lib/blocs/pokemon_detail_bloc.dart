import 'package:mypokedex/models/pokemon_details.dart';
import 'package:mypokedex/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class PokemonDetailBloc{
  final _repository = Repository();
  final _pokemonName = PublishSubject<String>();
  final _detail = BehaviorSubject<Future<PokemonDetails>>();

  Function(String) get fetchPokemonByName => _pokemonName.sink.add;
  Stream<Future<PokemonDetails>> get pokemonDetails => _detail.stream;

  PokemonDetailBloc(){
    _pokemonName.stream.transform(_itemTransformer()).pipe(_detail);
  }

  dispose() async{
    _pokemonName.close();
    await _detail.drain();
    _detail.close();
  }

  _itemTransformer() {
    return ScanStreamTransformer((Future<PokemonDetails> detail, String name, int index) {
        print(name);
        detail = _repository.fetchDetails(name);
        return detail;
      },
    );
  }
}