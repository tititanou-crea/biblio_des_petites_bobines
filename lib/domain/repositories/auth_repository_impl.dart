// data/repositories/auth_repository_impl.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/member.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> register(Member member, String password) async {
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: member.email,
      password: password,
    );

    // Sauvegarde des infos supplémentaires dans Firestore
    await _firestore.collection('members').doc(userCredential.user!.uid).set({
      'firstName': member.firstName,
      'lastName': member.lastName,
      'email': member.email,
      'phone': member.phone,
      'role': member.role,
    });
  }

  @override
  Future<Member?> login(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    DocumentSnapshot<Map<String, dynamic>> doc = await _firestore
        .collection('members')
        .doc(userCredential.user!.uid)
        .get();

    if (doc.exists) {
      final data = doc.data()!;
      return Member(
        firstName: data['firstName'],
        lastName: data['lastName'],
        email: data['email'],
        phone: data['phone'],
        role: data['role'],
      );
    } else {
      return null;
    }
  }
}