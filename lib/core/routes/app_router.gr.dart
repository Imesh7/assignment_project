// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:assignment_project/feature/catalog_one/ui/catalog_one.dart'
    as _i1;
import 'package:assignment_project/feature/catalog_three/ui/catalog_three.dart'
    as _i2;
import 'package:assignment_project/feature/home/ui/home.dart' as _i3;
import 'package:auto_route/auto_route.dart' as _i4;

/// generated route for
/// [_i1.CatalogOne]
class CatalogOne extends _i4.PageRouteInfo<void> {
  const CatalogOne({List<_i4.PageRouteInfo>? children})
      : super(
          CatalogOne.name,
          initialChildren: children,
        );

  static const String name = 'CatalogOne';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.CatalogOne();
    },
  );
}

/// generated route for
/// [_i2.CatalogThree]
class CatalogThree extends _i4.PageRouteInfo<void> {
  const CatalogThree({List<_i4.PageRouteInfo>? children})
      : super(
          CatalogThree.name,
          initialChildren: children,
        );

  static const String name = 'CatalogThree';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.CatalogThree();
    },
  );
}

/// generated route for
/// [_i3.Home]
class Home extends _i4.PageRouteInfo<void> {
  const Home({List<_i4.PageRouteInfo>? children})
      : super(
          Home.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.Home();
    },
  );
}
