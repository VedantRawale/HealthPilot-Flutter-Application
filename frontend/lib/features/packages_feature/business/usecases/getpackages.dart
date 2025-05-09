import '../../../../business/entities/products.dart';
import '../repositories/package_repository.dart';

class GetPackages {
  final PackageRepository _packageRepository;
  GetPackages(this._packageRepository);
  Future<List<Product>> getPackagesList() async {
    return _packageRepository.getPackages();
  }
}
