import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:belajar_flutter/models/users.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with email & password
  Future<UserCredential> signInWithEmail(String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return cred;
    } on FirebaseAuthException catch (e) {
      // Re-throw as a simple Exception with message for UI handling
      throw Exception(e.message ?? 'Authentication failed');
    }
  }

  // Sign up / register with email & password
  /// Sign up / register with email & password.
  /// If [displayName] is provided, updates the Firebase user's displayName
  /// and saves a user document to Firestore under `users/{uid}`.
  Future<UserCredential> signUpWithEmail(
    String email,
    String password, {
    String? displayName,
  }) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = cred.user;
      if (user != null && displayName != null && displayName.isNotEmpty) {
        // update Firebase Auth displayName
        await user.updateDisplayName(displayName);
        await user.reload();
      }

      // Save to Firestore using UserModel (do NOT store password)
      try {
        final uid = user?.uid;
        if (uid != null) {
          final userModel = UserModel(
            uid: uid,
            email: email,
            displayName: displayName ?? user?.displayName ?? '',
            photoUrl: user?.photoURL,
            createdAt: DateTime.now(),
          );

          // Write model to Firestore; use server timestamp for createdAt on server
          await FirebaseFirestore.instance.collection('users').doc(uid).set({
            ...userModel.toMap(),
            'createdAt': FieldValue.serverTimestamp(),
          }, SetOptions(merge: true));
        }
      } on FirebaseException catch (fireErr) {
        throw Exception(
          'Registration succeeded but saving profile failed: ${fireErr.message}',
        );
      } catch (fireErr) {
        throw Exception(
          'Registration succeeded but saving profile failed: $fireErr',
        );
      }

      return cred;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Registration failed');
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Current user
  User? get currentUser => _auth.currentUser;
}
