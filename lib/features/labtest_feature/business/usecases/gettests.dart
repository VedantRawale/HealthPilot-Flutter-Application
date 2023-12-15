import 'package:flutter/material.dart';
import '../../../../business/entities/products.dart';
import '../repositories/test_repository.dart';

class GetTests {
  final TestRepository _testRepository;
  GetTests(this._testRepository);
  Future<List<Product>> getTestsList() async {
    return _testRepository.getTests();
  }
}
