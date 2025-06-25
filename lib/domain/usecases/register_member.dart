import '../entities/member.dart';
import '../repositories/member_repository.dart';

class RegisterMember {
  final MemberRepository repository;

  RegisterMember(this.repository);

  Future<void> execute(Member member, String password) {
    return repository.registerMember(member, password);
  }
}