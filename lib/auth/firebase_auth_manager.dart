import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:juntoz/auth/auth_manager.dart';
import 'package:juntoz/auth/google_auth.dart' as gauth;

/// Firebase implementation for email/password auth.
/// - Automatically creates the user profile document in Firestore on first login/registration.
class FirebaseAuthManager extends AuthManager with EmailSignInManager, GoogleSignInManager {
  final fa.FirebaseAuth _auth = fa.FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  static const String usersCollection = 'users';

  fa.User? get currentUser => _auth.currentUser;

  @override
  Future<fa.User?> signInWithEmail(BuildContext context, String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(email: email.trim(), password: password);
      await _ensureUserProfile(cred.user);
      return cred.user;
    } on fa.FirebaseAuthException catch (e) {
      debugPrint('signInWithEmail error: ${e.code} ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('signInWithEmail error: $e');
      rethrow;
    }
  }

  @override
  Future<fa.User?> createAccountWithEmail(BuildContext context, String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password);
      await _ensureUserProfile(cred.user);
      return cred.user;
    } on fa.FirebaseAuthException catch (e) {
      debugPrint('createAccountWithEmail error: ${e.code} ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('createAccountWithEmail error: $e');
      rethrow;
    }
  }

  @override
  Future<fa.User?> signInWithGoogle(BuildContext context) async {
    try {
      final cred = await gauth.googleSignInFunc();
      final user = cred?.user;
      await _ensureUserProfile(user);
      return user;
    } on fa.FirebaseAuthException catch (e) {
      debugPrint('signInWithGoogle error: ${e.code} ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('signInWithGoogle error: $e');
      rethrow;
    }
  }

  /// Creates the user document if it does not exist.
  Future<void> _ensureUserProfile(fa.User? user, {String? name}) async {
    if (user == null) return;
    final doc = _db.collection(usersCollection).doc(user.uid);
    final snap = await doc.get();
    if (!snap.exists) {
      final nowIso = DateTime.now().toIso8601String();
      await doc.set({
        'name': name ?? (user.displayName ?? user.email?.split('@').first ?? 'User'),
        'email': user.email ?? '',
        'createdAt': nowIso,
      });
    }
  }

  Future<void> setDisplayNameOnCreate(String name) async {
    final user = _auth.currentUser;
    if (user != null) {
      try {
        await user.updateDisplayName(name);
        await _ensureUserProfile(user, name: name);
      } catch (e) {
        debugPrint('Failed to set display name: $e');
      }
    }
  }

  /// Quick demo login for Preview: tries to sign in a fixed demo user.
  /// If the user doesn't exist, it will be created and a sample trip seeded.
  Future<fa.User?> signInWithDemo(BuildContext context) async {
    const demoEmail = 'preview.demo@juntoz.app';
    const demoPassword = 'Demo1234!';
    try {
      fa.UserCredential cred;
      try {
        cred = await _auth.signInWithEmailAndPassword(email: demoEmail, password: demoPassword);
      } on fa.FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          cred = await _auth.createUserWithEmailAndPassword(email: demoEmail, password: demoPassword);
          await cred.user?.updateDisplayName('Demo');
        } else if (e.code == 'invalid-credential' || e.code == 'wrong-password') {
          // If password changed externally, recreate the user to unblock preview
          // Delete possible conflicting account is not allowed client-side; fall back to sign up with different alias
          final alt = DateTime.now().millisecondsSinceEpoch;
          final altEmail = 'preview+$alt@juntoz.app';
          cred = await _auth.createUserWithEmailAndPassword(email: altEmail, password: demoPassword);
          await cred.user?.updateDisplayName('Demo');
        } else {
          rethrow;
        }
      }

      final user = cred.user;
      await _ensureUserProfile(user, name: 'Demo');
      await _seedDemoDataIfEmpty(user!);
      return user;
    } catch (e) {
      debugPrint('signInWithDemo error: $e');
      rethrow;
    }
  }

  Future<void> _seedDemoDataIfEmpty(fa.User user) async {
    try {
      final tripsCol = _db.collection(usersCollection).doc(user.uid).collection('trips');
      final existing = await tripsCol.limit(1).get();
      if (existing.docs.isNotEmpty) return;

      final now = DateTime.now();
      final start = now.add(const Duration(days: 7));
      final end = start.add(const Duration(days: 4));
      final tripId = tripsCol.doc().id;
      final demoTrip = {
        'id': tripId,
        'title': 'Demo trip',
        'description': 'Sample itinerary to explore features',
        'destination': 'Barcelona, Spain',
        'startDate': start.toIso8601String(),
        'endDate': end.toIso8601String(),
        'coverImageUrl': null,
        'createdBy': user.uid,
          'memberIds': [user.uid],
        'members': [
          {
            'userId': user.uid,
            'userName': user.displayName ?? 'Demo',
            'userEmail': user.email ?? '',
            'role': 'admin',
            'joinedAt': now.toIso8601String(),
          }
        ],
        'createdAt': now.toIso8601String(),
        'updatedAt': now.toIso8601String(),
      };
      await tripsCol.doc(tripId).set(demoTrip);
    } catch (e) {
      debugPrint('Failed to seed demo data: $e');
    }
  }

  @override
  Future<void> signOut() => _auth.signOut();

  @override
  Future deleteUser(BuildContext context) async {
    try {
      final user = _auth.currentUser;
      if (user == null) return;
      await _db.collection(usersCollection).doc(user.uid).delete().catchError((_) {});
      await user.delete();
    } on fa.FirebaseAuthException catch (e) {
      debugPrint('deleteUser error: ${e.code} ${e.message}');
      rethrow;
    }
  }

  @override
  Future updateEmail({required String email, required BuildContext context}) async {
    try {
      final user = _auth.currentUser;
      if (user == null) return;
      await user.verifyBeforeUpdateEmail(email.trim());
      await _db.collection(usersCollection).doc(user.uid).update({'email': email.trim()});
    } on fa.FirebaseAuthException catch (e) {
      debugPrint('updateEmail error: ${e.code} ${e.message}');
      rethrow;
    }
  }

  @override
  Future resetPassword({required String email, required BuildContext context}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } on fa.FirebaseAuthException catch (e) {
      debugPrint('resetPassword error: ${e.code} ${e.message}');
      rethrow;
    }
  }
}
