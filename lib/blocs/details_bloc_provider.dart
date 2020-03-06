import 'package:flutter/cupertino.dart';
import 'package:mypokedex/blocs/pokemon_detail_bloc.dart';

class DetailsBlocProvider extends InheritedWidget {
  final PokemonDetailBloc bloc;

  DetailsBlocProvider({Key key, Widget child})
      : bloc = PokemonDetailBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static PokemonDetailBloc of(BuildContext context) {
    // ignore: deprecated_member_use
    return (context.inheritFromWidgetOfExactType(DetailsBlocProvider) as DetailsBlocProvider).bloc;
  }
}
