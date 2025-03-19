
import 'package:assignment_project/feature/catalog_one/data/dto/new_offers.dart';

import '../../../../core/exception/server_exeption.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/dto/featured.dart';
import '../repository/catalog_one_repositroy.dart';

class CatalogOneUsecase implements Usecase<CatalogData, NoParams> {
  CatalogOneRepository catalogOneRepository;

  CatalogOneUsecase(this.catalogOneRepository);

  @override
  Future<CatalogData> call(params) async {
    try {
      List<Featured> features =  await catalogOneRepository.fetchFeatured();
      List<NewOffers> newOffers =  await catalogOneRepository.fetchNewOffers();

      return CatalogData(features, newOffers);
    } on ServerException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}

class CatalogData {
  final List<Featured> featuredList;
  final List<NewOffers> newOffersList;

  CatalogData(this.featuredList, this.newOffersList);
}
