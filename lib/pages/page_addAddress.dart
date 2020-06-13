import 'package:flutter/material.dart';

class AddAddress extends StatelessWidget {
  final _cName = TextEditingController();
  final _cPhoneNumber = TextEditingController();
  final _cCountry = TextEditingController();
  final _cCity = TextEditingController();

  void savePressed(BuildContext context) {
    final myAddFunction = ModalRoute.of(context).settings.arguments as Function;

    myAddFunction(_cName.text.toString(), _cPhoneNumber.text.toString(), _cCountry.text.toString(), _cCity.text.toString());
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    TextFormField inputName = TextFormField(
      controller: _cName,
      decoration: InputDecoration(
        labelText: 'Nome',
        icon: Icon(Icons.person),
      ),
    );

    TextFormField inputPhoneNumber = TextFormField(
      controller: _cPhoneNumber,
      decoration: InputDecoration(
        labelText: 'Phone Number',
        icon: Icon(Icons.phone),
      ),
    );

    TextFormField inputCountry = TextFormField(
      controller: _cCountry,
      decoration: InputDecoration(
        labelText: 'Country',
        icon: Icon(Icons.flag),
      ),
    );

    TextFormField inputCity = TextFormField(
      controller: _cCity,
      decoration: InputDecoration(
        labelText: 'City',
        icon: Icon(Icons.location_city),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('New Address'),
        actions: <Widget>[
          Container(
            width: 80,
            child: IconButton(
              icon: Icon(Icons.save),
              onPressed: () => savePressed(context),
            ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          SizedBox(height: 20),
          Form(
            child: Column(
              children: <Widget>[
                inputName,
                inputPhoneNumber,
                inputCountry,
                inputCity,
              ],
            ),
          )
        ],
      ),
    );
  }
}
