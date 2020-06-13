import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/address_list.dart';
import '../data/test_data.dart';
import '../models/model_address.dart';

class AddressBook extends StatefulWidget {
  @override
  _AddressBookState createState() => _AddressBookState();
}

class _AddressBookState extends State<AddressBook> {
  Icon customIcon = Icon(Icons.search);
  Widget customTitle = Center(child: Text('Address Book'));
  final cFilter = TextEditingController();
  bool _isSearching = false;
  String searchQuery = '';
  List<Address> fAddress = [];

  //Methods
  void _deleteAddress(String name, String phoneNumber) {
    setState(() {
      addressData.removeWhere((address) => address.name == name && address.phoneNumber == phoneNumber);
    });
  }

  void _addAddress(String newName, String newPhoneNumber, String newCountry,
      String newCity) {
    final newAddress = Address(
        name: newName,
        phoneNumber: newPhoneNumber,
        country: newCountry,
        city: newCity);
    setState(() {
      addressData.add(newAddress);
    });
  }

  void _editAddress(
    Address selectedAddress,
    String editName,
    String editPhoneNumber,
    String editCountry,
    String editCity,
  ) {
    for (var i = 0; i < addressData.length; i++) {
      if (selectedAddress.id == addressData[i].id) {
        setState(() {
          addressData[i].name = editName;
          addressData[i].phoneNumber = editPhoneNumber;
          addressData[i].country = editCountry;
          addressData[i].city = editCity;
        });
      }
    }
  }

  void _addPressed(BuildContext context) {
    Navigator.of(context).pushNamed('/page_addAddress', arguments: _addAddress);
  }

  Widget _buildSearchField() {
    return TextField(
      controller: cFilter,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Search Address...',
        border: InputBorder.none,
        hintStyle:
            TextStyle(color: Colors.white70, fontWeight: FontWeight.w500),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
      onSubmitted: (query) => updateSearchQuery(query),
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (cFilter == null || cFilter.text.isEmpty) {
              Navigator.pop(context);
              fAddress = [];
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  void _startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      fAddress = [];
      searchQuery = newQuery;
      if (searchQuery != '') {
        checkFilter(searchQuery);
      }
    });
  }

  void checkFilter(String filter) {
    for (var i = 0; i < addressData.length; i++) {
      if (addressData[i].name.contains(searchQuery) ||
          addressData[i].phoneNumber.contains(searchQuery) ||
          addressData[i].country.contains(searchQuery) ||
          addressData[i].city.contains(searchQuery)) {
        fAddress.add(addressData[i]);
      } 
    }
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      cFilter.clear();
      updateSearchQuery('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _isSearching ? const BackButton() : Container(),
        title: _isSearching ? _buildSearchField() : customTitle,
        actions: _buildActions(),
      ),
      body: AddressList(
        filteredAddresses: searchQuery == '' ? addressData : fAddress,
        deleteAddress: _deleteAddress,
        editAddress: _editAddress,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addPressed(context),
      ),
    );
  }
}
