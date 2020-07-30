import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name = '';
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs')
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        children: <Widget>[
          _createInput(),
          _createPerson(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
        ]
      ),
    );
  }

  Widget _createInput(){
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${ _name.length }'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon:  Icon ( Icons.accessibility),
        icon: Icon (Icons.email),
      ),
      onChanged: (value){
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createEmail(){
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Email de la persona',
        labelText: 'Email',
        suffixIcon:  Icon ( Icons.alternate_email),
        icon: Icon (Icons.account_circle),
      ),
      onChanged: (value) => setState(() {
          _email = value;
        }),
    );
  }

  Widget _createPassword(){
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon:  Icon ( Icons.lock_open),
        icon: Icon (Icons.lock),
      ),
      onChanged: (value) => setState(() {
          _password = value;
        }),
    );
  }

  Widget _createPerson(){
    return ListTile(
      title: Text('Nombre es: $_name'),
    );
  }
}