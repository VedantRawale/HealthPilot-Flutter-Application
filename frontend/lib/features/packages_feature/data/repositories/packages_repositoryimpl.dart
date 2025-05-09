import 'package:flutter/services.dart';
import 'dart:convert';
import '../../../../business/entities/products.dart';
import '../../business/repositories/package_repository.dart';

class PackageRepositoryImpl implements PackageRepository{
  @override
  Future<List<Product>> getPackages() async{
    String packagesJson = await rootBundle.loadString('lib/features/packages_feature/data/datasources/local/packages.json');
    List<dynamic> packagesList = json.decode(packagesJson);
    return packagesList.map((json) => Product.fromJson(json)).toList();
  }
}
