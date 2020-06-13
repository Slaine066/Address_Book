import 'package:flutter/material.dart';

import '../widgets/address_list_item.dart';

class EditAddress extends StatelessWidget {
  final _cName = TextEditingController();
  final _cPhoneNumber = TextEditingController();
  final _cCountry = TextEditingController();
  final _cCity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as ToEdit;

    final selectedAddress = args.myAddress;
    final editFunction = args.myEditAddress;

    _cName.text = selectedAddress.name;
    _cPhoneNumber.text = selectedAddress.phoneNumber;
    _cCountry.text = selectedAddress.country;
    _cCity.text = selectedAddress.city;

    TextFormField inputName = TextFormField(
      controller: _cName,
      autofocus: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Nome',
        icon: Icon(Icons.person),
      ),
    );

    TextFormField inputPhoneNumber = TextFormField(
      controller: _cPhoneNumber,
      autofocus: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Phone Number',
        icon: Icon(Icons.phone),
      ),
    );

    TextFormField inputCountry = TextFormField(
      controller: _cCountry,
      autofocus: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Country',
        icon: Icon(Icons.flag),
      ),
    );

    TextFormField inputCity = TextFormField(
      controller: _cCity,
      autofocus: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'City',
        icon: Icon(Icons.location_city),
      ),
    );
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Address'),
          actions: <Widget>[
            Container(
              width: 80,
              child: IconButton(
                icon: Icon(Icons.save),
                onPressed: () {editFunction(
                  selectedAddress,
                  _cName.text.toString(),
                  _cPhoneNumber.text.toString(),
                  _cCountry.text.toString(),
                  _cCity.text.toString(),
                );
                Navigator.pop(context);
                },
              ),
            )
          ],
        ),
        body: ListView(padding: EdgeInsets.all(20), children: <Widget>[
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
        ]));
  }
}
