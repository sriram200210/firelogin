// // import 'package:firebase_auth/firebase_auth.dart';

// class Usermodel {
//   String? uid;
//   String? username;
//   String? email;

//   Usermodel({this.uid, this.email, this.username});

//   //recieve data from server
//   factory Usermodel.fromMap(map) {
//     return Usermodel(
//         uid: map['uid'], email: map['email'], username: map['username']);
//   }

//   //sending data to server
//   Map<String, dynamic> toMap() {
//     return {'email': email, 'uid': uid, 'username': username};
//   }
// }

// ignore_for_file: non_constant_identifier_names

class UserModel {
  String? uid;
  String? email;
  String? Name;
  String? phone;
  String? date;

  UserModel({this.uid, this.email, this.Name, this.phone, this.date});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        Name: map['Name'],
        phone: map['phone'],
        date: map['date']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'Name': Name,
      'phone': phone,
      'date': date
    };
  }
}
