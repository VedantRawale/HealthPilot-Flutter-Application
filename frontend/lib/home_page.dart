import 'package:flutter/material.dart';
import 'package:health_pilot/core/constants/constants.dart';
import 'package:provider/provider.dart';
import '../../business/entities/products.dart';
import 'customwidgets/titlewithbutton_widget.dart';
import 'features/cart_feature/presentation/widgets/cart_icon_widget.dart';
import 'features/labtest_feature/business/usecases/gettests.dart';
import 'features/labtest_feature/presentation/widgets/labtest_gridview_widget.dart';
import 'features/packages_feature/business/usecases/getpackages.dart';
import 'features/packages_feature/presentation/widgets/package_listitem_widget.dart';
import 'features/drawer/open_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kColor4,
        drawer: OpenDrawer(),
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            AppLogoWithCartIconRowWidget(),
            const Flexible(
              child: TitleWithButtonWidget(title: 'Popular lab tests'),
            ),
            Consumer<GetTests>(
              builder: (context, testUseCase, child) {
                return ShowListOfLabTests(testUseCase);
              },
            ),
            const SizedBox(height: 5),
            const TitleWithButtonWidget(title: 'Popular packages'),
            Consumer<GetPackages>(
              builder: (context, packageUseCase, child) {
                return ShowListOfPackages(packageUseCase);
              },
            )
          ],
        ));
  }

  FutureBuilder<List<Product>> ShowListOfLabTests(GetTests testUseCase) {
    return FutureBuilder<List<Product>>(
      future: testUseCase.getTestsList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No tests available'));
        } else {
          List<Product> testList = snapshot.data!;
          return SizedBox(
            height: 350,
            // color: Colors.black,
            child: Center(child: LabTestGridView(testList: testList)),
          );
        }
      },
    );
  }

  FutureBuilder<List<Product>> ShowListOfPackages(GetPackages packageUseCase) {
    return FutureBuilder<List<Product>>(
      future: packageUseCase.getPackagesList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No packages available'));
        } else {
          List<Product> packageList = snapshot.data!;
          return SizedBox(
            height: 290,
            child: ListView.builder(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 10.0),
                scrollDirection: Axis.horizontal,
                itemCount: packageList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PackageCard(product: packageList[index]),
                  );
                }),
          );
        }
      },
    );
  }
}

class MenuBtnAtTop extends StatelessWidget {
  const MenuBtnAtTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final navprov = Provider.of<NavBarProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            backgroundColor: kColor1,
            child: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
    );
  }
}

class AppLogoWithCartIconRowWidget extends StatelessWidget {
  const AppLogoWithCartIconRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: MenuBtnAtTop()),
            SizedBox(
              height: 50,
              width: 200,
              child: Image.asset('lib/assets/imageassets/applogo.png',
                  fit: BoxFit.contain),
            ),
            Flexible(child: SizedBox(width: 50)),
            const CartIcon(),
          ],
        ),
      ),
    );
  }
}
