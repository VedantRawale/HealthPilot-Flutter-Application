import 'package:flutter/services.dart';
import 'dart:convert';
import '../../../../business/entities/products.dart';
import '../../business/repositories/test_repository.dart';

class TestRepositoryImpl implements TestRepository {
  @override
  Future<List<Product>> getTests() async {
    String testsJson = await rootBundle.loadString('lib/features/labtest_feature/data/datasources/local/tests.json');
    List<dynamic> testsList = json.decode(testsJson);
    return testsList.map((json) => Product.fromJson(json)).toList();
  }
  
}
