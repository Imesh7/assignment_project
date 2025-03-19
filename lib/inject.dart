import 'package:assignment_project/feature/catalog_one/data/respository/catalog_one_repository_impl.dart';
import 'package:assignment_project/feature/catalog_one/domain/usecase/catalog_one_usecase.dart';
import 'package:assignment_project/feature/catalog_three/data/respository/catalog_three_impl.dart';
import 'package:assignment_project/feature/catalog_three/domain/repository/catalog_three_repositroy.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/api/api_client.dart';
import 'feature/catalog_three/domain/usecase/catalog_three_usecase.dart';
import 'feature/home/data/respository/home_repository_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  //Api client
  getIt.registerSingleton<ApiClient>(ApiClient(getIt<FirebaseFirestore>()));
  //Respoitory impl
  getIt.registerSingleton<HomeRepositoryImpl>(HomeRepositoryImpl());

  //CatalogOneUsecase Respoitory impl
  getIt.registerSingleton<CatalogOneRepositoryImpl>(
      CatalogOneRepositoryImpl(getIt<ApiClient>()));
  //CatalogOneUsecase Use case
  getIt.registerSingleton<CatalogOneUsecase>(
      CatalogOneUsecase(getIt<CatalogOneRepositoryImpl>()));

  //CatalogThreeRepositoryImpl Respoitory impl
  getIt.registerSingleton<CatalogThreeRepositoryImpl>(
      CatalogThreeRepositoryImpl(getIt<ApiClient>()));
  //CatalogThreeUsecase Use case
  getIt.registerSingleton<CatalogThreeUsecase>(
      CatalogThreeUsecase(getIt<CatalogThreeRepositoryImpl>()));
}
