
import '../../data/dto/attraction.dart';

abstract class CatalogThreeRepository {
  Future<List<Attraction>> fetchAttraction();
}
