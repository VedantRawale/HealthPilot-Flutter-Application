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
import 'package:health_pilot/introduction_animation/introduction_animation/introduction_animation_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


Future<void> initSupabase() async {
   sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  await Supabase.initialize(
    url: 'https://cemowcytiuyatgmrqwzm.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNlbW93Y3l0aXV5YXRnbXJxd3ptIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY0MjI3NDksImV4cCI6MjA2MTk5ODc0OX0.5uB0n_19bgNb9ph84SaCrS2phUS8u3Qp3aXHH2QOVvA',
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  await initSupabase();
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
      home: IntroductionAnimationScreen(),
    );
  }
}
