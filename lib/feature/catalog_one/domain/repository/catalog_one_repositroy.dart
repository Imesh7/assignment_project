
import 'package:assignment_project/feature/catalog_one/data/dto/new_offers.dart';

import '../../data/dto/featured.dart';

abstract class CatalogOneRepository {
  Future<List<Featured>> fetchFeatured();
  Future<List<NewOffers>> fetchNewOffers();
}
