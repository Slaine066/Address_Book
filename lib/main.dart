import 'package:Address_Book/pages/page_addAddress.dart';
import 'package:flutter/material.dart';

import './pages/page_addressBook.dart';
import './pages/page_viewAddress.dart';
import './pages/page_editAddress.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Address Book',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.indigo,
        primaryTextTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        fontFamily: 'Quicksand',
      ),
      home: AddressBook(),
      routes: {
        '/page_addAddress': (context) => AddAddress(),
        '/page_viewAddress': (context) => ViewAddress(),
        '/page_editAddress': (context) => EditAddress(),
      },
    );
  }
}
