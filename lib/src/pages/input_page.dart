import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name = '';
  String _email = '';
  String _password = '';
  String _date = '';
  String _selectedPower = 'Volar';
  List _powers = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];
  TextEditingController _inputEditingDate = new TextEditingController();

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
          Divider(),
          _createDatePicker( context ),
          Divider(),
          _createDropdwown(),
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

  Widget _createDatePicker(BuildContext context){
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputEditingDate,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon:  Icon ( Icons.perm_contact_calendar),
        icon: Icon (Icons.calendar_today),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  Widget _createDropdwown(){

    return  Row(children: <Widget>[
      Icon(Icons.select_all),
      SizedBox(width: 30.0),
      Expanded(
      child: DropdownButton(
        value: _selectedPower,
          items: getOptionsDropdownMenuItem(),
          onChanged: (opt) {
            setState(() {
              _selectedPower = opt;
            });
            print(opt);
          }
      ))
    ]);
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(hours: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if ( picked != null ){
      setState(() {
        _date = picked.toString();
        _inputEditingDate.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptionsDropdownMenuItem() {
    List<DropdownMenuItem<String>> list = new List();
    _powers.forEach((element) {
      list.add( DropdownMenuItem(
        child: Text(element),
        value: element
      ));
    });
    return list;
  }

  Widget _createPerson(){
    return ListTile(
      title: Text('Nombre es: $_name'),
    );
  }
}