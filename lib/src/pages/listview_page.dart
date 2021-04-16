import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  ListViewPage({Key key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listNumbers = [];
  int _ultimoItem = 0;

  @override
  void initState() {
    super.initState();
    _add10Img();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _add10Img();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lists'),
      ),
      body: _createList(),
    );
  }

  Widget _createList(){
      return ListView.builder(
        controller: _scrollController,
        itemCount: _listNumbers.length,
        itemBuilder: ( BuildContext context, int index) {
          final img = _listNumbers[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$img'),
            placeholder: AssetImage('assets/loading.gif'),
          );
        },
      );
  }

  void _add10Img(){
    for(var i =1; i< 10; i++){
      _ultimoItem++;
      _listNumbers.add( _ultimoItem );
    }
    setState((){
    });

  }
}