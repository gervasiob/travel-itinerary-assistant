import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;

/// Listenable that refreshes GoRouter when FirebaseAuth state changes.
class AuthState extends ChangeNotifier {
  late final fa.FirebaseAuth _auth;
  AuthState() {
    _auth = fa.FirebaseAuth.instance;
    _auth.authStateChanges().listen((_) => notifyListeners());
  }

  bool get isLoggedIn => _auth.currentUser != null && _auth.currentUser!.isAnonymous == false;
}
