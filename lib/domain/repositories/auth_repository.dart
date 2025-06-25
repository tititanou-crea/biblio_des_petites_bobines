import '../entities/member.dart';

abstract class AuthRepository {
  Future<void> register(Member member, String password);
  Future<Member?> login(String email, String password);
}
