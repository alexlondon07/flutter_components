import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  AnimatedContainerPage({Key key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width = 50.0;
  double _heigth = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container')
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(
            seconds: 1
          ),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _heigth,
          decoration: BoxDecoration(
            borderRadius:  _borderRadiusGeometry,
            color: _color
          ),
      ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.offline_bolt),
        onPressed: _change,
      ),
    );
  }

  void _change(){
    final random = Random();
    setState(() {
      _width = random.nextInt(300).toDouble();
      _heigth = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1 );
        _borderRadiusGeometry = BorderRadius.circular( random.nextInt(100).toDouble() );
    });
  }
}
