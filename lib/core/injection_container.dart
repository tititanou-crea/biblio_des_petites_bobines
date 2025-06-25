import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/repositories/member_repository_impl.dart';
import '../../domain/repositories/member_repository.dart';
import '../../domain/usecases/login_member.dart';
import '../../domain/usecases/register_member.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Firebase instances
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  // Repository
  sl.registerLazySingleton<MemberRepository>(() => MemberRepositoryImpl(sl(), sl()));

  // Use cases
  sl.registerLazySingleton(() => LoginMember(sl()));
  sl.registerLazySingleton(() => RegisterMember(sl()));
}
