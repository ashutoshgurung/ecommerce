import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreServices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Creates a new user profile document in Firestore.
  /// Call this once, right after a user signs up for the first time
  /// (email/password OR Google) — not on every login.
  Future<void> createUserProfile(User user) async {
    await _db.collection('users').doc(user.uid).set({
      'uid': user.uid,
      'email': user.email,
      'displayName': user.displayName ?? '',
      'photoUrl': user.photoURL ?? '',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}