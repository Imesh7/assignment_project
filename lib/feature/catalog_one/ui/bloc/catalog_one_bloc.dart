import 'package:assignment_project/feature/catalog_one/data/dto/new_offers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/exception/server_exeption.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/dto/featured.dart';
import '../../domain/usecase/catalog_one_usecase.dart';

part 'catalog_one_event.dart';
part 'catalog_one_state.dart';

class CatalogOneBloc extends Bloc<CatalogOneEvent, CatalogOneState> {
  CatalogOneBloc(this._catalogOneUsecase) : super(LoadingCatalogOneState()) {
    on<InitialCatalogOneEvent>(fetchData);
  }

  final CatalogOneUsecase _catalogOneUsecase;
  late CatalogData catalogData;

  void fetchData(
      InitialCatalogOneEvent event, Emitter<CatalogOneState> emit) async {
    try {
      emit(LoadingCatalogOneState());
      catalogData = await _catalogOneUsecase(NoParams());
      emit(SuccessCatalogOneState(
          catalogData.featuredList, catalogData.newOffersList));
    } on ServerException catch (e) {
      emit(FailedCatalogOneState(e.errorMessage));
    }
  }
}
