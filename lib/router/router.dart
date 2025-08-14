import 'package:fun88/data/logic/bloc/session_bloc/session_bloc.dart';
import 'package:fun88/presentation/home/home_screen.dart';
import 'package:go_router/go_router.dart';

class MyRouter {
  final SessionState loginInfo;
  String initial = '/';
  MyRouter(this.loginInfo);

  late final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: loginInfo.token.isNotEmpty ? '/' : '/',
    refreshListenable: loginInfo,
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return NoTransitionPage(key: state.pageKey, child: HomeScreen());
        },
      ),
    ],
    // errorBuilder: (context, state) => const ErrorScreen(),
  );
}
