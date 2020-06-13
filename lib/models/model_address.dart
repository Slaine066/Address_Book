import 'package:meta/meta.dart';

class Address {
  String id;
  String name;
  String phoneNumber;
  String country;
  String city;

  Address({
    this.id,
    @required this.name,
    @required this.phoneNumber,
    @required this.country,
    @required this.city,
  });
}
