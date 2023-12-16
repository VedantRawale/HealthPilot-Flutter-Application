import 'package:health_pilot/features/cart_feature/business/repositories/cart_repository.dart';
import 'package:health_pilot/skeleton.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'business/services/notification_service.dart';
import 'features/book_appointment_feature/presentation/provider/ScheduleDateTimeProvider.dart';
import 'features/cart_feature/business/usecases/getcart.dart';
import 'features/labtest_feature/business/usecases/gettests.dart';
import 'features/labtest_feature/data/repositories/tests_repositoryimpl.dart';
import 'features/cart_feature/data/repositories/cart_repositoryimpl.dart';
import 'features/packages_feature/business/usecases/getpackages.dart';
import 'features/packages_feature/data/repositories/packages_repositoryimpl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(
    MultiProvider(
    providers: [
      Provider<GetTests>(
        create: (_) => GetTests(TestRepositoryImpl()),
      ),
      Provider<GetPackages>(
        create: (_) => GetPackages(PackageRepositoryImpl()),
      ),
      ChangeNotifierProvider(
        create: (_) => GetCart(CartRepositoryImpl()),
      ),
      ChangeNotifierProvider(
        create: (_) => ScheduleDateTimeProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Skeleton(),
    );
  }
}
