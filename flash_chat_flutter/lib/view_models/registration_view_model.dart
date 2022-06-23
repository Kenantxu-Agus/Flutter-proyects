import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../services/firebase_service.dart';
import '../views/chat_screen.dart';

class RegistrationViewModel {
  UserModel _user = UserModel(eMail: 'eMail', password: 'password');
  FirebaseService _service = FirebaseService.singleton;
  bool showSpinner = false;
  void setEMail(String eMail) {
    _user.eMail = eMail;
  }

  void setPassword(String password) {
    _user.password = password;
  }

  Future<void> registerUser(BuildContext context) async {
    try {
      await _service.registerUser(context, _user);
      Navigator.pushNamed(context, ChatScreen.id);
    } catch (error) {
      // Todo: mostrar alerta del error del login
    } finally {
      showSpinner = false;
    }
  }
}
