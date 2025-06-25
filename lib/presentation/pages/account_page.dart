import 'package:flutter/material.dart';
import '../../../core/injection_container.dart';
import '../../../domain/entities/member.dart';
import '../../../domain/repositories/member_repository.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Member? _member;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    print('AccountPage initState appelé');
    _loadCurrentMember();
  }

  Future<void> _loadCurrentMember() async {
    try {
      final memberRepo = sl<MemberRepository>();
      final member = await memberRepo.getCurrentMember();
      print('Membre chargé: $member');
      setState(() {
        _member = member;
      });
    } catch (e, st) {
      print('Erreur chargement membre: $e');
      print('Stacktrace: $st');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors du chargement : ${e.toString()}')),
      );
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Future<void> _logout() async {
    try {
      final memberRepo = sl<MemberRepository>();
      await memberRepo.logout();
      Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de la déconnexion : ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print('AccountPage build() appelé');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon compte'),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _member == null
          ? const Center(child: Text('Aucun utilisateur connecté'))
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Prénom : ${_member!.firstName}', style: Theme.of(context).textTheme.bodyLarge),
            Text('Nom : ${_member!.lastName}', style: Theme.of(context).textTheme.bodyLarge),
            Text('Email : ${_member!.email}', style: Theme.of(context).textTheme.bodyLarge),
            Text('Téléphone : ${_member!.phone}', style: Theme.of(context).textTheme.bodyLarge),
            Text('Rôle : ${_member!.role}', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _logout,
              child: const Text('Se déconnecter'),
            ),
          ],
        ),
      ),
    );
  }
}