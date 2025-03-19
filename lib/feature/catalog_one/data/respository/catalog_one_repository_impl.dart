import 'package:assignment_project/feature/catalog_one/data/dto/new_offers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/api_client.dart';
import '../../../../core/exception/exception_handler.dart';
import '../../../../core/exception/server_exeption.dart';
import '../../domain/repository/catalog_one_repositroy.dart';
import '../dto/featured.dart';

class CatalogOneRepositoryImpl extends CatalogOneRepository {
  final ApiClient _apiClient;

  CatalogOneRepositoryImpl(this._apiClient);

  @override
  Future<List<Featured>> fetchFeatured() async {
    try {
      final data =
          await _apiClient.firebaseFirestore.collection("featured").get();
      return data.docs.map((doc) {
        return Featured.fromMap(doc.data());
      }).toList();
    } on FirebaseException catch (e) {
      throw ExceptionHandler.firebaseErrorHanlder(e);
    } catch (e) {
      throw ServerException("Unexpected Exception : $e");
    }
  }

  @override
  Future<List<NewOffers>> fetchNewOffers() async {
    try {
      final data =
          await _apiClient.firebaseFirestore.collection("new_offers").get();
      return data.docs.map((doc) {
        return NewOffers.fromMap(doc.data());
      }).toList();
    } on FirebaseException catch (e) {
      throw ExceptionHandler.firebaseErrorHanlder(e);
    } catch (e) {
      throw ServerException("Unexpected Exception : $e");
    }
  }
}
