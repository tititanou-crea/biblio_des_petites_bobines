import 'package:biblio_des_petites_bobines/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'domain/repositories/member_repository.dart';
import 'domain/usecases/login_member.dart';
import 'domain/usecases/register_member.dart';
import 'firebase_options.dart';
import 'routes/app_router.dart';
import 'routes/app_routes.dart';
import 'core/injection_container.dart';  // <-- ajoute ça

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await init();  // <-- APPEL OBLIGATOIRE pour enregistrer les dépendances
  runApp(const MyApp());
}

final AppRouter _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La Bibliothèque des Petites Bobines',
      theme: appTheme,
      onGenerateRoute: _appRouter.generateRoute,
      initialRoute: AppRoutes.account,
    );
  }
}