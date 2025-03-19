import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/exception/server_exeption.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/dto/attraction.dart';
import '../../domain/usecase/catalog_three_usecase.dart';

part 'catalog_three_event.dart';
part 'catalog_three_state.dart';

class CatalogThreeBloc extends Bloc<CatalogThreeEvent, CatalogThreeState> {
  CatalogThreeBloc(this._catalogThreeUsecase) : super(LoadingCatalogThreeState()) {
    on<InitialCatalogThreeEvent>(fetchData);
  }

  final CatalogThreeUsecase _catalogThreeUsecase;
  late List<Attraction> attractionList;

  void fetchData(InitialCatalogThreeEvent event, Emitter<CatalogThreeState> emit) async {
    try {
      emit(LoadingCatalogThreeState());
      attractionList = await _catalogThreeUsecase(NoParams());
      emit(SuccessCatalogThreeState(attractionList));
    } on ServerException catch (e) {
      emit(FailedCatalogThreeState(e.errorMessage));
    } 
  }
}
