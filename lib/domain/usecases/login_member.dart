import '../entities/member.dart';
import '../repositories/member_repository.dart';

class LoginMember {
  final MemberRepository repository;

  LoginMember(this.repository);

  Future<Member?> execute(String email, String password) {
    return repository.loginMember(email, password);
  }
}