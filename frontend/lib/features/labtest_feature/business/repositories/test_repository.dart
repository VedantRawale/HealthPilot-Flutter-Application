import 'package:flutter/material.dart';
import '../../../../business/entities/products.dart';

abstract class TestRepository {
  Future<List<Product>> getTests();
}