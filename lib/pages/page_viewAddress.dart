import 'package:flutter/material.dart';

import '../widgets/address_list_item.dart';

class ViewAddress extends StatelessWidget {
  static String defaultMessage = "No information";

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as ToEdit;
        final selectedAddress = args.myAddress;
        
    var locationInfo = '${selectedAddress.country}, ${selectedAddress.city}';

    void _editPressed(BuildContext context) {
      Navigator.of(context)
          .pushNamed('/page_editAddress', arguments: args);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Address',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.mode_edit),
            onPressed: () => _editPressed(context),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    child: Text(
                      selectedAddress.name[0],
                      style: TextStyle(fontSize: 50, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    maxRadius: 70,
                    backgroundColor: Colors.indigo,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${selectedAddress.name}',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: <Widget>[
                Card(
                  elevation: 4,
                  child: ListTile(
                    title: Text(
                        selectedAddress.phoneNumber.toString().isNotEmpty
                            ? selectedAddress.phoneNumber
                            : defaultMessage),
                    subtitle: Text(
                      "Phone Number",
                      style: TextStyle(color: Colors.black54),
                    ),
                    leading: Icon(Icons.phone,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                Card(
                  elevation: 4,
                  child: ListTile(
                    title: Text(selectedAddress.city.isNotEmpty ||
                            selectedAddress.country.isNotEmpty
                        ? locationInfo
                        : defaultMessage),
                    subtitle: Text(
                      "City",
                      style: TextStyle(color: Colors.black54),
                    ),
                    leading: Icon(Icons.location_city,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
