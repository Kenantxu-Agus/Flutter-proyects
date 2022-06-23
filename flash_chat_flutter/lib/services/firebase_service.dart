import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class FirebaseService {
  static FirebaseService singleton = FirebaseService();
  final _auth = FirebaseAuth.instance;
  final _firestone = FirebaseFirestore.instance;

  Future<UserCredential> logInUser(BuildContext context, UserModel user) async {
    return await _auth.signInWithEmailAndPassword(
        email: user.eMail, password: user.password);
  }

  void logOutUser() {
    _auth.signOut();
  }

  Future<UserCredential> registerUser(
      BuildContext context, UserModel user) async {
    return await _auth.createUserWithEmailAndPassword(
        email: user.eMail, password: user.password);
  }

  String getEmailFromCurrentUser() {
    try {
      User? currentUser = _auth.currentUser;
      return currentUser!.email!;
    } catch (e) {
      throw Exception('No se ha podido localizar el email: $e');
    }
  }

  void addMessage(String text, String sender) {
    _firestone.collection('messages').add({
      'text': text,
      'sender': sender,
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamMessages() {
    return _firestone.collection('messages').snapshots();
  }
}
