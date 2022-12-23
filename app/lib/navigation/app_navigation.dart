import 'package:go_router/go_router.dart';
import 'package:feature/feature.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const FeedWidget();
      },
    ),
  ],
);