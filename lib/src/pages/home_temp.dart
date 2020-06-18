import 'package:flutter/material.dart';


class HomePageTemp extends StatelessWidget {

  final options = ['Uno', 'Dos', 'Tres', 'Cuatro'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components temp'),
      ),
      body:  ListView(
        // children: _createItems(),
        children: _createItemsV2(),
      ),
    );
  }

/**
 * Metodo para crear una lista
 */
  List<Widget> _createItems(){

    List<Widget> list = new List<Widget>();

    for(String opt in options) {
    
      final tempWidget = ListTile(
        title: Text (opt),
      );
      list..add( tempWidget )
          ..add( Divider());
    }
    return list;
  }

  /**
   * Metodo para crear lista corta
   */
  List<Widget> _createItemsV2(){
    return options.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title:  Text ( item + '!'),
            subtitle: Text('Test'),
            leading: Icon( Icons.border_all),
            trailing: Icon( Icons.keyboard_arrow_right),
            onTap: (){},
          ),
        ],
      );
    }).toList();
  }

}