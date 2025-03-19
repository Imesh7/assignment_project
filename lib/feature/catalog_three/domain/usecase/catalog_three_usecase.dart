
import '../../../../core/exception/server_exeption.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/dto/attraction.dart';
import '../repository/catalog_three_repositroy.dart';

class CatalogThreeUsecase implements Usecase<List<Attraction>, NoParams> {
  CatalogThreeRepository catalogThreeRepository;

  CatalogThreeUsecase(this.catalogThreeRepository);

  @override
  Future<List<Attraction>> call(params) async {
    try {
      return await catalogThreeRepository.fetchAttraction();
    } on ServerException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
