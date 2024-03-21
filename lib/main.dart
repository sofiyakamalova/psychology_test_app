import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:psychology_test_app/firebase_options.dart';
import 'package:psychology_test_app/my_app_view.dart';
import 'package:psychology_test_app/simple_bloc_observer.dart';
import 'package:psychology_test_app/src/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:psychology_test_app/src/features/tests/provider/test_provider.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(FirebaseUserRepo()));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp(this.userRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizProvider(context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RepositoryProvider<AuthenticationBloc>(
            create: (context) =>
                AuthenticationBloc(userRepository: userRepository),
            child: const MyAppView()),
      ),
    );
  }
}
