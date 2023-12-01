import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/controller/auth_controller.dart';
import 'package:monitor_app/mstate/auth_state.dart';
import 'package:monitor_app/screen/home_screen.dart';
import 'package:monitor_app/screen/login_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authControllerProvider, (previous, next) {
      if (next is AuthAuthorized) {
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      } else if (next is AuthUnauthorized) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    });
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 160, 0, 0),
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(seconds: 3),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Center(
                  child: ClipOval(
                      child: Image.asset('assets/images/ic_logo.png',
                          fit: BoxFit.none))),
            );
          },
          onEnd: () => ref.read(authControllerProvider.notifier).appStarted(),
        ),
      ),
    );
  }
}
