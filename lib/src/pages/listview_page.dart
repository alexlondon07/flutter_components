import 'package:flutter/material.dart';
import 'dart:async';

class ListViewPage extends StatefulWidget {
  ListViewPage({Key key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listNumbers = [];
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _add10Img();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _add10Img();
        fectData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lists'),
      ),
      body: Stack(
        children : <Widget>[
           _createList(),
           _createLoading()
        ]
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _createList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _listNumbers.length,
      itemBuilder: (BuildContext context, int index) {
        final img = _listNumbers[index];
        return FadeInImage(
          image: NetworkImage('https://picsum.photos/500/300/?image=$img'),
          placeholder: AssetImage('assets/loading.gif'),
        );
      },
    );
  }

  void _add10Img() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listNumbers.add(_ultimoItem);
    }
    setState(() {});
  }

  Future fectData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    new Timer(duration, responseHTTP);
  }

  void responseHTTP() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels+100,
      curve: Curves.fastOutSlowIn,
      duration: Duration( milliseconds: 250));

    _add10Img();
  }

  Widget _createLoading(){
    if(_isLoading ){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children : <Widget>[
              CircularProgressIndicator()
            ]
          ),
          SizedBox( height: 15.0)
        ],
      );
    }else{
      return Container();
    }
  }
}
