import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_primary_button.dart';
import '../../../l10n/generated/app_localizations.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(28, 36, 28, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: AppColors.green,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.menu_book_rounded,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(l10n.appTitle, style: textTheme.titleMedium),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 48),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 68,
                            height: 4,
                            decoration: BoxDecoration(
                              color: AppColors.ochre,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(height: 28),
                          Text(l10n.welcome, style: textTheme.headlineLarge),
                          const SizedBox(height: 16),
                          Text(l10n.introduction, style: textTheme.bodyLarge),
                        ],
                      ),
                    ),
                    AppPrimaryButton(
                      label: l10n.getStarted,
                      icon: Icons.arrow_forward_rounded,
                      onPressed: () => context.go(AppRoutes.home),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
