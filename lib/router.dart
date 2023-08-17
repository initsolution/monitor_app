import 'package:go_router/go_router.dart';
import 'package:monitor_app/model/task.dart';
import 'package:monitor_app/screen/home_screen.dart';
import 'package:monitor_app/screen/task_screen.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: false,
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'task',
            name: 'task',
            builder: (context, state) =>
                TaskScreen(task: (state.extra as Task)),
          ),
        ]),
  ],
);
