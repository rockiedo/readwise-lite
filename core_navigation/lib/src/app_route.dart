enum AppRoute {
  home('/'),
  settings('/settings');

  final String path;

  const AppRoute(this.path);
}