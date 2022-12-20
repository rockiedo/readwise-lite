import 'package:feature_feed/feature_feed.dart';
import 'package:feature_settings/feature_settings.dart';
import 'package:go_router/go_router.dart';
import 'package:core_navigation/core_navigation.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoute.home.path,
      builder: (context, state) {
        return const FeedWidget();
      },
    ),
    GoRoute(
      path: AppRoute.settings.path,
      builder: (context, state) {
        return const SettingsWidget();
      },
    )
  ],
);
