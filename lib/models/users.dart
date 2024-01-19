import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String password;
  final String name;
  final String phone;
  final String address;
  final String identifiant;

  User({
    required this.uid,
    required this.password,
    required this.name,
    required this.phone,
    required this.address,
    required this.identifiant,
  });

  //from map
  factory User.fromMap(Map<String, dynamic> map, DocumentReference ref) {
    return User(
      uid: ref.id,
      password: map['motpass'],
      name: map['nom'],
      phone: map['telephone'],
      address: map['adress'],
      identifiant: map['identifiant'],
    );
  }

  //to map
  Map<String, dynamic> toMap() {
    return {
      'motpass': password,
      'nom': name,
      'telephone': phone,
      'adress': address,
      'identifiant': identifiant,
    };
  }

  //create new user
  Future<void> createUser(User user) async {
    final ref = FirebaseFirestore.instance.collection('utilisateurs');
    await ref.add(user.toMap());
  }
}
