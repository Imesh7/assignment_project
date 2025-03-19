part of 'catalog_three_bloc.dart';

@immutable
abstract class CatalogThreeState extends Equatable {}

class CatalogThreeInitial extends CatalogThreeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingCatalogThreeState extends CatalogThreeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SuccessCatalogThreeState extends CatalogThreeState {
  final List<Attraction> attractionList;

  SuccessCatalogThreeState(this.attractionList);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FailedCatalogThreeState extends CatalogThreeState {
  late final String errorMessage;

  FailedCatalogThreeState(this.errorMessage);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
