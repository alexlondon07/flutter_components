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
        children: _createItems(),
      ),
    );
  }

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
}