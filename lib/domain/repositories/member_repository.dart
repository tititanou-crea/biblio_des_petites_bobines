import '../entities/member.dart';

abstract class MemberRepository {
  Future<void> registerMember(Member member, String password);
  Future<Member?> loginMember(String email, String password);
  Future<void> logout();
  Future<Member?> getCurrentMember();
}