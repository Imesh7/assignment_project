import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/api_client.dart';
import '../../../../core/exception/exception_handler.dart';
import '../../../../core/exception/server_exeption.dart';
import '../../domain/repository/catalog_three_repositroy.dart';
import '../dto/attraction.dart';

class CatalogThreeRepositoryImpl extends CatalogThreeRepository {
  final ApiClient _apiClient;

  CatalogThreeRepositoryImpl(this._apiClient);

  @override
  Future<List<Attraction>> fetchAttraction() async {
    try {
      final data =
          await _apiClient.firebaseFirestore.collection("attraction").get();
      return data.docs.map((doc) {
        return Attraction.fromMap(doc.data());
      }).toList();
    } on FirebaseException catch (e) {
      throw ExceptionHandler.firebaseErrorHanlder(e);
    } catch (e) {
      throw ServerException("Unexpected Exception : $e");
    }
  }
}
