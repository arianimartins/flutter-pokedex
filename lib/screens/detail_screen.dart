import 'package:flutter/material.dart';
import 'package:mypokedex/blocs/details_bloc_provider.dart';
import 'package:mypokedex/blocs/pokemon_detail_bloc.dart';
import 'package:mypokedex/config/theme.dart';
import 'package:mypokedex/models/abilites.dart';
import 'package:mypokedex/models/pokemon_details.dart';

class PokemonDetail extends StatefulWidget {

  final String name;
  PokemonDetail({this.name});

  @override
  State<StatefulWidget> createState() {
    return PokemonDetailState(name: name);
  }
}

class PokemonDetailState extends State<PokemonDetail> {
  PokemonDetailBloc bloc;
  final String name;
  PokemonDetailState({this.name});

  @override
  void didChangeDependencies() {
    bloc = DetailsBlocProvider.of(context);
    bloc.fetchPokemonByName(name);
    super.didChangeDependencies();
  }
  /*@override
  void initState() {
    bloc.fetchPokemonByName(name);
    super.initState();
  }*/

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_capitalizeString(widget.name))),

      body: StreamBuilder(
        stream: bloc.pokemonDetails,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return buildScreen(snapshot);
          }else if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }else{
            return Center(child: CircularProgressIndicator());
          }
        }
      ),

    );
  }

  Widget buildScreen(AsyncSnapshot snapshot){
    return FutureBuilder(
      future: snapshot.data,
      builder: (context, itemSnapShot){
        if(itemSnapShot.hasData){
          PokemonDetails p = itemSnapShot.data;
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Abilities.:', style: TextStyles.textSubtitle,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: listAbilities(p.abilities),
                ),
              ],
            ),
          );
        }else if(itemSnapShot.hasError){
          return Text(itemSnapShot.error.toString());
        }else{
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  String _capitalizeString(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }
  
  listAbilities(List<Abilities> abilities){
    var list = <Widget>[];
    for(int i=0; i<abilities.length; i++){
      list.add( Text(_capitalizeString(abilities[i].ability.name), style: TextStyles.textValues) );
    }
    return list;
  }
}
