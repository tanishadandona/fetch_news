

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User{
  String name;
  String profilePhoto;
  String email;
  String uid;
  User({
    required this.name,required this.email,required this.profilePhoto,required this.uid
});
  Map<String,dynamic> toJson()=>{
    "name":name,
    "profilePhoto":profilePhoto,
  "email":email,
  "uid":uid

  };
  static User fromSnap(DocumentSnapshot snap){
    var snapshot=snap.data()as Map<String,dynamic>;
return User(email: snapshot['email'],profilePhoto: snapshot['profilePhoto'],
    uid: snapshot['uid'],name: snapshot['name']);
  }}
