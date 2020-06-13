import 'package:flutter/material.dart';

import '../models/model_address.dart';

class ToEdit {
   Address myAddress;
   Function myEditAddress;

   ToEdit(this.myAddress, this.myEditAddress);
}

class AddressListItem extends StatelessWidget {
  final Address address;
  
  final Function deleteAddress;
  final Function editAddress;

  AddressListItem(this.address, this.deleteAddress, this.editAddress);



  void _addressPressed(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/page_viewAddress',
      arguments: ToEdit(address, editAddress),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        address.name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(address.phoneNumber),
      leading: CircleAvatar(
        child: Text(address.name[0]),
      ),
      trailing: FlatButton.icon(
        icon: Icon(Icons.delete),
        label: Text('Delete'),
        textColor: Theme.of(context).errorColor,
        onPressed: () => deleteAddress(address.name, address.phoneNumber),
      ),
      onTap: () => _addressPressed(context),
    );
  }
}
