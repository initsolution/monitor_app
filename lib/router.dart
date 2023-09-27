
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:monitor_app/model/category_checklist_preventive.dart';
import 'package:monitor_app/model/task.dart';
import 'package:monitor_app/screen/camera_screen.dart';
import 'package:monitor_app/screen/album_screen.dart';
import 'package:monitor_app/screen/form_checklist_screen.dart';
import 'package:monitor_app/screen/form_report_torque.dart';
import 'package:monitor_app/screen/form_report_verticality.dart';
import 'package:monitor_app/screen/home_screen.dart';
import 'package:monitor_app/screen/task_screen.dart';

// final GoRouter router = GoRouter(
//   debugLogDiagnostics: false,
//   initialLocation: '/',
//   routes: [
//     GoRoute(
//         path: '/',
//         name: 'home',
//         builder: (context, state) => const HomeScreen(),
//         routes: [
//           GoRoute(
//               path: 'task',
//               name: 'task',
//               builder: (context, state) =>
//                   TaskScreen(task: (state.extra as Task)),
//               routes: [
//                 GoRoute(
//                   path: 'camera',
//                   name: 'camera',
//                   builder: (context, state) =>
//                       CameraExampleHome(cameras: (state.extra as List<CameraDescription>)),
//                 ),
//               ]),
//         ]),
//   ],
// );

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'home':
      String email = settings.arguments as String;
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            HomeScreen(email: email),
        settings: RouteSettings(name: HomeScreen.routeName),
      );
    case 'task':
      Task task = settings.arguments as Task;
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            TaskScreen(task: task),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(microseconds: 200),
        settings: RouteSettings(name: TaskScreen.routeName),
      );
    case 'camera':
      List<CameraDescription> camera =
          settings.arguments as List<CameraDescription>;
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            CameraScreen(cameras: camera),
        settings: RouteSettings(name: CameraScreen.routeName),
      );
    case 'album':
      // Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
      bool isPickable = settings.arguments as bool;
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AlbumScreen(isPickable: isPickable),
        settings: RouteSettings(name: AlbumScreen.routeName),
      );
    case 'checklist':
      List<CategoryChecklistPreventive> checklist =
          settings.arguments as List<CategoryChecklistPreventive>;
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            FormChecklistScreen(checklist: checklist),
        settings: RouteSettings(name: FormChecklistScreen.routeName),
      );
    case 'report_torque':
      Task task = settings.arguments as Task;
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            FormReportTorque(task: task),
        settings: RouteSettings(name: FormReportTorque.routeName),
      );
    case 'report_verticality':
      Task task = settings.arguments as Task;
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            FormReportVerticality(task: task),
        settings: RouteSettings(name: FormReportVerticality.routeName),
      );
  }
  return null;
}
