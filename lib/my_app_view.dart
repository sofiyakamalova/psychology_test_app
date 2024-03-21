import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psychology_test_app/src/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:psychology_test_app/src/features/navigation/bottom_nav_bar.dart';
import 'package:psychology_test_app/src/features/onboarding/onboarding_page.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          return const BottomNavBar();
          //TestsPage()
        } else {
          return const OnboardingPage();
        }
      }),
    );
  }
}
