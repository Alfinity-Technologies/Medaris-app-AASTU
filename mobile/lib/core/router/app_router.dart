import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/home_screen.dart';
import '../widgets/app_shell.dart';
import '../widgets/module_placeholder_screen.dart';
import 'app_routes.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        redirect: (context, state) => AppRoutes.home,
      ),
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.home,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: AppRoutes.qirat,
            builder: (context, state) => const ModulePlaceholderScreen(),
          ),
          GoRoute(
            path: AppRoutes.reader,
            builder: (context, state) => const ModulePlaceholderScreen(),
          ),
          GoRoute(
            path: AppRoutes.audio,
            builder: (context, state) => const ModulePlaceholderScreen(),
          ),
          GoRoute(
            path: AppRoutes.downloads,
            builder: (context, state) => const ModulePlaceholderScreen(),
          ),
          GoRoute(
            path: AppRoutes.schedule,
            builder: (context, state) => const ModulePlaceholderScreen(),
          ),
          GoRoute(
            path: AppRoutes.events,
            builder: (context, state) => const ModulePlaceholderScreen(),
          ),
          GoRoute(
            path: AppRoutes.notifications,
            builder: (context, state) => const ModulePlaceholderScreen(),
          ),
          GoRoute(
            path: AppRoutes.profile,
            builder: (context, state) => const ModulePlaceholderScreen(),
          ),
        ],
      ),
    ],
  );

  ref.onDispose(router.dispose);
  return router;
});
