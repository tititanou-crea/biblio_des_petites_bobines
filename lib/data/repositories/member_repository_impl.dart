import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/member.dart';
import '../../domain/repositories/member_repository.dart';

class MemberRepositoryImpl implements MemberRepository {
  final fb_auth.FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  MemberRepositoryImpl(this._auth, this._firestore);

  @override
  Future<void> registerMember(Member member, String password) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: member.email,
      password: password,
    );

    await _firestore.collection('members').doc(credential.user!.uid).set({
      'firstName': member.firstName,
      'lastName': member.lastName,
      'email': member.email,
      'phone': member.phone,
      'role': member.role,
    });
  }

  @override
  Future<Member?> loginMember(String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final uid = credential.user?.uid;
    if (uid == null) return null;

    final doc = await _firestore.collection('members').doc(uid).get();
    if (!doc.exists) return null;

    final data = doc.data()!;
    return Member(
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      role: data['role'] ?? '',
    );
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }

  @override
  Future<Member?> getCurrentMember() async {
    final user = _auth.currentUser;
    if (user == null) return null;

    final doc = await _firestore.collection('members').doc(user.uid).get();
    if (!doc.exists) return null;

    final data = doc.data()!;
    return Member(
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      role: data['role'] ?? '',
    );
  }
}