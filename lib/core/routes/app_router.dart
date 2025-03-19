import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: Home.page, initial: true),
        AutoRoute(page: CatalogOne.page),
        CustomRoute(
            page: CatalogThree.page,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            durationInMilliseconds: 500)
      ];
}
