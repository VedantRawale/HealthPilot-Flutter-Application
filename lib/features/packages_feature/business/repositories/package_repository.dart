import 'package:flutter/material.dart';
import '../../../../business/entities/products.dart';

abstract class PackageRepository {
  Future<List<Product>> getPackages();
}