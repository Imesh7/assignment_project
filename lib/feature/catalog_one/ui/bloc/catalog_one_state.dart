part of 'catalog_one_bloc.dart';

@immutable
abstract class CatalogOneState extends Equatable {}

class CatalogOneInitial extends CatalogOneState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingCatalogOneState extends CatalogOneState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SuccessCatalogOneState extends CatalogOneState {
  final List<Featured> featuredList;
  final List<NewOffers> newOffersList;

  SuccessCatalogOneState(this.featuredList, this.newOffersList);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FailedCatalogOneState extends CatalogOneState {
  late final String errorMessage;

  FailedCatalogOneState(this.errorMessage);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
