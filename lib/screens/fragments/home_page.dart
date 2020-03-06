import 'package:flutter/material.dart';
import 'package:mypokedex/blocs/details_bloc_provider.dart';
import 'package:mypokedex/blocs/pokemons_bloc.dart';
import 'package:mypokedex/models/pokemons.dart';

import '../detail_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllPokemons(0);
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.allPokemons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget buildList(snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.results.length,
        itemBuilder: (context, index) {
          return Card(
              margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
              child: InkWell(
                onTap: (){
                  openPokemonDetail(snapshot.data, index);
                },
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      trailing: Icon(Icons.arrow_right, color: Colors.redAccent,),
                      title: Text(
                          _capitalizeString(snapshot.data.results[index].name)),
                      leading: Image.asset(
                        'images/pokeball.png',
                        fit: BoxFit.contain,
                      ),
                    )),
              ),
            );
        });
  }

  String _capitalizeString(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }

  openPokemonDetail(PokemonsRequest data, int index){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      var item = data.results[index];
      return DetailsBlocProvider(
        child: PokemonDetail(
          name: item.name,
        ),
      );
    }));
  }

}
