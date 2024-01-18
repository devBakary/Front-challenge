import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String password;
  final String name;
  final String phone;
  final String address;
  final int numero;

  User({
    required this.uid,
    required this.password,
    required this.name,
    required this.phone,
    required this.address,
    required this.numero,
  });
}