import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
// No need for google_sign_in plugin: use FirebaseAuth providers directly

Future<UserCredential?> googleSignInFunc() async {
  if (kIsWeb) {
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(GoogleAuthProvider());
  }

  // Use OAuth provider flow on mobile/desktop
  return FirebaseAuth.instance.signInWithProvider(GoogleAuthProvider());
}

Future signOutWithGoogle() => FirebaseAuth.instance.signOut();
