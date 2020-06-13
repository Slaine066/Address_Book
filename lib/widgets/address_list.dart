import 'package:flutter/material.dart';

import '../models/model_address.dart';
import './address_list_item.dart';

class AddressList extends StatelessWidget {
  //final List<Address> myAddresses;
  final Function deleteAddress;
  final Function editAddress;
  final List<Address> filteredAddresses;

  AddressList({
    //this.myAddresses,
    this.filteredAddresses,
    this.deleteAddress,
    this.editAddress,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      itemBuilder: (context, index) {
        return AddressListItem(filteredAddresses[index], deleteAddress, editAddress);
      },
      itemCount: filteredAddresses.length,
    );
          
    

    /* ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      itemBuilder: (context, index) {
        return AddressListItem(filteredAddresses[index], deleteAddress, editAddress);
      },
      itemCount: filteredAddresses.length,
    ); */
  }
}
