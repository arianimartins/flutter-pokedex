import 'package:flutter/material.dart';
import 'package:mypokedex/menus/drawer_menu.dart';

import 'fragments/about_page.dart';
import 'fragments/home_page.dart';

class HomeScreen extends StatefulWidget {

  //Itens do menu
  final menuItens = [
    new DrawerMenuItem(title: 'Home', icon: Icons.home),
    new DrawerMenuItem(title: 'About', icon: Icons.info),
  ];


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //Posição do item do menu que foi selecionado
  int _selectedMenuItemIndex = 0;

  //Pega a página da opção selecionada
  _getMenuItemPage(int pos) {
    switch (pos) {
      case 0:
        return new HomePage();
      case 1:
        return new AboutPage();
      default:
        break;
    }
  }

  //Muda o item selecionado visualmente, e fecha o menu quando a navegação for feita.
  _onSelectItem(int index) {
    setState(() {
      _selectedMenuItemIndex = index;
    });
    Navigator.of(context).pop(); //Fecha o Menu
  }

  @override
  Widget build(BuildContext context) {

    var menuOptions = <Widget>[]; //lista de widgets para o children de Column

    for(int i=0; i<widget.menuItens.length; i++){ //Para cada item da lista de menu, cria/add um widget
      var mItem = widget.menuItens[i];
      menuOptions.add(new ListTile(
        title: new Text(mItem.title),
        leading: new Icon(mItem.icon),
        selected: i == _selectedMenuItemIndex, //Verifica se é o item selecionado atualmente ou não
        trailing: Icon(Icons.arrow_forward),
        onTap: (){
          _onSelectItem(i);
        },
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Pokédex'),
        centerTitle: true,
      ),
      drawer: _appDrawer(menuOptions),
      body: _getMenuItemPage(_selectedMenuItemIndex),
    );
  }

  Widget _appDrawer(List<Widget> menuOptions) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          new DrawerHeader(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  child: Image.asset('images/pokedex.png'),
                  radius: 50,
                  backgroundColor: Colors.transparent,
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text('Pokédex'))
              ],
            ),
          ),
          new Column(
            children: menuOptions,
          )
        ],
      ),
    );
  }

}
