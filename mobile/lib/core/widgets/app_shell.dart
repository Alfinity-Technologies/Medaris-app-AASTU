import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/generated/app_localizations.dart';
import '../router/app_routes.dart';

class AppShell extends StatelessWidget {
  const AppShell({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final path = GoRouterState.of(context).uri.path;
    final selectedIndex = switch (path) {
      AppRoutes.qirat => 1,
      AppRoutes.events || AppRoutes.schedule => 2,
      AppRoutes.profile => 3,
      _ => 0,
    };
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xFFE1E5E8))),
        ),
        child: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            final route = switch (index) {
              1 => AppRoutes.qirat,
              2 => AppRoutes.events,
              3 => AppRoutes.profile,
              _ => AppRoutes.home,
            };
            context.go(route);
          },
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.home_outlined),
              selectedIcon: const Icon(Icons.home_outlined),
              label: l10n.home,
            ),
            NavigationDestination(
              icon: const Icon(Icons.menu_book_outlined),
              selectedIcon: const Icon(Icons.menu_book_outlined),
              label: l10n.qirat,
            ),
            NavigationDestination(
              icon: const Icon(Icons.calendar_month_outlined),
              selectedIcon: const Icon(Icons.calendar_month_outlined),
              label: l10n.events,
            ),
            NavigationDestination(
              icon: const Icon(Icons.person_outline),
              selectedIcon: const Icon(Icons.person_outline),
              label: l10n.profile,
            ),
          ],
        ),
      ),
    );
  }
}
