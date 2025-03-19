import 'package:assignment_project/inject.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'feature/catalog_one/domain/usecase/catalog_one_usecase.dart';
import 'feature/catalog_one/ui/bloc/catalog_one_bloc.dart';
import 'feature/catalog_three/domain/usecase/catalog_three_usecase.dart';
import 'feature/catalog_three/ui/bloc/catalog_three_bloc.dart';
import 'feature/home/ui/bloc/home_bloc.dart';

class BlocProviders {
  static List<SingleChildWidget> providers = [
    BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
    ),
    BlocProvider<CatalogOneBloc>(
      create: (context) => CatalogOneBloc(getIt.get<CatalogOneUsecase>()),
    ),
    BlocProvider<CatalogThreeBloc>(
      create: (context) => CatalogThreeBloc(getIt.get<CatalogThreeUsecase>()),
    ),
  ];
}
