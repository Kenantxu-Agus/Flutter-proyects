import '../services/firebase_service.dart';

class ChatViewModel {
  final FirebaseService _service = FirebaseService.singleton;
  late String eMail;

  void logOut() {
    _service.logOutUser();
  }

  String loggedInUserEmail() {
    eMail = _service.getEmailFromCurrentUser();
    return eMail;
  }

  void sendMessage(String messageText) {
    _service.addMessage(messageText, loggedInUserEmail());
  }
}
