import 'package:flutter/material.dart';
import 'package:flutter_components/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    //print(menuProvider.options);
    return FutureBuilder(
        future: menuProvider.loadData(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(
            children: _listItems(snapshot.data),
          );
        });
  }

  // Metodo para crear lista corta
  List<Widget> _listItems(List<dynamic> data) {
    final List<Widget> options = [];

    data.forEach((element) {
      final wgTemp = ListTile(
        title: Text(element['title']),
        leading: Icon(Icons.add_a_photo, color: Colors.blue),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {},
      );

      options..add(wgTemp)..add(Divider());
    });

    return options;
  }
}
